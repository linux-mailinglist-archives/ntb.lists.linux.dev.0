Return-Path: <ntb+bounces-1032-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 810529C6F73
	for <lists+linux-ntb@lfdr.de>; Wed, 13 Nov 2024 13:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD8428287D
	for <lists+linux-ntb@lfdr.de>; Wed, 13 Nov 2024 12:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3728E205151;
	Wed, 13 Nov 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gLpgthrp"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AA2040A2
	for <ntb@lists.linux.dev>; Wed, 13 Nov 2024 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501767; cv=none; b=Rr63x43n7hv0NzVamEClD1UBwMc61MZLvEt9N+GPk0AF9fkXr2Nvlv4INH+dKoy+2ODM7kOebedOUP9jHIJ6JsULDNhYFB43lOX9ALib+BUMICYLMH6ENmpcYsoLd0PUQ1DRPl7mqHkXIloCFU0VeVNmopDU9KZqFYSnamqu0is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501767; c=relaxed/simple;
	bh=pl7sVd3EkZjYz8a4hu3qyOtH7RHbVGi7fS/efUFEh0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DnrD9uPAkRK0WfUE98ZdvUGMXtO/VQa9fLNFVdWZ+iImHJSGz9kJjI5Yr8o3D9dv8Wii9zuPiX/QZxHwnJgZnccl/8wU6hY5mm64LQuu0DW+JGT5AQpe5iVeQY+RVLaFskEgubIy2WZ8QCs9kqGSPyex2GSyCuvAnw5DYFYk0Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gLpgthrp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/tiT1oHv++iZFY5S8iNVJ0nRwrLe5bjQFEltGuWg0g=;
	b=gLpgthrpaLnM8v45rl7nPH20azm9xJdi6yTCZzkhTbGbboX0E6M00KkIC82urkaLgsX+5w
	BT9x/Y7kKBFMu70GtPoN/vMvJN/XdD+BR1LQ+S6qLdQgQ3YvLhM6Yjvk4eSVksIPn/m99C
	5CpLqC3itcNDYT8Cf9dvVkLbjEdDLz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-FnIGmh99Nm6KbjHRbbg6LQ-1; Wed, 13 Nov 2024 07:42:43 -0500
X-MC-Unique: FnIGmh99Nm6KbjHRbbg6LQ-1
X-Mimecast-MFC-AGG-ID: FnIGmh99Nm6KbjHRbbg6LQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d4854fa0eso4455816f8f.2
        for <ntb@lists.linux.dev>; Wed, 13 Nov 2024 04:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501762; x=1732106562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/tiT1oHv++iZFY5S8iNVJ0nRwrLe5bjQFEltGuWg0g=;
        b=pyB5MT4O9wHvU6llDtU9EyNcIjH3jyagJ92SlqIs4qx30grqAIRNmSwPfkSmLX+zYn
         zR/E6IsflqUOpEAe5jorbYJ37M4tdLXjURs/rviuA5T5dmkBk3Lf9HMM+dondYRWZiT2
         m818jzD3z3BPP06Xbmrm1GVnYnn71+csLvw3BfSHfLbSqJP3ZBk1F/+RvunHMbs176gi
         BHMRFq6i1PQJD0BcFe/b8pVUt3obwCHbk9JD6rUd4AdbGdvFAKxt8PgD0PviH3/avNf+
         +RxTgX/dNzkmcNdmW4pvKhjzfovhBY9pjb28hqmnhlWufdBwX587z7apSbISWkC60ra3
         Mr8g==
X-Forwarded-Encrypted: i=1; AJvYcCWwo+jw0QJ62uNRf0NTBh4jvA7fE9ihq6Ex1p9SHjmXWE9LMZDCjdWk6AgVEptUJjOsOzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOLPm+FCflcIcPMu7HoVtqNICCNd8qv+UhVcdxy4b7d1/y/a2X
	why8UTlAGixIUoQ3LjtMO6dgrGyiiEFISReL8o3axaw0VtltUTJflqZtEX7tcuYulPA2hakLjJx
	DguOJTGk81Pcomzkkhzuf8IpvE3TLH7+IcbNdcIy6aueE8FjNUA==
X-Received: by 2002:a5d:5983:0:b0:381:bdeb:1799 with SMTP id ffacd0b85a97d-381f186cd09mr18144214f8f.16.1731501761761;
        Wed, 13 Nov 2024 04:42:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5699iopflHa4MIh1vN3HWtOXM+FnSWh5U2CqZjf/QXNdmzfM7vRlX36oxsyFaMlA1GtkJXQ==
X-Received: by 2002:a5d:5983:0:b0:381:bdeb:1799 with SMTP id ffacd0b85a97d-381f186cd09mr18144148f8f.16.1731501761273;
        Wed, 13 Nov 2024 04:42:41 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:42:40 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Ankit Agrawal <ankita@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 05/11] misc: Use never-managed version of pci_intx()
Date: Wed, 13 Nov 2024 13:41:53 +0100
Message-ID: <20241113124158.22863-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113124158.22863-2-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MtRVfkblk-V2VrrGsDmd8b2KyM6mEtO-s_1kkGYAh-c_1731501762
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

cardreader/rtsx_pcr.c and tifm_7xx1.c enable their PCI-Device with
pci_enable_device(). Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/misc/cardreader/rtsx_pcr.c | 2 +-
 drivers/misc/tifm_7xx1.c           | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index be3d4e0e50cc..e25e6d560dd7 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1057,7 +1057,7 @@ static int rtsx_pci_acquire_irq(struct rtsx_pcr *pcr)
 	}
 
 	pcr->irq = pcr->pci->irq;
-	pci_intx(pcr->pci, !pcr->msi_en);
+	pci_intx_unmanaged(pcr->pci, !pcr->msi_en);
 
 	return 0;
 }
diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
index 1d54680d6ed2..5f9c7ccae8d2 100644
--- a/drivers/misc/tifm_7xx1.c
+++ b/drivers/misc/tifm_7xx1.c
@@ -327,7 +327,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 		goto err_out;
 	}
 
-	pci_intx(dev, 1);
+	pci_intx_unmanaged(dev, 1);
 
 	fm = tifm_alloc_adapter(dev->device == PCI_DEVICE_ID_TI_XX21_XX11_FM
 				? 4 : 2, &dev->dev);
@@ -368,7 +368,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 err_out_free:
 	tifm_free_adapter(fm);
 err_out_int:
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 err_out:
 	if (!pci_dev_busy)
@@ -392,7 +392,7 @@ static void tifm_7xx1_remove(struct pci_dev *dev)
 		tifm_7xx1_sock_power_off(tifm_7xx1_sock_addr(fm->addr, cnt));
 
 	iounmap(fm->addr);
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 
 	pci_disable_device(dev);
-- 
2.47.0


