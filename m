Return-Path: <ntb+bounces-1123-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E290A58207
	for <lists+linux-ntb@lfdr.de>; Sun,  9 Mar 2025 09:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B503F3AD401
	for <lists+linux-ntb@lfdr.de>; Sun,  9 Mar 2025 08:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D021B422A;
	Sun,  9 Mar 2025 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="13JkA35W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HcA4OL9y"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F51B0F26
	for <ntb@lists.linux.dev>; Sun,  9 Mar 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741509716; cv=none; b=Sw89p5TIwbQo8BMu+ltTbHZ8liTcBjaK0xk3FEdn6GEyw0y00BjGAu0s8zMBT3M1cCN1/WdJBL2gBanQmGJAKrSi3c8jHArwfzks9HyIOcU/qv8Czw84SA7LlKYnYlI7FWiH+MB5MVUHr2g2pf4bOq3gvnL61FNE7krXmOBRMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741509716; c=relaxed/simple;
	bh=1HS7obeYKb42uw1IraPsN9L3DRfMjADODhtzMqrMiwM=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=GT9bAT967/0SMbS0ZGxwY4n2uibhv9x8r/kxWnBl4cT0NqlTaaEa9U/N59q5kV7Xtk9Zmu67NtKEHkrw+zn5iD1NN7OCTW+Zr0akrQ2jIdjmz4XyUdLX/zM3239fED1Sj43VZOlZ19kDbPTHl95mtOaPOV1R268nf1ZRnlz2Pfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=13JkA35W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HcA4OL9y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250309084110.584867364@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741509713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=0qmkifLEMtx3Jy85H4q3Dgu6t8Utbc3eUX1wCcoYGzQ=;
	b=13JkA35W9MvGhNq3JF4ktAccWEDwqiIwdA0iigLvldNlsSFyhSE1kzkm6EcMKIeriMXuNp
	G5xQdSK1E7vSMYSe1oq4I+bFcdKIFR+FEsAc0qF6woy95DlVxqWj0bEZ+a+J7kubFazKcG
	3IIajm3dPNVKam0afs23lQTkWoC/vZ9wu/y3gaRXN9dAUtEqgqHEZg9piPRY1dTGkmSVfh
	bwr4nnPofhy0FS/9spMXm2NMTHnPGOlA6jQvsgbMD9Mg9BVXldcCxz2wc0cENCAaoX9fWr
	zmMm8PGGISmhO3ABZZ/G+0ZvKdQxPLjvoJxRClTl/V2oMYX0XgoaamvXed9DZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741509713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=0qmkifLEMtx3Jy85H4q3Dgu6t8Utbc3eUX1wCcoYGzQ=;
	b=HcA4OL9y+8wbG550PPnhwe0RGfY+yMShbqDAWDOweFwmW4lbB4B6DolTo2K3jFd43dMtMf
	ERQq8+TwWZeulWBQ==
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
Subject: [patch 07/10] PCI/MSI: Provide a sane mechanism for TPH
References: <20250309083453.900516105@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sun,  9 Mar 2025 09:41:53 +0100 (CET)

The PCI/TPH driver fiddles with the MSI-X control word of an active
interrupt completely unserialized against concurrent operations issued
from the interrupt core. It also brings the PCI/MSI-X internal cached
control word out of sync.

Provide a function, which has the required serialization and keeps the
control word cache in sync.

Unfortunately this requires to look up and lock the interrupt descriptor,
which should be only done in the interrupt core code. But confining this
particular oddity in the PCI/MSI core is the lesser of all evil. A
interrupt core implementation would require a larger pile of infrastructure
and indirections for dubious value.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Wei Huang <wei.huang2@amd.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/msi/msi.c |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h     |    9 +++++++++
 2 files changed, 56 insertions(+)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -910,6 +910,53 @@ void pci_free_msi_irqs(struct pci_dev *d
 	}
 }
 
+#ifdef CONFIG_PCIE_TPH
+/**
+ * pci_msix_write_tph_tag - Update the TPH tag for a given MSI-X vector
+ * @pdev:	The PCIe device to update
+ * @index:	The MSI-X index to update
+ * @tag:	The tag to write
+ *
+ * Returns: 0 on success, error code on failure
+ */
+int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 tag)
+{
+	struct msi_desc *msi_desc;
+	struct irq_desc *irq_desc;
+	unsigned int virq;
+
+	if (!pdev->msix_enabled)
+		return -ENXIO;
+
+	guard(msi_descs_lock)(&pdev->dev);
+	virq = msi_get_virq(&pdev->dev, index);
+	if (!virq)
+		return -ENXIO;
+	/*
+	 * This is a horrible hack, but short of implementing a PCI
+	 * specific interrupt chip callback and a huge pile of
+	 * infrastructure, this is the minor nuissance. It provides the
+	 * protection against concurrent operations on this entry and keeps
+	 * the control word cache in sync.
+	 */
+	irq_desc = irq_to_desc(virq);
+	if (!irq_desc)
+		return -ENXIO;
+
+	guard(raw_spinlock_irq)(&irq_desc->lock);
+	msi_desc = irq_data_get_msi_desc(&irq_desc->irq_data);
+	if (!msi_desc || msi_desc->pci.msi_attrib.is_virtual)
+		return -ENXIO;
+
+	msi_desc->pci.msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_ST;
+	msi_desc->pci.msix_ctrl |= FIELD_PREP(PCI_MSIX_ENTRY_CTRL_ST, tag);
+	pci_msix_write_vector_ctrl(msi_desc, msi_desc->pci.msix_ctrl);
+	/* Flush the write */
+	readl(pci_msix_desc_addr(msi_desc));
+	return 0;
+}
+#endif
+
 /* Misc. infrastructure */
 
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -989,6 +989,15 @@ int pcim_request_region_exclusive(struct
 				  const char *name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
 
+#ifdef CONFIG_PCI_MSI
+int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 tag);
+#else
+static inline int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 tag)
+{
+	return -ENODEV;
+}
+#endif
+
 /*
  * Config Address for PCI Configuration Mechanism #1
  *


