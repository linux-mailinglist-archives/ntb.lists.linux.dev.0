Return-Path: <ntb+bounces-1286-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB095ACCBB3
	for <lists+linux-ntb@lfdr.de>; Tue,  3 Jun 2025 19:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3041897357
	for <lists+linux-ntb@lfdr.de>; Tue,  3 Jun 2025 17:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7E21E5B71;
	Tue,  3 Jun 2025 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xMbxkOQq"
X-Original-To: ntb@lists.linux.dev
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7551B0F0A
	for <ntb@lists.linux.dev>; Tue,  3 Jun 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970250; cv=none; b=h1DfJYIYANd83MlGO0fnZBTX0nvK9mGT5gd+mxOkqBRSdU6YOnC4GgKNUaxLu/utXekSsRFKOGWwnTfif3IL4D2ou9RNhpWV5Ug909RJroBIa2yVyZDBmN4MQKXGdoUs4MQrfw+U9Z2aftDagQFnfhXfeiMvpieDAT3rw5inpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970250; c=relaxed/simple;
	bh=+ePQnJDcFqkQJpItAOPJsBodMxVCJcjaopq3bndTN+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKT5etrAQlRVxUWweGhSm7DtQPndbouMHlM1mXFzlkFV/YeBQLP5aa9+jG0nLSrazUgavDC3h4dKAo2E423H13ZJbBQCSPrTAz7uyDxVks9oV3HSntaf16snqK7w9CcShoJNjGjm0gkoGysaQaTqtrEtTEFdwsXbCosRvWjK/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xMbxkOQq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4508287895dso397405e9.1
        for <ntb@lists.linux.dev>; Tue, 03 Jun 2025 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748970245; x=1749575045; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKzxSvkuFHVX/dTGPAv3o3KaERfEbJG/IRGT5UdUnSc=;
        b=xMbxkOQqmaK7SNEN3ecehZRCdlrPWK607Ye5IdH40owSb3DRkCvh2Mvikk5c52phDq
         M/vl2uSV6kb93iRB09J/rMtML7axXTF67h+uw3uVlplyrFb9UPbDZdzOGwU7pDJzBb8u
         xxGbBrINVMkCUngQVugDdO83Ydefw3fPuicoEwj1K/uBJG+XlczJAJad8NOalGxxj7KJ
         vkUEQ4gp3yrl61xVktrjtUh/3ttqI7I0JEFAFdURi/Qdo57WXuIcc/YIp42jMQpJnFZJ
         eF3cmDkNQvrt6zlRTwdL2ZM/4ComUjbxuwvsVgw5UddhNtV/dTTopYIfh8ZzwsJ+E9YJ
         bdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970245; x=1749575045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKzxSvkuFHVX/dTGPAv3o3KaERfEbJG/IRGT5UdUnSc=;
        b=AMHJAlAgBxFALR1uZt+p1y2u3DkH6b8XvlD71guDow68ullKHVvu459C/Jz4aYyQ+Y
         9XrvtlzP7aUNnNSGsPOZBke/lT79kG88zkH7SDBPWMEdpSkosUf5HlIo+kogBnxuwv5M
         T4sfJS44tsZVo9HOVuu5M53o2tma66yr/j68r3u/B0mJirXw5/EFVI5D1TdeEIwPCmL0
         69HoMIr5H6y8rzj3yXbFrIG/WApJBmBgCpJ2rs5sZ7YTcVDBlzRa6GfgshVOuwcDd8lP
         6bM2veDLVZK0qMo0qWspfKz2FAVQp9ixtnOp9yzQ/Mrf1/XD2DF8XmtXbM/Z0wj+85ts
         qH1w==
X-Gm-Message-State: AOJu0Yw/ATeZOV3QLj16QbD/33vPTIimX1pjFm01bBB6YAUwQaOBKHO/
	6HPOaue3d5yfpxSky5pXDZXY9DuTGp65vXeUkWSulLTUmN6ZLmoT/CelXky9RYsoKRA=
X-Gm-Gg: ASbGncu2t0cC0B/s+lf56BsCHtNa2ULGUL9Iy91Yk64Zv2feIHDMXZ/Um5oq5X0cRvx
	zevdwI7r1X5y3XhAattl7CjvTpmlOL4hDCabG24W4I1jbz8G9+QZZlp0/vHjNFHM7fGTA1I9Q2F
	uky/3j+bSr+SvvJChuPrTftxn0W6BVmF59onJyuW4IXJGXgTvp0Fa9zwfHiZlFbXLfaMNObzjoE
	Iecp32n4iruB+ZMW/FeI/Gd2cGcRozGgEMatBGWXV8yvtuaG7SSig7eKbr/gV6YbcRgjc3tK9xp
	waHsfI68cPUye6aBcwr5tGT3YInJjaSCHYA/KwpcmyF13rv9tqNaT4+g+8s/6WD+IA==
