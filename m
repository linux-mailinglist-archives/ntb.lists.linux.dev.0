Return-Path: <ntb+bounces-1227-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E309A7E2C8
	for <lists+linux-ntb@lfdr.de>; Mon,  7 Apr 2025 16:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2776917DA18
	for <lists+linux-ntb@lfdr.de>; Mon,  7 Apr 2025 14:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFC71F8F04;
	Mon,  7 Apr 2025 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2GDhKuu2"
X-Original-To: ntb@lists.linux.dev
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7771F8BAA
	for <ntb@lists.linux.dev>; Mon,  7 Apr 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036770; cv=none; b=nVY9YeDeWMXwNk5Uztz1K7WM4TAkrbA5XmjS/3Co8f51ojP0kpLSVVOGymMpWTE1cX/6K5PkpO3K8RgMTLuQ5bi8H2l1p5jq/pug3S4Hgr42pTM5mmGIoNlcHdPnvAIghBcmOhEGTNMCgWZPJhOlABffzn9Nr/zejy6GDzlztF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036770; c=relaxed/simple;
	bh=ogQNcCu8YxT+9o47hJnNjydZZvfGLWbCXP72er2tm7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PENBS0rl01TQD+VY+Fd3gL8vni7jDfTmDU2PMpEhBOFlzFhemEJwvZZdVg/25ypa65PIXIykeZRMNyrzpF6cks5L3i1M8MvHg5OJQYSb++2FnkwChti/CaDc5wVwcM7v97piuMBOt+6vODO37wWH5Q3vOgWP1sdSW0u7yC1f2dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2GDhKuu2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26080955e9.2
        for <ntb@lists.linux.dev>; Mon, 07 Apr 2025 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744036766; x=1744641566; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDhUBb7n4i/zjscinLcxbX9vyxcNyXV4VmsLqe1lsoo=;
        b=2GDhKuu2KyOdbjTS6wZ7WboOpdHyRox5mn0Gvn8Y0HiMEzV0p9QCJusbhvVve5n2KW
         uha69J6y5dpC9iDrxBk51LAbSnm49mkDAeXArUKLpCYmg3dSy+6D31c2irltnoKhfZLO
         zBG556vjY1VUHOSuN24GvLWBt10j+DtT0/jvKZI9rDN68aYIqoQ81JYcIaEgEfJs9/MX
         YDZBXrRAceRW1+CKS0+BvdkR8rIkqGeOquYPaCrqtz0CsLjbBKKhStT9EFjhj22ZDpkL
         ZCyydTfcgOWLfKVnOrypx/TfFcg2a6wEh1oBJVXmweQAXypxOH7qmMzIg9NBu6aXX/nq
         YzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744036766; x=1744641566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDhUBb7n4i/zjscinLcxbX9vyxcNyXV4VmsLqe1lsoo=;
        b=OGJIB9kVs7hcmbQovqcMdY8NoSQ+vCWYtmTIRj27AlpWDuREmppJD40XoaIL84EBk6
         68P2LF2GiYStVBnxyguSKvtMntaN4U86AUvhNJZTX24nVx3O7riKmmnJsRahEWeSQibA
         q1eE1/19X1SVg8fgVn7SEITbQAB9ov5zPAh6PCERJMlC+xC8qIA3849r2jp6C58Li676
         0Ik9yQ2wiHgFX4GyjRR/5oQRR07gNhtjMruNlxRvWehPpp9mtEREShMxc4OuV5NtBlae
         w3mcn3Pt1/oYGNawEN4B2gT4/IiFqTKR2ShcFOCVZe8OMb/9u0XVOBSttcz2EiNzCStV
         h92A==
X-Forwarded-Encrypted: i=1; AJvYcCUxqVv0X1L7IMVVKxIx7oOy8DHks0kl8WDCekWtOTiGpYHQ9lj1JV14PYmA3b/UT5uRs/A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+0IHClhFn0T3eBOHfs3Va4w0NnklmvGNHMIFT9RBMoF6Cdc2l
	R4+yqwOPXkID6iDCdZfVOmYss6+g0quAsdo5xHctV2qmw4AMvItSvdNX536NEi0=
X-Gm-Gg: ASbGncurXpws3SGLJAZkJOvR0JBCPTV+lAeVYmOQ8bKgVdiglNHE0jVe6ZUizswQhE9
	JlfGP4NlEJMfeHROrGxAzZPrLVf2KtdJuPaWFUN0N8WBB/OvR+dUtv/G4YkM9JDrfzZK6UTHUyf
	3pHtEp/tIwqwJb1NXt0yNc8TdOTrewiExOiDp1lG8NyDKmtyFXKkpuVJvTRdXXzfe60OgbuKZRm
	cIOt9nkgjEcj43IRTkN0ooM6ofGNcUWAEtihEdXpHudjunnTVBJYuHBeCDvDbtxbjOPekgaZJNZ
	OWU6XUpDou7GQ++zVVxCmwps+3A1drjjmKHxo2jtNCyakvKM7f3Pnq67M10=
