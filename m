Return-Path: <ntb+bounces-789-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA859967CA
	for <lists+linux-ntb@lfdr.de>; Wed,  9 Oct 2024 12:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA7D283DBC
	for <lists+linux-ntb@lfdr.de>; Wed,  9 Oct 2024 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01C31917C2;
	Wed,  9 Oct 2024 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JbnYRoxJ"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1130E19047F
	for <ntb@lists.linux.dev>; Wed,  9 Oct 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471353; cv=none; b=HcHZ7fTZY0ckEVoRCNunL/S0G8/aBfTUE/5PSF+DxBO98YjoloE2DNMVgiXnSYBQfp2NuLO3RA1rOOWbysmAr0NnwBsY6ETqqZDx9hclwiv7WhMOtIMaiKMGt0xawoJ/LuTESbUGDU0/tkyQWhuriimljBCTdfqjpArFWe5ZssA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471353; c=relaxed/simple;
	bh=P6wOEJFH1gN3pSkiGKb7z2pqnwnI+EOwPE66fTmRo9I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zgka4osAkYe7aCamkfhJX0vq/t04b+bJreLrHs3sXsTxTTb5GN4ePOwSqNRnePYAjOt+mGfyuGkFy18Wgn7kiZxf9+Ld9p6o/2n1wGvFCvMKFfy7m86Xw97r5YbBKHAgoesy2aHKonaeWVIFPCEyERcyC7G7kXEv2gvU0sbSClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JbnYRoxJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728471351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6wOEJFH1gN3pSkiGKb7z2pqnwnI+EOwPE66fTmRo9I=;
	b=JbnYRoxJJ++r2vZLZJKWKYIRwTuRG7Bhmg6+2Fxqo0D/x3dgwjEPfuiw0cpNFGX05D6LtI
	A+HF7YVS30Qa9XAl16+Fc3cvsLwRqc3oQAAU6sCXLcYiqQ7/EwdAWIJQ80zXI0MXIXwY4m
	j3l3KVu57iwAyTUCw8JDxopmXsEXbFU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-HaakjqNNP16DgNr95HjfXA-1; Wed, 09 Oct 2024 06:55:49 -0400
X-MC-Unique: HaakjqNNP16DgNr95HjfXA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2e28b9dc55dso1603991a91.0
        for <ntb@lists.linux.dev>; Wed, 09 Oct 2024 03:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728471348; x=1729076148;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcZlzWYyN8UAcZA3DQr50bLqr6cMtcb31GCRb120JWk=;
        b=FxIb0x/pnLo0m2ew93fwn1/dAbxRhECsE8wCthZLfKod2Y+qnXYd/Cl+idWhtimOhc
         vZUzftuJXRId7Yt9JS3lSEHb0DRocC/Sgs6iq/8mzxQWvMDrlkAmxsfHJLgxcVG2cZ7C
         h4NMGgS9lUonpJ5U1d/k4Q5KPfnLfpp6IOK1S6Aeksy1eOKiw3FPo3dOekLQ/mk/GT4v
         OwDh4O9BxX1FTRnEHXHRqlx/YWjl5qfoCRhbdcsuMGNATTNrvz47RFl3EQ8hof57x6B2
         q+O0A/jJUT7k7K7InWZa6XtY5OXkJp6TVdC/W/csuuQ8mdAb+bMBZLfEsVzgqjW6tA5p
         wQzA==
X-Forwarded-Encrypted: i=1; AJvYcCU/njNjoa3ZEirVBQPMPwPHw75W7nSKaxrfGAWRcZgIfjTumoeTYu6ShPVl+vaFXpmIRTU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjRPOpYGwI4p8HA/LK/kD6ga2+WEst8zLYOD0d9Bq/TOgyBLaQ
	zHWMIdFPfJNDBqotZflDFc7akPUev7tS97ZC+gnaWkDaELCUv6bonUw7JPwXmR4Hekg46CFTB2s
	qZxdRoKs79mxSw5VXNIBW3/u9BOwtyCRpNSeX769B0UjHBkawzQ==
