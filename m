Return-Path: <ntb+bounces-199-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFC5A9ECD
	for <lists+linux-ntb@lfdr.de>; Thu,  1 Sep 2022 20:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7EF1C2091C
	for <lists+linux-ntb@lfdr.de>; Thu,  1 Sep 2022 18:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6FA6D3F;
	Thu,  1 Sep 2022 18:17:44 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E86AD6
	for <ntb@lists.linux.dev>; Thu,  1 Sep 2022 18:17:42 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id o4so17931756pjp.4
        for <ntb@lists.linux.dev>; Thu, 01 Sep 2022 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Qndv3o1BDX4jKEhP6/cOGCGzKhPbNgFyLvmips1cGSw=;
        b=FB7FfwWCgxkwUTWFM7Sw5xQt+sq6IDLt2GAs7if+LO4ecKp/ZUo6kDhfslTqqthehO
         2RK8MzFbGVTTc4iiOy4fY3BnMqA6JXgN7S1VKmuJHPkGqBpUGH8ZY9dbQ0NOECAFuWRp
         +UUDhfKaT9rmV+JhYm+Wm+PhPPpzPaqZA03GSvr0XQsoWaZa7FafP1bq8gMlE4X2DBRk
         UPITBeIrd815eFRsQX6bDIn0dwOzVWwoEI5mUHkLU5ya3DEgDQHKyMv/P7Xrautiovy5
         NYnt8vuKn8lR0GvNHF0lEVLrxQOlBoCizuB+s32VtUfzz1M03JJds1K4bq+FR7vragN6
         2o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Qndv3o1BDX4jKEhP6/cOGCGzKhPbNgFyLvmips1cGSw=;
        b=Ot/NyqbKuRvJmk0psVrBy6MUeG4MONgHJuoWbgtFQx8s7X5dhfPZ0qBBolMJd0cjty
         5Eq14fNB47NZ+C6Fsh+JWaMwqpJNFEeDVpV8Ke3JG4Cjz07QEK3dw5T82DE40AoSOzjG
         jIUEZObOQ5e0PkkuAsvRfHN07nkheNtD1WBHSCPKaM4r+rqWsij4ncdAMrSYsBt2/kL0
         5w7yv8Z9q7vBWY4aEC7HIrvzP8I7Aj32o8362fZCaB7sfkq+RvMZpM++7gaJG2U5MjlK
         zlmzjREOEx8nbjDtWPbl4yKbGnC99tdI+j9GoqaGDsXqkhsCSGZxSaKp+xEXk/MJ8mC0
         dXnA==
X-Gm-Message-State: ACgBeo3hzrrJkuKokkq+K8SqdEgCIu+U1/6TfA1fIKoAv11yvsaDmwtA
	LX+g6fmLpa8IpEY/Lb/pG2MLTw==
X-Google-Smtp-Source: AA6agR4PxlK0UMCpv71RWneKT6bQBirMFB3bozWatDAlt9JYr56eh/p2iO9GDm2iig97kJwvE3nR4g==
X-Received: by 2002:a17:90a:c789:b0:1fa:6bc0:77f6 with SMTP id gn9-20020a17090ac78900b001fa6bc077f6mr431798pjb.1.1662056262329;
        Thu, 01 Sep 2022 11:17:42 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b0017519b86996sm6320538plh.218.2022.09.01.11.17.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2022 11:17:42 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: chenzhuo.1@bytedance.com,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 1/3] PCI/AER: Use pci_aer_clear_uncorrect_error_status() to clear uncorrectable error status
Date: Fri,  2 Sep 2022 02:16:32 +0800
Message-Id: <20220901181634.99591-2-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
References: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Status bits for ERR_NONFATAL errors only are cleared in
pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
error status in ntb_hw_idt.c and lpfc_attr.c. So we add
pci_aer_clear_uncorrect_error_status() and change to use it.

Use pci_aer_clear_nonfatal_status() in dpc_process_error(), which has
no functional changes.

Since pci_aer_clear_nonfatal_status() is used only internally, move
its declaration to the PCI internal header file. Also, no one cares
about return value of pci_aer_clear_nonfatal_status(), so make it void.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c |  4 ++--
 drivers/pci/pci.h               |  2 ++
 drivers/pci/pcie/aer.c          | 23 ++++++++++++++++++-----
 drivers/pci/pcie/dpc.c          |  3 +--
 drivers/scsi/lpfc/lpfc_attr.c   |  4 ++--
 include/linux/aer.h             |  4 ++--
 6 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 733557231ed0..de1dbbc5b9de 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	ret = pci_enable_pcie_error_reporting(pdev);
 	if (ret != 0)
 		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
