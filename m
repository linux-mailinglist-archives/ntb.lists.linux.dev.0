Return-Path: <ntb+bounces-1098-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E969A3FC62
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 17:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88A817A890B
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 16:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BE921504E;
	Fri, 21 Feb 2025 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fu4n1qTn"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396A2248B0
	for <ntb@lists.linux.dev>; Fri, 21 Feb 2025 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156878; cv=none; b=IJQRCZGFadMAwpasC41ivUIlWGe5JxXJ6/oHUflhKECaPO7Aw87snRtM7nIaB5+XrzMq/n8iHhKHhDs2/Ht8vxCFtcEvW8fNEEB2Y+fQ168HdHUrpGX3MaoT2SuowYJS2we6rVA0pqNP1AmM7Cws6EvSvivWH1tMvKwEuZoHr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156878; c=relaxed/simple;
	bh=ed2DCzqGuQ7oYA4KGyuQboEdsEgBubtYVQfuHacbSo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhV4yBRzNfpM1FWPK+OEE6JF61wJS2eD4pj8QHye3LH2EZxExCDUbr4NrB2cCTkRXYo/KThnV9vN/2Xuw60BRxmx9FsTI7HSKdaBSbxXfxvz5nFWIdceh/OIoGT8jIMCBduYVWi6hz27weLIrODsExJ+aT8ts2ocsf3FqVmcA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fu4n1qTn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156877; x=1771692877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ed2DCzqGuQ7oYA4KGyuQboEdsEgBubtYVQfuHacbSo0=;
  b=Fu4n1qTnVu4Pbp9w3A/RKz72iouBn4FCSL+ThpxX5tsaUllk0+HoNBgz
   tPRX0zjrlfrEH2LjmL13901vQqPGujkUeJst63SZE8/iXc8P5IJBPRxLV
   m6e6+4j6LTA9Oy1n7DVUEKIXb7dWPmLRQ4V+tApzZSviAwEKptvuUdxge
   /5yFjtDqEeD+fOksBXo1mO6QUCtzO/s//V6xeq/fgGvTV3FkcaVHLhml5
   N9swYGfBq3G65rLhJK7YgYpisgTpu/X0PO6WnE3lu/gu9wGL3shBSw1iM
   4xFYch7XEPvc1Wn03M2jCX6WHWvnwV02aLnm5tcX1Oe4lOBXKMs42Liya
   A==;
X-CSE-ConnectionGUID: 2WNYRv5bSk2vOccnP86B2w==
X-CSE-MsgGUID: qOy9kwNjQYKT97K+e15elA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41187028"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41187028"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:54:37 -0800
X-CSE-ConnectionGUID: MPoog1KgQ2qkbS/wt55gJA==
X-CSE-MsgGUID: /ovU0+hCQTSflOLcEbQCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119540684"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 08:54:32 -0800
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
Subject: [PATCH v1 11/13] media: atmel-isi: use devm_kmemdup_array()
Date: Fri, 21 Feb 2025 22:23:31 +0530
Message-Id: <20250221165333.2780888-12-raag.jadav@intel.com>
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

Convert to use devm_kmemdup_array() and while at it, make the size robust
against type changes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 0d1c39347529..7d8bec46af89 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1072,16 +1072,12 @@ static int isi_formats_init(struct atmel_isi *isi)
 		return -ENXIO;
 
 	isi->num_user_formats = num_fmts;
-	isi->user_formats = devm_kcalloc(isi->dev,
-					 num_fmts, sizeof(struct isi_format *),
-					 GFP_KERNEL);
+	isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
+					       sizeof(isi_fmts[0]), GFP_KERNEL);
 	if (!isi->user_formats)
 		return -ENOMEM;
 
-	memcpy(isi->user_formats, isi_fmts,
-	       num_fmts * sizeof(struct isi_format *));
 	isi->current_fmt = isi->user_formats[0];
-
 	return 0;
 }
 
-- 
2.34.1


