Return-Path: <ntb+bounces-987-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C539B06E7
	for <lists+linux-ntb@lfdr.de>; Fri, 25 Oct 2024 17:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45ADB2834C9
	for <lists+linux-ntb@lfdr.de>; Fri, 25 Oct 2024 15:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFFF231CB5;
	Fri, 25 Oct 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHlQGJfF"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBC20F3D9
	for <ntb@lists.linux.dev>; Fri, 25 Oct 2024 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868460; cv=none; b=rh5crHI0vqKqeH4Z0DVBDYMZGl4kkL+On6Z19u6qd35xR9jQNGBMTEpB9LJNmPPpszPh5VAAuq7dar3ob8w/yxZ2V4BVZdqBesAqqgwewsuDaQ1sBVYN/JwQ495ERMc5LCLwSvN5+r68ZeFV3g4VfErccPXSwki63Rc/lFZ4w8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868460; c=relaxed/simple;
	bh=x2AO4woPu9H2aNxl2TylFo7TB42POmIv8HM+dl0TTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e58DCuqqEMeVFveIL811A8cRt6a6QZadjxkK9hIa69eYKmmUcivL2GLX3cq6VkAb1J5kbNC2RtjPKHrUVzTDVUYsTzs1n42hCL1EAf4aulRb8iYLcwown3iZuO+WhDEZbhi0p0FlIBOkpEHEEy8RP/q+efbpC5Iw7Qf2vBTQ5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHlQGJfF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729868455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
	b=JHlQGJfFGkKI7u7dcrInpEF+F3cIrMd5Bp+9dTD+E1AU5RVPWFz06HnGmTanRsAP7EhQXX
	vfj6LWVAg35SWvTlN9oUNRCn78xDNXY4B80amRjxI/jF/wm92cHJH7Xr/Ygp3zaa9CllUs
	jym45B6KCEWxYfesyxTIjROyeZFvafs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-a0_riMDgPKGsezCbvKO-qQ-1; Fri, 25 Oct 2024 11:00:54 -0400
X-MC-Unique: a0_riMDgPKGsezCbvKO-qQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d603515cfso1009553f8f.1
        for <ntb@lists.linux.dev>; Fri, 25 Oct 2024 08:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868453; x=1730473253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
        b=iEMO9E3jmhy9InH8Zk3AiVJhX0TrZeezV+yV6FJKA1RlbY3Xo6Do+c+0bfLJFAQy+V
         ViUqIwr/jiwDOQktnB2qZ+m8Rj9TJrxQZaAQzNklGL7avzTNpOM0w/C/H6k5xUUBB4hi
         8O/HKL5s+RFp3QGjIEGOYhGK/5G+1dNd5NGw25HNhNgX5l88tQFxvTW13Tq8+6rkycnc
         ccSWbhN8gVFS4OPp5F8fe5oRGeHPCmWpIkqkW131aAHba3QTpCQkFtfzuMhDKLPMmQ2d
         pqeSwzs8I6rOcWPLKL653smUyvknvUeKmptlOKVklBO1cCpJue9tFtOkM2VtrEwbLqq6
         krJg==
X-Forwarded-Encrypted: i=1; AJvYcCV8IeuAxNZrChMlTP5gQ0vXc5Oy3KE/lx4/829rwU38eJVPotV3lPlgVX1Qz0NNqxPhsXU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6KB3mtFQ/4qaSSEjFFZExDCwTGLPnCPYlJiRFFHfTlvunw6u1
	7dT9+rmzwP0jf/+notVA7nvQx+RAnYLZGTgsl+Oj0WFg1N+NvfnXzpWMp8tdkYlhDkAXH6eANGB
	7GlAWSV9q9MbGMCxe4AOixZ8nv6O74NM8bY/GLfgJ9DxA1WQ94A==
X-Received: by 2002:a05:6000:178e:b0:37d:4937:c9eb with SMTP id ffacd0b85a97d-37efcf05ef0mr8444754f8f.21.1729868452839;
        Fri, 25 Oct 2024 08:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHuZZsnRNqLrqF9GwOZcr5qbeM2dWtXIkrXTvrx9EisXT4UszvhL4K4oEeTzFUCaGcEshlLw==
X-Received: by 2002:a05:6000:178e:b0:37d:4937:c9eb with SMTP id ffacd0b85a97d-37efcf05ef0mr8444655f8f.21.1729868452087;
        Fri, 25 Oct 2024 08:00:52 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9216fsm1727189f8f.100.2024.10.25.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:00:51 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/10] ALSA: korg1212: Replace deprecated PCI functions
Date: Fri, 25 Oct 2024 16:59:52 +0200
Message-ID: <20241025145959.185373-10-pstanner@redhat.com>
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index e62fb1ad6d77..49b71082c485 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2108,7 +2108,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	err = pcim_request_all_regions(pci, "korg1212");
 	if (err < 0)
 		return err;
 
@@ -2130,7 +2130,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = pcim_iomap_table(pci)[0];
+	korg1212->iobase = pcim_iomap(pci, 0, 0);
+	if (!korg1212->iobase)
+		return -ENOMEM;
 
 	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
-- 
2.47.0


