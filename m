Return-Path: <ntb+bounces-986-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB59B06DE
	for <lists+linux-ntb@lfdr.de>; Fri, 25 Oct 2024 17:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63B57284476
	for <lists+linux-ntb@lfdr.de>; Fri, 25 Oct 2024 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025E820F3FB;
	Fri, 25 Oct 2024 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TPOw8IXO"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B1920BB2E
	for <ntb@lists.linux.dev>; Fri, 25 Oct 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868458; cv=none; b=UGQ0mG6UM9UDFOSV2l05g9ozai6kuEJTBkyO8kia87yjKso00Rfo6cfLGBlo17Kh2xS+r67GEHWljitUOaD5uKMi2RY7tYf0K8cnmJeONl9buf0795ButPY+yXuEs4iEecJpD8JOyWLbVZP9YZc5RJhdM5Z6Rhl5QsdpweeYxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868458; c=relaxed/simple;
	bh=KRhL2deOZRHNfuo7/CizyodCPj2p+YqlhuhaNJFSYuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUavbftvGAlfZPeSC6FeELjirxDBA0Dwc+Dx5JUZCvXLVlV5nYBfUXJ3cEbrGW5pmXLHX8fHZvuvxfqcM75tbC3SBO256QxdgsK2k73U4KbNBvTn7vYeE+9khNO+0k3KpZaaEy3HOG8EMmrjvjt2ht0Q7zxVlUDy9F5HFMkSsso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TPOw8IXO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729868453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oH83zA24aoDnwtpuZ+wclLhu+n7qeaaZUv7+D6hfs+0=;
	b=TPOw8IXOC7L7C+ZF2Ga1RUo4lwDuVQKIhH8OniQvfxKDqsY0Ff9bOwffzGiJL/VItrWyIl
	zO7RRmY0DOqm9KOcWHyb9hy7ac9Yrl4ISow3j6Gd+UowNbr84FLKAzuZEdbm1cysyG7ZKv
	1QsTT/PQjfYuZC14xsoG6EgzlVwtj9U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-A1mS8PMvM9OKvzEX_WjsSA-1; Fri, 25 Oct 2024 11:00:51 -0400
X-MC-Unique: A1mS8PMvM9OKvzEX_WjsSA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4315dd8fe7fso19841955e9.3
        for <ntb@lists.linux.dev>; Fri, 25 Oct 2024 08:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868450; x=1730473250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oH83zA24aoDnwtpuZ+wclLhu+n7qeaaZUv7+D6hfs+0=;
        b=INM8H1FM0z0J1iGkzQgQO6WA3Ie/K4rt5DyxXv4oli225GHdrmvMRIAbwmuDRPvp1v
         /U4HGY21+2qP8nrrn/8OvAw3ix+uegZo8nfU8N8BP+TLKoIu9FYNYM/cBTwWruVPHQB4
         HqruSP9aFG3yICsn5N17J9YZPGMO8Nt5TrQcGVh/VKf37+PAXI1aca5c7jZJwUbSa54K
         fR3TMky/dKfK+8EvVQh8eJak4RoYwmp9ADtcUGliSN2j8shDmhyDSPlG0mww50KaChLi
         17D5V77TPdXEX71odSQi67UUDLIpkk9+taUUB4aip9qovBlLZLHLuTjeU4zTmI7hnRq1
         j4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVggpEmov/nXTsFsj1DGTpFy1khi6y+9olS7aVkPw8a0s268axi18b/zlOw5P1SijqNHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzEo50ROIXHYSJxQd6HoELt+8ZCPUIRs3s0fz1EY1Ai2ybGeES
	mA7hfoMmG9BN6Y/D1Tp4r1z8S7aZJ6TLHN7goaezkJ+Oku/AvPSCZuwEDnc+8lWhgktBb3vkXIL
	x3IY5WGf0PtsD2z4QBzPLQDu3kaU02ycQLvu1zBiK0JcpcLdDqg==
X-Received: by 2002:a5d:4e08:0:b0:37d:95a7:9e57 with SMTP id ffacd0b85a97d-37efcee8c28mr8039769f8f.2.1729868448829;
        Fri, 25 Oct 2024 08:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1JzvMg8cr6yZm3DrYA37QNNdDoszBRAqVfY9P7gwJlqkM8x7H1LKy5SQs7DHzYJeG4eaDSg==
X-Received: by 2002:a5d:4e08:0:b0:37d:95a7:9e57 with SMTP id ffacd0b85a97d-37efcee8c28mr8039706f8f.2.1729868448084;
        Fri, 25 Oct 2024 08:00:48 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9216fsm1727189f8f.100.2024.10.25.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:00:47 -0700 (PDT)
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
Subject: [PATCH 07/10] ntb: idt: Replace deprecated PCI functions
Date: Fri, 25 Oct 2024 16:59:50 +0200
Message-ID: <20241025145959.185373-8-pstanner@redhat.com>
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
Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 6fc9dfe82474..544d8a4d2af5 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2671,15 +2671,20 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	 */
 	pci_set_master(pdev);
 
-	/* Request all BARs resources and map BAR0 only */
-	ret = pcim_iomap_regions_request_all(pdev, 1, NTB_NAME);
+	/* Request all BARs resources */
+	ret = pcim_request_all_regions(pdev, NTB_NAME);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to request resources\n");
 		goto err_clear_master;
 	}
 
-	/* Retrieve virtual address of BAR0 - PCI configuration space */
-	ndev->cfgspc = pcim_iomap_table(pdev)[0];
+	/* ioremap BAR0 - PCI configuration space */
+	ndev->cfgspc = pcim_iomap(pdev, 0, 0);
+	if (!ndev->cfgspc) {
+		dev_err(&pdev->dev, "Failed to ioremap BAR 0\n");
+		ret = -ENOMEM;
+		goto err_clear_master;
+	}
 
 	/* Put the IDT driver data pointer to the PCI-device private pointer */
 	pci_set_drvdata(pdev, ndev);
-- 
2.47.0


