Return-Path: <ntb+bounces-985-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7C9B06DD
	for <lists+linux-ntb@lfdr.de>; Fri, 25 Oct 2024 17:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8161028466C
	for <lists+linux-ntb@lfdr.de>; Fri, 25 Oct 2024 15:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E37E20F3EF;
	Fri, 25 Oct 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzbfThlw"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116DE20D4F1
	for <ntb@lists.linux.dev>; Fri, 25 Oct 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868457; cv=none; b=VRrc/Go8aOM6qC/83GmBqy4p9IXgLfiJQGTVpGMhWc3eUc5u8Rss0V36Ih7UNzleHVxjzIaPL1yW8jlYncz7DLV28uR3uAhDC6Tr3zGKxRF3TmuATXMLDjNiZ/E+U09ohEFiWBmHspG9O8WAnxRMhmbFNTlfIkcjyvF3tjZaZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868457; c=relaxed/simple;
	bh=fUViQ0wuhaRh1Z4rYxnCtcfkzxZviFoQ/oXZmPMz6Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgpMYcTuQKCqwR5yKWUw61LXwDo1ftupa7rSd8PMPlc6A9ZxLV00cWkGZXxo/03jw0HToe8Gh6u+WAGsqtQuNCE8fj5NcrynmZglBRLC+E6fxNQjZ1btnuuXPN1/mNqR2YI9nukdaGiKKDBwqjVhMG8imBf3yDztHI9kAZGsEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzbfThlw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729868452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pA/Y9KFQGL5eKPmyYHAWaMItiz6sKe/fm026vyTOII=;
	b=HzbfThlwRjm8CsYt1hULHGScC978g+Ix7WFfe7HVC7IApSClmyipy4VHe4DG9eHunaXgnR
	JIytZ+pS6zcktIrlrnoMdllcAQAsKr1WJGRIu00KZN4P5eMbUv/AdYIWg0BQQRvpld9TGb
	p0MoCxs7F8UcU+hbsFuvjTzhfwoMJDs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-vEXZofqVPsSWvWtHyV3x7w-1; Fri, 25 Oct 2024 11:00:51 -0400
X-MC-Unique: vEXZofqVPsSWvWtHyV3x7w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so1179122f8f.1
        for <ntb@lists.linux.dev>; Fri, 25 Oct 2024 08:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868450; x=1730473250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pA/Y9KFQGL5eKPmyYHAWaMItiz6sKe/fm026vyTOII=;
        b=OJJ/X+Eoc0QHx+30t+QkczzJxk1HhbbGJANklPY/QcM+FvIFXEUC7N+rAXSeH/ed/0
         q5fNmsUKaV1pkpDnXOUA1v6Y015F6ZLWK5PlULrSi/qdWP5073xdbfE3icGuMJT68kuT
         8UNrrUbhA3T2rXj2+RVKAWa6fii5iGeCN7HCOArsi3qq1w8YYONZz3foDAUanQC9lbx0
         8zq6BKs2R6ue/xR21lq4xGc1YpTA39axkFF7y3uRlepST8+OtJNp0BTdLTAqbbnTXuWX
         O34zgYwVf/oxEEQMNnVlMt37ojqe1kFWoCQ5kHsFPD/CAUuv6UgQ3AqctovLphffHKYN
         p/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjneFomG7hMI963vlZ2aMUzdilZFRCokXCcAUWS/4JffnhOWtNOCnB4CHPlA+KC0M3bTE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCWMpKbNiH6WF4jLOGeY4jKcfgX+Gg2LmF6sGdtDf4DHrQwals
	je8MAv+r7e9gwvOGYomX2Q2MRs1QuvXkV0rbFF3JUZEtEqZ5HSiLZEIUey4yoRMmPeh0iWmkGNK
	EeifXQjy2OjhECu17E7RQFadu90noa0F1pZJ0prY2fU2Bki9C1g==
X-Received: by 2002:adf:f5c3:0:b0:37d:2e74:2eea with SMTP id ffacd0b85a97d-3803ab671c1mr4935440f8f.5.1729868446676;
        Fri, 25 Oct 2024 08:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrImwuTr8UU6hSynSFO/Qk6OWlhES0U2PEH7e6DuZZMiwqG+LsgRJgOGFwOY24fOpFVbrN7g==
X-Received: by 2002:adf:f5c3:0:b0:37d:2e74:2eea with SMTP id ffacd0b85a97d-3803ab671c1mr4935358f8f.5.1729868446141;
        Fri, 25 Oct 2024 08:00:46 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9216fsm1727189f8f.100.2024.10.25.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:00:45 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Philipp Stanner <pstanner@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jie Wang <jie.wang@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 06/10] wifi: iwlwifi: replace deprecated PCI functions
Date: Fri, 25 Oct 2024 16:59:49 +0200
Message-ID: <20241025145959.185373-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025145959.185373-1-pstanner@redhat.com>
References: <20241025145959.185373-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pcim_iomap_table() and pcim_iomap_regions_request_all() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with their successors, pcim_iomap() and
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index 3b9943eb6934..4b41613ad89d 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -3533,7 +3533,6 @@ struct iwl_trans *iwl_trans_pcie_alloc(struct pci_dev *pdev,
 	struct iwl_trans_pcie *trans_pcie, **priv;
 	struct iwl_trans *trans;
 	int ret, addr_size;
-	void __iomem * const *table;
 	u32 bar0;
 
 	/* reassign our BAR 0 if invalid due to possible runtime PM races */
@@ -3659,22 +3658,15 @@ struct iwl_trans *iwl_trans_pcie_alloc(struct pci_dev *pdev,
 		}
 	}
 
-	ret = pcim_iomap_regions_request_all(pdev, BIT(0), DRV_NAME);
+	ret = pcim_request_all_regions(pdev, DRV_NAME);
 	if (ret) {
-		dev_err(&pdev->dev, "pcim_iomap_regions_request_all failed\n");
+		dev_err(&pdev->dev, "pcim_request_all_regions failed\n");
 		goto out_no_pci;
 	}
 
-	table = pcim_iomap_table(pdev);
-	if (!table) {
-		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
-		ret = -ENOMEM;
-		goto out_no_pci;
-	}
-
-	trans_pcie->hw_base = table[0];
+	trans_pcie->hw_base = pcim_iomap(pdev, 0, 0);
 	if (!trans_pcie->hw_base) {
-		dev_err(&pdev->dev, "couldn't find IO mem in first BAR\n");
+		dev_err(&pdev->dev, "pcim_iomap failed\n");
 		ret = -ENODEV;
 		goto out_no_pci;
 	}
-- 
2.47.0


