Return-Path: <ntb+bounces-1087-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C5A3FC67
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 17:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA2C3BA6EB
	for <lists+linux-ntb@lfdr.de>; Fri, 21 Feb 2025 16:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7A321505A;
	Fri, 21 Feb 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVBw0SDh"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2B214A9A
	for <ntb@lists.linux.dev>; Fri, 21 Feb 2025 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156823; cv=none; b=pnCfhVn/HF8YjZA2vczmh5DEldRqBRm9PV48R2hk8e7Q3OmctxdH9bBRj1gxnmZCL/0bwH/zoVUjuE4zcfjvewN93vCWsv+Np3Qkbrjp251XH7tLNXXKYp5T83DkQnd2R+OxYnizwVnVnavLr88z2q5HCCcoxWIEU5wS2HsS0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156823; c=relaxed/simple;
	bh=2rRlTeGBa/v+F/AVLqrsIcSSJAryM6w5Ldgl/1cCG8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nnk41xQJyqV8UZBmuOF3yduWM1dxTwhwAv4vCfl75LnNr4lXe8Zv0JypZerYthQLWm2Utjidwf4UClVTPiV+aMzlsYEmweoSAuMgBS42M187P23TCsQVSw/4v/uoZpS94t2nFcY0xU7Zam8Yxvv6I/xIT0QgvTtWNoqJ3C6e4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVBw0SDh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156821; x=1771692821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2rRlTeGBa/v+F/AVLqrsIcSSJAryM6w5Ldgl/1cCG8Y=;
  b=TVBw0SDhRRajyo2oowxxlchSqr82JNSPKjoZtggi7wr81fbQuwFhX5VN
   PqfKmmkela7pevq7qKvBorvbPUUrVJxgED+uVbWxmM6o7OqtUsKGtIEvc
   D8jTcgpBybb9PcXuDu1uD5FrTgoPt2RGsifKM63oM72BFfkgTuRkNT4gz
   30g+L13/n912+/6W3KXvE27sFJycllTmvjqmxne9WqgqqyVzSRMml9fbq
   60c3dJDkOnqFDc6oEw+DLUVIyejToGv2SqupGda+6B3Tb43x+nlQpvFJs
   eNwbl0bYhgMg8Ac3eU1okYMhe7bvCvhKYZM8IMixl6m3Jg4uUsDspChdD
   g==;
X-CSE-ConnectionGUID: 3scPa7iPQBCF51rdaPiWgA==
X-CSE-MsgGUID: Tm8tFUzTQE2W6QXcksSCiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186801"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41186801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:53:41 -0800
X-CSE-ConnectionGUID: etn1Crk0T8mejC6g/A9O+g==
X-CSE-MsgGUID: bHwbSUa4R7qC9s8Tvw6bSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119540590"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 08:53:36 -0800
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
Subject: [PATCH v1 00/13] Convert to use devm_kmemdup_array()
Date: Fri, 21 Feb 2025 22:23:20 +0530
Message-Id: <20250221165333.2780888-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series is the second wave of patches to add users of newly introduced
devm_kmemdup_array() helper. Original series on [1].

This depends on changes available on immutable tag[2]. Feel free to pick
your subsystem patches with it, or share your preferred way to route them.

[1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com
[2] https://lore.kernel.org/r/Z7cqCaME4LxTTBn6@black.fi.intel.com

Raag Jadav (13):
  ASoC: Intel: avs: use devm_kmemdup_array()
  ASoC: hdac_hdmi: use devm_kmemdup_array()
  ASoC: tlv320dac33: use devm_kmemdup_array()
  ASoC: uda1380: use devm_kmemdup_array()
  ASoC: meson: axg-tdm-interface: use devm_kmemdup_array()
  ASoC: uniphier: use devm_kmemdup_array()
  fbdev: pxafb: use devm_kmemdup_array()
  power: supply: sc27xx: use devm_kmemdup_array()
  regulator: devres: use devm_kmemdup_array()
  regulator: cros-ec: use devm_kmemdup_array()
  media: atmel-isi: use devm_kmemdup_array()
  media: stm32-dcmi: use devm_kmemdup_array()
  ntb: idt: use devm_kmemdup_array()

 drivers/media/platform/atmel/atmel-isi.c     |  8 ++------
 drivers/media/platform/st/stm32/stm32-dcmi.c |  8 ++------
 drivers/ntb/hw/idt/ntb_hw_idt.c              | 11 +++-------
 drivers/power/supply/sc27xx_fuel_gauge.c     |  5 ++---
 drivers/regulator/cros-ec-regulator.c        |  4 ++--
 drivers/regulator/devres.c                   |  5 ++---
 drivers/video/fbdev/pxafb.c                  | 21 ++++++++------------
 sound/soc/codecs/hdac_hdmi.c                 |  3 +--
 sound/soc/codecs/tlv320dac33.c               |  6 ++----
 sound/soc/codecs/uda1380.c                   |  6 ++----
 sound/soc/intel/avs/boards/da7219.c          |  3 ++-
 sound/soc/intel/avs/boards/es8336.c          |  3 ++-
 sound/soc/intel/avs/boards/nau8825.c         |  3 ++-
 sound/soc/intel/avs/boards/rt274.c           |  3 ++-
 sound/soc/intel/avs/boards/rt286.c           |  3 ++-
 sound/soc/intel/avs/boards/rt298.c           |  3 ++-
 sound/soc/intel/avs/boards/rt5663.c          |  3 ++-
 sound/soc/intel/avs/boards/rt5682.c          |  3 ++-
 sound/soc/meson/axg-tdm-interface.c          |  9 ++-------
 sound/soc/uniphier/aio-cpu.c                 |  8 ++------
 20 files changed, 46 insertions(+), 72 deletions(-)


base-commit: b16e9f8547a328b19af59afc213ce323124d11e9
-- 
2.34.1


