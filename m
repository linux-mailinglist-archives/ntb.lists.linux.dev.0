Return-Path: <ntb+bounces-1096-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBAA3FC9B
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 18:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C961E865DFA
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 16:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01E52153FE;
	Fri, 21 Feb 2025 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUtfb9tB"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1722331E
	for <ntb@lists.linux.dev>; Fri, 21 Feb 2025 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156868; cv=none; b=jUuS094sLgzJSUA9QkeyAz0jqeK5iI1OPa72cHffMW4W96Tlc/7rloT9WpnK/AMbxzifHW4bI4YPtdl3o6HhyKcDhtRLb2eSxD7I7K3bZr3ua3o5ElkqXwMy+71/sSlkr7lpJpXI6YdFgeuPpZbHBHXDlYGT2toXxx/zEcjCmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156868; c=relaxed/simple;
	bh=A43sWN4sdLq3tQc+IB25Ps/3Ig8snwsi8Gmk90X6cpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DK6Yvl8/tUSYLG9DI79zsqwciZJyezPnpiP73qYWTi9PHoyqM5X7ae50S9aKDKHen7ZMr/dEEaVxhMJ/D0jm1q+nHZJXGy17VjxmHZPLTPmqA+fD5XBOn8h2SDU8SfE9yNpgaaG6RN7xwx3ConcpNWf1rbbGuuDp/9USqIUcZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUtfb9tB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156867; x=1771692867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A43sWN4sdLq3tQc+IB25Ps/3Ig8snwsi8Gmk90X6cpQ=;
  b=iUtfb9tB8PAItLaGqefacRPCk3RaceVQxi3U288tByIxS56EyGRZLmTc
   oG3F5s+ARqpkpN4nYCcg1R2ceWOZW9o2gRcBmfc+P8lBJLMLj20wpG5I7
   YEXyTXXZronjRt9NOZMVQ1giKz+MGSAtFJBqGguJAxCSyaZ5oYJmpT1s3
   25f22KeYaIumbdM6qGkgDdZdq6+3xvBHsFCfV1NYvpXjZOKCwf+MJ1EUt
   Gyhzf/ngtoY2A9a2E7reLFxADl+DqBI0fdjyor4LEUrLK4MEX+tTUmZ1K
   /gd22IfXUQGkSO91CI1CHrKnBjeTuobkkEiYJt5fWCwrve+RUZd7gBPY3
   g==;
X-CSE-ConnectionGUID: EfDn3o/8Txut9kS7BS6tkg==
X-CSE-MsgGUID: BbfHjy4tSlOnrg2JyHU3/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186996"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41186996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:54:27 -0800
X-CSE-ConnectionGUID: ZO72wDWjR+S/AYe3IWuDrg==
X-CSE-MsgGUID: rsbgpl0GTBi/tx9p6TvNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119540651"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 08:54:22 -0800
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
Subject: [PATCH v1 09/13] regulator: devres: use devm_kmemdup_array()
Date: Fri, 21 Feb 2025 22:23:29 +0530
Message-Id: <20250221165333.2780888-10-raag.jadav@intel.com>
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
 drivers/regulator/devres.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 36164aec30e8..ab238579879c 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -332,9 +332,8 @@ int devm_regulator_bulk_get_const(struct device *dev, int num_consumers,
 				  const struct regulator_bulk_data *in_consumers,
 				  struct regulator_bulk_data **out_consumers)
 {
-	*out_consumers = devm_kmemdup(dev, in_consumers,
-				      num_consumers * sizeof(*in_consumers),
-				      GFP_KERNEL);
+	*out_consumers = devm_kmemdup_array(dev, in_consumers, num_consumers,
+					    sizeof(*in_consumers), GFP_KERNEL);
 	if (*out_consumers == NULL)
 		return -ENOMEM;
 
-- 
2.34.1


