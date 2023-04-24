Return-Path: <ntb+bounces-472-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA236EC8B7
	for <lists+linux-ntb@lfdr.de>; Mon, 24 Apr 2023 11:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A91701C208FD
	for <lists+linux-ntb@lfdr.de>; Mon, 24 Apr 2023 09:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE30610E8;
	Mon, 24 Apr 2023 09:23:47 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF197C
	for <ntb@lists.linux.dev>; Mon, 24 Apr 2023 09:23:44 +0000 (UTC)
Received: from huangjintao.. ([10.12.190.56])
	(user=u202017189@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33O9Mveu031569-33O9Mvev031569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 24 Apr 2023 17:23:03 +0800
From: Jintao Huang <u202017189@hust.edu.cn>
To: Sanjay R Mehta <sanju.mehta@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>
Cc: hust-os-kernel-patches@googlegroups.com,
        Jintao Huang <u202017189@hust.edu.cn>,
        Dongliang Mu <dzm91@hust.edu.cn>, ntb@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] NTB: remove all the checks of the return values.
Date: Mon, 24 Apr 2023 09:22:55 +0000
Message-Id: <20230424092255.29338-1-u202017189@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: u202017189@hust.edu.cn

The comments in debugfs_create_dir and debugfs_create_file point out that,
generally, we do not need to check the return arguments of the functions.
In this case, it will be useful to delete all the checks
about the return arguments.

Signed-off-by: Jintao Huang <u202017189@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
This issue is found by static analyzer. The patched code has passed
Smatch checker, but remains untested on concrete running.
---
 drivers/ntb/hw/amd/ntb_hw_amd.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index 04550b1f984c..6b0f0c4bf278 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -934,21 +934,13 @@ static ssize_t ndev_debugfs_read(struct file *filp, char __user *ubuf,
 
 static void ndev_init_debugfs(struct amd_ntb_dev *ndev)
 {
-	if (!debugfs_dir) {
-		ndev->debugfs_dir = NULL;
-		ndev->debugfs_info = NULL;
-	} else {
-		ndev->debugfs_dir =
-			debugfs_create_dir(pci_name(ndev->ntb.pdev),
-					   debugfs_dir);
-		if (!ndev->debugfs_dir)
-			ndev->debugfs_info = NULL;
-		else
-			ndev->debugfs_info =
-				debugfs_create_file("info", S_IRUSR,
-						    ndev->debugfs_dir, ndev,
-						    &amd_ntb_debugfs_info);
-	}
+	ndev->debugfs_dir =
+		debugfs_create_dir(pci_name(ndev->ntb.pdev),
+				   debugfs_dir);
+	ndev->debugfs_info =
+		debugfs_create_file("info", 0400,
+				    ndev->debugfs_dir, ndev,
+				    &amd_ntb_debugfs_info);
 }
 
 static void ndev_deinit_debugfs(struct amd_ntb_dev *ndev)
-- 
2.34.1


