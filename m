Return-Path: <ntb+bounces-202-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5AC5AA52E
	for <lists+linux-ntb@lfdr.de>; Fri,  2 Sep 2022 03:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39EC1C20937
	for <lists+linux-ntb@lfdr.de>; Fri,  2 Sep 2022 01:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E997ED1;
	Fri,  2 Sep 2022 01:39:03 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B839EA0
	for <ntb@lists.linux.dev>; Fri,  2 Sep 2022 01:39:00 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 73so707789pga.1
        for <ntb@lists.linux.dev>; Thu, 01 Sep 2022 18:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=xtrTkJ4Uu3ohhJxNrzty1GMo4mCUZ5As2LZg/P4tK50=;
        b=YYQS3U2an0NHsaT3kRyB/CjX2F6iSDaaaXdAkWZvO6gonxfA9qhHlPPJIy66EZe3ZR
         wxIjWeCJzO7jdFWWO88kKC3qSXJ1mLTTNBSOcVvGsmLmcdYAQSBwKNehifBdxOZDugqV
         isbdfKU8zmXU8m/Rm4CMHQofJVobu0qt2c+DjTYFJ5nX6ZsHTBHOxLlM51mZyvNLpmVQ
         Q+YgCC0+Y8zFHJRTaKTF2NKyWdE/a8DEmMRHAUZ8A1vOp/Kq1MqYaKQzBTyto1CV5NQP
         3+lPV55ABJaNHPEdbwbeUfQ4cHlupDfFN0jhMHJfQ5143PjQWyb5UgPyMSfsKXs/t6TM
         bxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xtrTkJ4Uu3ohhJxNrzty1GMo4mCUZ5As2LZg/P4tK50=;
        b=E9iJVvNowUBwW5HdcLwbpLEo+fKok7YRDDgInPRLsFl0B0tUzJLPcQ+7n9BC2jzk8e
         M01IR0nEOVM78m5ZP9j6QGaqaCLiqeBZqWqwsWodxaliExdo38OkBF23Feku6dv24c0n
         vIDQw/SL/uqeWdQ5Wh3s8OjFE3VohKmotVUITlSLofyFnV6ewTVL2SDdMotNX0tZ0vaP
         g+dybIZDgp0j3MSRCd7/cAHwie1C4bC1IEnpwwld3P9KMgJBv70ROTAldAllxx2Avu6i
         crxgcfP64fAVi7IYKJw62LoRK5abf+xffAdbsVhO+vv+aYtZ6wKXcfWtVOo+Q7y8dMZS
         2BOg==
X-Gm-Message-State: ACgBeo0l7k4N+v0IQ1mRQEy4FqRy88L5fGRxP76fOc1OHpfeoJi4B0Ak
	w+w0pwfSrOJTN344cyuWWU7Z
X-Google-Smtp-Source: AA6agR7DjBAE56OPQD2pNaMD6zNmrRU9jU2sr6gi8usaSIIxK9Wdjn2+Sdz7pqPgMja4jY2efNlR5A==
X-Received: by 2002:a63:4b5e:0:b0:41d:e04b:4515 with SMTP id k30-20020a634b5e000000b0041de04b4515mr28031011pgl.100.1662082739808;
        Thu, 01 Sep 2022 18:38:59 -0700 (PDT)
Received: from thinkpad ([117.217.177.124])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090a474100b001fdbb2e38acsm4058764pjg.5.2022.09.01.18.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 18:38:58 -0700 (PDT)
Date: Fri, 2 Sep 2022 07:08:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <frank.li@nxp.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kw@linux.com" <kw@linux.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>, "kishon@ti.com" <kishon@ti.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>,
	"lznuaa@gmail.com" <lznuaa@gmail.com>
Subject: Re: [EXT] Re: [PATCH v6 4/4] pcie: endpoint: pci-epf-vntb: add
 endpoint MSI support
Message-ID: <20220902013848.GA4935@thinkpad>
References: <20220818151127.2449064-1-Frank.Li@nxp.com>
 <20220818151127.2449064-5-Frank.Li@nxp.com>
 <20220831104203.GD5076@thinkpad>
 <AM9PR04MB8793BEEC8B2F1713C252B4CA88789@AM9PR04MB8793.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM9PR04MB8793BEEC8B2F1713C252B4CA88789@AM9PR04MB8793.eurprd04.prod.outlook.com>

On Wed, Aug 31, 2022 at 04:19:17PM +0000, Frank Li wrote:
> 
> 
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Wednesday, August 31, 2022 5:42 AM
> > To: Frank Li <frank.li@nxp.com>
> > Cc: maz@kernel.org; tglx@linutronix.de; robh+dt@kernel.org;
> > krzysztof.kozlowski+dt@linaro.org; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; kw@linux.com; bhelgaas@google.com; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-pci@vger.kernel.org; Peng Fan
> > <peng.fan@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> > jdmason@kudzu.us; kernel@pengutronix.de; festevam@gmail.com; dl-linux-
> > imx <linux-imx@nxp.com>; kishon@ti.com; lorenzo.pieralisi@arm.com;
> > ntb@lists.linux.dev; lznuaa@gmail.com
> > Subject: [EXT] Re: [PATCH v6 4/4] pcie: endpoint: pci-epf-vntb: add endpoint
> > MSI support
> > 
> > Caution: EXT Email
> > 
> > On Thu, Aug 18, 2022 at 10:11:27AM -0500, Frank Li wrote:
> > >                         ┌───────┐          ┌──────────┐
> > >                         │       │          │          │
> > >       ┌─────────────┐   │       │          │ PCI Host │
> > >       │ MSI         │◄┐ │       │          │          │
> > >       │ Controller  │ │ │       │          │          │
> > >       └─────────────┘ └─┼───────┼───
> > ───────┼─BAR0     │
> > >                         │ PCI   │          │ BAR1     │
> > >                         │ Func  │          │ BAR2     │
> > >                         │       │          │ BAR3     │
> > >                         │       │          │ BAR4     │
> > >                         │       ├─────────►│          │
> > >                         └───────┘          └──────────┘
> > >
> > 
> > This diagram doesn't say which side is host and which one is endpoint.
> > And not conveying any useful information.
> 
> [Frank Li] At V2 version, this diagram is in cover letter.  Bjorn suggest move to here.
> I think you have good background knowledge.  But it should be helpful for new
> People,  who just touch this area. 
> 