X-Google-Smtp-Source: AGHT+IF/bbnRWhXnCMm4/LMO0sxRqkVkmCI0hgssSEjAwOUAWspKM6UfG2ikSMVxykZS/l4e3f9CLA==
X-Received: by 2002:a05:600c:1e0d:b0:451:e260:353d with SMTP id 5b1f17b1804b1-451e65ab8d5mr34535215e9.8.1748970245445;
        Tue, 03 Jun 2025 10:04:05 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:ce70:8503:aea6:a8ed])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm19165796f8f.69.2025.06.03.10.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:04:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 03 Jun 2025 19:03:40 +0200
Subject: [PATCH v2 3/3] PCI: endpoint: pci-epf-vntb: Allow BAR assignment
 via configfs
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-pci-vntb-bar-mapping-v2-3-fc685a22ad28@baylibre.com>
References: <20250603-pci-vntb-bar-mapping-v2-0-fc685a22ad28@baylibre.com>
In-Reply-To: <20250603-pci-vntb-bar-mapping-v2-0-fc685a22ad28@baylibre.com>
To: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
 Allen Hubbe <allenbh@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7504; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=+ePQnJDcFqkQJpItAOPJsBodMxVCJcjaopq3bndTN+U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoPysBV7firfAE+AzkkStnAoQeF5a2evaqJzTz+
 vEgGBG7I1WJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaD8rAQAKCRDm/A8cN/La
 hZLjD/oCLt8l8hWeZLpqseq38yP/0NebqBRpu9cWfo7uV8rt9Mxi8V0hnxz/QTjSmjdI6U/mTb8
 3T1RGLtERE7FFQ2ZRfTjjkxwf4NR7FbBO7GddhG/UakMBTBlBlJ+C0GVFK1horqdC7VJPyMs1tC
 6yUQgFHLAdcp0atQLDMtzwMFn1W8XSt0eFx+2Rc89Cgvci9C5qCvCwF+d/YYLV9+7EKU6KtF1Y9
 /T6UI4kymQzewV1HyRHtU5nFgErgrILrXf+w0a9dtHPsm2VLJwQQRYxcqH2ECvxPvCmqIbLeECN
 MuGmykicgJ3dZeUr1P41tAOTike0QlH6A26b0g5bSqvnIq8Nj9NU749Fk+LKKgh7cL5z7waoAy0
 yXHcU4N1pA5Fd46cLvxzPfCqTHiucUI6MDLotrMIVzGDZ/UZpTAL6kl4WxQ8nHPKg/OqfZZOgkm
 kWk7V15TVIpbCnh4uui8gkBqKYMn+gsfGq3cICHR62Aff5Qj70FIAGhTJKCOUinBj3ypmzsyuXU
 0GwQ0eKUVi2Sv+T04ORRkG05yio4hEYlguvGX+PppiqLpKV5hUIxg1H6Uz6v2mO4YGpSm2ua5SE
 0Li7rBPxU+gPGC/RoQwp/F/KwwjQYVoSLj4rk+Ub3vIdWcotW+j7znsUyhTI0qbCgAQ09wUgcLN
 H5J/xwyGDcdOTWg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The current BAR configuration for the PCI vNTB endpoint function allocates
BARs in order, which lacks flexibility and does not account for
platform-specific quirks. This is problematic on Renesas platforms, where
BAR_4 is a fixed 256B region that ends up being used for MW1, despite being
better suited for doorbells.

Add new configfs attributes to allow users to specify arbitrary BAR
assignments. If no configuration is provided, the driver retains its
original behavior of sequential BAR allocation, preserving compatibility
with existing userspace setups.

