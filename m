Return-Path: <ntb+bounces-1122-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39EAA581F7
	for <lists+linux-ntb@lfdr.de>; Sun,  9 Mar 2025 09:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAE5A16B9C5
	for <lists+linux-ntb@lfdr.de>; Sun,  9 Mar 2025 08:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064B71B0F18;
	Sun,  9 Mar 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K2YtWH0a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+V1semF3"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54D191F89
	for <ntb@lists.linux.dev>; Sun,  9 Mar 2025 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741509714; cv=none; b=cIwmDkW29sU4Qt4cjHT+aPngCmuI9CXdx+mq+R37gYTc4781WRAo6F/peG/ksoJpQ7WjykTdbHaRZEvM7fqA6RdTILm8plm9uNKPNJKZRiRCJuLwT7nIHjNsenNJjG09FjM/j0Pi1Zs5bZxaqkJ/vtmYXMz3St5qJ76i1K7qncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741509714; c=relaxed/simple;
	bh=cmacTxXIxce5OuCOlsFeMKlTtcskqKZQBd5w4CspMG8=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=WevWvDuYkwMrxVuOVRCgHrp3wtluBvpvp7e138yGftZKsARX9wtvv/nNY3CkThY+XOG/j3ML3nBLJU7DCZlFFEnc7ACCNMRstSNdrKddgdmsMupl4sAPwwrBH3sgFPXyRPbPHDakoYUx1S1FsP1vsIj8aVliIkjjSFsvwEfIFt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K2YtWH0a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+V1semF3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250309084110.521468021@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741509712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=orv27tW3w4e5gK89wOdnKXG8n73hJW7aZdj9rhy7feg=;
	b=K2YtWH0a4l+FQiItA7EWn9vQ8BmUgGpW9GgnLLsG7Ge0el1FPT+aFS4WbjfJRR09H4jqwa
	BZh49etMSqqHMW3C2mLlpGIt91iqNvGWFS6PBtp5gC9tq93M2z6tqz7bRi6/fombnAxpON
	0Zv6d6Wsulr6J9bwES9NF10PmCVS1qijcyP9PRJg3rPDxIjVrHAgHwTRLzUX1dpiFwd5xr
	fig+ldA2rmmPp/zDn8PrxB+0Tt45RYknA7jRV9DqZA8Ayj+VmSQewIRaQQlcuuvhOk1PQG
	vG32ed/TxJU4hh6khEDrNQ2k+rZRd0/J57VfD0wtM4TMdpOoif3nlz/ANTy5HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741509712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=orv27tW3w4e5gK89wOdnKXG8n73hJW7aZdj9rhy7feg=;
	b=+V1semF33MS8lCzLlGKkqy2+J7ifQfxoM0OqN2kWXuIrVrxHCl2aQhamUsLy4eUkbgawVh
	vik9ycw1n1h/YHAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Wei Huang <wei.huang2@amd.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org
Subject: [patch 06/10] PCI: hv: Switch MSI descriptor locking to guard()
References: <20250309083453.900516105@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sun,  9 Mar 2025 09:41:51 +0100 (CET)

Convert the code to use the new guard(msi_descs_lock).

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
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


