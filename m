Return-Path: <ntb+bounces-1029-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E19C6F61
	for <lists+linux-ntb@lfdr.de>; Wed, 13 Nov 2024 13:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98D45289F1A
	for <lists+linux-ntb@lfdr.de>; Wed, 13 Nov 2024 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8982036EF;
	Wed, 13 Nov 2024 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZhfZl9r"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53E2022E2
	for <ntb@lists.linux.dev>; Wed, 13 Nov 2024 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501762; cv=none; b=aQYJqukn3RTQSdtC4912CCnZqI95BKzsNryZ3EkH54pDWajlKxe97G9HRRLzm6NPfiCw47jkQ0QibmRMINgqFt924G4CxcRwzfQKP29Pj49oyL/psL2nEy5EVJfbwMKy9CgKNHAKUkNqjw1Bsty/n/6WFCcJ++M7SZ2+kL+ZdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501762; c=relaxed/simple;
	bh=dO0Bt5S9xKcwhKAQUQyexaV6kggyDnL6IVx7RfRRupg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTwxhxq4RGs0YfxFZ7MNi2gNKQUG0jn4UqxqvgH+DpDeUAzVwF4Nd2MtSLHtPnRu7KXB29Pz+5pwVRU6qXn47cctrZYEh/wHNSKp/eZ0EjXSHP+ad5Uja6Ktop8U4ETl9GCpU+rxVJ67At2Ok2QNgwbARyJ/Plc4+70XfDZVV9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZhfZl9r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UdUsG2Ce2FuhD+Vr0J1b3PhjfLKCU3S+xUJ9DfCqJQ=;
	b=VZhfZl9rW1jL3ciPc5uztMuH6xPl1OWiDahUZFmFtTIkCfRSHB7OkjotrmeKIagoiZo6v8
	TK1VU1lpCH8PsEFJD3wpax2/Z06KLvLLlIbMWot30yAFXxDgA04HFIbA+0xToJHZbzcTH7
	VRIt3eNj64PY7djLbHCTmapCZoxrzkA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-6uytsS7yOI6G1Nb6g3fIFw-1; Wed, 13 Nov 2024 07:42:36 -0500
X-MC-Unique: 6uytsS7yOI6G1Nb6g3fIFw-1
X-Mimecast-MFC-AGG-ID: 6uytsS7yOI6G1Nb6g3fIFw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d458087c0so439090f8f.1
        for <ntb@lists.linux.dev>; Wed, 13 Nov 2024 04:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501755; x=1732106555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UdUsG2Ce2FuhD+Vr0J1b3PhjfLKCU3S+xUJ9DfCqJQ=;
        b=jv9Mmtv3/wAmD0+WxCvZr95m4AgURLCoAzjPh2EseSlVIsnJ6K/Wm0ZErYgT+lUnch
         Z/FEoJdmLGAJjJf6tAvIF775Mhe40DvtrPA47ZlNQXEYCxVCO33tm7Hna/kpNVze1wcf
         JQneXzfTMFy3x3YAOH5UQMlOtCgbw5w6Y0zlC7xtfxB4/PFLXAYmRENwNpSlHoZ1vi8q
         XEfCdsxxoiXbWJwarPAR+wswNaPDh4OOPMxuB1qsBjaG2IARtYPx2aIIoo7+g7GAqcit
         fxo2TxJhJEFTxRQ5jDSvc61eV17McqauvqjKYVVK1AyUf7RjvU/wOp/OHEfZgbbLBZlR
         WT3A==
X-Forwarded-Encrypted: i=1; AJvYcCUent6g72bOdKlZu5xfOVeWP5SnR124mMvPCKytvmRTg+hIncBJKpyEL+erOzAWh4+3xRE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzx2LvqHU0Na6uJfVeKGiMnp2TZm6gTWAS9YPCUQAsalFgwxQE
	dJwjEbXKGWG/spDyvYgGMWsTOBKMSY1S58WhIH31ANKWVkDOmEsq786Bzix//zrGIFH+yRLteq5
	Of58dmjSIUXdpVMy9YOlUvuw+dBb+nGjQ7APYGxppRXHjGa3iYw==
X-Received: by 2002:a05:6000:2d84:b0:381:f443:21c6 with SMTP id ffacd0b85a97d-381f44325dbmr11520853f8f.0.1731501755009;
        Wed, 13 Nov 2024 04:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpGOsc1jx0uRyavECo6HCq0VfxiOW2oXCFxduoG1UVcDJiaH+xI1Ywem/WU8zILNl7MjLF9A==
X-Received: by 2002:a05:6000:2d84:b0:381:f443:21c6 with SMTP id ffacd0b85a97d-381f44325dbmr11520807f8f.0.1731501754619;
        Wed, 13 Nov 2024 04:42:34 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:42:34 -0800 (PST)
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
Subject: [PATCH v2 02/11] drivers/xen: Use never-managed version of pci_intx()
Date: Wed, 13 Nov 2024 13:41:50 +0100
Message-ID: <20241113124158.22863-4-pstanner@redhat.com>
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
X-Mimecast-MFC-PROC-ID: cO6phzMje7hO2U9p4Rj7eai6tgl4Y0DI5ZQYJ4irQN4_1731501755
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

xen enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xen-pciback/conf_space_header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index fc0332645966..8d26d64232e8 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -106,7 +106,7 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 
 	if (dev_data && dev_data->allow_interrupt_control &&
 	    ((cmd->val ^ value) & PCI_COMMAND_INTX_DISABLE))
-		pci_intx(dev, !(value & PCI_COMMAND_INTX_DISABLE));
+		pci_intx_unmanaged(dev, !(value & PCI_COMMAND_INTX_DISABLE));
 
 	cmd->val = value;
 
-- 
2.47.0


