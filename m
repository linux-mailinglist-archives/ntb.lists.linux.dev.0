Return-Path: <ntb+bounces-450-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670E6AE6AB
	for <lists+linux-ntb@lfdr.de>; Tue,  7 Mar 2023 17:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0519C280A52
	for <lists+linux-ntb@lfdr.de>; Tue,  7 Mar 2023 16:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ECCAD5F;
	Tue,  7 Mar 2023 16:33:34 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77D28E3
	for <ntb@lists.linux.dev>; Tue,  7 Mar 2023 16:33:33 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id kb15so13799102pjb.1
        for <ntb@lists.linux.dev>; Tue, 07 Mar 2023 08:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6pe3bFa4dtdjd19YymjjBBEUeO6qAkV6I0oGfI7oeQ=;
        b=mWKzJI5Qelz3mHOnckXG1swo5n1J1nJ5NHNNzhn+UbHdAvrWjy/ro3VYvqQ1VSTbft
         ICm7pt89UwZrvnE6jG/Gm1a2KVO+a2U9GBaheaSZfmKeNwqqBtWCKghcyL3zsxBksFej
         ArkOUR3F27v5s4djLQ9fKSX6/vjZsGMUIgY2H/fezevHrbTcCFkTqf5sNJl+zX/ebyMI
         Rf8c2u1v6+sUaO/S6sGJ2/4NFVJIjwbi0uIXUhrWx1THORT6hHLjhey4oAK/Zm/at110
         g78k09t5jlwgE6hZtV2bFK4msWFOTzN1Omy2+PMp8RJWVP4tSbl/f2Ci/KjoQfLPv9mB
         hoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6pe3bFa4dtdjd19YymjjBBEUeO6qAkV6I0oGfI7oeQ=;
        b=WXANjbX0Qvg1ge0jrr7hQgxZZpMuG2IIacAr2n7hqTyNnVj4JfZq+Ot5FDgDggqkxm
         gscE4Y+0enO7giRUu+mxtI6QMU85juRGXh2rY9AdAFAK+GUL4HUFbw3SRJeNinmk3NyH
         kKpqH4fiNkJSjV2poiKndCEqpTDoYf1Xps9AHmLzR6PaUnN17WvUs6jxy9zwfdvPBA4V
         WldV4k2aqOCMyRz+tXTC3Y0BXQCzha07cVNF1oPGhf+uMMsjC8tFDOiUkd7O3WuEa4Ui
         Ys5st3o5UTxv+Ev14gkMfS2HLJNXjouBO/0OunM/19Gx0JKkKiBd9dIv1YIUVMevfsyq
         gl1A==
X-Gm-Message-State: AO0yUKXWYi0U7tE8nrYilouw/zuvOUtiu3j/nk8pxOvWAJrccPHB/hkf
	Z63YC7jQMyo/+MtB39id/h8=
X-Google-Smtp-Source: AK7set8Eav0yqRkAndYPJUYgK9rU+iloFq5BX+jt6Cx/GayRhRPGX+xaSZ4trXl4zA8fQG+L5lu2Mg==
X-Received: by 2002:a17:902:dac1:b0:19c:13d2:44c1 with SMTP id q1-20020a170902dac100b0019c13d244c1mr19533010plx.15.1678206813024;
        Tue, 07 Mar 2023 08:33:33 -0800 (PST)
Received: from DESKTOP-HHR6EMI.localdomain ([143.244.50.165])
        by smtp.gmail.com with ESMTPSA id kp8-20020a170903280800b00198dd432329sm8660951plb.51.2023.03.07.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:33:32 -0800 (PST)
From: void0red <void0red@gmail.com>
To: void0red@gmail.com
Cc: allenbh@gmail.com,
	dave.jiang@intel.com,
	fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev
Subject: [PATCH v3] ntb_tool: check null return of devm_kcalloc in tool_init_mws
Date: Wed,  8 Mar 2023 00:33:07 +0800
Message-Id: <20230307163307.132-1-void0red@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANE+tVo98AZuRGcAshv5W6v2+fKjTruDVRRdgjfyAVk93cC3_g@mail.gmail.com>
References: <CANE+tVo98AZuRGcAshv5W6v2+fKjTruDVRRdgjfyAVk93cC3_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kang Chen <void0red@gmail.com>

devm_kcalloc may fails, tc->peers[pidx].outmws might be null
and will cause null pointer dereference later.

Fixes: 7f46c8b3a552 ("NTB: ntb_tool: Add full multi-port NTB API support")
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Kang Chen <void0red@gmail.com>
---
v3 -> v2: add Reviewed-by tag
v2 -> v1: add Fixes and Reviewed-by tags

 drivers/ntb/test/ntb_tool.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ntb/test/ntb_tool.c b/drivers/ntb/test/ntb_tool.c
index 5ee0afa62..eeeb4b1c9 100644
--- a/drivers/ntb/test/ntb_tool.c
+++ b/drivers/ntb/test/ntb_tool.c
@@ -998,6 +998,8 @@ static int tool_init_mws(struct tool_ctx *tc)
 		tc->peers[pidx].outmws =
 			devm_kcalloc(&tc->ntb->dev, tc->peers[pidx].outmw_cnt,
 				   sizeof(*tc->peers[pidx].outmws), GFP_KERNEL);
+		if (tc->peers[pidx].outmws == NULL)
+			return -ENOMEM;
 
 		for (widx = 0; widx < tc->peers[pidx].outmw_cnt; widx++) {
 			tc->peers[pidx].outmws[widx].pidx = pidx;
-- 
2.34.1