Having the block diagram always helps but my point is that this diagram doesn't
convey the immediate knowledge that it is supposed to do so. Like there is no
partition between host and endpoint and you did not add any explanation about
it in the below text. So in v2, please incorporate those.

> I already mark "PCI Func" and "PCI Host".  
> 

Sorry, that's not helpful and you need to improve it.

> > 
> > > Linux supports endpoint functions. PCI Host write BAR<n> space like write
> > > to memory. The EP side can't know memory changed by the host driver.
> > >
> > 
> > I think you just say, that there is no defined way of raising IRQs by host
> > to the endpoint.
> > 
> > > PCI Spec has not defined a standard method to do that. Only define MSI(x)
> > > to let EP notified RC status change.
> > >
> > 
> > MSI is from EP, right? Throughout the driver you should call it as "doorbell"
> > and not MSI.
> 
> [Frank Li] What's I want said is that PCI standard define MSI(x) to let EP notify RC. 
> But there are not standard way for reverse direction.  MSI should be correct here.
> 

Right. But also use "MSI/MSI-X" instead of "MSI(x)"

> > 
> > > The basic idea is to trigger an IRQ when PCI RC writes to a memory
> > > address. That's what MSI controller provided. EP drivers just need to
> > > request a platform MSI interrupt, struct msi_msg *msg will pass down a
> > > memory address and data. EP driver will map such memory address to one
> > of
> > > PCI BAR<n>.  Host just writes such an address to trigger EP side irq.
> > >
> > 
> > IIUC (by looking at other patches in the series), the memory assigned for BAR
> > region by the PCI host is mapped to the platform interrupt controller in
> > PCI Endpoint. Such that, whenever the PCI host writes to the BAR region, it
> > will trigger an IRQ in the Endpoint.
> > 
> > This kind of setup is available in other platforms like Qualcomm where the
> > mapping of a register region available in BAR0 and interrupt controller is
> > done in the hardware itself. So whenever the PCI host writes to that register
> > in BAR0, an IRQ will be delivered to the endpoint.
> 
> [Frank Li] Yes,  not all platform have it. And EP driver have not provide a API
> to get register region.  I think platform msi API is pretty good API. 
> Many system have GIC ITS,  so EP function driver can use it.  Our test platform
> have not ITS yet,  so we added a simple MU-MSI driver to do it. I think qualcomm
> platform can use similar method.  So all EP function driver can use common method
> to get notification from PCI host.
> 

What is the common method here? If you want to make this doorbell feature
common across all EPF drivers, then you need to provide EPF APIs.

> > 
> > > Add MSI support for pci-epf-vntb. pci-epf-vntb driver query if system
> > > have MSI controller. Setup doorbell address according to struct msi_msg.
> > >
> > > So PCIe host can write this doorbell address to triger EP side's irq.
> > >
> > > If no MSI controller exist, fall back to software polling.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/endpoint/functions/pci-epf-vntb.c | 134 +++++++++++++++---
> > >  1 file changed, 112 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > b/drivers/pci/endpoint/functions/pci-epf-vntb.c

[...]

> > > +static void epf_ntb_epc_msi_init(struct epf_ntb *ntb)
> > > +{
> > > +     struct device *dev = &ntb->epf->dev;
> > > +     struct irq_domain *domain;
> > > +     int virq;
> > > +     int ret;
> > > +     int i;
> > > +
> > > +     domain = dev_get_msi_domain(ntb->epf->epc->dev.parent);
> > > +     if (!domain)
> > > +             return;
> > > +
> > > +     dev_set_msi_domain(dev, domain);
> > > +
> > > +     if (platform_msi_domain_alloc_irqs(&ntb->epf->dev,
> > > +             ntb->db_count,
> > > +             epf_ntb_write_msi_msg)) {
> > > +             dev_info(dev, "Can't allocate MSI, fall back to poll mode\n");
> > > +             return;
> > > +     }
> > > +
> > > +     dev_info(dev, "vntb use MSI as doorbell\n");
> > > +
> > 
> > Why are you using the interrupt controller as the MSI controller? Why not
> > just
> > a plain interrupt controller?
> 
> [Frank Li] what's your means?   I think only MSI controller support write memory to trigger irq.
> 

From EPF driver perspective, only the IRQs need to be requested, right? So why
cannot you expose MU as a generic irqchip driver, instead of a MSI controller? 

Thanks,
Mani

-- 
மணிவண்ணன் சதாசிவம்

