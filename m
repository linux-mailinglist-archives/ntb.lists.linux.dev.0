Return-Path: <ntb+bounces-1157-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A5A5F553
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 14:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7884417E96A
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 13:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BA0268697;
	Thu, 13 Mar 2025 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Excbi3s1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jfqVmJ6+"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F62267711
	for <ntb@lists.linux.dev>; Thu, 13 Mar 2025 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871029; cv=none; b=PRJMbfVwVgvmaNgv1dc6RrGWiFXKzqjQ7g5MSormvZywF3MGy1nVWDVNSzWxVzqJY0+/yy/PfMXRFlBNzMTkn6oqRXhAZIk+g+vhdmpU3sf4tT488l3AcLHXTrQM+Yy//5iUpEf2tF1KfablcxpoHnfRy8JVWnfjYnAJDyUYsgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871029; c=relaxed/simple;
	bh=9i1aJ8qWulAmg/dYGGOWI20bIOPVKt/oVPRMd7Z+pD4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=kpWH9QOmoaJHfRjxhLxv3wvLUFfM+xhNxU1xM0looDmiaFpgUm/5gr/0xt0g4QlfB4WvBDmgGAcl5u8+662ZGubN8shdNpXJlvJlFSkOFfIZMKWO8/08AMsSp4ZoTheFPoYaJQCrNZR1fqCRsUrQ0EAVbuO/TESgjTql7PkGinM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Excbi3s1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jfqVmJ6+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250313130321.758905320@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741871027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=itIv7ByiHV7P2pJ+IbyJNFhivtoUlfzZdqMqvWLFhgs=;
	b=Excbi3s1DtT3QO820qb5czupDlXmRZsoQRpBGpvK92Xo0ijnoLO97t9nQOyksHlordRcEq
	yRIC5DDmJI7Syx8g33wwE/vy3qVWb65nCHYsABug7AqtgJpQL7bhOImrtCJlJAa6bBKgHV
	DNRvm3DKmw8a3us4A9mU42aalhn3Mqu57TH9nuoWsh1SnjEXJO6ioOcVwArDWeIuWptoJN
	U646U7jwYEW7qBzcKZ1iUFYdVinPtECsmLMNoNLTZFK1LL8Kh3azq/jDqas5W79vz0UrEv
	C9rUEEBNQhTJZDymxk08AhsYbymzaI6EFY2fFMBX3YtmGh4Mcp/rjV6kEINU3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741871027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=itIv7ByiHV7P2pJ+IbyJNFhivtoUlfzZdqMqvWLFhgs=;
	b=jfqVmJ6+yxvC7C06YY7zxcO2cbhHnaSXC9NCoAAE6oYZqvNT3DwGSigdM1iywhj9lZp5Yx
	s8aA4mSdDQXMCbDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Michael Kelley <mhklinux@outlook.com>,
 Wei Liu <wei.liu@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Nishanth Menon <nm@ti.com>,
 Dhruva Gole <d-gole@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Wei Huang <wei.huang2@amd.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huwei.com>
Subject: [patch V2 06/10] PCI: hv: Switch MSI descriptor locking to guard()
References: <20250313130212.450198939@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 14:03:46 +0100 (CET)

Convert the code to use the new guard(msi_descs_lock).

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: linux-hyperv@vger.kernel.org
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/controller/pci-hyperv.c |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -3976,24 +3976,18 @@ static int hv_pci_restore_msi_msg(struct
 {
 	struct irq_data *irq_data;
 	struct msi_desc *entry;
-	int ret = 0;
 
 	if (!pdev->msi_enabled && !pdev->msix_enabled)
 		return 0;
 
-	msi_lock_descs(&pdev->dev);
+	guard(msi_descs_lock)(&pdev->dev);
 	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_ASSOCIATED) {
 		irq_data = irq_get_irq_data(entry->irq);
-		if (WARN_ON_ONCE(!irq_data)) {
-			ret = -EINVAL;
-			break;
-		}
-
+		if (WARN_ON_ONCE(!irq_data))
+			return -EINVAL;
 		hv_compose_msi_msg(irq_data, &entry->msg);
 	}
-	msi_unlock_descs(&pdev->dev);
-
-	return ret;
+	return 0;
 }
 
 /*




