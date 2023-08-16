Return-Path: <ntb+bounces-530-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BFE77DC4F
	for <lists+linux-ntb@lfdr.de>; Wed, 16 Aug 2023 10:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615D91C20F9E
	for <lists+linux-ntb@lfdr.de>; Wed, 16 Aug 2023 08:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290FD79DE;
	Wed, 16 Aug 2023 08:33:23 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from out-57.mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36E17F7
	for <ntb@lists.linux.dev>; Wed, 16 Aug 2023 08:33:20 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692174798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uYnqDLoRJvJeZ1bXp0N97xRehL/FT+MxAZrkDB8mRIA=;
	b=mrJMbOUz9XeM1gRa8KyZu8tojWMrDYayiJ0Zrc40Q+FD8IapOXuJZZO0ig8bD4PorOSppN
	n1wqXcOLoeKpmWEMNgReox50bQ36T4JXWwAAL5kx3jQRksl/8o1ocu8oU6CqM9zLu1ENIw
	Do+ifzql0P+Bp+e/PQSSAbiXf2rVqyo=
From: Yajun Deng <yajun.deng@linux.dev>
To: kurt.schwemmer@microsemi.com,
	logang@deltatee.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com
Cc: linux-pci@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yajun Deng <yajun.deng@linux.dev>
Subject: [PATCH] ntb_hw_switchtec: Fix shift-out-of-bounds in switchtec_ntb_mw_set_trans
Date: Wed, 16 Aug 2023 16:33:05 +0800
Message-Id: <20230816083305.1426718-1-yajun.deng@linux.dev>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

There is a kernel API ntb_mw_clear_trans() would pass 0 to both addr and
size. This would make xlate_pos negative.

[   23.734156] switchtec switchtec0: MW 0: part 0 addr 0x0000000000000000 size 0x0000000000000000
[   23.734158] ================================================================================
[   23.734172] UBSAN: shift-out-of-bounds in drivers/ntb/hw/mscc/ntb_hw_switchtec.c:293:7
[   23.734418] shift exponent -1 is negative

Ensuring xlate_pos is a positive or zero before BIT.

Fixes: 1e2fd202f859 ("ntb_hw_switchtec: Check for alignment of the buffer in mw_set_trans()")
Signed-off-by: Yajun Deng <yajun.deng@linux.dev>
---
 drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
index d6bbcc7b5b90..21468d4fef64 100644
--- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
+++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
@@ -288,7 +288,7 @@ static int switchtec_ntb_mw_set_trans(struct ntb_dev *ntb, int pidx, int widx,
 	if (size != 0 && xlate_pos < 12)
 		return -EINVAL;
 
-	if (!IS_ALIGNED(addr, BIT_ULL(xlate_pos))) {
+	if (xlate_pos >= 0 && !IS_ALIGNED(addr, BIT_ULL(xlate_pos))) {
 		/*
 		 * In certain circumstances we can get a buffer that is
 		 * not aligned to its size. (Most of the time
-- 
2.25.1


