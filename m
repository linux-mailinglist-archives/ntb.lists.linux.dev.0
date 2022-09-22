Return-Path: <ntb+bounces-272-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CC5E6ED4
	for <lists+linux-ntb@lfdr.de>; Thu, 22 Sep 2022 23:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166B71C209D6
	for <lists+linux-ntb@lfdr.de>; Thu, 22 Sep 2022 21:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78903C26;
	Thu, 22 Sep 2022 21:50:33 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B033E6
	for <ntb@lists.linux.dev>; Thu, 22 Sep 2022 21:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA640C433D7;
	Thu, 22 Sep 2022 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663883432;
	bh=MgTN7LkGK6RTKAK8xVN3320exVPlVXdsT6FCYwP83tA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XYgCEWLPerROkbSvzzraCysPpwUrHSr4ezRMEPzD/ldnsRprA24KspE1uqZz2Lud3
	 +R/nXgSNU53Ci9h+ObaShk9tsEctWfNDGis5b1UWi93JIQlrKTPW6V0Izp4Dlf3kES
	 BfJdiFGPoX5QiO/uIZh9h5L6fr3x5OC48pG6l94oppUo3FzD9qJO4pyfZQZ3kw75Tx
	 0+9bJybb6Hkuf7t/doyH+9AjA+eGxEvcJUqlKgO/jAjSec2SFBQhU+8Sn9eoSb7Ekx
	 X0yg8nxr8vmau0UWfJECH2zzeVv/V0E1M5Hrv8aW10ZF74JV/wXq5hl/DvDqgp7FSG
	 UAybAAMfGEg6w==
Date: Thu, 22 Sep 2022 16:50:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Cc: fancer.lancer@gmail.com, jdmason@kudzu.us, dave.jiang@intel.com,
	allenbh@gmail.com, bhelgaas@google.com, ruscur@russell.cc,
	oohall@gmail.com, james.smart@broadcom.com,
	dick.kennedy@broadcom.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] PCI/AER: Use pci_aer_raw_clear_status() to clear
 root port's AER error status
Message-ID: <20220922215030.GA1341314@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901181634.99591-4-chenzhuo.1@bytedance.com>

On Fri, Sep 02, 2022 at 02:16:34AM +0800, Zhuo Chen wrote:
> Statements clearing AER error status in aer_enable_rootport() has the
> same function as pci_aer_raw_clear_status(). So we replace them, which
> has no functional changes.
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/pci/pcie/aer.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d2996afa80f6..eb0193f279f2 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1287,12 +1287,7 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
>  				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
>  
>  	/* Clear error status */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
> -	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
> -	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
> -	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
> -	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
> +	pci_aer_raw_clear_status(pdev);

It's true that this is functionally equivalent.

But 20e15e673b05 ("PCI/AER: Add pci_aer_raw_clear_status() to
unconditionally clear Error Status") says pci_aer_raw_clear_status()
is only for use in the EDR path (this should have been included in the
function comment), so I think we should preserve that property and use
pci_aer_clear_status() here.

pci_aer_raw_clear_status() is the same as pci_aer_clear_status()
except it doesn't check pcie_aer_is_native().  And I'm pretty sure we
can't get to aer_enable_rootport() *unless* pcie_aer_is_native(),
because get_port_device_capability() checks the same thing, so they
should be equivalent here.

Bjorn

