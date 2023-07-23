Return-Path: <ntb+bounces-515-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8375DF4C
	for <lists+linux-ntb@lfdr.de>; Sun, 23 Jul 2023 01:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01EF1281DB8
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Jul 2023 23:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6139ED9;
	Sat, 22 Jul 2023 23:25:16 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9554EC7;
	Sat, 22 Jul 2023 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZI1rx+BD/ilin0/NRtZDSz3iiOgdzXGOIXLdu8xHh9Q=; b=ATVLvw/4vffWNT0C0kA/6d1Cwu
	rC4TgYZAS3Dsm6BA+Xjn8nctjNVRfc8WOv2GOUYZjncfUy9wglN8XEFcS1dDgEieQ3JnUMPzqRiwW
	1i/E8ylSASwInBI7SSV1zj6oRhsegFkcx5jlwpqYQRoW4qnoAUY8S75QzMdNjk1IdLTikNveUOdiV
	KVrDMM2gC7QAuYgkM3K19uyJVpMlKmerB24hP5PyRDGxLcv8ZxAUaXbFM2084tAefm7G7nLo3nTcK
	xkRkWdF8B6tqAB/XozVygkbUxHvBqB33mDurHUJUvVr73saagyPtv3Fbw3j67LUsvF0HdXCVTKnVS
	1mcpPH/g==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1qNLj4-0001Hu-KT; Sun, 23 Jul 2023 01:09:26 +0200
Received: from [136.25.87.181] (helo=lars-desktop.lan)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1qNLj3-000OAF-V0; Sun, 23 Jul 2023 01:09:26 +0200
From: Lars-Peter Clausen <lars@metafoo.de>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	linux-pci@vger.kernel.org,
	mhi@lists.linux.dev,
	ntb@lists.linux.dev,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 3/5] PCI: endpoint: pci-epf-ntb: Constify pci_epf_ops
Date: Sat, 22 Jul 2023 16:08:46 -0700
Message-Id: <20230722230848.589428-3-lars@metafoo.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722230848.589428-1-lars@metafoo.de>
References: <20230722230848.589428-1-lars@metafoo.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26977/Sat Jul 22 09:27:56 2023)

The pci_epf_ops struct for the PCI endpoint ntb driver is never modified.
Mark it as const so it can be placed in the read-only section.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/pci/endpoint/functions/pci-epf-ntb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-ntb.c b/drivers/pci/endpoint/functions/pci-epf-ntb.c
index 9aac2c6f3bb9..630181469720 100644
--- a/drivers/pci/endpoint/functions/pci-epf-ntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-ntb.c
@@ -2099,7 +2099,7 @@ static int epf_ntb_probe(struct pci_epf *epf,
 	return 0;
 }
 
-static struct pci_epf_ops epf_ntb_ops = {
+static const struct pci_epf_ops epf_ntb_ops = {
 	.bind	= epf_ntb_bind,
 	.unbind	= epf_ntb_unbind,
 	.add_cfs = epf_ntb_add_cfs,
-- 
2.39.2


