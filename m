Return-Path: <ntb+bounces-809-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998699A368
	for <lists+linux-ntb@lfdr.de>; Fri, 11 Oct 2024 14:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE0F51F25808
	for <lists+linux-ntb@lfdr.de>; Fri, 11 Oct 2024 12:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BFB21949D;
	Fri, 11 Oct 2024 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LyAC5Pmw"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38133218D7F
	for <ntb@lists.linux.dev>; Fri, 11 Oct 2024 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648478; cv=none; b=CvI8f7MZdZuhESoaJ6Xxx42gBvfWTeyUiudSmvtrzufU6LectNASVM12nA1X/iqIeft7SSGpsAkD8vXUlfyT5ChNPSkk0GSDToDZAKosfSwgBtfyhgao3UFJtywfuzFdzHeucvA6ZdOiaAD4kteOXnZQa/lEFYPqcQnTQ0Bjwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648478; c=relaxed/simple;
	bh=MwKBr4MW13REKEdZEAqTL7D+rRGFsGjM7n9xGoHUCEw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COfQU2f162oJ9412gRrycezwDEpypTOi1ZQJQwkt47R2HXPJTvawOWkCElqv0+EIO5aRxcJR1+dSkWmhDAlCnaBdzXZc066IrOoAXb4emEY12kbOAQk9rtbhMVZu1GaluO0+6h8hX62TxIHQWi3CnJ+drUOX/gkkalLrERLdfYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LyAC5Pmw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728648475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwKBr4MW13REKEdZEAqTL7D+rRGFsGjM7n9xGoHUCEw=;
	b=LyAC5Pmw3syzJenHzvdqCObXZtgZ/Fp6azkWcy0NIy5N36U+PNgK8BDipIwSfeBrRBgzlT
	4UTbnZJrWHTtPsvqO9hubsFwWp9uTcwOw2GBes5dhB4oeJRqYRF49UShG2ufKBHU/fzp4t
	DmouwrSVJiL36FnVsxmAD2fLhuCjefQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-ezeICUztMuGtQVWV2UKUOQ-1; Fri, 11 Oct 2024 08:07:53 -0400
X-MC-Unique: ezeICUztMuGtQVWV2UKUOQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb0b0514bso12204325e9.1
        for <ntb@lists.linux.dev>; Fri, 11 Oct 2024 05:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648472; x=1729253272;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwKBr4MW13REKEdZEAqTL7D+rRGFsGjM7n9xGoHUCEw=;
        b=MLE3tKoBwbiE5yU0E7G0nCdtLTpjaJx2Do3KEi5w/sYFU/4RovtR7Y40X+LhtswlPd
         eyaIF2DdlY2Bc32t+ppP7hCzaBW0963qdpTpQi7gKomXiZ+mbbJVHPabgH7Ynq+e4wuM
         gu/PRNFq4Hitsx8cHIxHWz4cmBeEAAIGMc2eO2waSwpfaSlnQFrpfwDUBBTAF9w42i5d
         JoKvSY8IPJPkid928szLtN3FKmutQ7EEVdIUCoipHXaw1ANQhJl/F8loZehb42ir74QG
         U5MoQSa5PDQKnxBt+2x/pmO8w49R3BOO0D7l/m8Q+T3izZ+G4fc83X8BTXDFn7FkHiIm
         QEtg==
X-Forwarded-Encrypted: i=1; AJvYcCU9oQXHMbQQJBtBHaZH8gc8z9wAe2j8IwSTm2OnwNDIBawrr6kiqjfCp4/XEv0A12Yl9T4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT2u8ZidoKbqgSH73EMoLJaDYc4Nusp0uzS/vyfqU91ZCAcerq
	dB/0vAxn2LIC/TWsSS9f5htrmN/XaMIh7DYtCLpjcN3RqcGyhOMkiDqbftYuvo5smwgVQZvNCMq
	i98QgR2hredo32IQiW/ejRwL545nqwGAwutOcL4T5i+m2C56Sjw==
X-Received: by 2002:a05:600c:1d26:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-4311deaea05mr17632325e9.2.1728648472042;
        Fri, 11 Oct 2024 05:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfafWJbYY7XgafIoUBODjA0mqAG0Im27BYfV9oETn5/NEqgGUi/qx3b+BLDWe06kqudkM50g==