-	else /* Cleanup nonfatal error status before getting to init */
-		pci_aer_clear_nonfatal_status(pdev);
+	else /* Cleanup uncorrectable error status before getting to init */
+		pci_aer_clear_uncorrect_error_status(pdev);
 
 	/* First enable the PCI device */
 	ret = pcim_enable_device(pdev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e10cdec6c56e..574176f43025 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -686,6 +686,7 @@ void pci_aer_init(struct pci_dev *dev);
 void pci_aer_exit(struct pci_dev *dev);
 extern const struct attribute_group aer_stats_attr_group;
 void pci_aer_clear_fatal_status(struct pci_dev *dev);
+void pci_aer_clear_nonfatal_status(struct pci_dev *dev);
 int pci_aer_clear_status(struct pci_dev *dev);
 int pci_aer_raw_clear_status(struct pci_dev *dev);
 #else
@@ -693,6 +694,7 @@ static inline void pci_no_aer(void) { }
 static inline void pci_aer_init(struct pci_dev *d) { }
 static inline void pci_aer_exit(struct pci_dev *d) { }
 static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
+static inline void pci_aer_clear_nonfatal_status(struct pci_dev *dev) { }
 static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
 static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
 #endif
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 7952e5efd6cf..d2996afa80f6 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -251,13 +251,13 @@ int pci_disable_pcie_error_reporting(struct pci_dev *dev)
 }
 EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
 
-int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
+void pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
 	u32 status, sev;
 
 	if (!pcie_aer_is_native(dev))
-		return -EIO;
+		return;
 
 	/* Clear status bits for ERR_NONFATAL errors only */
 	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
@@ -265,10 +265,7 @@ int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 	status &= ~sev;
 	if (status)
 		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
-
-	return 0;
 }
-EXPORT_SYMBOL_GPL(pci_aer_clear_nonfatal_status);
 
 void pci_aer_clear_fatal_status(struct pci_dev *dev)
 {
@@ -286,6 +283,22 @@ void pci_aer_clear_fatal_status(struct pci_dev *dev)
 		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
 }
 
+int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
+{
+	int aer = dev->aer_cap;
+	u32 status;
+
+	if (!pcie_aer_is_native(dev))
+		return -EIO;
+
+	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
+	if (status)
+		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_aer_clear_uncorrect_error_status);
+
 /**
  * pci_aer_raw_clear_status - Clear AER error registers.
  * @dev: the PCI device
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 3e9afee02e8d..7942073fbb34 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
+		pci_aer_clear_uncorrect_error_status(pdev);
 	}
 }
 
diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 3caaa7c4af48..1ed8d1640325 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -4712,7 +4712,7 @@ static DEVICE_ATTR_RW(lpfc_aer_support);
  * Description:
  * If the @buf contains 1 and the device currently has the AER support
  * enabled, then invokes the kernel AER helper routine
- * pci_aer_clear_nonfatal_status() to clean up the uncorrectable
+ * pci_aer_clear_uncorrect_error_status() to clean up the uncorrectable
  * error status register.
  *
  * Notes:
@@ -4738,7 +4738,7 @@ lpfc_aer_cleanup_state(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 
 	if (phba->hba_flag & HBA_AER_ENABLED)
-		rc = pci_aer_clear_nonfatal_status(phba->pcidev);
+		rc = pci_aer_clear_uncorrect_error_status(phba->pcidev);
 
 	if (rc == 0)
 		return strlen(buf);
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 97f64ba1b34a..f638ad955deb 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -44,7 +44,7 @@ struct aer_capability_regs {
 /* PCIe port driver needs this function to enable AER */
 int pci_enable_pcie_error_reporting(struct pci_dev *dev);
 int pci_disable_pcie_error_reporting(struct pci_dev *dev);
-int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
+int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev);
 void pci_save_aer_state(struct pci_dev *dev);
 void pci_restore_aer_state(struct pci_dev *dev);
 #else
@@ -56,7 +56,7 @@ static inline int pci_disable_pcie_error_reporting(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
-static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
+static inline int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
-- 
2.30.1 (Apple Git-130)


