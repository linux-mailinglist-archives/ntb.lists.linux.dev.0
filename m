Return-Path: <ntb+bounces-441-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6765CF50
	for <lists+linux-ntb@lfdr.de>; Wed,  4 Jan 2023 10:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258812808EC
	for <lists+linux-ntb@lfdr.de>; Wed,  4 Jan 2023 09:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0AC7EA;
	Wed,  4 Jan 2023 09:16:20 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1097F3
	for <ntb@lists.linux.dev>; Wed,  4 Jan 2023 09:16:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
	by APP-03 (Coremail) with SMTP id rQCowABnSab5QbVj8mZsCg--.32128S2;
	Wed, 04 Jan 2023 17:08:09 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	mani@kernel.org,
	kishon@kernel.org,
	bhelgaas@google.com
Cc: ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] PCI: endpoint: pci-epf-vntb: Add missing check for alloc_workqueue
Date: Wed,  4 Jan 2023 17:08:08 +0800
Message-Id: <20230104090808.46085-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnSab5QbVj8mZsCg--.32128S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrW5Ar1fGF13GryfXrWkZwb_yoWfZFX_Wa
	97ZrsrWrZ8Gr18uryYkw4xZFyvkwnYqFn3ZFWrKFyakFyfC3yY93yDJryDGr1xWF15tryD
	u34qvr90yr12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU09NVDUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/

Add check for the return value of alloc_workqueue since it may return
NULL pointer.

Fixes: e35f56bb0330 ("PCI: endpoint: Support NTB transfer between RC and EP")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 04698e7995a5..05c99185ba65 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -1441,6 +1441,9 @@ static int __init epf_ntb_init(void)
 
 	kpcintb_workqueue = alloc_workqueue("kpcintb", WQ_MEM_RECLAIM |
 					    WQ_HIGHPRI, 0);
+	if (!kpcintb_workqueue)
+		return -ENOMEM;
+
 	ret = pci_epf_register_driver(&epf_ntb_driver);
 	if (ret) {
 		destroy_workqueue(kpcintb_workqueue);
-- 
2.25.1


