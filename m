Return-Path: <ntb+bounces-824-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C878499F66E
	for <lists+linux-ntb@lfdr.de>; Tue, 15 Oct 2024 20:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A0AB1F22363
	for <lists+linux-ntb@lfdr.de>; Tue, 15 Oct 2024 18:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412E1227B8A;
	Tue, 15 Oct 2024 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIm8lxnL"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B06202659
	for <ntb@lists.linux.dev>; Tue, 15 Oct 2024 18:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018338; cv=none; b=JDQ7KE7delnEMDcXkfCHBEJo7Ils9KuDwxboOOiKc9PwNxJ+2qA+IaqkqN/iVQaJU2fz41OylQpN4p0Y8bgQwD98qhpjkmwqNhf3Biqgsc4VnktXY7JQzu+pAslxBLUJas55T1nJO8fmSZNLPnFhPGJzCAc1bT1d/moN4QETs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018338; c=relaxed/simple;
	bh=/SfxeGkmkuFBzJlcm9he7bsLCj/mubu0nn2+ZKQiN20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8GHUGFJr0HZnJxGbEF4ZIEH2DHwNCMieakC/XYK1q5DrYLPzPbnKXFVoutJg5PwJYEx/D8eXPu07a2et7j5E0RsVxK0W8VqCEdo1fWeyZgYWM/AHkDi+GMlQlZakwCXP14wviBoggCibKinIfe29ljLs3tOSpk0slhIFZtZx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIm8lxnL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8By1s5DNgX9TQd6/BhnQDktT5vhu3DwbP7hhC4pXIE=;
	b=FIm8lxnLvCZC6syad7dr5VuHqhpnPHpVFdO6FSXxbltJpDrhAOxmukyicJltSYdCfGvSba
	7bvl5lBdbJOnaebHjlq3HAtMVKwGlqncXOzb3eQ/j4bgSUGHscqe8bvU9TPAaXbK5yYQJ0
	bHCLroVDsbGrgYt/gknTjfzAL8YvK2Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-GF2xzCeVNw2DUiozzWj1EQ-1; Tue, 15 Oct 2024 14:52:14 -0400
X-MC-Unique: GF2xzCeVNw2DUiozzWj1EQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a2593e9e9so97399866b.0
        for <ntb@lists.linux.dev>; Tue, 15 Oct 2024 11:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018333; x=1729623133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8By1s5DNgX9TQd6/BhnQDktT5vhu3DwbP7hhC4pXIE=;
        b=JO0cOlACMAFYawB8ELlm0swwy3DFpXN9BLNFiKFCkw1PP4qro6eL0ou/u7pHzVyTH0
         uOHS/bL/ggTZ91jwD1sZBx9fHQ6CMcDju2Emdtw32DQ2lo2M55JmLMxd3X0wmGlQuLde
         RU9TiB97IIrtEe6deyj1/DEY2e4MC7idHqEJyylCcsA4XcynE5EJX467kGKFPZNCHlYX
         r3UPp1lNzZKq3lDIGXn6wq5auC8CN3oTfLtB7aC3Ex0/1IqrnESjypm64IBCGkB9Ul2i
         y2E9e5GYtsZc86InHy6zcwbN9gEjPO5HdnrT1KtoaBHZBSU98RrkGV03ToiqQDcSkCkm
         XDmg==
X-Forwarded-Encrypted: i=1; AJvYcCXvOhiruFP82rOxBDxvgkA1UC7TQzEJ2B55gowOPCqGR0emkDR+VLVFWiS23lOb/SOTU6s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFNw2DvONPPTQXYpp9ew6s85OcBhz5y5fyaxSBs2RUJ20OD00j
	6pGJC6QiXUY8KZ5eI+xQW7WaUEWE/xw+jeaB8PTcdb2bI+5cEpxiRjzTD79CBU0qf+E28BEgYK3
	Zz3HtNwDv4LcH13xscHRVAwgzwVe9oBI81oZbyGWK2ZZtqBLIwQ==
X-Received: by 2002:a17:907:7296:b0:a99:398b:59a2 with SMTP id a640c23a62f3a-a99e3ea2b27mr1249218466b.54.1729018332723;
        Tue, 15 Oct 2024 11:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVMiEMyqRAKWpWp2L+WAD0bOjYiITCR1i/AfinVgUXX5Av5wUs1Mv5vuWKI1T3DD0pJ93RAg==
X-Received: by 2002:a17:907:7296:b0:a99:398b:59a2 with SMTP id a640c23a62f3a-a99e3ea2b27mr1249213666b.54.1729018332219;
        Tue, 15 Oct 2024 11:52:12 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de. [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:52:11 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 10/13] wifi: qtnfmac: use always-managed version of pcim_intx()
Date: Tue, 15 Oct 2024 20:51:20 +0200
Message-ID: <20241015185124.64726-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015185124.64726-1-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
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

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

qtnfmac enables its PCI-Device with pcim_enable_device(). Thus, it needs
the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
index f66eb43094d4..3adcfac2886f 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
@@ -204,7 +204,7 @@ static void qtnf_pcie_init_irq(struct qtnf_pcie_bus_priv *priv, bool use_msi)
 
 	if (!priv->msi_enabled) {
 		pr_warn("legacy PCIE interrupts enabled\n");
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 	}
 }
 
-- 
2.47.0


