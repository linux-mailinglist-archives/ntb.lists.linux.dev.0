Return-Path: <ntb+bounces-286-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B45965EC818
	for <lists+linux-ntb@lfdr.de>; Tue, 27 Sep 2022 17:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5D941C2092A
	for <lists+linux-ntb@lfdr.de>; Tue, 27 Sep 2022 15:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB134443A;
	Tue, 27 Sep 2022 15:37:06 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133B440E
	for <ntb@lists.linux.dev>; Tue, 27 Sep 2022 15:37:04 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so15924368pjm.1
        for <ntb@lists.linux.dev>; Tue, 27 Sep 2022 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aYko3ZVwyT696yLYGiiAUmeOR/6Iu/X0LpxMIdrnF54=;
        b=nNyLyfmm9vPfc2jkz+Ib2s8L5uC3nIxwYFbHTZBE4wm/19mEfJ56+zb27geFRML253
         q/VXhTiuuL2mDXXK0PfkRRR7dKyxvJoMkfBVOepSHcB9tU5wRAbmw86DLNAupCB9nfDw
         1TAyy2QtzNUCo1lh3Q9zR/Cu+o8Ptr84wOJ4Y3AHIdT7fWGI85DhTsQbp4Ai1PaprGqn
         7dII5kRS2bNvv+kQl7Jums4+c3XQEJnGwBuLIpPTAn84IwrHQFqTUGCq2t8wDker65dB
         B8CEXve20gKJdVD47CJRmsm8oiZ+ATCApVov2nJ0nGcGmFxxxtjaBGbDLmoxWfU5fAwg
         qtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aYko3ZVwyT696yLYGiiAUmeOR/6Iu/X0LpxMIdrnF54=;
        b=c28bASCIDtZ005rg2qbAKVZGt8bvypAKl/BfQLo+beOwthb+hIFrsBlcQflWY2hczn
         TwUjUXbudgomfWh+KxmNXRoOFf/mvVedlb4zZxFqlE4abULjRZh3ZqkZAetqcVbV9x3W
         nyuAZe8ncMaPVmLUaRShqrBT2gjsNCRozknsMOQx66Vq3qYGMSIJ7gX8Kj0ApT2B+dMb
         +qYsODnfoQnzjrD1dhKFyQ57VnhVQGMw8yLxnAxIQDQ1f+I1457Xl45Jf4r4yGz+T67+
         7yvavRUmABxRq4R84DYlNJCHddByVLUd3sQ/E3AM7MUHUuYh9MV7+xZ8M+yGKGjNSYBA
         aD7A==
X-Gm-Message-State: ACrzQf35v1JGylYyWVYa2g9fZBqjn1cTD42V+h+8cf9d0nna6r/wBrXI
	sLuAup8hNZ8fxtiVYzb0LGlaFw==
X-Google-Smtp-Source: AMsMyM6fWQZmnaPutJ9CdVBfyRI6BNcV0U/RqOi+poy1rkw3+bixybTGWSjCqMgNjjV43ajEgjBKAg==
X-Received: by 2002:a17:90b:278a:b0:202:6821:65f8 with SMTP id pw10-20020a17090b278a00b00202682165f8mr5248676pjb.157.1664293024148;
        Tue, 27 Sep 2022 08:37:04 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.36.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:37:03 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: bhelgaas@google.com,
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
Subject: [PATCH v2 6/9] PCI/AER: Move check inside pcie_clear_device_status().
Date: Tue, 27 Sep 2022 23:35:21 +0800
Message-Id: <20220927153524.49172-7-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcie_clear_device_status() doesn't check for pcie_aer_is_native()
internally, but after commit 068c29a248b6 ("PCI/ERR: Clear PCIe Device
Status errors only if OS owns AER") and commit aa344bc8b727 ("PCI/ERR:
Clear AER status only when we control AER"), both callers check before
calling it. So we move the check inside pcie_clear_device_status().

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pci.c      |  7 +++++--
 drivers/pci/pcie/aer.c |  4 ++--
 drivers/pci/pcie/err.c | 14 +++-----------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 95bc329e74c0..8caf4a5529a1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2282,9 +2282,12 @@ EXPORT_SYMBOL_GPL(pci_set_pcie_reset_state);
 void pcie_clear_device_status(struct pci_dev *dev)
 {
 	u16 sta;
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 
-	pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
-	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
+	if (host->native_aer || pcie_ports_native) {
+		pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
+		pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
+	}
 }
 #endif
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2ebd108339d..e2320ab27a31 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -971,11 +971,11 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 		 * Correctable error does not need software intervention.
 		 * No need to go through error recovery process.
 		 */
-		if (aer)
+		if (aer) {
 			pci_write_config_dword(dev, aer + PCI_ERR_COR_STATUS,
 					info->status);
-		if (pcie_aer_is_native(dev))
 			pcie_clear_device_status(dev);
+		}
 	} else if (info->severity == AER_NONFATAL)
 		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
 	else if (info->severity == AER_FATAL)
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 59c90d04a609..f80b21244ef1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -188,7 +188,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	int type = pci_pcie_type(dev);
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -241,16 +240,9 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	pci_dbg(bridge, "broadcast resume message\n");
 	pci_walk_bridge(bridge, report_resume, &status);
 
-	/*
-	 * If we have native control of AER, clear error status in the device
-	 * that detected the error.  If the platform retained control of AER,
-	 * it is responsible for clearing this status.  In that case, the
-	 * signaling device may not even be visible to the OS.
-	 */
-	if (host->native_aer || pcie_ports_native) {
-		pcie_clear_device_status(dev);
-		pci_aer_clear_nonfatal_status(dev);
-	}
+	pcie_clear_device_status(dev);
+	pci_aer_clear_nonfatal_status(dev);
+
 	pci_info(bridge, "device recovery successful\n");
 	return status;
 
-- 
2.30.1 (Apple Git-130)


