Return-Path: <ntb+bounces-778-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C61996357
	for <lists+linux-ntb@lfdr.de>; Wed,  9 Oct 2024 10:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D99F1F214EB
	for <lists+linux-ntb@lfdr.de>; Wed,  9 Oct 2024 08:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A77198A05;
	Wed,  9 Oct 2024 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBX7TRYr"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E476D197A93
	for <ntb@lists.linux.dev>; Wed,  9 Oct 2024 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463078; cv=none; b=TlRtgIsa+SCIrqxM5T/QY2GgKoOW8avMOE4kflyyUxzpcXcFwLV5V+YfXQNIC140cCgt1eLSpEqIjzjLVLGdZRUmShZjw0smBT/lQ3UR0ZU3Y9v5yLw2JmgeP8c3F3kS9G068al5oVwYmiqp76hnJvSmABYx6+lAUKiJO8BJFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463078; c=relaxed/simple;
	bh=1G+pEtntUe6ZQw3bO6bhaoH2cS+X3nDY9vjN4pE1htc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/kc2t0ymnfZWJ9W3PZQPPl3q0q2oruRFcZyFXcBs9WAejrV2JgjXqGMrgwugom5XE74OfsfQ+BmV8rHkfItqRXD0SkAZUXp52HtIQVMPoxtckBcsz/dd7NU1CoCZGrePcQ6Qu/M844195tyjWk8mWybE7vuXWggjV2M2Giu6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBX7TRYr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnZVeWBmT+J+LidRf6mImSoyv0oTiirkxqtpTQtBia8=;
	b=IBX7TRYrLbhoWDwNzXG6GsF+XXeM+Vx1i/0ODfoW8Nx0palhPVbDIqDY1HG4oQy+vSG0st
	sHtQtNN1I/Jz7ytxDFymDDwl0gkzmeLIFTpNu/ueUMIeIsbvwU2I/iSkgOcE0AkbEept8k
	LxuOXEshzXzBaheunt4I8qv03k35Mfw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-HqUGwyARMui1jnHQj7NiAg-1; Wed, 09 Oct 2024 04:37:53 -0400
X-MC-Unique: HqUGwyARMui1jnHQj7NiAg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7afcea583caso145036985a.2
        for <ntb@lists.linux.dev>; Wed, 09 Oct 2024 01:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463073; x=1729067873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnZVeWBmT+J+LidRf6mImSoyv0oTiirkxqtpTQtBia8=;
        b=lc0tke+5B4arlrgyoQ54CtZmL514Z9moNEQHRf14fezQzYqv5k54ll4mohaUGd6/Bj
         sP81TRgbkUcGXwq5dBrpwCk/hsnFzTdwF9yj2zzrUO6XKalnAkiez4Y7atP8ehfZ95Xb
         YZNDsWv64dgC34uwt96sR8QErhQudMiKWP8odtdqm5SXO1SRd05rX0/ZgLlwDnWBgZm0
         3l1D7m+kM/VhRWqHKBHekgXF01nMlRgwG3nT9+HqJ+Fn4zhAdLc1SWCJqCLtwlc0+hPr
         OKdQQL0iRKa3A9QiUY7R+c8TCzPt+wO3HgWn9fLzj4v45lrLeFeo0IOXeld4W2/Jnwh1
         JMAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZfi6OwKKobq44YaBDoBby8QxfH1lcPlCSXbCmef9Rva27ZDP/pS8QKTFOrU2SMrJR6N0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWHZtq0bNTOWsDrXdu5oXTAesZRovJqVra6Q++jlhG2ompsj1A
	KWWjVjmKyMLNu2aJTKplMAuCBnjgpK2VYpawkxrtVY6eMzDGmixXXUBuP4milK/Ar/uyTZjEcki
	AJp1OXSOaTYDLYShXrCuO06TSUDz4AlNh8KWsKi7hJN+AxaDdCA==
X-Received: by 2002:a05:620a:40a:b0:7a7:fdef:27a with SMTP id af79cd13be357-7b0874d7cdemr203381985a.58.1728463072687;
        Wed, 09 Oct 2024 01:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVcvq1l/JiYDRYGcvT0xuobZAhQYwMoKmOoPhvJp1jfhxUy6a6lyXKK7lz5Kz5T1IwGDIQGw==
X-Received: by 2002:a05:620a:40a:b0:7a7:fdef:27a with SMTP id af79cd13be357-7b0874d7cdemr203375485a.58.1728463072097;
        Wed, 09 Oct 2024 01:37:52 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:37:51 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 08/13] PCI: MSI: Use never-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:14 +0200
Message-ID: <20241009083519.10088-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
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

MSI sets up its own separate devres callback implicitly in
pcim_setup_msi_release(). This callback ultimately uses pci_intx(),
which is problematic since the callback of course runs on driver-detach.

That problem has last been described here:
https://lore.kernel.org/all/ee44ea7ac760e73edad3f20b30b4d2fff66c1a85.camel@redhat.com/

Replace the call to pci_intx() with one to the never-managed version
pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
This MSI part here is probably the part of the series that needs most
attention.
---
 drivers/pci/msi/api.c | 2 +-
 drivers/pci/msi/msi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index b956ce591f96..c95e2e7dc9ab 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -289,7 +289,7 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 			 */
 			if (affd)
 				irq_create_affinity_masks(1, affd);
-			pci_intx(dev, 1);
+			pci_intx_unmanaged(dev, 1);
 			return 1;
 		}
 	}
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 3a45879d85db..53f13b09db50 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -268,7 +268,7 @@ EXPORT_SYMBOL_GPL(pci_write_msi_msg);
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
 {
 	if (!(dev->dev_flags & PCI_DEV_FLAGS_MSI_INTX_DISABLE_BUG))
-		pci_intx(dev, enable);
+		pci_intx_unmanaged(dev, enable);
 }
 
 static void pci_msi_set_enable(struct pci_dev *dev, int enable)
-- 
2.46.1


