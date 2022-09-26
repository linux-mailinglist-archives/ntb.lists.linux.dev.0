Return-Path: <ntb+bounces-278-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C415EAF3E
	for <lists+linux-ntb@lfdr.de>; Mon, 26 Sep 2022 20:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4122E1C2091A
	for <lists+linux-ntb@lfdr.de>; Mon, 26 Sep 2022 18:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0934686;
	Mon, 26 Sep 2022 18:09:09 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BB4682
	for <ntb@lists.linux.dev>; Mon, 26 Sep 2022 18:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6A3C433D6;
	Mon, 26 Sep 2022 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664215748;
	bh=f0vC5rcbDYjIyScqcWYY9GpgiQN1RROu0ZZ2a2E8E2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cc2VTt5YU8CMoAICIdScy9zbs3OhBWuctGyV31uYoLdX/jhHdprUjUqxyrBZ90I2m
	 h8N5ESFrH1aB8IMAdw2dYD0NCdAYmVAWblgzCt/FgA6kr9H6dIGoOFJ3yX0nTLyyk7
	 gb35oRC9yB3dTEzhLGg/AhrJGiOmlbX2LU1buRJYTRbUORZAxUyRtFt0UpbZ75PkX2
	 qC0+M6pIGnpbu+rX6ewu3bb5iebRbHY/rA+em1+StX155rtK6dt5K5tLJbhb+c0LDc
	 fbLcwRJOPUksuwO/XnLcreVRekt5Z59jz5qMlcdMO7KxrNiaxg692INePg4DaFbIMu
	 2iLGYmd1p3aOQ==
Date: Mon, 26 Sep 2022 13:09:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, linux-pci@vger.kernel.org,
	jejb@linux.ibm.com, jdmason@kudzu.us, james.smart@broadcom.com,
	fancer.lancer@gmail.com, linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev, oohall@gmail.com, bhelgaas@google.com,
	dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] PCI/ERR: Clear fatal status in pcie_do_recovery()
Message-ID: <20220926180906.GA1609498@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1de80c28-33ec-b1bd-a557-91e4166d2da7@bytedance.com>

On Mon, Sep 26, 2022 at 10:01:55PM +0800, Zhuo Chen wrote:
> On 9/23/22 5:08 AM, Bjorn Helgaas wrote:
> > On Fri, Sep 02, 2022 at 02:16:33AM +0800, Zhuo Chen wrote:
> > > When state is pci_channel_io_frozen in pcie_do_recovery(),
> > > the severity is fatal and fatal status should be cleared.
> > > So we add pci_aer_clear_fatal_status().
> > 
> > Seems sensible to me.  Did you find this by code inspection or by
> > debugging a problem?  If the latter, it would be nice to mention the
> > symptoms of the problem in the commit log.
> 
> I found this by code inspection so I may not enumerate what kind of problems
> this code will cause.
> > 
> > > Since pcie_aer_is_native() in pci_aer_clear_fatal_status()
> > > and pci_aer_clear_nonfatal_status() contains the function of
> > > 'if (host->native_aer || pcie_ports_native)', so we move them
> > > out of it.
> > 
> > Wrap commit log to fill 75 columns.
> > 
> > > Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> > > ---
> > >   drivers/pci/pcie/err.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> > > index 0c5a143025af..e0a8ade4c3fe 100644
> > > --- a/drivers/pci/pcie/err.c
> > > +++ b/drivers/pci/pcie/err.c
> > > @@ -243,10 +243,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> > >   	 * it is responsible for clearing this status.  In that case, the
> > >   	 * signaling device may not even be visible to the OS.
> > >   	 */
> > > -	if (host->native_aer || pcie_ports_native) {
> > > +	if (host->native_aer || pcie_ports_native)
> > >   		pcie_clear_device_status(dev);
> > 
> > pcie_clear_device_status() doesn't check for pcie_aer_is_native()
> > internally, but after 068c29a248b6 ("PCI/ERR: Clear PCIe Device Status
> > errors only if OS owns AER") and aa344bc8b727 ("PCI/ERR: Clear AER
> > status only when we control AER"), both callers check before calling
> > it.
> > 
> > I think we should move the check inside pcie_clear_device_status().
> > That could be a separate preliminary patch.
> > 
> > There are a couple other places (aer_root_reset() and
> > get_port_device_capability()) that do the same check and could be
> > changed to use pcie_aer_is_native() instead.  That could be another
> > preliminary patch.
> > 
> Good suggestion. But I have only one doubt. In aer_root_reset(), if we use
> "if (pcie_aer_is_native(dev) && aer)", when dev->aer_cap
> is NULL and root->aer_cap is not NULL, pcie_aer_is_native() will return
> false. It's different from just using "(host->native_aer ||
> pcie_ports_native)".
> Or if we can use "if (pcie_aer_is_native(root))", at this time a NULL
> pointer check should be added in pcie_aer_is_native() because root may be
> NULL.

Good point.  In aer_root_reset(), we're updating Root Port registers,
so I think they should look like:

  if (pcie_aer_is_native(root) && aer) {
    ...
  }

Does that seem safe and equivalent to you?

Bjorn