X-Received: by 2002:a17:90b:28c7:b0:2e2:b21b:2247 with SMTP id 98e67ed59e1d1-2e2b21b2322mr933580a91.27.1728471348027;
        Wed, 09 Oct 2024 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVV2txsjAP9qEDQxARdGlpHpBZTxsJXvis+5//ouL/mBT0m0DdnB1NIlYvykMWn/28LY/iUQ==
X-Received: by 2002:a17:90b:28c7:b0:2e2:b21b:2247 with SMTP id 98e67ed59e1d1-2e2b21b2322mr933536a91.27.1728471347607;
        Wed, 09 Oct 2024 03:55:47 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a365cb84sm1341556a91.0.2024.10.09.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 03:55:46 -0700 (PDT)
Message-ID: <d6a78b6a3dec3e2371cced1382cd83d7dcf37426.camel@redhat.com>
Subject: Re: [RFC PATCH 09/13] ata: Use always-managed version of pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  linux-staging@lists.linux.dev,
 kvm@vger.kernel.org,  xen-devel@lists.xenproject.org,
 linux-sound@vger.kernel.org
Date: Wed, 09 Oct 2024 12:55:07 +0200
In-Reply-To: <95b23ff9-eb17-4e1c-b7a3-2d3691ffc48f@kernel.org>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-10-pstanner@redhat.com>
	 <95b23ff9-eb17-4e1c-b7a3-2d3691ffc48f@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-10-09 at 17:51 +0900, Damien Le Moal wrote:
> On 10/9/24 17:35, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which can sometimes be managed
> > through
> > devres. To remove this hybrid nature from pci_intx(), it is
> > necessary to
> > port users to either an always-managed or a never-managed version.
> >=20
> > All users in ata enable their PCI-Device with pcim_enable_device().
> > Thus,
> > they need the always-managed version.
> >=20
> > Replace pci_intx() with pci_intx_unmanaged().
>=20
> This contradicts the sentence above and the patche replaces
> pci_intx() with
> pcim_intx()... So s/pci_intx_unmanaged/pcim_intx in the above
> sentence ?

Yes, absolutely correct, the commit message is broken. The code itself
is fine, I grepped through it for pci_enable / pcim_enable

P.

