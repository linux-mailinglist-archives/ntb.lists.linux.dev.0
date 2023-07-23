Return-Path: <ntb+bounces-514-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B22775DF4A
	for <lists+linux-ntb@lfdr.de>; Sun, 23 Jul 2023 01:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B78281DBA
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Jul 2023 23:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2650FEDB;
	Sat, 22 Jul 2023 23:25:13 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF83EC7;
	Sat, 22 Jul 2023 23:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nXTpEnvYxIqxyUt02yJGB4DzINGd6irEOWEcHV+28tU=; b=QAybGx3pV056eRBmpH9+6gI4Qp
	Pq2Z4DqbpP7g441/K+wyASFP/qAVZf2i+fX8bYgGAFa03hxW4HfqPeRmULR2Ez0Hk71Kqwk8I8wsa
	642JIu4FxGrLLoXgBHKgB5gSauzJlQYZGVq+N5WnBBGruakkxKPHqpRfaDpJ5orO5/oYAzwjfAWk3
	BWpWri8mWOw+AFV7atnJliO4taTUWeHR28vVBH4zXdDvbBE1fcmkjVdw3fqbW5/AymuKTcouVWXro
	TAIGMZvk0I4H7T2dM6t88mYCoZZofiuFYSCeEOCCut9nqelPVNw6WgpTfpuvV46aVOgKzDY4SvaZj
	6N5RLt2Q==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1qNLj2-0001HQ-6u; Sun, 23 Jul 2023 01:09:24 +0200
Received: from [136.25.87.181] (helo=lars-desktop.lan)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1qNLj1-000OAF-Hk; Sun, 23 Jul 2023 01:09:23 +0200
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
Subject: [PATCH 2/5] PCI: endpoint: pci-epf-mhi: Constify pci_epf_ops and pci_epf_event_ops
Date: Sat, 22 Jul 2023 16:08:45 -0700
Message-Id: <20230722230848.589428-2-lars@metafoo.de>
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

Both the pci_epf_ops and pci_epf_evnt_ops structs for the PCI endpoint mhi
driver are never modified. Mark them as const so they can be placed in the
read-only section.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 9c1f5a154fbd..bb1c8e502a09 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -389,7 +389,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
 }
 
-static struct pci_epc_event_ops pci_epf_mhi_event_ops = {
+static const struct pci_epc_event_ops pci_epf_mhi_event_ops = {
 	.core_init = pci_epf_mhi_core_init,
 	.link_up = pci_epf_mhi_link_up,
 	.link_down = pci_epf_mhi_link_down,
@@ -428,7 +428,7 @@ static const struct pci_epf_device_id pci_epf_mhi_ids[] = {
 	{},
 };
 
-static struct pci_epf_ops pci_epf_mhi_ops = {
+static const struct pci_epf_ops pci_epf_mhi_ops = {
 	.unbind	= pci_epf_mhi_unbind,
 	.bind	= pci_epf_mhi_bind,
 };
-- 
2.39.2