X-Google-Smtp-Source: AGHT+IGo0Uhr29cvTsRS3LxyOzKKN2ODb8nALSSx+D+EwmUMgG7tIeki4Sbg0p2SXiRhZCiImjf7MA==
X-Received: by 2002:a05:600c:524f:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43ee06ab14amr77347205e9.19.1744036766119;
        Mon, 07 Apr 2025 07:39:26 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1122:cb29:d776:d906])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm135003705e9.9.2025.04.07.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:39:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/3] PCI: endpoint: space allocation fixups
Date: Mon, 07 Apr 2025 16:39:06 +0200
Message-Id: <20250407-pci-ep-size-alignment-v3-0-865878e68cc8@baylibre.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrj82cC/4XNQQqDMBCF4atI1p0So6Gxq96jdJHEUQc0SiKhV
 rx7o5tCoXT5P5hvVhbQEwZ2zVbmMVKg0aUoThmznXYtAtWpmeBC8kIomCwBThDohaB7at2Aboa
 qVtIIZRSXnKXbyWNDz8O9P1J3FObRL8ebmO/rPzHmwAFRmosyudSVvhm99GQ8nu04sB2N4gOVv
 PwFiQTZQvPalLax8vIFbdv2BrNE4pkGAQAA
X-Change-ID: 20250328-pci-ep-size-alignment-9d85b28b8050
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, 
 linux-nvme@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ogQNcCu8YxT+9o47hJnNjydZZvfGLWbCXP72er2tm7Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn8+OZHbkA5zUijOC1Lyem6hVLcbAobdwSqz5Ry
 4vtiY/xbzCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ/PjmQAKCRDm/A8cN/La
 hYLrD/90dg5PKRwz8YLHDCaM7Vq3WVq4SIxJCfhO1ZtER7+uHYYRkbooqqZ+UrW017Or3od1xQa
 yCkeURyi1REiYqr6TxlMlG1lfST2grvdD3Xvy25bCN7ooV7ljuZTb9PpWlFDdSh/zTcapGA3HyH
 nrhBlsnoRlTzVbgsaUXnOCPJkBma1OXjxPKPvccqxKcUYUPrQEExKlTlG6RU4otW3/xiS+kwXyI
 EpsA2FckSNHcLvDREnS3NayTyn5lGsbC4KyCRnekHn1HK30MZnarf7+sQX1foxD7K0LqA1ASRhs
 xy2vzOae7BRGOvnFScpZtpDiYEcCVcSQBuhDIXimPFLxvN18UBq1w7tfw4WNd3lzkrcsukUta42
 fHma6it0bX1PnIX32+TcPMZIK8WuHATrIjqFBfsQJxSTZBxxWTEIQROzgMhbJCe0PYfaBzWSpCJ
 DxsWvvx97spixLpnSFgbO24aFXZKcd0AzQ8ZpYPLK2kicpC/8sDO6MzwAmSu9TLENZI50DQROtH
 IA4ZS94r/7tr6hOoikclE+ISSP2JK5029ZltBiMh9FdJlcGtEobu/7VZG4wYaKTASXFSXKE8qj6
 T/Z7baToAeb5lWbVXYyyjf2tCLLabejWhGSGmsIh8jtWmG6wt7QkR2H/4F79ewvO122I/MbBuBx
 /pBoV7hfw/sCr3Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset fixes problems while trying to allocate space for PCI
endpoint function.

The problems, and related fixups, have been found while trying to link two
renesas rcar-gen4 r8a779f0-spider devices with the vNTB endpoint
function. This platform has 2 configurable BAR0 and BAR2, with an alignment
of 1MB, and fairly small fixed BAR4 of 256B.

This was tested with
 * BAR0 (1MB):  CTRL+SPAD
 * BAR2 (1MB):  MW0
 * BAR4 (256B): Doorbell

This setup is currently not supported by the vNTB EP driver and requires a
small hack. I'm working on that too.

Changes in v3:
- Rebased on v6.15-rc1
- Fix build issue with newly introduced nvme endpoint function
- Link to v2: https://lore.kernel.org/r/20250404-pci-ep-size-alignment-v2-0-c3a0db4cfc57@baylibre.com

Changes in v2:
- Allocate space that match the iATU alignment requirement, as previously
  done.
- Chose not to add a new member in struct pci_epf_bar, as initially
  discussed. After reworking the code, that did not seem necessary.
- Make sure SPAD registers are 4 bytes aligned in the vNTB endpoint function
- Link to v1: https://lore.kernel.org/r/20250328-pci-ep-size-alignment-v1-0-ee5b78b15a9a@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      PCI: endpoint: add epc_feature argument for pci_epf_free_space()
      PCI: endpoint: improve fixed_size bar handling when allocating space
      PCI: endpoint: pci-epf-vntb: simplify ctrl/spad space allocation

 drivers/nvme/target/pci-epf.c                 |  3 +-
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  3 +-
 drivers/pci/endpoint/functions/pci-epf-test.c |  2 ++
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 42 ++++++++++-----------------
 drivers/pci/endpoint/pci-epf-core.c           | 27 ++++++++++++-----
 include/linux/pci-epf.h                       |  1 +
 6 files changed, 42 insertions(+), 36 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250328-pci-ep-size-alignment-9d85b28b8050

Best regards,
-- 
Jerome


