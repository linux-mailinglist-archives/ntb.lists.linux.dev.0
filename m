Return-Path: <ntb+bounces-1165-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D2AA5FEA3
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 18:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA3707A736B
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 17:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2833E1E9907;
	Thu, 13 Mar 2025 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uFZ1UBSP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DaZ5+jSl"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68E1DB13E
	for <ntb@lists.linux.dev>; Thu, 13 Mar 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741888517; cv=none; b=MCZNjdgzLgK1WYaJn0uSdHFdSk2GMBEhGv99klxYePUgRsufkIz2eAVHKKI0WvSOqUUvjiOmcCdrSTqmkNdWnAC7I0Jo7kOvcZNI20ZHespCVPRIC44ZJbSgBrJUec1j7A/5LbyVM8sG48uAWBh42k2kBCWjdmNBQvuCd4HSX4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741888517; c=relaxed/simple;
	bh=Tt71LYU6EhXq+PF34rquse8y+1HkrL6YTObHYDTEgC4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qx1L/glwBKBx+DH2G+nGgsYuz8np6vx1x8709PPPKMNorwf+CfCTgMvbnIxyLLJPXFK4h2wm3DLh1TEpSTdPfArzrtjCFDaiFa/xkcF5PTaOuRQHo82JNBRXlvc0xYXiZMdsHKqwsLFyed3kebezI6xmentq6gYV4tcyEd5QLgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uFZ1UBSP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DaZ5+jSl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741888513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PI1SXUEUlOflpG5mqedjH0tAMTUnOBBlzLm30n5Uuc=;
	b=uFZ1UBSPIOZgTqTqDPp+hhu/m7GcOkIt1v3H07rmD4Ul7VL35J6jWDvJIA+deMFrBrOnbr
	8ynwe7rivWoT25DDOIcKFqTlsUHbHlBmYIb1TLN91juJY9FmyXTCXZr5OEP4FJWRQJRcrF
	OoZQaJr9kQvLeLhWezSO18uv67r3WIgHGxe4u4mh4hNj0o3F3bh+1vYNFz22NcT7tkTOIl
	og+qd1C2OI0B6igXtHcKG2JJlrAQdE2Arpkbd1UkgQDpUVePa9LPRdlZs+NCkvxTQmUet3
	UhOf8ztb+kp+188qw6+Z+WIKy9JFx+dvkdWZgF0blzeIBmRdkZxk5ukei3qmuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741888513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PI1SXUEUlOflpG5mqedjH0tAMTUnOBBlzLm30n5Uuc=;
	b=DaZ5+jSlfrg02yOuP/NlnEIu8fr+/VfyCADOXZFaNyu2YS2F1MFQ+giIy2PvmK5hrryHIc
	SNt0bHYWB8QiwtCw==
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Peter Zijlstra
 <peterz@infradead.org>, Nishanth Menon <nm@ti.com>, Dhruva Gole
 <d-gole@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Dave Jiang
 <dave.jiang@intel.com>, Jon Mason <jdmason@kudzu.us>, Allen Hubbe
 <allenbh@gmail.com>, ntb@lists.linux.dev, Michael Kelley
 <mhklinux@outlook.com>, Wei Liu <wei.liu@kernel.org>, Haiyang Zhang
 <haiyangz@microsoft.com>, linux-hyperv@vger.kernel.org, Wei Huang
 <wei.huang2@amd.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Jonathan Cameron
 <Jonathan.Cameron@huwei.com>
Subject: Re: [patch V2 05/10] PCI/MSI: Switch to MSI descriptor locking to
 guard()
In-Reply-To: <20250313155015.000037f5@huawei.com>
References: <20250313130212.450198939@linutronix.de>
 <20250313130321.695027112@linutronix.de>
 <20250313155015.000037f5@huawei.com>
Date: Thu, 13 Mar 2025 18:55:12 +0100
Message-ID: <87ldt86cjj.ffs@tglx>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Mar 13 2025 at 15:50, Jonathan Cameron wrote:
>> +	guard(msi_descs_lock)(&dev->dev);
>> +	int ret = __msix_setup_interrupts(dev, entries, nvec, masks);
>> +	if (ret)
>> +		pci_free_msi_irqs(dev);
>
> It's not immediately obvious what this is undoing (i.e. where the alloc
> is).  I think it is at least mostly the pci_msi_setup_msi_irqs in
> __msix_setup_interrupts

It's a universal cleanup for all possible error cases.

> Why not handle the error in __msix_setup_interrupts and make that function
> side effect free.  Does require gotos but in a function that isn't
> doing any cleanup magic so should be fine.

I had the gotos first and then hated them. But you are right, it's better
to have them than having the magic clean up at the call site.

I'll fold the delta patch below.

Thanks,

        tglx
---
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -671,19 +671,23 @@ static int __msix_setup_interrupts(struc
 	int ret = msix_setup_msi_descs(dev, entries, nvec, masks);
 
 	if (ret)
-		return ret;
+		goto fail;
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
-		return ret;
+		goto fail;
 
 	/* Check if all MSI entries honor device restrictions */
 	ret = msi_verify_entries(dev);
 	if (ret)
-		return ret;
+		goto fail;
 
 	msix_update_entries(dev, entries);
 	return 0;
+
+fail:
+	pci_free_msi_irqs(dev);
+	return ret;
 }
 
 static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries,
@@ -693,10 +697,7 @@ static int msix_setup_interrupts(struct
 		affd ? irq_create_affinity_masks(nvec, affd) : NULL;
 
 	guard(msi_descs_lock)(&dev->dev);
-	int ret = __msix_setup_interrupts(dev, entries, nvec, masks);
-	if (ret)
-		pci_free_msi_irqs(dev);
-	return ret;
+	return __msix_setup_interrupts(dev, entries, nvec, masks);
 }
 
 /**

