Return-Path: <ntb+bounces-740-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A09458D9
	for <lists+linux-ntb@lfdr.de>; Fri,  2 Aug 2024 09:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF11A1C205E1
	for <lists+linux-ntb@lfdr.de>; Fri,  2 Aug 2024 07:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF4A1C0DE3;
	Fri,  2 Aug 2024 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AmXjEitI"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51871C0DE5
	for <ntb@lists.linux.dev>; Fri,  2 Aug 2024 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722583780; cv=none; b=YGLgZYM/mOP/G9y3Fvm6qInMJr8syIP+u+zBBP5H4o0RZzKhhq+YMF4D88qMnqeSOEoCrxLg0PtVpgpuYZCB5kIuAmPoELTzj6fdekyDfKr83P4XW/MOtvSEQl32TCMTDPG5GIe6YtyChg2uJ7JNl88TEsPca94LgdgCv+i+wYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722583780; c=relaxed/simple;
	bh=/qNa7b0UY2NN2bq6vNpDiP0TaRXi/KQpapeAk2I4r3A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PhfS60elM988IfhdTRAaPK7/IJX+VOBdnwp9UVtHa82/6psbynS9x1LXj77oGle6uTEaILGeHJPS+5Efg8UC/ARD60iYouG70yIcimeb0lpK7ehclbbgMLKTm9+IKXOvzw4+VmycTykdmR68/0M25EzXJC41ZfDnBiQd25PHHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AmXjEitI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722583777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qNa7b0UY2NN2bq6vNpDiP0TaRXi/KQpapeAk2I4r3A=;
	b=AmXjEitIPJBnI4v1jFOH+eXVrvPWiohDcXiqQ0p48m+KjiPNyZ0qIIONpge62Rs7KkDq1l
	Jm3LhpnxRFt1esBE/w5BkbbrKiXedpW1yaaqVS/HeOB+HefFEQDa1tH+Uv+ElLydQrMkl8
	lQ4TJJi3LLOwF0OdOG2s+/FdRI2uozc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Igb2pOBvOTCpfPhbUffORA-1; Fri, 02 Aug 2024 03:29:34 -0400
X-MC-Unique: Igb2pOBvOTCpfPhbUffORA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5a121cd4d27so1064569a12.1
        for <ntb@lists.linux.dev>; Fri, 02 Aug 2024 00:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722583773; x=1723188573;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oflud7+JAJ9QyEvfCkggZ4DJB6jzCHKS2M1exBnEcgI=;
        b=PCriATeFgMCdcQcue0RdopaLquMlhbc9FSxG9niVp/MYVxuJJVjYT3M9AWj3OvU+cY
         0gynpnGAsavIh4uGEh6TCPaKOPHJt0OdOIUoX6emfkX2H5OHx6utbgxUhrR4MTIiUzkb
         r1fodc3nnf078FY6f8N9N/huFs8doDKcfatBXrRlD0nyfuAQ04tSk7okdyFOVAsfZFxA
         PCGGa470vLSYcfI03bFML4h27w0LSfMm65OuCsK3mdo8zYeGbbs3TN74pSEwxln3SezY
         uFeRyJeuJs/KE8xgDPz2shiLIfw0XTVASUzzzKBUNiR/M29r07VyGX7Boty8npHePewl
         v/yg==
X-Forwarded-Encrypted: i=1; AJvYcCXsZ0uofBLEhFRJDM36BO8DwhzDG5iwwlmp2c3x98Nol4eCyHBkCCIgeJah8TM7Uv0lkuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuyMqMqUVDarqpYVmyM7KuLe5Izjm1gdLZYQKE7iBEbx/tTeWs
	ompL3aLsPvTaRr850DKUusUmVyAV54J2NQgUbM5krOPBWYen69oW56fGBD6Rq1M+189FMAlhr3M
	iKREIOsJbemcuyMKCBVKfK6yKRL9T0jjJd1oq+OyiPrXx75cX2Q==
X-Received: by 2002:a50:f69b:0:b0:5b0:c00:8e6a with SMTP id 4fb4d7f45d1cf-5b7f57f41damr1098625a12.3.1722583773133;
        Fri, 02 Aug 2024 00:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsji3VfhXPxlMrKr64Fn48CXyC0btftVqR91XWF6/2fd7ezeuTo6NKImFbFsMb8BsrTBId9w==
X-Received: by 2002:a50:f69b:0:b0:5b0:c00:8e6a with SMTP id 4fb4d7f45d1cf-5b7f57f41damr1098574a12.3.1722583772521;
        Fri, 02 Aug 2024 00:29:32 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d6c:8e00:43f3:8884:76fa:d218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839610c77sm741802a12.9.2024.08.02.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 00:29:32 -0700 (PDT)
Message-ID: <a1a7fbf3cca131955911c911e09f1b1d908a7c06.camel@redhat.com>
Subject: Re: [PATCH 04/10] crypto: marvell - replace deprecated PCI functions
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,  Boris Brezillon
 <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, Srujana Challa
 <schalla@marvell.com>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Serge
 Semin <fancer.lancer@gmail.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Kevin Cernekee <cernekee@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,  Mark Brown <broonie@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jie Wang <jie.wang@intel.com>, Adam
 Guerin <adam.guerin@intel.com>, Shashank Gupta <shashank.gupta@intel.com>,
 Damian Muszynski <damian.muszynski@intel.com>, Nithin Dabilpuram
 <ndabilpuram@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, Johannes
 Berg <johannes.berg@intel.com>, Gregory Greenman
 <gregory.greenman@intel.com>, Emmanuel Grumbach
 <emmanuel.grumbach@intel.com>, Yedidya Benshimol
 <yedidya.ben.shimol@intel.com>, Breno Leitao <leitao@debian.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, John Ogness
 <john.ogness@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-ide@vger.kernel.org, qat-linux@intel.com,
 linux-crypto@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Date: Fri, 02 Aug 2024 09:29:30 +0200