This enables use cases such as assigning BAR_2 for MW1 and using the
limited BAR_4 for doorbells on Renesas platforms.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 131 ++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 2198282a80a40774047502a37f0288ca396bdb0e..7475d87659b1c70aa41b0999eabfa661f4ceed39 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -73,6 +73,8 @@ enum epf_ntb_bar {
 	BAR_MW1,
 	BAR_MW2,
 	BAR_MW3,
+	BAR_MW4,
+	VNTB_BAR_NUM,
 };
 
 /*
@@ -132,7 +134,7 @@ struct epf_ntb {
 	bool linkup;
 	u32 spad_size;
 
-	enum pci_barno epf_ntb_bar[6];
+	enum pci_barno epf_ntb_bar[VNTB_BAR_NUM];
 
 	struct epf_ntb_ctrl *reg;
 
@@ -654,6 +656,62 @@ static void epf_ntb_epc_destroy(struct epf_ntb *ntb)
 	pci_epc_put(ntb->epf->epc);
 }
 
+
+/**
+ * epf_ntb_is_bar_used() - Check if a bar is used in the ntb configuration
+ * @ntb: NTB device that facilitates communication between HOST and VHOST
+ * @barno: Checked bar number
+ *
+ * Returns: true if used, false if free.
+ */
+static bool epf_ntb_is_bar_used(struct epf_ntb *ntb,
+				enum pci_barno barno)
+{
+	int i;
+
+	for (i = 0; i < VNTB_BAR_NUM; i++) {
+		if (ntb->epf_ntb_bar[i] == barno)
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * epf_ntb_find_bar() - Assign BAR number when no configuration is provided
+ * @epc_features: The features provided by the EPC specific to this EPF
+ * @ntb: NTB device that facilitates communication between HOST and VHOST
+ * @barno: Bar start index
+ *
+ * When the BAR configuration was not provided through the userspace
+ * configuration, automatically assign BAR as it has been historically
+ * done by this endpoint function.
+ *
+ * Returns: the BAR number found, if any. -1 otherwise
+ */
+static int epf_ntb_find_bar(struct epf_ntb *ntb,
+			    const struct pci_epc_features *epc_features,
+			    enum epf_ntb_bar bar,
+			    enum pci_barno barno)
+{
+	while (ntb->epf_ntb_bar[bar] < 0) {
+		barno = pci_epc_get_next_free_bar(epc_features, barno);
+		if (barno < 0)
+			break; /* No more BAR available */
+
+		/*
+		 * Verify if the BAR found is not already assigned
+		 * through the provided configuration
+		 */
+		if (!epf_ntb_is_bar_used(ntb, barno))
+			ntb->epf_ntb_bar[bar] = barno;
+
+		barno += 1;
+	}
+
+	return barno;
+}
+
 /**
  * epf_ntb_init_epc_bar() - Identify BARs to be used for each of the NTB
  * constructs (scratchpad region, doorbell, memorywindow)
@@ -676,23 +734,21 @@ static int epf_ntb_init_epc_bar(struct epf_ntb *ntb)
 	epc_features = pci_epc_get_features(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no);
 
 	/* These are required BARs which are mandatory for NTB functionality */
-	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++, barno++) {
-		barno = pci_epc_get_next_free_bar(epc_features, barno);
+	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++) {
+		barno = epf_ntb_find_bar(ntb, epc_features, bar, barno);
 		if (barno < 0) {
 			dev_err(dev, "Fail to get NTB function BAR\n");
 			return -EINVAL;
 		}
-		ntb->epf_ntb_bar[bar] = barno;
 	}
 
 	/* These are optional BARs which don't impact NTB functionality */
-	for (bar = BAR_MW1, i = 1; i < num_mws; bar++, barno++, i++) {
-		barno = pci_epc_get_next_free_bar(epc_features, barno);
+	for (bar = BAR_MW1, i = 1; i < num_mws; bar++, i++) {
+		barno = epf_ntb_find_bar(ntb, epc_features, bar, barno);
 		if (barno < 0) {
 			ntb->num_mws = i;
 			dev_dbg(dev, "BAR not available for > MW%d\n", i + 1);
 		}
-		ntb->epf_ntb_bar[bar] = barno;
 	}
 
 	return 0;
@@ -860,6 +916,37 @@ static ssize_t epf_ntb_##_name##_store(struct config_item *item,	\
 	return len;							\
 }
 
+#define EPF_NTB_BAR_R(_name, _id)					\
+	static ssize_t epf_ntb_##_name##_show(struct config_item *item,	\
+					      char *page)		\
+	{								\
+		struct config_group *group = to_config_group(item);	\
+		struct epf_ntb *ntb = to_epf_ntb(group);		\
+									\
+		return sprintf(page, "%d\n", ntb->epf_ntb_bar[_id]);	\
+	}
+
+#define EPF_NTB_BAR_W(_name, _id)					\
+	static ssize_t epf_ntb_##_name##_store(struct config_item *item, \
+					       const char *page, size_t len) \
+	{								\
+	struct config_group *group = to_config_group(item);		\
+	struct epf_ntb *ntb = to_epf_ntb(group);			\
+	int val;							\
+	int ret;							\
+									\
+	ret = kstrtoint(page, 0, &val);					\
+	if (ret)							\
+		return ret;						\
+									\
+	if (val < NO_BAR || val > BAR_5)				\
+		return -EINVAL;						\
+									\
+	ntb->epf_ntb_bar[_id] = val;					\
+									\
+	return len;							\
+	}
+
 static ssize_t epf_ntb_num_mws_store(struct config_item *item,
 				     const char *page, size_t len)
 {
@@ -899,6 +986,18 @@ EPF_NTB_MW_R(mw3)
 EPF_NTB_MW_W(mw3)
 EPF_NTB_MW_R(mw4)
 EPF_NTB_MW_W(mw4)
+EPF_NTB_BAR_R(ctrl_bar, BAR_CONFIG)
+EPF_NTB_BAR_W(ctrl_bar, BAR_CONFIG)
+EPF_NTB_BAR_R(db_bar, BAR_DB)
+EPF_NTB_BAR_W(db_bar, BAR_DB)
+EPF_NTB_BAR_R(mw1_bar, BAR_MW1)
+EPF_NTB_BAR_W(mw1_bar, BAR_MW1)
+EPF_NTB_BAR_R(mw2_bar, BAR_MW1)
+EPF_NTB_BAR_W(mw2_bar, BAR_MW1)
+EPF_NTB_BAR_R(mw3_bar, BAR_MW3)
+EPF_NTB_BAR_W(mw3_bar, BAR_MW3)
+EPF_NTB_BAR_R(mw4_bar, BAR_MW4)
+EPF_NTB_BAR_W(mw4_bar, BAR_MW4)
 
 CONFIGFS_ATTR(epf_ntb_, spad_count);
 CONFIGFS_ATTR(epf_ntb_, db_count);
@@ -910,6 +1009,12 @@ CONFIGFS_ATTR(epf_ntb_, mw4);
 CONFIGFS_ATTR(epf_ntb_, vbus_number);
 CONFIGFS_ATTR(epf_ntb_, vntb_pid);
 CONFIGFS_ATTR(epf_ntb_, vntb_vid);
+CONFIGFS_ATTR(epf_ntb_, ctrl_bar);
+CONFIGFS_ATTR(epf_ntb_, db_bar);
+CONFIGFS_ATTR(epf_ntb_, mw1_bar);
+CONFIGFS_ATTR(epf_ntb_, mw2_bar);
+CONFIGFS_ATTR(epf_ntb_, mw3_bar);
+CONFIGFS_ATTR(epf_ntb_, mw4_bar);
 
 static struct configfs_attribute *epf_ntb_attrs[] = {
 	&epf_ntb_attr_spad_count,
@@ -922,6 +1027,12 @@ static struct configfs_attribute *epf_ntb_attrs[] = {
 	&epf_ntb_attr_vbus_number,
 	&epf_ntb_attr_vntb_pid,
 	&epf_ntb_attr_vntb_vid,
+	&epf_ntb_attr_ctrl_bar,
+	&epf_ntb_attr_db_bar,
+	&epf_ntb_attr_mw1_bar,
+	&epf_ntb_attr_mw2_bar,
+	&epf_ntb_attr_mw3_bar,
+	&epf_ntb_attr_mw4_bar,
 	NULL,
 };
 
@@ -1379,6 +1490,7 @@ static int epf_ntb_probe(struct pci_epf *epf,
 {
 	struct epf_ntb *ntb;
 	struct device *dev;
+	int i;
 
 	dev = &epf->dev;
 
@@ -1389,6 +1501,11 @@ static int epf_ntb_probe(struct pci_epf *epf,
 	epf->header = &epf_ntb_header;
 	ntb->epf = epf;
 	ntb->vbus_number = 0xff;
+
+	/* Initially, no bar is assigned */
+	for (i = 0; i < VNTB_BAR_NUM; i++)
+		ntb->epf_ntb_bar[i] = NO_BAR;
+
 	epf_set_drvdata(epf, ntb);
 
 	dev_info(dev, "pci-ep epf driver loaded\n");

-- 
2.47.2


