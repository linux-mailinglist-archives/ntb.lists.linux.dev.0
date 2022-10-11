Return-Path: <ntb+bounces-326-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9345FB1D3
	for <lists+linux-ntb@lfdr.de>; Tue, 11 Oct 2022 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2892280339
	for <lists+linux-ntb@lfdr.de>; Tue, 11 Oct 2022 11:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5852F4B;
	Tue, 11 Oct 2022 11:49:51 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954062CA2;
	Tue, 11 Oct 2022 11:49:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BBc2VP124208;
	Tue, 11 Oct 2022 06:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665488282;
	bh=O939ppKFQ711a6u7DlUF6zI/V1H471HhXJNuzjrPsBE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=VT5qj/RrYpTaWsC2RVeYOXJhcwoQdKQdkxv8ArgwSubUT0Md2MQaAfXbJGyM1If6l
	 XAFFD3EfeQ+EakzH3gAvka8vn54sYxl4Wb23TklUAroWrooBbp7ILayz/AP7PgDvIk
	 4f2B+Q3R04RBzxzMMhEYPAHl0KTe4JSNNiFN5tZw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BBc2do088460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 06:38:02 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 06:38:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 06:38:01 -0500
Received: from [172.24.147.145] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BBbw44092905;
	Tue, 11 Oct 2022 06:37:58 -0500
Subject: Re: [RFC] PCI EP/RC network transfer by using eDMA
To: Frank Li <Frank.Li@nxp.com>, <fancer.lancer@gmail.com>,
        <helgaas@kernel.org>, <sergey.semin@baikalelectronics.ru>,
        <kw@linux.com>, <linux-pci@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <ntb@lists.linux.dev>,
        <jdmason@kudzu.us>, <haotian.wang@sifive.com>, <lznuaa@gmail.com>,
        <imx@lists.linux.dev>
References: <20220928213856.54211-1-Frank.Li@nxp.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <d098a631-9930-26d3-48f3-8f95386c8e50@ti.com>
Date: Tue, 11 Oct 2022 17:07:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220928213856.54211-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Frank,

On 29/09/22 3:08 am, Frank Li wrote:
> 
> ALL:
> 
>         Recently some important PCI EP function patch already merged.
> Especially DWC EDMA support.
>         PCIe EDMA have nice feature, which can read/write all PCI host
> memory regardless EP side PCI memory map windows size.
>         Pci-epf-vntb.c also merged into mainline.
>         And part of vntb msi patch already merged.
> 		https://lore.kernel.org/imx/86mtaj7hdw.wl-maz@kernel.org/T/#m35546867af07735c1070f596d653a2666f453c52
> 
>         Although msi can improve transfer latency,  the transfer speed
> still quite slow because DMA have not supported yet.
> 
>         I plan continue to improve transfer speed. But I find some
> fundamental limitation at original framework, which can’t use EDMA 100% benefits.

By framework, you mean limitations with pci-epf-vntb right?
>         After research some old thread:
> 		https://lore.kernel.org/linux-pci/20200702082143.25259-1-kishon@ti.com/
> 		https://lore.kernel.org/linux-pci/9f8e596f-b601-7f97-a98a-111763f966d1@ti.com/T/
> 		Some RDMA document and https://github.com/ntrdma/ntrdma-ext
> 
>         I think the solution, which based on haotian wang will be best one.

why?
> 
>    ┌─────────────────────────────────┐   ┌──────────────┐
>    │                                 │   │              │
>    │                                 │   │              │
>    │   VirtQueue             RX      │   │  VirtQueue   │
>    │     TX                 ┌──┐     │   │    TX        │
>    │  ┌─────────┐           │  │     │   │ ┌─────────┐  │
>    │  │ SRC LEN ├─────┐  ┌──┤  │◄────┼───┼─┤ SRC LEN │  │
>    │  ├─────────┤     │  │  │  │     │   │ ├─────────┤  │
>    │  │         │     │  │  │  │     │   │ │         │  │
>    │  ├─────────┤     │  │  │  │     │   │ ├─────────┤  │
>    │  │         │     │  │  │  │     │   │ │         │  │
>    │  └─────────┘     │  │  └──┘     │   │ └─────────┘  │
>    │                  │  │           │   │              │
>    │     RX       ┌───┼──┘   TX      │   │    RX        │
>    │  ┌─────────┐ │   │     ┌──┐     │   │ ┌─────────┐  │
>    │  │         │◄┘   └────►│  ├─────┼───┼─┤         │  │
>    │  ├─────────┤           │  │     │   │ ├─────────┤  │
>    │  │         │           │  │     │   │ │         │  │
>    │  ├─────────┤           │  │     │   │ ├─────────┤  │
>    │  │         │           │  │     │   │ │         │  │
>    │  └─────────┘           │  │     │   │ └─────────┘  │
>    │   virtio_net           └──┘     │   │ virtio_net   │
>    │  Virtual PCI BUS   EDMA Queue   │   │              │
>    ├─────────────────────────────────┤   │              │
>    │  PCI EP Controller with eDMA    │   │  PCI Host    │
>    └─────────────────────────────────┘   └──────────────┘
> 
> 
>         Basic idea is
> 	1.	Both EP and host probe virtio_net driver
> 	2.	There are two queues,  one is EP side(EQ),  the other is Host side.
> 	3.	EP side epf driver map Host side’s queue into EP’s space. , Called HQ.
> 	4.	One working thread
> 	a.	pick one TX from EQ and RX from HQ, combine and generate EDMA request, and put into DMA TX queue.
> 	b.	Pick one RX from EQ and TX from HQ, combine and generate EDMA request, and put into DMA RX queue.
> 	5.	EDMA done irq will mark related item in EP and HQ finished.
> 
> The whole transfer is zero copied and use DMA queue.
> 
>        RDMA have similar idea and more coding efforts.

My suggestion would be to pick a cleaner solution with the right 
abstractions and not based on coding efforts.

>        I think Kishon Vijay Abraham I prefer use vhost,  but I don’t know how to build a queue at host side.

Not sure what you mean by host side here. But the queue would be only on 
virtio frontend (virtio-net running on PCIe RC) and PCIe EP would access 
the front-end's queue.
>        NTB transfer just do one directory EDMA transfer (DMA write) because Read actually local memory
>   to local memory.
> 
>        Any comments about overall solution?

I would suggest you to go through the comments received on Haotian Wang 
patch and suggest what changes you are proposing.

Thanks,
Kishon

