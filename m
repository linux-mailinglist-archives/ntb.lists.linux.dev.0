Return-Path: <ntb+bounces-1161-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC5A5F562
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 14:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6489588011C
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 13:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9CD269832;
	Thu, 13 Mar 2025 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M/g2FUp4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3KqNIfwg"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC02690E6
	for <ntb@lists.linux.dev>; Thu, 13 Mar 2025 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871038; cv=none; b=QdJPiBax0W+IQNoD4K6EDpfr1gqvsMu4xZVuIO5gCz55c8B+QjpqEowai4inIgy2hu3VRNPhoQHjKRsAmW22RAZGrATsW/Pmhu88xZs63ABIbCHU9M5+dXWA7VWyiOx4uuSMscjqMiTvh66IBAm76ChAXqvdpGTZHwxaIJv/THE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871038; c=relaxed/simple;
	bh=ziAUb6xXmsqMxAmD+XpOIfqe60CvD7tMtpsaSqUF2VQ=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=JjCVZVbZxKxmjKA2s6v0u76/k/p2Gh5tbB0kMNlvgGKrvbFlHf2GePL8cAnmemGTx3oyH5n8TLJSAQwPdC5dPW+7SzPPXVImLlBbZuul63+yTTF2BfmWZa2qCvCym7V53e6KA4+KXAq9SFKn+GtHNe8TtMex/Mbf3hvKdaLcKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M/g2FUp4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3KqNIfwg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250313130322.027190131@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741871034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=syj4DKiPqVRJ4tJ6hdHCsNz/PeEgBfCP7TCfi1O9n7E=;
	b=M/g2FUp4+d4KQi+pVi/iNrEY7yyofNEj4PYtueo0XHrGtIfUZD7Eu7cZ0CPzXYK5SKZfYh
	Rfh0IFuqq9zUzMWWgGuA7ZEaSAcH3l7zn2BHAwvZ3IQOQDyujLMXR54lzBxNRK83xTSe0N
	qcFjDActCUwtJzM50bZKHn/hedwdah4TddOJrZjxuWTBZDAocdnxnfNwWdNTq/av1lIHhg
	XbZdgdTFudwQgFu5BQ5cQkZeTv/V9Vzq73Z0pbMj6gWpWooZF8bmAjGdz/ckMoe1QIcuKA
	/nKd9bNsdS23IWakjntm6ieGx4xYCb2ZWxuXgSQsWNJwCKHUj/cPzRNoxcuiHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741871034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=syj4DKiPqVRJ4tJ6hdHCsNz/PeEgBfCP7TCfi1O9n7E=;
	b=3KqNIfwgh2+pPnJQB0EsGRiw7nUHYBApMvIUzU2PhcfESPiI0Bf0dlcX7sRrf8NMWh0FF+
	7ZXowdA74cpHjtAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huwei.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Nishanth Menon <nm@ti.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dhruva Gole <d-gole@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org,
 Michael Kelley <mhklinux@outlook.com>,
 Wei Liu <wei.liu@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 linux-hyperv@vger.kernel.org,
 Wei Huang <wei.huang2@amd.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org
Subject: [patch V2 10/10] genirq/msi: Rename msi_[un]lock_descs()
References: <20250313130212.450198939@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 14:03:53 +0100 (CET)

Now that all abuse is gone and the legit users are converted to
guard(msi_descs_lock), rename the lock functions and document them as
internal.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huwei.com>
---
 include/linux/msi.h |    8 ++++----
 kernel/irq/msi.c    |   16 ++++++++++------
 2 files changed, 14 insertions(+), 10 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -224,11 +224,11 @@ struct msi_dev_domain {
 
 int msi_setup_device_data(struct device *dev);
 
-void msi_lock_descs(struct device *dev);
-void msi_unlock_descs(struct device *dev);
+void __msi_lock_descs(struct device *dev);
+void __msi_unlock_descs(struct device *dev);
 
-DEFINE_LOCK_GUARD_1(msi_descs_lock, struct device, msi_lock_descs(_T->lock),
-		    msi_unlock_descs(_T->lock));
+DEFINE_LOCK_GUARD_1(msi_descs_lock, struct device, __msi_lock_descs(_T->lock),
+		    __msi_unlock_descs(_T->lock));
 
 struct msi_desc *msi_domain_first_desc(struct device *dev, unsigned int domid,
 				       enum msi_desc_filter filter);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -337,26 +337,30 @@ int msi_setup_device_data(struct device
 }
 
 /**
- * msi_lock_descs - Lock the MSI descriptor storage of a device
+ * __msi_lock_descs - Lock the MSI descriptor storage of a device
  * @dev:	Device to operate on
+ *
+ * Internal function for guard(msi_descs_lock). Don't use in code.
  */
-void msi_lock_descs(struct device *dev)
+void __msi_lock_descs(struct device *dev)
 {
 	mutex_lock(&dev->msi.data->mutex);
 }
-EXPORT_SYMBOL_GPL(msi_lock_descs);
+EXPORT_SYMBOL_GPL(__msi_lock_descs);
 
 /**
- * msi_unlock_descs - Unlock the MSI descriptor storage of a device
+ * __msi_unlock_descs - Unlock the MSI descriptor storage of a device
  * @dev:	Device to operate on
+ *
+ * Internal function for guard(msi_descs_lock). Don't use in code.
  */
-void msi_unlock_descs(struct device *dev)
+void __msi_unlock_descs(struct device *dev)
 {
 	/* Invalidate the index which was cached by the iterator */
 	dev->msi.data->__iter_idx = MSI_XA_MAX_INDEX;
 	mutex_unlock(&dev->msi.data->mutex);
 }
-EXPORT_SYMBOL_GPL(msi_unlock_descs);
+EXPORT_SYMBOL_GPL(__msi_unlock_descs);
 
 static struct msi_desc *msi_find_desc(struct msi_device_data *md, unsigned int domid,
 				      enum msi_desc_filter filter)