>=20
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0drivers/ata/ahci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/ata_piix.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/pata_rdc.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/sata_sil24.c | 2 +-
> > =C2=A0drivers/ata/sata_sis.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/sata_uli.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/sata_vsc.c=C2=A0=C2=A0 | 2 +-
> > =C2=A07 files changed, 7 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> > index 45f63b09828a..9273ff3d4732 100644
> > --- a/drivers/ata/ahci.c
> > +++ b/drivers/ata/ahci.c
> > @@ -1985,7 +1985,7 @@ static int ahci_init_one(struct pci_dev
> > *pdev, const struct pci_device_id *ent)
> > =C2=A0
> > =C2=A0=09if (ahci_init_msi(pdev, n_ports, hpriv) < 0) {
> > =C2=A0=09=09/* legacy intx interrupts */
> > -=09=09pci_intx(pdev, 1);
> > +=09=09pcim_intx(pdev, 1);
> > =C2=A0=09}
> > =C2=A0=09hpriv->irq =3D pci_irq_vector(pdev, 0);
> > =C2=A0
> > diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
> > index 093b940bc953..d441246fa357 100644
> > --- a/drivers/ata/ata_piix.c
> > +++ b/drivers/ata/ata_piix.c
> > @@ -1725,7 +1725,7 @@ static int piix_init_one(struct pci_dev
> > *pdev, const struct pci_device_id *ent)
> > =C2=A0=09 * message-signalled interrupts currently).
> > =C2=A0=09 */
> > =C2=A0=09if (port_flags & PIIX_FLAG_CHECKINTR)
> > -=09=09pci_intx(pdev, 1);
> > +=09=09pcim_intx(pdev, 1);
> > =C2=A0
> > =C2=A0=09if (piix_check_450nx_errata(pdev)) {
> > =C2=A0=09=09/* This writes into the master table but it does
> > not
> > diff --git a/drivers/ata/pata_rdc.c b/drivers/ata/pata_rdc.c
> > index 0a9689862f71..09792aac7f9d 100644
> > --- a/drivers/ata/pata_rdc.c
> > +++ b/drivers/ata/pata_rdc.c
> > @@ -340,7 +340,7 @@ static int rdc_init_one(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> > =C2=A0=09=09return rc;
> > =C2=A0=09host->private_data =3D hpriv;
> > =C2=A0
> > -=09pci_intx(pdev, 1);
> > +=09pcim_intx(pdev, 1);
> > =C2=A0
> > =C2=A0=09host->flags |=3D ATA_HOST_PARALLEL_SCAN;
> > =C2=A0
> > diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
> > index 72c03cbdaff4..b771ebd41252 100644
> > --- a/drivers/ata/sata_sil24.c
> > +++ b/drivers/ata/sata_sil24.c
> > @@ -1317,7 +1317,7 @@ static int sil24_init_one(struct pci_dev
> > *pdev, const struct pci_device_id *ent)
> > =C2=A0
> > =C2=A0=09if (sata_sil24_msi && !pci_enable_msi(pdev)) {
> > =C2=A0=09=09dev_info(&pdev->dev, "Using MSI\n");
> > -=09=09pci_intx(pdev, 0);
> > +=09=09pcim_intx(pdev, 0);
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pdev);
> > diff --git a/drivers/ata/sata_sis.c b/drivers/ata/sata_sis.c
> > index ef8724986de3..b8b6d9eff3b8 100644
> > --- a/drivers/ata/sata_sis.c
> > +++ b/drivers/ata/sata_sis.c
> > @@ -290,7 +290,7 @@ static int sis_init_one(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pdev);
> > -=09pci_intx(pdev, 1);
> > +=09pcim_intx(pdev, 1);
> > =C2=A0=09return ata_host_activate(host, pdev->irq,
> > ata_bmdma_interrupt,
> > =C2=A0=09=09=09=09 IRQF_SHARED, &sis_sht);
> > =C2=A0}
> > diff --git a/drivers/ata/sata_uli.c b/drivers/ata/sata_uli.c
> > index 60ea45926cd1..52894ff49dcb 100644
> > --- a/drivers/ata/sata_uli.c
> > +++ b/drivers/ata/sata_uli.c
> > @@ -221,7 +221,7 @@ static int uli_init_one(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pdev);
> > -=09pci_intx(pdev, 1);
> > +=09pcim_intx(pdev, 1);
> > =C2=A0=09return ata_host_activate(host, pdev->irq,
> > ata_bmdma_interrupt,
> > =C2=A0=09=09=09=09 IRQF_SHARED, &uli_sht);
> > =C2=A0}
> > diff --git a/drivers/ata/sata_vsc.c b/drivers/ata/sata_vsc.c
> > index d39b87537168..a53a2dfc1e17 100644
> > --- a/drivers/ata/sata_vsc.c
> > +++ b/drivers/ata/sata_vsc.c
> > @@ -384,7 +384,7 @@ static int vsc_sata_init_one(struct pci_dev
> > *pdev,
> > =C2=A0=09=09pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE,
> > 0x80);
> > =C2=A0
> > =C2=A0=09if (pci_enable_msi(pdev) =3D=3D 0)
> > -=09=09pci_intx(pdev, 0);
> > +=09=09pcim_intx(pdev, 0);
> > =C2=A0
> > =C2=A0=09/*
> > =C2=A0=09 * Config offset 0x98 is "Extended Control and Status
> > Register 0"
>=20
>=20


