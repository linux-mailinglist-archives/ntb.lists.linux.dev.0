Return-Path: <ntb+bounces-1026-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CDB9BAF9C
	for <lists+linux-ntb@lfdr.de>; Mon,  4 Nov 2024 10:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B25E1F214EC
	for <lists+linux-ntb@lfdr.de>; Mon,  4 Nov 2024 09:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD68E1AB51F;
	Mon,  4 Nov 2024 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrbOpgyE"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05366FC5
	for <ntb@lists.linux.dev>; Mon,  4 Nov 2024 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712429; cv=none; b=J1MuKFtV0Pdb4tJ6zaDHkjiGCatJe1o3fmVyjYRmMUhfD25au1/uPMHH1WRc5+YLGIZwVz3Hha/qky0+zyo34lfjucXSWZKqOdDk9IEmBF03mHXbC/1iJ2fukiKTuCQZovIH5pIF36D8K+SUqa8Ug3R7oWTHx7hFUh5suLSwJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712429; c=relaxed/simple;
	bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PdsRXpWujrOxcWdG27mnRK7U5kT6NsdIMZAC96SSKdAuEv8HUqJTJu5/1Uw1H8VCU4ZMPNB1pyEI6Jz8cdIhYouSCQDKImbqCZgrGbPkfBn8lCHIt/S/b5VOEtjrfQH/GzYpkyBnxEJt9+QmUrb5Cfnw76MONDumIqBf+EuIh0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrbOpgyE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730712426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
	b=WrbOpgyEd2W7+/B5indTTYOG+ndIip9BKgzSm6NzjEnilPorMbJDdj+UTZm7dMl0uHv/FO
	hkWKfdUg9c9jihQq5Y7xXOGFIbjq9eZHk6TAc6vj/SPZBs0G1Lug4leVABfro8u6uHErtD
	mHQjb+rdhiU64lzeTHm1C1FOefFWazY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-ZurgetC3OwGLQIvr2SHFcA-1; Mon, 04 Nov 2024 04:27:06 -0500
X-MC-Unique: ZurgetC3OwGLQIvr2SHFcA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a157d028aso320328066b.2
        for <ntb@lists.linux.dev>; Mon, 04 Nov 2024 01:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712425; x=1731317225;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
        b=rALpll4AOZhqqEq5WPZsuUIrPy5K5hljeQ00UB3aMR28CQGgAFAaDwTAEqLVbBK7y+
         CuHgxrupWSmwGcx3dPd+vyJAUb+ToMlbuwGaQH3LvHZaAqh6HDzHYRblkbGejLsxjonG
         DaYSeBIHmS6lRytjLPoAVwtuapSooENpxwg6lDRMKDMaYVkFI9MD3gTNpLX4gj4WmtL7
         LbfkXBt6J4y1i0Kc21eTQBU6D+v2erCH47hCLMtUYoY766hbM1MBODiA8RN8dgsr3yh8
         1IUJpZ0IXXpkPjVjG72pzN/DPWYbW1EmfcDzMN7tcAao4RNOdrje14oUm0G34wdjIe7i
         r6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6oojAoW1J5unp+G6NE7MnFj6EMKq0q+vsC5lRo8270bnsgKAWYqclROTMaRlhxKil0ec=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDT6PCnZmxpg0j3dmsMj1I2L1rdmymupUtLqL0ybYPb5iOan9z
	inRXZ/25YkfZHpw8pSgoYVMChczzfzV41JlGgcDDDgSFPQH9oIGSrJkWJrXAOA1J+M/ie1m8nlt
	6mIr8s8WaJGtWKoHoC40tGGUHKAgrMOFy82uYquADq0yPJUyhPA==
X-Received: by 2002:a5d:5f54:0:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-381c7a3a49cmr8192676f8f.4.1730712414709;
        Mon, 04 Nov 2024 01:26:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUG4i3r4RT/0mDz+U1cY7m40dZcu2ijC6eEouX1uNQBldOHTZd5hoduIq2TUsnjYO3wLrnew==
X-Received: by 2002:a5d:5f54:0:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-381c7a3a49cmr8192628f8f.4.1730712414212;
        Mon, 04 Nov 2024 01:26:54 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f? (200116b82d7fe40007f8722cbb2ebb7f.dip.versatel-1u1.de. [2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7d20sm12817150f8f.7.2024.11.04.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:26:53 -0800 (PST)
Message-ID: <a8d9f32f60f55c58d79943c4409b8b94535ff853.camel@redhat.com>
Subject: Re: [PATCH 01/13] PCI: Prepare removing devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Christian
 Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, Eric Auger
 <eric.auger@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>, Ye
 Bin <yebin10@huawei.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Mon, 04 Nov 2024 10:26:51 +0100
In-Reply-To: <87cyjgwfmo.ffs@tglx>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-2-pstanner@redhat.com> <87cyjgwfmo.ffs@tglx>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
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

On Thu, 2024-10-31 at 14:45 +0100, Thomas Gleixner wrote:
> On Tue, Oct 15 2024 at 20:51, Philipp Stanner wrote:
> > +/**
> > + * pci_intx - enables/disables PCI INTx for device dev, unmanaged
> > version
>=20
> mismatch vs. actual function name.

ACK, will fix

>=20
> > + * @pdev: the PCI device to operate on
> > + * @enable: boolean: whether to enable or disable PCI INTx
> > + *
> > + * Enables/disables PCI INTx for device @pdev
> > + *
> > + * This function behavios identically to pci_intx(), but is never
> > managed with
> > + * devres.
> > + */
> > +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
>=20
> This is a misnomer. The function controls the INTX_DISABLE bit of a
> PCI device. Something like this:
>=20
> void __pci_intx_control()
> {
> }
>=20
> static inline void pci_intx_enable(d)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __pci_intx_control(d, true);
> }
>=20
> .....
>=20
> makes it entirely clear what this is about.

Well, I would agree if it were about writing a 'real' new function. But
this is actually about creating a _temporary_ function which is added
here and removed again in patch 12 of this same series.

It wouldn't even be needed; the only reason why it exists is to make it
easy for the driver maintainers concerned by patches 2-11 to review the
change and understand what's going on. Hence it is
"pci_intx_unmanaged()" =3D=3D "Attention, we take automatic management away
from your driver"

pci_intx() is then fully restored after patch 12 and it keeps its old
name.

Gr=C3=BC=C3=9Fe,
Philipp


>=20
> Hmm?
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20


