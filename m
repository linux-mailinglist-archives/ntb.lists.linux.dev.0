Return-Path: <ntb+bounces-1124-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1FA58209
	for <lists+linux-ntb@lfdr.de>; Sun,  9 Mar 2025 09:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB35C162D8C
	for <lists+linux-ntb@lfdr.de>; Sun,  9 Mar 2025 08:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A99C1BBBDD;
	Sun,  9 Mar 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zCtQYWDN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bwhxlZzz"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E31B4246
	for <ntb@lists.linux.dev>; Sun,  9 Mar 2025 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741509718; cv=none; b=IDOwV/ybGQbUYuvH1MpqP+bxYIQza1OTUlUd9b4lW6hYp5F5BgwoXQYg9wCFexSkWSM9dORprYsp2oVJjoljH+ffY4BIChaNlteI/3O5ePPHhqNabuzJQmItiCmWz9OkhfVLOm8sWc5V5pr6kTgMgM/Aq3aMeYrpDcPIK1lCZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741509718; c=relaxed/simple;
	bh=5l7R6AdaqwRlGif5tU/xFQ/s9Ah8K7qa8CaWg309ca4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=EB/lRIt4wcaege7EydDPm6aG0ccMQTE1WkDXzL/cuyUb7vrDRUD3iVh3ExdCPMx/faytjUCR4KRHEfcNaEZnZ7+7i+/eH6OrcxkopVnCBKraMAWe+fJvzWkuaq4iRTwe1nbnx44NJnQOTjemORSv7tkBDV2SmB223ZDF678BAUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zCtQYWDN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bwhxlZzz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250309084110.648079737@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741509715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=g042MrY1rHTcKBvw/cHhhjvItHiESxmK6Esu9o+YXlg=;
	b=zCtQYWDN7JpNg5tYfD+QYQgq5ZDZItLGDIRB5/t33mmDB1zXLa/rqpvjYrNwYSitaqcyFl
	1JA/dH89iehlJyh3RrPjEwH4M2vQKjRX9ZTxoVZMQwQGO06wP23NwICGyLCyKYgFwiqH4S
	7KniY+xnatIqXw/g8kx18AaZUU+whlNeWzme7OvRWJch15DLygGpqqHx83NlflyN+roKGc
	YtdZf9pDT1N2C6iJVCvX5fMZI4H889viOMXv48F84P34TZI9wUUknMVPMCE6X8n89bWEoY
	AUo3mQG6OHw703SddnakYTrMueteeDfDedY6tQNMSRftmGNH1E/on9zaPlN1DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741509715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=g042MrY1rHTcKBvw/cHhhjvItHiESxmK6Esu9o+YXlg=;
	b=bwhxlZzzlCxewlkNn2cRYMP6ONLol6B1H7iDXEKBMjO88mjhkHxKfcjZ27zDPpuwpOggLt
	81O92heUwlnKXzCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Wei Huang <wei.huang2@amd.com>,
 linux-pci@vger.kernel.org,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org
Subject: [patch 08/10] PCI/TPH: Replace the broken MSI-X control word update
References: <20250309083453.900516105@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sun,  9 Mar 2025 09:41:54 +0100 (CET)

The driver walks the MSI descriptors to test whether a descriptor exists
for a given index. That's just abuse of the MSI internals.

The same test can be done with a single function call by looking up whether
there is a Linux interrupt number assigned at the index.

What's worse is that the function is completely unserialized against
modifications of the MSI-X control by operations issued from the interrupt
core. It also brings the PCI/MSI-X internal cached control word out of
sync.

Remove the trainwreck and invoke the function provided by the PCI/MSI core
to update it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Wei Huang <wei.huang2@amd.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/tph.c |   44 +-------------------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

--- a/drivers/pci/tph.c
+++ b/drivers/pci/tph.c
@@ -204,48 +204,6 @@ static u8 get_rp_completer_type(struct p
 	return FIELD_GET(PCI_EXP_DEVCAP2_TPH_COMP_MASK, reg);
 }
 
-/* Write ST to MSI-X vector control reg - Return 0 if OK, otherwise -errno */
-static int write_tag_to_msix(struct pci_dev *pdev, int msix_idx, u16 tag)
-{
-#ifdef CONFIG_PCI_MSI
-	struct msi_desc *msi_desc = NULL;
-	void __iomem *vec_ctrl;
-	u32 val;
-	int err = 0;
-
-	msi_lock_descs(&pdev->dev);
-
-	/* Find the msi_desc entry with matching msix_idx */
-	msi_for_each_desc(msi_desc, &pdev->dev, MSI_DESC_ASSOCIATED) {
-		if (msi_desc->msi_index == msix_idx)
-			break;
-	}
-
-	if (!msi_desc) {
-		err = -ENXIO;
-		goto err_out;
-	}
-
-	/* Get the vector control register (offset 0xc) pointed by msix_idx */
-	vec_ctrl = pdev->msix_base + msix_idx * PCI_MSIX_ENTRY_SIZE;
-	vec_ctrl += PCI_MSIX_ENTRY_VECTOR_CTRL;
-
-	val = readl(vec_ctrl);
-	val &= ~PCI_MSIX_ENTRY_CTRL_ST;
-	val |= FIELD_PREP(PCI_MSIX_ENTRY_CTRL_ST, tag);
-	writel(val, vec_ctrl);
-
-	/* Read back to flush the update */
-	val = readl(vec_ctrl);
-
-err_out:
-	msi_unlock_descs(&pdev->dev);
-	return err;
-#else
-	return -ENODEV;
-#endif
-}
-
 /* Write tag to ST table - Return 0 if OK, otherwise -errno */
 static int write_tag_to_st_table(struct pci_dev *pdev, int index, u16 tag)
 {
@@ -346,7 +304,7 @@ int pcie_tph_set_st_entry(struct pci_dev
 
 	switch (loc) {
 	case PCI_TPH_LOC_MSIX:
-		err = write_tag_to_msix(pdev, index, tag);
+		err = pci_msix_write_tph_tag(pdev, index, tag);
 		break;
 	case PCI_TPH_LOC_CAP:
 		err = write_tag_to_st_table(pdev, index, tag);


