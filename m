Return-Path: <ntb+bounces-788-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43679967A7
	for <lists+linux-ntb@lfdr.de>; Wed,  9 Oct 2024 12:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E311C2471E
	for <lists+linux-ntb@lfdr.de>; Wed,  9 Oct 2024 10:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B521191461;
	Wed,  9 Oct 2024 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aD17HEW2"
X-Original-To: ntb@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB018FC80
	for <ntb@lists.linux.dev>; Wed,  9 Oct 2024 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471025; cv=none; b=u05ZgdzIqvmiac0GLSaNCloa8NAWbpm/XtpkEnZWi0EJ7piz1acD98gpqEk24qrqzGYffDHYW1ZzyYsEhrwlx04bYfJ2E9U63Mt4Wnm/qFd/WmhEJ1rZzV5gete5y6Yq2DZ7wuAdtzOKp8BdwAvMAF5lAaDCoKx1h+NDjO43X1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471025; c=relaxed/simple;
	bh=DSgm22aJFfiNtDR5PH9COXLN1T3/sjP+t9mUNwfGUwc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBbhNxQPGQOXYmKwdY4i7Y9iT2n/dpX6wW41A7R2Sd7tZxWKw9Hwm+kmGDCY2DMSpWpU8x6iipoRF7d0z5iiBD0szi98aYqyZ4h5s+wZobGXu9vyaVM8ke4QzjA+WHO1gwv7mBCGhhSxPOb4hLnwhi4MI7c7hxQOiUXGQogVJU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aD17HEW2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728471021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSgm22aJFfiNtDR5PH9COXLN1T3/sjP+t9mUNwfGUwc=;
	b=aD17HEW292abkeVr6K/27cxhGRHtEYgOoCbfpawI/fxMAFpxr22H8uXOLEEKV6m9aTOdML
	fVolMHzdYN+9aqGWalGEuVDdlTxkmQd1Dwxpe9c1h9tJzbGNdXSLvSvDquvh9Lz4buMKp2
	Hevq/JUeyiUHItaqJ2kHx1qvxFAHPhU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-x2TBmSWjMG6GNhrb3lfPDQ-1; Wed, 09 Oct 2024 06:50:19 -0400
X-MC-Unique: x2TBmSWjMG6GNhrb3lfPDQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb857fc7dso57277615e9.0
        for <ntb@lists.linux.dev>; Wed, 09 Oct 2024 03:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728471018; x=1729075818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DSgm22aJFfiNtDR5PH9COXLN1T3/sjP+t9mUNwfGUwc=;
        b=b2TWwPDdUryEfpBOef77JypvD0ig4NEQ4pYXedqJl+1zzQ2SdhYHU3dn02nZ/JNo/i
         TCTWoF6WNXUpx7HvR+TWsaFuv1ED79xI81SLuSTSZWhIf4dMzbNm/xq6CuDLmWOUzbyd
         mx8A3gRz2gS+1ew1GO9J1lZ2I6uT87e8aNxLwH7Hv2RGMYqxL+sf1SdZKR58Rz8uFwXS
         6t3obZII/JNMLZEquf/J8NF4JlD0UKtrww2GQf8+yo6v56cQAuW9tcxszfwSwOwzrQJF
         w1CIeoUzxM17MauFczrwm5oa98OVc2NGQwlN8xya9P35GsUQv2wLIsiIF4Z14qGODOIX
         nE2A==
X-Forwarded-Encrypted: i=1; AJvYcCVV9nUnznk2jg4CQRi3Lp6M/1XRjbovlNxZ8UK4iKIvkpcnf5G6zPW97/HYGSSXKoR0W1g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzREf0LOOSCkbJqNirKJFnp6zQRLDwQZco8/3voYnq9wTMWlFKQ
	fNNujsYT3GmV3wksf92ppR5MwwlIrlt15Qzibifsgg+nvCnyidcdzuGoEy7y3J/S1I673S5wwGw
	Y3TwrbZgjihRR9O367o2rsvt6ZwUr23YicuHEKh6Bo3RYU0Qnxg==
X-Received: by 2002:a05:600c:154e:b0:42c:bf94:f9ad with SMTP id 5b1f17b1804b1-430d748c5demr14383785e9.34.1728471018506;
        Wed, 09 Oct 2024 03:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHApNTrtsbft1V7n10B4IIxH4JucbHmoQkQ4Jkaz+as7iAf1Sn6WqJVUcb29pY2MStHfTeBSg==
X-Received: by 2002:a05:600c:154e:b0:42c:bf94:f9ad with SMTP id 5b1f17b1804b1-430d748c5demr14383375e9.34.1728471017985;
        Wed, 09 Oct 2024 03:50:17 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695e62bsm10108645f8f.81.2024.10.09.03.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 03:50:17 -0700 (PDT)
Message-ID: <6f54425072b008481a0511fc140bab2590cd1c06.camel@redhat.com>
Subject: Re: [RFC PATCH 03/13] drivers/xen: Use never-managed version of
 pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Juergen Gross <jgross@suse.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex
 Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>, Manish
 Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
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
Date: Wed, 09 Oct 2024 12:50:14 +0200
In-Reply-To: <3874c932-71c4-4253-9dcf-a9c302e6bc7e@suse.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-4-pstanner@redhat.com>
	 <3874c932-71c4-4253-9dcf-a9c302e6bc7e@suse.com>
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

On Wed, 2024-10-09 at 10:51 +0200, Juergen Gross wrote:
> On 09.10.24 10:35, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which can sometimes be managed
> > through
> > devres. To remove this hybrid nature from pci_intx(), it is
> > necessary to
> > port users to either an always-managed or a never-managed version.
> >=20
> > xen enables its PCI-Device with pci_enable_device(). Thus, it
> > needs the never-managed version.
> >=20
> > Replace pci_intx() with pci_intx_unmanaged().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>=20
> Acked-by: Juergen Gross <jgross@suse.com>
>=20
> BTW, the diffstat in the [PATCH 00/13] mail is missing some files,
> e.g. the changes of this patch.

Ooops, probably something exploded when I copied the backed-up cover-
letter after regenerating the patches. Will fix.

But good to see that someone actually reads cover letters :p

P.

>=20
>=20
> Juergen
>=20


