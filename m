Return-Path: <ntb+bounces-305-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D75EDADB
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 13:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31876280C1E
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD8EEC0;
	Wed, 28 Sep 2022 11:00:46 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F31C7B
	for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 11:00:44 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id cp18so3051306pjb.2
        for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rCPVKZ50NkFbH9E+3DsIFhzlzdb9LrGYkPCbNAondgs=;
        b=iLmZWvRN87k27aqqnGiiZyr/PIvIi6gyg+ubxnGsz6AYdpaL02gOAYpDwyX/av5gea
         SGBHsgy3kqlL+UdASZ5ba0G0uglZ6uIB/hlEynmvUiwavZfENlilap49GoCKCO8jil5s
         ykJhjtuNkA1jYk9HnORk/eRJKvKVIziGBjgU/YDTn0FHYWG/JIieXlD2ZML1eBckofJg
         19/H6u5nMnCZs4ZVHPx9hSz4jjHELKTW2Scm/xgg4Zs20v+XcW0UfJh0UjtkgmRdL/p3
         KO7B4Sni6jjjVPHeoGC8vnJK9t4cyJ26UjpqZrOFvpUSKtdd18rkQpcUIu0YBcdyw3Ez
         /e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rCPVKZ50NkFbH9E+3DsIFhzlzdb9LrGYkPCbNAondgs=;
        b=LJ5yDzyMv4cAMrCOfrXcC++B/0mBggBFM154sNUjFmE3FrzRBpYFaJDm/Rr7qsq9ZL
         O9fseSkgOgAVrt7I3oPu1TLE357dEMIPV/GSvsgFJw93JKgNsNsqHvxEiLUDCc0Oe8Lk
         TjpDvbl45nruaNPQ5UjuD0rHZcUgjU+3rMbxNJtsjBQVSs2YcInaaWtrqvFGZ8NjvIRS
         UVq4L+IceavyAMCxid9wCZsFt6g8icjsn30IuZjC98vwUwSSC3uB8f7+TZkbufVXgFt6
         TEPgbofzE1TiK96n2KbXHCNadMqkWGN92pZZNo+oOSuL4dogFRo0Vmq9HSqu41L4zfiQ
         ZqyQ==
X-Gm-Message-State: ACrzQf2Tx5z6MupuIlrGkFn7v+RrPWhjoi8IdVHTudU0E5woqonIWa/w
	mE0QzAJCCP7S80cU2Eo55N+RZQ==
X-Google-Smtp-Source: AMsMyM5lEci9yGqtj2f3PQKyVqu+eW1q1DBUopUebAIuNMUWTEcMe2lkXmVXLNNUz1watayaf6Zjww==
X-Received: by 2002:a17:90a:3989:b0:205:e4c2:e09b with SMTP id z9-20020a17090a398900b00205e4c2e09bmr6011652pjb.190.1664362843851;
        Wed, 28 Sep 2022 04:00:43 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:43 -0700 (PDT)
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
Subject: [PATCH v3 6/9] PCI/AER: Move check inside pcie_clear_device_status().
Date: Wed, 28 Sep 2022 18:59:43 +0800
Message-Id: <20220928105946.12469-7-chenzhuo.1@bytedance.com>
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

pcie_clear_device_status() doesn't check for pcie_aer_is_native()
internally, but after commit 068c29a248b6 ("PCI/ERR: Clear PCIe Device
Status errors only if OS owns AER") and commit aa344bc8b727 ("PCI/ERR:
Clear AER status only when we control AER"), both callers check before
calling it. So move the check inside pcie_clear_device_status().

pcie_clear_device_status() and pci_aer_clear_nonfatal_status() both
have check internally, so remove check when callers calling them.

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


