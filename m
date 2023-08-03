Return-Path: <ntb+bounces-524-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82676E913
	for <lists+linux-ntb@lfdr.de>; Thu,  3 Aug 2023 15:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1338E282083
	for <lists+linux-ntb@lfdr.de>; Thu,  3 Aug 2023 13:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41941ED4B;
	Thu,  3 Aug 2023 13:03:42 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBD1E528
	for <ntb@lists.linux.dev>; Thu,  3 Aug 2023 13:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044BBC433CD;
	Thu,  3 Aug 2023 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691067820;
	bh=CYiX21pmOUK7rEEnhQDAT/C62K8obmFsue9Gjg+mb6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cnq7UHLCEBYUsJUGlhvdJguedS9wySXaFkacIJV0PtkCVKX985HjaliWvaGQkxUfM
	 fv1KudGemze+Q3t78U/hpGG7PAFKjY4wSNee8VHAXJUFaKMv0RrrdTWH4tzEeqFORw
	 t+Jb3kFpXCKfMq9qpXdNu1CCLQ+1SAtcVpI4iDoX3wPpLfOehayin+wshak/jnEh9R
	 J9AePAthD0XHmBYUhyQPmYvODiGxx/Rr1SjX/s1W0wPGI/qdTH/8oq9LLEgvIPaI2E
	 9mnoj34sJC+kPFPgSj/e1KpaJMTNQXKeF6fXV3quCpeOMjZT14OZCNmPsDIQpcK11L
	 eve0bqDwmDs3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: ruanjinjie <ruanjinjie@huawei.com>,
	Jon Mason <jdmason@kudzu.us>,
	Sasha Levin <sashal@kernel.org>,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 3/5] NTB: EPF: fix possible memory leak in pci_vntb_probe()
Date: Thu,  3 Aug 2023 09:03:31 -0400
Message-Id: <20230803130333.641625-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803130333.641625-1-sashal@kernel.org>
References: <20230803130333.641625-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.42
Content-Transfer-Encoding: 8bit

From: ruanjinjie <ruanjinjie@huawei.com>

[ Upstream commit 956578e3d397e00d6254dc7b5194d28587f98518 ]

As ntb_register_device() don't handle error of device_register(),
if ntb_register_device() returns error in pci_vntb_probe(), name of kobject
which is allocated in dev_set_name() called in device_add() is leaked.

As comment of device_add() says, it should call put_device() to drop the
reference count that was set in device_initialize()
when it fails, so the name can be freed in kobject_cleanup().

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 8c6931210ac4d..cd985a41c8d65 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -1288,6 +1288,7 @@ static int pci_vntb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 err_register_dev:
+	put_device(&ndev->ntb.dev);
 	return -EINVAL;
 }
 
-- 
2.40.1


