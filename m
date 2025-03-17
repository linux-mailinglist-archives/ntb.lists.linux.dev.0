Return-Path: <ntb+bounces-1175-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D32DCA6510D
	for <lists+linux-ntb@lfdr.de>; Mon, 17 Mar 2025 14:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D6A23B6F3B
	for <lists+linux-ntb@lfdr.de>; Mon, 17 Mar 2025 13:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD9724290C;
	Mon, 17 Mar 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I+lmDMBo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kD+t1zcj"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6924169B
	for <ntb@lists.linux.dev>; Mon, 17 Mar 2025 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218171; cv=none; b=UL/a7rd9+UHYVrQhDShSnhEiECek0q/8RP3jXtr0Y7u03FjhWsZRzBrry3gj9YkxAZJnORodK2gaLkiARJSTNRJ2SDXRWIfUH88VK0szyyWkYHfbW+Qx4mNwyizfi+/rfgSS922X/qOjJKarQsAZgge8z/h8+ceuyxsr4nyzJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218171; c=relaxed/simple;
	bh=p1T7rPE6PheQf1PP3APwWVg7WjhczJsCxKMiW9/IOi4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=swGpPnkNn9Y23FxsptEdhUrExRpmFBzZrxrhnS7qkFcszUrTXYD0UGMqKea9QsnAXkLzGDtrIprzD19CPlmJyVYVrWtMY+4IgQobx2rdI8GeI3Mfnp62Zr/2NmZiRFfvYCms6KGNizasqboGNptNI0tTS0l5Ui9d8GEmRs6vGcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I+lmDMBo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kD+t1zcj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250317092946.075206592@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742218168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3/dRMN7oC/HSArm4ElW7bOG9bX8b/YPinUN++M1pXqM=;
	b=I+lmDMBoCXWAe1aotpi9TzLp2syIkoYuxIIkcAv2AlYOPe2S/+dhRwasZEUe1P1bkGhVA9
	408wd+oLUdwowQzLUtOzZlhI0kOmujCj3CtzG5vdX+GDCQN80WcxQFm6pWqfF9uu/yLAwo
	Qf+rugx8daut868JVXE+JaG6zsIgbiQh7B8Qli/TFav+bjjI8aZsJ9e2rqw4Lgf5cwt9Lc
	rvGCV/Jzfy1LEA9nvKEVvLlyY7pFKMyL/z8kiZZQfdNJJh5OMwEqOB6iuloxiT/iLQsTJS
	Swh8sq5Mx67ukMmheyWs8D5uE5jootv55P9+VmlsqmNWS/Xm9Hn3N1GNmbdZOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742218168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3/dRMN7oC/HSArm4ElW7bOG9bX8b/YPinUN++M1pXqM=;
	b=kD+t1zcjj/G+g2DMtE4DoeqeCmi99mS8B8MhBunWIJqfeR6v1OSO6xWw1rXnRRonnrYdAH
	sfpNSZc2I8ZJbCAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Michael Kelley <mhklinux@outlook.com>,
 Wei Liu <wei.liu@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org,
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
Subject: [patch V3 06/10] PCI: hv: Switch MSI descriptor locking to guard()
References: <20250317092919.008573387@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 14:29:28 +0100 (CET)

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






