Return-Path: <ntb+bounces-1100-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C779A3FC9D
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 18:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B741890CAE
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 16:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095E2216E19;
	Fri, 21 Feb 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeiWiGUi"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE4228CBE
	for <ntb@lists.linux.dev>; Fri, 21 Feb 2025 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156888; cv=none; b=dEgOYrTb7Zsl+EehmLb6BiXMdIYTGZ3wOml8Eds8+QJuc+7kYK9CeIg3iM+KXNUJQI+0n5SJYvz/4PfVOGOSAZ1dxpqu9TCcqNNTqIN3TuTBMWgOw4CPA5Jk5+1SdRyCL1mifYJnCBRxqcoqYW0cUJ0mFNIuVsW2FlDBH04R9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156888; c=relaxed/simple;
	bh=EOwyqYejNLfsT6rL68R+fEW9WTrw+NQl9DdiqdiokLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uANl95b7Bq3/OO57SWmBnPssWUJIdSo/gviktWLMdcH56u/WutX/O9BVwxrgm35JVT9qtIb6FcSyPV5JvR4mpwi5FfvFVeuE5xih5oN3hSYQMYS1Fv8qFDr2EN32ggmRl1XwxRd+SVpDZ6vqUVvnrplpRoF0dYuYsPIimlkzffA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeiWiGUi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156887; x=1771692887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EOwyqYejNLfsT6rL68R+fEW9WTrw+NQl9DdiqdiokLE=;
  b=aeiWiGUitzCR6ZpV6UNOhJcMO09O9gJYhTTTJNUWvh3eX0yPAPY1qkDH
   NuNGHrGBGuEZLvykN/1b83CT5hFDom6KZ3gmOM1l0u+NkGqYvbRNJDQQf
   ZyDgZ9CxB4SeCppFuhSPAIBm4kq6850aDGSRp1TKXcf+SXLiG5XtqR/11
   zai/Dj9kpx60Pxarc/n64aIr2Ai6wIssNzWambQevX656cAXVaxE860B6
   7b4eJvO9s7VMr0xXvyDx+At//1Ken7TCjQvHR+P2IXfxoG3/DPI/J/kt1
   Zw4mBqojhi7fw1aJ9UjEpNOcEKbZfVxe8qOsw846AgFncuQ/Cm1pPHp6d
   g==;
X-CSE-ConnectionGUID: qKBRN22bTOekQTCA7bRGQg==
X-CSE-MsgGUID: WVHl4kAgR9yOxs56DGeKRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41187058"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41187058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:54:47 -0800
X-CSE-ConnectionGUID: DYJJzhjaQOuDrU8A2DAUGw==
X-CSE-MsgGUID: ab/clBpBQ8asdRAQBm9BgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119540712"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 08:54:42 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	deller@gmx.de,
	andriy.shevchenko@linux.intel.com,
	sre@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	jdmason@kudzu.us,
	fancer.lancer@gmail.com
Cc: linux-sound@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 13/13] ntb: idt: use devm_kmemdup_array()
Date: Fri, 21 Feb 2025 22:23:33 +0530
Message-Id: <20250221165333.2780888-14-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221165333.2780888-1-raag.jadav@intel.com>
References: <20250221165333.2780888-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() which is more robust.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 544d8a4d2af5..dbfc53d0ef0c 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -1103,16 +1103,11 @@ static struct idt_mw_cfg *idt_scan_mws(struct idt_ntb_dev *ndev, int port,
 		}
 	}
 
-	/* Allocate memory for memory window descriptors */
-	ret_mws = devm_kcalloc(&ndev->ntb.pdev->dev, *mw_cnt, sizeof(*ret_mws),
-			       GFP_KERNEL);
-	if (!ret_mws)
-		return ERR_PTR(-ENOMEM);
-
 	/* Copy the info of detected memory windows */
-	memcpy(ret_mws, mws, (*mw_cnt)*sizeof(*ret_mws));
+	ret_mws = devm_kmemdup_array(&ndev->ntb.pdev->dev, mws, *mw_cnt,
+				     sizeof(mws[0]), GFP_KERNEL);
 
-	return ret_mws;
+	return ret_mws ?: ERR_PTR(-ENOMEM);
 }
 
 /*
-- 
2.34.1


