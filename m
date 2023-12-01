Return-Path: <ntb+bounces-576-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738F800218
	for <lists+linux-ntb@lfdr.de>; Fri,  1 Dec 2023 04:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C9B6B20F9C
	for <lists+linux-ntb@lfdr.de>; Fri,  1 Dec 2023 03:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F794409;
	Fri,  1 Dec 2023 03:27:10 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817A1FDE
	for <ntb@lists.linux.dev>; Fri,  1 Dec 2023 03:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ShJQH0P4wz4f3khR
	for <ntb@lists.linux.dev>; Fri,  1 Dec 2023 11:27:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 14EDB1A0BF8
	for <ntb@lists.linux.dev>; Fri,  1 Dec 2023 11:27:05 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
	by APP1 (Coremail) with SMTP id cCh0CgBHShB6UmlljP2lCQ--.19396S5;
	Fri, 01 Dec 2023 11:27:04 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: ntb@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	mani@kernel.org,
	kishon@kernel.org,
	bhelgaas@google.com,
	yangyingliang@huawei.com
Subject: [PATCH 2/2] NTB: EPF: return error code in the error path in pci_vntb_probe()
Date: Fri,  1 Dec 2023 11:30:57 +0800
Message-Id: <20231201033057.1399131-2-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201033057.1399131-1-yangyingliang@huaweicloud.com>
References: <20231201033057.1399131-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBHShB6UmlljP2lCQ--.19396S5
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4DKw15JFy3GF4fJr4xJFb_yoWfCrgEga
	4UZrs7WrZ8GF1xWryYkw47Za4q93sI9rs7CF4IyF1SyFy5ZrWDuryDtF4kAF17Wr15KryY
	yF90yr98Zr17AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M2
	8IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
	4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jbhL8UUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

If dma_set_mask_and_coherent() fails, return the error code instead
of -EINVAL.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 2b7bc5a731dd..c6f07722cbac 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -1272,7 +1272,7 @@ static int pci_vntb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "Cannot set DMA mask\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	ret = ntb_register_device(&ndev->ntb);
-- 
2.25.1