X-Received: by 2002:a05:600c:1d26:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-4311deaea05mr17631395e9.2.1728648471511;
        Fri, 11 Oct 2024 05:07:51 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d05:4700:3e59:7d70:cabd:144b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d7929sm40692135e9.4.2024.10.11.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:07:50 -0700 (PDT)
Message-ID: <a688a4109e292d7510ebd7206bd3296e23ca1e3b.camel@redhat.com>
Subject: Re: [RFC PATCH 13/13] Remove devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>,  Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
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
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-input@vger.kernel.org,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-staging@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Fri, 11 Oct 2024 14:07:48 +0200
In-Reply-To: <20241010114314.296db535.alex.williamson@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-14-pstanner@redhat.com>
	 <7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
	 <f42bb5de4c9aca307a3431dd15ace4c9cade1cb9.camel@redhat.com>
	 <20241010114314.296db535.alex.williamson@redhat.com>
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

On Thu, 2024-10-10 at 11:43 -0600, Alex Williamson wrote:
> On Thu, 10 Oct 2024 11:11:36 +0200
> Philipp Stanner <pstanner@redhat.com> wrote:
>=20
> > On Thu, 2024-10-10 at 11:50 +0300, Dan Carpenter wrote:
> > > On Wed, Oct 09, 2024 at 10:35:19AM +0200, Philipp Stanner wrote:=C2=
=A0
> > > > pci_intx() is a hybrid function which can sometimes be managed
> > > > through
> > > > devres. This hybrid nature is undesirable.
> > > >=20
> > > > Since all users of pci_intx() have by now been ported either to
> > > > always-managed pcim_intx() or never-managed
> > > > pci_intx_unmanaged(),
> > > > the
> > > > devres functionality can be removed from pci_intx().
> > > >=20
> > > > Consequently, pci_intx_unmanaged() is now redundant, because
> > > > pci_intx()
> > > > itself is now unmanaged.
> > > >=20
> > > > Remove the devres functionality from pci_intx(). Remove
> > > > pci_intx_unmanaged().
> > > > Have all users of pci_intx_unmanaged() call pci_intx().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>=C2=A0=20
> > >=20
> > > I don't like when we change a function like this but it still
> > > compiles fine.
> > > If someone is working on a driver and hasn't pushed it yet, then
> > > it's
> > > probably
> > > supposed to be using the new pcim_intx() but they won't discover
> > > that
> > > until they
> > > detect the leaks at runtime.=C2=A0=20
> >=20
> > There wouldn't be any *leaks*, it's just that the INTx state would
> > not
> > automatically be restored. BTW the official documentation in its
> > current state does not hint at pci_intx() doing anything
> > automatically,
> > but rather actively marks it as deprecated.
> >=20
> > But you are right that a hypothetical new driver and OOT drivers
> > could
> > experience bugs through this change.
> >=20
> > >=20
> > > Why not leave the pci_intx_unmanaged() name.=C2=A0 It's ugly and that
> > > will
> > > discorage
> > > people from introducing new uses.=C2=A0=20
> >=20
> > I'd be OK with that. Then we'd have to remove pci_intx() as it has
> > new
> > users anymore.
> >=20
> > Either way should be fine and keep the behavior for existing
> > drivers
> > identical.
> >=20
> > I think Bjorn should express a preference
>=20
> FWIW, I think pcim_intx() and pci_intx() align better to our naming
> convention for devres interfaces.

Yup, also my personal preference. But we can mark those functions as
deprecated via docstring-comment. That should fullfill Damien's goal.

> =C2=A0 Would it be sufficient if pci_intx()
> triggered a WARN_ON if called for a pci_is_managed() device?

No, I don't think that's a good idea; reason being that
pci_is_managed() just checks that global boolean which we inherited
from the old implementation and which should not be necessary with
proper devres.
The boolean is used for making functions such as pci_intx() and
__pci_request_region() hybrid. So with our non-hybrid version we never
need it.

P.

> =C2=A0 Thanks,
>=20
> Alex
>=20


