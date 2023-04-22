Return-Path: <ntb+bounces-471-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A144F6EBA1D
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Apr 2023 18:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79607280A53
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Apr 2023 16:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE276132;
	Sat, 22 Apr 2023 16:00:09 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0033CC
	for <ntb@lists.linux.dev>; Sat, 22 Apr 2023 16:00:05 +0000 (UTC)
Received: from uu22.. ([10.12.190.56])
	(user=dddddd@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33MFwu2V023768-33MFwu2W023768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 22 Apr 2023 23:58:57 +0800
From: Yinhao Hu <dddddd@hust.edu.cn>
To: Dave Jiang <dave.jiang@intel.com>, Jon Mason <jdmason@kudzu.us>,
        Allen Hubbe <allenbh@gmail.com>
Cc: hust-os-kernel-patches@googlegroups.com, Yinhao Hu <dddddd@hust.edu.cn>,
        Dongliang Mu <dzm91@hust.edu.cn>, ntb@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ntb: hw: intel: remove return value check of `ndev_init_debugfs`
Date: Sat, 22 Apr 2023 23:56:34 +0800
Message-Id: <20230422155634.483023-1-dddddd@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dddddd@hust.edu.cn

Smatch complains that:
ndev_init_debugfs() warn: 'ndev->debugfs_dir' is an error pointer or valid

Debugfs checks are generally not supposed to be checked for errors
and it is not necessary here.

Just delete the dead code.

Signed-off-by: Yinhao Hu <dddddd@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
The issue is found by static analysis and remains untested.
---
 drivers/ntb/hw/intel/ntb_hw_gen1.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
index 9ab836d0d4f1..9b0b2c43f1bb 100644
--- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
+++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
@@ -778,13 +778,10 @@ static void ndev_init_debugfs(struct intel_ntb_dev *ndev)
 		ndev->debugfs_dir =
 			debugfs_create_dir(pci_name(ndev->ntb.pdev),
 					   debugfs_dir);
-		if (!ndev->debugfs_dir)
-			ndev->debugfs_info = NULL;
-		else
-			ndev->debugfs_info =
-				debugfs_create_file("info", S_IRUSR,
-						    ndev->debugfs_dir, ndev,
-						    &intel_ntb_debugfs_info);
+		ndev->debugfs_info =
+			debugfs_create_file("info", S_IRUSR,
+					    ndev->debugfs_dir, ndev,
+					    &intel_ntb_debugfs_info);
 	}
 }
 
-- 
2.34.1


