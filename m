Return-Path: <ntb+bounces-516-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0375DF4E
	for <lists+linux-ntb@lfdr.de>; Sun, 23 Jul 2023 01:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C3D41C20A45
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Jul 2023 23:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFCFED9;
	Sat, 22 Jul 2023 23:25:29 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E6EC7;
	Sat, 22 Jul 2023 23:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HcEhnsl8OXwy3Xs9hLEzxmJ6HcVgVNWkjJo3dbzOO5Q=; b=IVCPKHEh+ttWqGkq+pTDFKeIkB
	AIbC1xsqR9iS+vKzOcA3M3iPtH2a5ApleaLZEDylT6fXXXfyvbFEGZehKS44Tua43niJlbFniDkEy
	j2F/TvC/ZNNHKCiXteZ0YylnwNKg6lHYY8wWdRzeQSexTTEAoq7ZQB9G+gXEwb1OHhu27zUz5N0iv
	q8epuJzT5GmQwV3RSZUR012s9hkT75HzyxrF3pXZNnXgIyAvL4dW74yUnmzzUL7SejWHK4chdjmFH
	GxWHHp4tVmpU16vr73dnYuDdK+MBZVnY8sJ3M3SIuVSFlcqpXnggp66gcRHTGv2YweWjsfSdfymBn
	3Vx+eLRw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1qNLj7-0001I7-0k; Sun, 23 Jul 2023 01:09:29 +0200
Received: from [136.25.87.181] (helo=lars-desktop.lan)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1qNLj6-000OAF-Bw; Sun, 23 Jul 2023 01:09:28 +0200
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
Subject: [PATCH 4/5] PCI: endpoint: pci-epf-vntb: Constify pci_epf_ops
Date: Sat, 22 Jul 2023 16:08:47 -0700
Message-Id: <20230722230848.589428-4-lars@metafoo.de>
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

The pci_epf_ops struct for the PCI endpoint vntb driver is never modified.
Mark it as const so it can be placed in the read-only section.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index c8b423c3c26e..ff4b43af4487 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -1387,7 +1387,7 @@ static void epf_ntb_unbind(struct pci_epf *epf)
 }
 
 // EPF driver probe
-static struct pci_epf_ops epf_ntb_ops = {
+static const struct pci_epf_ops epf_ntb_ops = {
 	.bind   = epf_ntb_bind,
 	.unbind = epf_ntb_unbind,
 	.add_cfs = epf_ntb_add_cfs,
-- 
2.39.2


