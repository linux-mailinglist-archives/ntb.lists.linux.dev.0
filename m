Return-Path: <ntb+bounces-1189-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341DA68A30
	for <lists+linux-ntb@lfdr.de>; Wed, 19 Mar 2025 11:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC7C423442
	for <lists+linux-ntb@lfdr.de>; Wed, 19 Mar 2025 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A7F255E51;
	Wed, 19 Mar 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LT05L8wG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7sg4jJMm"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AB625525F
	for <ntb@lists.linux.dev>; Wed, 19 Mar 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742381809; cv=none; b=ZBZYpbUa0PEnk3JjJKrGq4zFjWXmWSqlBxF7xdcGlhJnc2dlaBa4AwDveu5qcK8g3N2xE/Z47b8nAUEATK/BJgGXnD3+6jkq074+5YvGHTj8/QziVkvYarBw3ePU7g6tTrtJlcI+B7M+2OuZLgTgArljcJtSN5Ve0b03MSLTgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742381809; c=relaxed/simple;
	bh=ovwB1tIyY2DkaUqZOtFf3VDmTTRENXZLRtFJy4bku14=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Yt3am7koYf7HLmw5fDq42ZwV8UNh3pZBiNkZEJNE/71NCniJevHHn+0ZqThMT5U37lsS8kLL4xgfiSH+DpKyvLe7wnuBmyK7YirDpMqlzgDB6rWyo055V07+KOMI68c7gded7HHckrht1Cc+rX+VDHimZcoO/orFgsPJ7xgVo2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LT05L8wG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7sg4jJMm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250319105506.263456735@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742381805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7+z8oSyOI/6DQVHw5aTbTSzONFRdZw/C9vWt0+dJcNg=;
	b=LT05L8wG0Ux9NmrrxTx0Hf7ewM/tmZ8wyhaQeq1xj5tvSiAQCl1DYrH9sTXsYeFpzzUpDD
	Vj2WN/TNPhvk1j33n+XskXs65K7davOxNncO9NXDE88UrJqFDXO0DGbLrSCuHkWJpTTTlc
	ueD0hFk5ImGn5iXu0LH4bfsZR7bIuf1JKrYbMKYAAA6Ea1UEISSIjBiqkIO3FzzRnzKOn6
	U0bs6JgbG6jgiwcXKBp2JBDVkNEygegLtRk/ku8lMhRORp4R9VzHCSWXgwymWMwnlM8mT0
	osDkhTWuX5Ggh23WL6d8d2dIgZ9Oqu2kyoSiRCFYTlqb3l8g3Vuw1k0gcElAkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742381805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7+z8oSyOI/6DQVHw5aTbTSzONFRdZw/C9vWt0+dJcNg=;
	b=7sg4jJMm9QQua9Rgrtc0zdBlqh+IMS8rj2JgF82TLVrs7iOc19s00ZasFxr49xSJzDEwSB
	5ssAeWNletxGM8DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Nishanth Menon <nm@ti.com>,
 Dhruva Gole <d-gole@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
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
Subject: [patch V4 04/14] NTB/msi: Switch MSI descriptor locking to lock
 guard()
References: <20250319104921.201434198@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 11:56:45 +0100 (CET)

Convert the code to use the new guard(msi_descs_lock).

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Allen Hubbe <allenbh@gmail.com>
Cc: ntb@lists.linux.dev



---
 drivers/ntb/msi.c |   22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -106,10 +106,10 @@ int ntb_msi_setup_mws(struct ntb_dev *nt
 	if (!ntb->msi)
 		return -EINVAL;
 
-	msi_lock_descs(&ntb->pdev->dev);
-	desc = msi_first_desc(&ntb->pdev->dev, MSI_DESC_ASSOCIATED);
-	addr = desc->msg.address_lo + ((uint64_t)desc->msg.address_hi << 32);
-	msi_unlock_descs(&ntb->pdev->dev);
+	scoped_guard (msi_descs_lock, &ntb->pdev->dev) {
+		desc = msi_first_desc(&ntb->pdev->dev, MSI_DESC_ASSOCIATED);
+		addr = desc->msg.address_lo + ((uint64_t)desc->msg.address_hi << 32);
+	}
 
 	for (peer = 0; peer < ntb_peer_port_count(ntb); peer++) {
 		peer_widx = ntb_peer_highest_mw_idx(ntb, peer);
@@ -289,7 +289,7 @@ int ntbm_msi_request_threaded_irq(struct
 	if (!ntb->msi)
 		return -EINVAL;
 
-	msi_lock_descs(dev);
+	guard(msi_descs_lock)(dev);
 	msi_for_each_desc(entry, dev, MSI_DESC_ASSOCIATED) {
 		if (irq_has_action(entry->irq))
 			continue;
@@ -307,17 +307,11 @@ int ntbm_msi_request_threaded_irq(struct
 		ret = ntbm_msi_setup_callback(ntb, entry, msi_desc);
 		if (ret) {
 			devm_free_irq(&ntb->dev, entry->irq, dev_id);
-			goto unlock;
+			return ret;
 		}
-
-		ret = entry->irq;
-		goto unlock;
+		return entry->irq;
 	}
-	ret = -ENODEV;
-
-unlock:
-	msi_unlock_descs(dev);
-	return ret;
+	return -ENODEV;
 }
 EXPORT_SYMBOL(ntbm_msi_request_threaded_irq);
 