In-Reply-To: <20240801174608.50592-5-pstanner@redhat.com>
References: <20240801174608.50592-1-pstanner@redhat.com>
	 <20240801174608.50592-5-pstanner@redhat.com>
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40)
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

On Thu, 2024-08-01 at 19:46 +0200, Philipp Stanner wrote:
> pcim_iomap_table() and pcim_iomap_regions_request_all() have been
> deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI:
> Deprecate
> pcim_iomap_table(), pcim_iomap_regions_request_all()").
>=20
> Replace these functions with their successors, pcim_iomap() and
> pcim_request_all_regions()
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c | 14 +++++++++--=
-
> --
> =C2=A0drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c | 13 +++++++++--=
-
> -
> =C2=A02 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
> b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
> index 400e36d9908f..ace39b2f2627 100644
> --- a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
> +++ b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
> @@ -739,18 +739,22 @@ static int otx2_cptpf_probe(struct pci_dev
> *pdev,
> =C2=A0=09=09dev_err(dev, "Unable to get usable DMA
> configuration\n");
> =C2=A0=09=09goto clear_drvdata;
> =C2=A0=09}
> -=09/* Map PF's configuration registers */
> -=09err =3D pcim_iomap_regions_request_all(pdev, 1 <<
> PCI_PF_REG_BAR_NUM,
> -=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 OTX2_CPT_DRV_NAME);
> +=09err =3D pcim_request_all_regions(pdev, OTX2_CPT_DRV_NAME);
> =C2=A0=09if (err) {
> -=09=09dev_err(dev, "Couldn't get PCI resources 0x%x\n",
> err);
> +=09=09dev_err(dev, "Couldn't request PCI resources
> 0x%x\n", err);
> =C2=A0=09=09goto clear_drvdata;
> =C2=A0=09}
> =C2=A0=09pci_set_master(pdev);
> =C2=A0=09pci_set_drvdata(pdev, cptpf);
> =C2=A0=09cptpf->pdev =3D pdev;
> =C2=A0
> -=09cptpf->reg_base =3D
> pcim_iomap_table(pdev)[PCI_PF_REG_BAR_NUM];
> +=09/* Map PF's configuration registers */
> +=09cptpf->reg_base =3D pcim_iomap(pdev, PCI_PF_REG_BAR_NUM, 0);
> +=09if (!cptpf->reg_base) {
> +=09=09dev_err(dev, "Couldn't ioremap PCI resource 0x%x\n",
> err);
> +=09=09err =3D -ENOMEM;

Just saw I messed that one up. err has to be set before printing it, of
course. Will fix that in a v2.

> +=09=09goto clear_drvdata;
> +=09}
> =C2=A0
> =C2=A0=09/* Check if AF driver is up, otherwise defer probe */
> =C2=A0=09err =3D cpt_is_pf_usable(cptpf);
> diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
> b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
> index 527d34cc258b..e2210bf9605a 100644
> --- a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
> +++ b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
> @@ -358,9 +358,8 @@ static int otx2_cptvf_probe(struct pci_dev *pdev,
> =C2=A0=09=09dev_err(dev, "Unable to get usable DMA
> configuration\n");
> =C2=A0=09=09goto clear_drvdata;
> =C2=A0=09}
> -=09/* Map VF's configuration registers */
> -=09ret =3D pcim_iomap_regions_request_all(pdev, 1 <<
> PCI_PF_REG_BAR_NUM,
> -=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 OTX2_CPTVF_DRV_NAME);
> +
> +=09ret =3D pcim_request_all_regions(pdev, OTX2_CPTVF_DRV_NAME);
> =C2=A0=09if (ret) {
> =C2=A0=09=09dev_err(dev, "Couldn't get PCI resources 0x%x\n",
> ret);
> =C2=A0=09=09goto clear_drvdata;
> @@ -369,7 +368,13 @@ static int otx2_cptvf_probe(struct pci_dev
> *pdev,
> =C2=A0=09pci_set_drvdata(pdev, cptvf);
> =C2=A0=09cptvf->pdev =3D pdev;
> =C2=A0
> -=09cptvf->reg_base =3D
> pcim_iomap_table(pdev)[PCI_PF_REG_BAR_NUM];
> +=09/* Map VF's configuration registers */
> +=09cptvf->reg_base =3D pcim_iomap(pdev, PCI_PF_REG_BAR_NUM, 0);
> +=09if (!cptvf->reg_base) {
> +=09=09dev_err(dev, "Couldn't ioremap PCI resource 0x%x\n",
> ret);
> +=09=09ret =3D -ENOMEM;

Same here.

P.

> +=09=09goto clear_drvdata;
> +=09}
> =C2=A0
> =C2=A0=09otx2_cpt_set_hw_caps(pdev, &cptvf->cap_flag);
> =C2=A0


