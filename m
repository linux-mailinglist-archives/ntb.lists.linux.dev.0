Return-Path: <ntb+bounces-1234-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34340A7EB1B
	for <lists+linux-ntb@lfdr.de>; Mon,  7 Apr 2025 20:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC039188A971
	for <lists+linux-ntb@lfdr.de>; Mon,  7 Apr 2025 18:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5B62566D5;
	Mon,  7 Apr 2025 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIZ8F3++"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C92561C8;
	Mon,  7 Apr 2025 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049808; cv=none; b=pGv23ZKBVsF261WTeBE7B71ulYqcDF6KiV0k+SfvruD41n8jjGJTX4D1BX9oV9LbOkoyRtymWk7f8TLU+4MjkjCe6aUUE6Y/aNIhMPSBmsCl5Sgne8rzXzGr/uZamCs6EvdjHUMeCXI4ix+yhFs/QC0IRkv6XaCSNOGtLB+dTM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049808; c=relaxed/simple;
	bh=EeNyzSPVB15bkTHwbGNE4TC98r6iZP9QZnHs4daBLNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oQQbiJ66e2gcvHYAEbdRWk7sll+obdfW/FMwoP9iW1k6kt600F2uGMr+ri1bGTtRcTA1sWmHZfRFWmFXcAVDlkLCUAG6X2aImLsXdPUnNpPkynrRG1NwxCyQTnKenGTOjbQcmgo3AY4sOO9Py9S/43jE/6JgS48/hZrHMR9Ww7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIZ8F3++; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CB9C4CEEC;
	Mon,  7 Apr 2025 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049807;
	bh=EeNyzSPVB15bkTHwbGNE4TC98r6iZP9QZnHs4daBLNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HIZ8F3++MVdvWaoG+XXrvuRDKiatOXVc1Jsk5VTLBY5oQ/Hur+MhEgScLgJJk+b9C
	 4Lbd4aE/yt6DXhKrIT6+t8lEeldjDrWEGIy2psZCYzkpQIjPgOg0Ztr5C/2iGKEgKq
	 MTk3IM4vkV0zBw6afBzTYcmQ+l+OxSgk27AYTDcbjbShUfCWeUN+D74rk/XL6xcP96
	 pcfbPI71MVGU5TOOsVZo+sBuSWPJTCsZJ3EJKAFlkHBzPhOhIcvAXlXo0GY/MYaTF9
	 jGztsCnv73iKY5pUWFTzubyJmpe4gUX+Z4lmiRX1QHe6MM1z+BY8oxDjFlG64Qnit3
	 DvM3oE3kVVRbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Sasha Levin <sashal@kernel.org>,
	Shyam-sundar.S-k@amd.com,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	ntb@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 4/9] ntb_hw_amd: Add NTB PCI ID for new gen CPU
Date: Mon,  7 Apr 2025 14:16:30 -0400
Message-Id: <20250407181635.3184105-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181635.3184105-1-sashal@kernel.org>
References: <20250407181635.3184105-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
Content-Transfer-Encoding: 8bit

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

[ Upstream commit bf8a7ce7e4c7267a6f5f2b2023cfc459b330b25e ]

Add NTB support for new generation of processor.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ntb/hw/amd/ntb_hw_amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index d687e8c2cc78d..63ceed89b62ef 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -1318,6 +1318,7 @@ static const struct pci_device_id amd_ntb_pci_tbl[] = {
 	{ PCI_VDEVICE(AMD, 0x148b), (kernel_ulong_t)&dev_data[1] },
 	{ PCI_VDEVICE(AMD, 0x14c0), (kernel_ulong_t)&dev_data[1] },
 	{ PCI_VDEVICE(AMD, 0x14c3), (kernel_ulong_t)&dev_data[1] },
+	{ PCI_VDEVICE(AMD, 0x155a), (kernel_ulong_t)&dev_data[1] },
 	{ PCI_VDEVICE(HYGON, 0x145b), (kernel_ulong_t)&dev_data[0] },
 	{ 0, }
 };
-- 
2.39.5


