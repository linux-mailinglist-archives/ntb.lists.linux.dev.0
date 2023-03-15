Return-Path: <ntb+bounces-456-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C216BBF2A
	for <lists+linux-ntb@lfdr.de>; Wed, 15 Mar 2023 22:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A4C52809A6
	for <lists+linux-ntb@lfdr.de>; Wed, 15 Mar 2023 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DCF746E;
	Wed, 15 Mar 2023 21:35:40 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD77460
	for <ntb@lists.linux.dev>; Wed, 15 Mar 2023 21:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA479C433D2;
	Wed, 15 Mar 2023 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678916139;
	bh=t0slNnDqTTBxM4l7m1MnXen0WkpNYZ0Oy+EHtd/aI48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ee4tuRcbXCIIJpJjWwyj+PthOSZjP+cV02hFdIB+CY44Ndgd7JemYu5LWnmFbnzPD
	 fh0xBbyvkoWL9olg24id/P+qgY5U2xCobnkIDjpQ8ejKgLyHXKnIRj6tXj6Fqg/5SU
	 9Oo7bNxYbYNqpiS3NY5B1VnIwPnTWVidVt0Y0PAZe6i9ijtXmyLTNjcKwXFP719nOl
	 UFJuaQ/8Gq2tKexMFgdo+dunvJKB9f8DUpZ7Vl10xRrh9Nv0YHkCCw9WWjGTQQxN90
	 7wsUToadu9eL5M/bxkjVkXP7GuX8Kh9sQGh61aKWmwNRciKzF6gR1s5s9IhLoZ1ewl
	 olPyRlmEk9EYw==
Date: Wed, 15 Mar 2023 16:35:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, bhelgaas@google.com,
	ruscur@russell.cc, oohall@gmail.com, fancer.lancer@gmail.com,
	jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, ntb@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/9] scsi: lpfc: Change to use
 pci_aer_clear_uncorrect_error_status()
Message-ID: <20230315213537.GA1788623@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206221335.GA1363005@bhelgaas>

On Tue, Dec 06, 2022 at 04:13:35PM -0600, Bjorn Helgaas wrote:
> On Wed, Sep 28, 2022 at 06:59:41PM +0800, Zhuo Chen wrote:
> > lpfc_aer_cleanup_state() requires clearing both fatal and non-fatal
> > uncorrectable error status.
> 
> I don't know what the point of lpfc_aer_cleanup_state() is.  AER
> errors should be handled and cleared by the PCI core, not by
> individual drivers.  Only lpfc, liquidio, and sky2 touch
> PCI_ERR_UNCOR_STATUS.
> 
> But lpfc_aer_cleanup_state() is visible in the
> "lpfc_aer_state_cleanup" sysfs file, so removing it would break any
> userspace that uses it.
> 
> If we can rely on the PCI core to clean up AER errors itself
> (admittedly, that might be a big "if"), maybe lpfc_aer_cleanup_state()
> could just become a no-op?
> 
> Any comment from the LPFC folks?
> 
> Ideally, I would rather not export pci_aer_clear_nonfatal_status() or
> pci_aer_clear_uncorrect_error_status() outside the PCI core at all.

Resurrecting this old thread.  Zhuo, can you figure out where the PCI
core clears these errors, include that in the commit log, and propose
a patch that makes lpfc_aer_cleanup_state() a no-op, by removing the
pci_aer_clear_nonfatal_status() call completely?

Such a patch could be sent to the SCSI maintainers since it doesn't
involve the PCI core.

If it turns out that the PCI core *doesn't* clear these errors, we
should figure out *why* it doesn't and try to change the PCI core so
it does.

> > But using pci_aer_clear_nonfatal_status()
> > will only clear non-fatal error status. To clear both fatal and
> > non-fatal error status, use pci_aer_clear_uncorrect_error_status().
> > 
> > Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> > ---
> >  drivers/scsi/lpfc/lpfc_attr.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
> > index 09cf2cd0ae60..d835cc0ba153 100644
> > --- a/drivers/scsi/lpfc/lpfc_attr.c
> > +++ b/drivers/scsi/lpfc/lpfc_attr.c
> > @@ -4689,7 +4689,7 @@ static DEVICE_ATTR_RW(lpfc_aer_support);
> >   * Description:
> >   * If the @buf contains 1 and the device currently has the AER support
> >   * enabled, then invokes the kernel AER helper routine
> > - * pci_aer_clear_nonfatal_status() to clean up the uncorrectable
> > + * pci_aer_clear_uncorrect_error_status() to clean up the uncorrectable
> >   * error status register.
> >   *
> >   * Notes:
> > @@ -4715,7 +4715,7 @@ lpfc_aer_cleanup_state(struct device *dev, struct device_attribute *attr,
> >  		return -EINVAL;
> >  
> >  	if (phba->hba_flag & HBA_AER_ENABLED)
> > -		rc = pci_aer_clear_nonfatal_status(phba->pcidev);
> > +		rc = pci_aer_clear_uncorrect_error_status(phba->pcidev);
> >  
> >  	if (rc == 0)
> >  		return strlen(buf);
> > -- 
> > 2.30.1 (Apple Git-130)
> > 

