Return-Path: <ntb+bounces-1194-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72002A68A52
	for <lists+linux-ntb@lfdr.de>; Wed, 19 Mar 2025 11:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C326883443
	for <lists+linux-ntb@lfdr.de>; Wed, 19 Mar 2025 10:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DCF2571C9;
	Wed, 19 Mar 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pMLNt4dY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aI2vjARS"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D42571B0
	for <ntb@lists.linux.dev>; Wed, 19 Mar 2025 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742381817; cv=none; b=KP9ylb8ZlRiZb/WXlkm2nXk+wR1rJEAso/91s6lPFT35CTXaaIgUbCNZhhx3+hlpruiOdnhtov97gJ80tfckCDik4+Ti0VBAXSuIkWDj1nwAEJNWS1OPZ9GyCfYk5R3/B3zFm/ne+I6f2hlzIK3M/JzWLI8G+nGMM0N+rFIcyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742381817; c=relaxed/simple;
	bh=Yku/Dk38vOmdf/tGUWDs7VYaf6oF5NAwKcemJLCATBA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=bn24P0OozIFXQkUV0Vu4mHEXYSWDja2A0vWTeGc/Ss+xjF5inPlg7Img0IURndCqWPoNQ9aRWSB8lHMVkiYYv9xXqwNpffS/VukYkylRLxDnkW6e03YqqVD0qGQdL8OnFInoFY6fpGAmOFAMPiRcMDrHTq1Gkc3O2kFTyBlNja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pMLNt4dY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aI2vjARS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250319105506.564105011@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742381814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=WN2Id7Ic7+jh+7crblGSxwRPR1jdNZ1jmqlHS+u0MqA=;
	b=pMLNt4dY/Q52H70ecXsmMPj7z8+X4gMHQhWOE2R/aN+exlVZANNpTbZRrA/CuIGq8Dw/H3
	5hkAxRaSH7Homfy8JEBc26oJQM1HD3Cms89ZtwMW+AUK+2UcmAPUnRfIMH+ytcV6jkjfbl
	dtHzzCA+AnOoVyxhqPIjGIwzKboQPfSpOZJJRJiuoD/UL1dkdYJytUlQWxTSiY0iN2G69f
	8Bi6NkfKhYrqYOX06fTG2XSveL4CcjQ2nkWmnm961pXzxflSmvE4F7v92C8gQOY1S2LiV7
	t/RKWa0tfQ2E+QuCr9ZQ7SzIR9gHisox/TyPPwNZEIf+1pZqnGctSIKqDnl3tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742381814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=WN2Id7Ic7+jh+7crblGSxwRPR1jdNZ1jmqlHS+u0MqA=;
	b=aI2vjARSZWWsVfBDHjbWorZRVdVYNQ3JL1TNiIjd4chDhAMywTAUd/hynu84kznQWMDysA
	3bU7iZ/ooC6VDhAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nishanth Menon <nm@ti.com>,
 Dhruva Gole <d-gole@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Michael Kelley <mhklinux@outlook.com>,
 Wei Liu <wei.liu@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org,
 Wei Huang <wei.huang2@amd.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huwei.com>
Subject: [patch V4 09/14] PCI/MSI: Switch msix_capability_init() to
 guard(msi_desc_lock)
References: <20250319104921.201434198@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 11:56:54 +0100 (CET)

Split the lock protected functionality of msix_capability_init() out into a
helper function and use guard(msi_desc_lock) to replace the lock/unlock
pair.

Simplify the error path in the helper function by utilizing a custom
cleanup to get rid of the remaining gotos.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: Split out from the previous combo patch
---
 drivers/pci/msi/msi.c |   36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -663,35 +663,39 @@ static void msix_mask_all(void __iomem *
 		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
 
-static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries,
-				 int nvec, struct irq_affinity *affd)
+DEFINE_FREE(free_msi_irqs, struct pci_dev *, if (_T) pci_free_msi_irqs(_T));
+
+static int __msix_setup_interrupts(struct pci_dev *__dev, struct msix_entry *entries,
+				   int nvec, struct irq_affinity_desc *masks)
 {
-	struct irq_affinity_desc *masks __free(kfree) =
-		affd ? irq_create_affinity_masks(nvec, affd) : NULL;
-	int ret;
+	struct pci_dev *dev __free(free_msi_irqs) = __dev;
 
-	msi_lock_descs(&dev->dev);
-	ret = msix_setup_msi_descs(dev, entries, nvec, masks);
+	int ret = msix_setup_msi_descs(dev, entries, nvec, masks);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	/* Check if all MSI entries honor device restrictions */
 	ret = msi_verify_entries(dev);
 	if (ret)
-		goto out_free;
+		return ret;
 
+	retain_ptr(dev);
 	msix_update_entries(dev, entries);
-	goto out_unlock;
+	return 0;
+}
+
+static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries,
+				 int nvec, struct irq_affinity *affd)
+{
+	struct irq_affinity_desc *masks __free(kfree) =
+		affd ? irq_create_affinity_masks(nvec, affd) : NULL;
 
-out_free:
-	pci_free_msi_irqs(dev);
-out_unlock:
-	msi_unlock_descs(&dev->dev);
-	return ret;
+	guard(msi_descs_lock)(&dev->dev);
+	return __msix_setup_interrupts(dev, entries, nvec, masks);
 }
 
 /**


