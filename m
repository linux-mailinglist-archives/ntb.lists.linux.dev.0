Return-Path: <ntb+bounces-1138-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DEA5CD4A
	for <lists+linux-ntb@lfdr.de>; Tue, 11 Mar 2025 19:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EEF817AFC2
	for <lists+linux-ntb@lfdr.de>; Tue, 11 Mar 2025 18:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBD825C6FF;
	Tue, 11 Mar 2025 18:10:26 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7212638A5
	for <ntb@lists.linux.dev>; Tue, 11 Mar 2025 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716626; cv=none; b=Wwt2R+mk9V3Qg6CbtOknv4Huah5QelKEhIKMIPFwiCCEE5tXHJemZKG9KjJOeFHAmeJrpMZSYQITKiW5sFhyV6bXxuuJ5t+yy577LDQB74ZCcNit0/66wlmVihel5TnpGjH8Rb96WEE6XTS3JJmUUatBQB/izXfRTdObNGWQzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716626; c=relaxed/simple;
	bh=uFQjRjX3d/rynmWIbL31HzUK72S6VsxciF2bSXaoFzc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcDlYapH1zKQrCpaAGCvDXuWN8K/duU+eR9T+xbyWdd+eEAuLJ7QyeH3Vx1+o9meBbLzLXXIIfhzrw1/LmHwJ1V7hJv0gXrPIY8/HsnSe6achST8xrTAj6JuK87lSLHJRe5qjg1R85qifOMM3dN16iHFwpuHbiS8mjFYMq9iI1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZC1vS2WHyz6HJjj;
	Wed, 12 Mar 2025 02:07:48 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 66C6C140134;
	Wed, 12 Mar 2025 02:10:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 11 Mar
 2025 19:10:20 +0100
Date: Tue, 11 Mar 2025 18:10:18 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>, "Nishanth Menon"
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
	<dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	<ntb@lists.linux.dev>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
	<wei.liu@kernel.org>, <linux-hyperv@vger.kernel.org>, Wei Huang
	<wei.huang2@amd.com>, Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>
Subject: Re: [patch 05/10] PCI/MSI: Switch to MSI descriptor locking to
 guard()
Message-ID: <20250311181018.0000477f@huawei.com>
In-Reply-To: <20250309084110.458224773@linutronix.de>
References: <20250309083453.900516105@linutronix.de>
	<20250309084110.458224773@linutronix.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Sun,  9 Mar 2025 09:41:49 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> Convert the code to use the new guard(msi_descs_lock).
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org

This one runs into some of the stuff that the docs say
to not do.  I don't there there are bugs in here as such
but it gets harder to reason about and fragile in the long
run.  Easy enough to avoid though - see inline.

Jonathan

> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -351,7 +351,7 @@ static int msi_verify_entries(struct pci
>  static int msi_capability_init(struct pci_dev *dev, int nvec,
>  			       struct irq_affinity *affd)
>  {
> -	struct irq_affinity_desc *masks = NULL;
> +	struct irq_affinity_desc *masks __free(kfree) = NULL;

This is a pattern that the cleanup.h docs talk about that
Linus really didn't like in some of the early patches because
of wanting constructors and destructors together.

Maybe use an inline definition as

	struct irq_affinity_desc *masks =
		affd ? irq_create_affinity_masks(nvec, affd) : NULL;


>  	struct msi_desc *entry, desc;
>  	int ret;
>  
> @@ -369,7 +369,7 @@ static int msi_capability_init(struct pc
>  	if (affd)
>  		masks = irq_create_affinity_masks(nvec, affd);
>  
> -	msi_lock_descs(&dev->dev);
> +	guard(msi_descs_lock)(&dev->dev);
>  	ret = msi_setup_msi_desc(dev, nvec, masks);
>  	if (ret)
>  		goto fail;

This runs against the advice in cleanup.h. It is probably
correct and doesn't hit the undefined paths that motivated
that guidance, but still maybe worth avoiding the mix of
cleanup and goto handling.

Easiest way being to factor out the code after guard to a helper.


> @@ -399,16 +399,13 @@ static int msi_capability_init(struct pc
>  
>  	pcibios_free_irq(dev);
>  	dev->irq = entry->irq;
> -	goto unlock;
> +	return 0;
>  
>  err:
>  	pci_msi_unmask(&desc, msi_multi_mask(&desc));
>  	pci_free_msi_irqs(dev);
>  fail:
>  	dev->msi_enabled = 0;
> -unlock:
> -	msi_unlock_descs(&dev->dev);
> -	kfree(masks);
>  	return ret;
>  }
>  
> @@ -669,13 +666,13 @@ static void msix_mask_all(void __iomem *
>  static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries,
>  				 int nvec, struct irq_affinity *affd)
>  {
> -	struct irq_affinity_desc *masks = NULL;
> +	struct irq_affinity_desc *masks __free(kfree) = NULL;
Similar to above.
>  	int ret;
>  
>  	if (affd)
>  		masks = irq_create_affinity_masks(nvec, affd);
>  
> -	msi_lock_descs(&dev->dev);
> +	guard(msi_descs_lock)(&dev->dev);
>  	ret = msix_setup_msi_descs(dev, entries, nvec, masks);
>  	if (ret)
>  		goto out_free;
> @@ -690,13 +687,10 @@ static int msix_setup_interrupts(struct
>  		goto out_free;
>  
>  	msix_update_entries(dev, entries);
> -	goto out_unlock;
> +	return 0;
>  
>  out_free:
Here as well.
>  	pci_free_msi_irqs(dev);
> -out_unlock:
> -	msi_unlock_descs(&dev->dev);
> -	kfree(masks);
>  	return ret;
>  }
>  
> @@ -871,13 +865,13 @@ void __pci_restore_msix_state(struct pci
>  
>  	write_msg = arch_restore_msi_irqs(dev);
>  
> -	msi_lock_descs(&dev->dev);
> -	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> -		if (write_msg)
> -			__pci_write_msi_msg(entry, &entry->msg);
> -		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
> +	scoped_guard (msi_descs_lock, &dev->dev) {
> +		msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> +			if (write_msg)
> +				__pci_write_msi_msg(entry, &entry->msg);
> +			pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
> +		}
>  	}
> -	msi_unlock_descs(&dev->dev);
>  
>  	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
>  }
> 
> 
> 


