Return-Path: <ntb+bounces-306-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 953CC5EDADC
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 13:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C22A71C2092D
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 11:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65806EC0;
	Wed, 28 Sep 2022 11:00:53 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B97B
	for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 11:00:51 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id ok12so283870pjb.4
        for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u9XQU41RsTUx8hAj0GByCivfHFYNLe/LcJ7HOx2cRk8=;
        b=g54oFMIdCF2dlMlWqBJXb2ajXcmoOjcmAclllhhmqpL/PbWxV//uy2iXv81V0hzVm0
         aLaAZ6+mer1bqH8611CebeDTcEHTIxWNAEILUMzm607EsRzinibmRhNx+T14qbAMFTMi
         deCvTYPrRQQAs0CrFDT6LPJFXI2rTfm5hdWox09u0jb5HlpwgLk2qQ90/AEQIPdMq1P4
         RP9nGHaoCYBIXKTXvNHto/IRYqqNt5gMGyMua828z4SXp/lAqHMpUZUYFelzp/iuDfYZ
         +4NxDQtAvtILUhS8r6L9rmxbQj1w4czfQ2xpYtCJUVoRjjtFTfaHnn0CHPuANhp+SPpR
         0inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u9XQU41RsTUx8hAj0GByCivfHFYNLe/LcJ7HOx2cRk8=;
        b=iulbmKFoc1cx0mlcFHApFvhb12nkXSnChoK/9Yhhc75rphYJcoiRuXMCN0pkskwz+G
         OxRma5zmtAqDmI6o8bzt0EIN1PjR1AqGp0/NLsU0LGm4aZfK3o2qMZ3UhLBgK6Kubhqz
         GuA4Tz7hKQ7K4n6fZUyOtMLSeFP4EEHwSKHuB1fbwJ+uGYi74PTj3H5bihB5WWbo3Xnj
         TTuAcSVWZMnatFOZbUC4Isaa3QuIjwDLTb06vhKgTVYXwQAdl5dj0VFF5qKBjFkLox/1
         gJNNs0VFnVVPecLFJi3gIjxMmzkZhc8O8vqIFEIjAgSVPuG3A3tygQ0Edj1TOVvyiyin
         67iQ==
X-Gm-Message-State: ACrzQf1Ux5nyGu0EDlSOP79MDvkkRLHrRsYAodsk8ZP9ySco1lkQR6w7
	u7E5fISfXRX5YpLyyni3wCTXnA==
X-Google-Smtp-Source: AMsMyM4kXAU4ifKn51M7WYKqFKeegfH0I0bkzWrZ+DYNC5KIZDtAkk16LDFcF/7vrBJSgxjKlw6Exw==
X-Received: by 2002:a17:902:bb98:b0:178:8e09:5675 with SMTP id m24-20020a170902bb9800b001788e095675mr31940670pls.91.1664362851153;
        Wed, 28 Sep 2022 04:00:51 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:50 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: sathyanarayanan.kuppuswamy@linux.intel.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: chenzhuo.1@bytedance.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-scsi@vger.kernel.org
Subject: [PATCH v3 7/9] PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
Date: Wed, 28 Sep 2022 18:59:44 +0800
Message-Id: <20220928105946.12469-8-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pcie_aer_is_native() in place of "host->native_aer ||
pcie_ports_native" to judge whether OS owns AER in aer_root_reset().

Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
get_port_device_capability() with pcie_aer_is_native(), which has no
functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/aer.c          | 5 ++---
 drivers/pci/pcie/portdrv_core.c | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2320ab27a31..a6d29269ccf2 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1403,7 +1403,6 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	int type = pci_pcie_type(dev);
 	struct pci_dev *root;
 	int aer;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	u32 reg32;
 	int rc;
 
@@ -1424,7 +1423,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	 */
 	aer = root ? root->aer_cap : 0;
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (aer && pcie_aer_is_native(root)) {
 		/* Disable Root's interrupt in response to error messages */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
 		reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
@@ -1443,7 +1442,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 			pci_is_root_bus(dev->bus) ? "Root" : "Downstream", rc);
 	}
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
+	if (aer && pcie_aer_is_native(root)) {
 		/* Clear Root Error Status */
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
 		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
index 1ac7fec47d6f..844297c0c85e 100644
--- a/drivers/pci/pcie/portdrv_core.c
+++ b/drivers/pci/pcie/portdrv_core.c
@@ -221,8 +221,7 @@ static int get_port_device_capability(struct pci_dev *dev)
 	}
 
 #ifdef CONFIG_PCIEAER
-	if (dev->aer_cap && pci_aer_available() &&
-	    (pcie_ports_native || host->native_aer))
+	if (pcie_aer_is_native(dev) && pci_aer_available())
 		services |= PCIE_PORT_SERVICE_AER;
 #endif
 
-- 
2.30.1 (Apple Git-130)


