Return-Path: <ntb+bounces-1097-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B97A3FC6F
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 18:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37DA6164E03
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 16:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A9F22371F;
	Fri, 21 Feb 2025 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neAB8J0D"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ECA215F4C
	for <ntb@lists.linux.dev>; Fri, 21 Feb 2025 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156873; cv=none; b=G0yiQ0CyEknzqJtVWcR0/TDbBgrUl6Bgf5MLbU9OcfKI7Hz+gtbiyjezb1zNxouHWYKLyCny3PKRjz53DkCAE8tJcJD6+HJvsHGrRE2xMkL/l0IZ28NFYGQTd8NuMG9lkNgBiieI4Zkhpv4ozZvNlSATsaDlDS9VK5tP4GOwvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156873; c=relaxed/simple;
	bh=LiGS3+6W4VSmf7HQmdSuxLihLsGhBnmgTm1eWOTnPMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BM9+XeRpCbrnDrSJrCMet3COkrNJteaGiBwPxXqE5/bS7E9wNPZDFG7e8ENriI4FhMOPf/bzQzMFtmerSs3oEISjW1x9rbexa6Z+0G7XHloMTqsmnM5nLwdVHf5f8V+YitBKZ4eJV6n6AdNAwuL4HVVNpy0INm6R6DwDZlcpIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neAB8J0D; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156872; x=1771692872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LiGS3+6W4VSmf7HQmdSuxLihLsGhBnmgTm1eWOTnPMo=;
  b=neAB8J0D5Vqto4NAsxYCzLcLXQIgXX7s7A49DAZC5boPorAImvGU6syE
   hJZRAVj5tHjgeoXLxDibXiJ1D/DzQ8vHyLnNIy2yFOLyeXu84MX1vhkQe
   v8wnzENIEDaP5lp/wVVKuXa6zNEnkwr3I9G+C/GlGzvZKK1TrfV3p707M
   hRtyMBb15K8OG1qomnQ43W5UAM9vGQNzTyHQWxS5RJQP6ubMZkyL6Lzx/
   zSmXl1ERUNB8wXFcdlJsr5Ftj8OW2XqdfC1Q+VCRtxuIRJr3wI5PPnb5T
   qhiO1a/eygXZn0xlyyH/wQ5mYN0HZJyFzF8MCmTjNc06DQ3TKnOoAXuap
   Q==;
X-CSE-ConnectionGUID: 6pUg9V6ZSCmngxBkNN3dcw==
X-CSE-MsgGUID: kQ26ghsCS7SvuKDcajyX0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41187012"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41187012"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:54:32 -0800
X-CSE-ConnectionGUID: UQNDZ6jDTz6OrrNvOwAsqw==
X-CSE-MsgGUID: KS45uG5yS42oczuMKzA0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119540662"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 08:54:27 -0800
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
Subject: [PATCH v1 10/13] regulator: cros-ec: use devm_kmemdup_array()
Date: Fri, 21 Feb 2025 22:23:30 +0530
Message-Id: <20250221165333.2780888-11-raag.jadav@intel.com>
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
 drivers/regulator/cros-ec-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
index fb9643ed7a49..fb0767b33a36 100644
--- a/drivers/regulator/cros-ec-regulator.c
+++ b/drivers/regulator/cros-ec-regulator.c
@@ -138,8 +138,8 @@ static int cros_ec_regulator_init_info(struct device *dev,
 	data->num_voltages =
 		min_t(u16, ARRAY_SIZE(resp.voltages_mv), resp.num_voltages);
 	data->voltages_mV =
-		devm_kmemdup(dev, resp.voltages_mv,
-			     sizeof(u16) * data->num_voltages, GFP_KERNEL);
+		devm_kmemdup_array(dev, resp.voltages_mv, data->num_voltages,
+				   sizeof(resp.voltages_mv[0]), GFP_KERNEL);
 	if (!data->voltages_mV)
 		return -ENOMEM;
 
-- 
2.34.1


