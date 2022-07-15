Return-Path: <ntb+bounces-91-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71DA5768C0
	for <lists+linux-ntb@lfdr.de>; Fri, 15 Jul 2022 23:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08CBA1C20A30
	for <lists+linux-ntb@lfdr.de>; Fri, 15 Jul 2022 21:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D785382;
	Fri, 15 Jul 2022 21:14:48 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505CD5381
	for <ntb@lists.linux.dev>; Fri, 15 Jul 2022 21:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDF2C3411E;
	Fri, 15 Jul 2022 21:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657919687;
	bh=YSgkRb4vMkYLetcxBlCkbkjcEzWxtfkj06mzwX8x114=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tae7N5oks312ap0xF4Tlj6qaOGkTzzIig/LF/ZLRny3wUzxs0gSS1PNnmBgcnWsQN
	 IRewBP0qMvM/LXOy2sP+D3kpuXs6oo2zW86t34aoV5ffTDc1RvmgmOy4zxO/FsExB6
	 nEWJTTdTcU3j1JO6j+FK/GfpnUAf4A1dRbpVKZcCkXP94aA+OTJKZe6yUs7vQu0pLq
	 zxDTTDjsWTeyCHvKh9exs0IdQFJ031Nli8kNzJsbbnCeflMXhCkRUDVkWp+qAgWGwp
	 P77fPSerrnviqO6mw0c3eIDq558d+lMGvFw2trhPCOMyutJGUYLk4lf6VHEuWhx66d
	 VnkJr/X3BgjoQ==
Date: Fri, 15 Jul 2022 16:14:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: maz@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kw@linux.com, bhelgaas@google.com,
	kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	peng.fan@nxp.com, aisheng.dong@nxp.com, jdmason@kudzu.us,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev
Subject: Re: [PATCH v2 0/4] PCI EP driver support MSI doorbell from host
Message-ID: <20220715211445.GA1191496@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220715192219.1489403-1-Frank.Li@nxp.com>

On Fri, Jul 15, 2022 at 02:22:15PM -0500, Frank Li wrote:
> 
>                   ┌───────┐          ┌──────────┐
>                   │       │          │          │
> ┌─────────────┐   │       │          │ PCI Host │
> │ MSI         │◄┐ │       │          │          │
> │ Controller  │ │ │       │          │          │
> └─────────────┘ └─┼───────┼──────────┼─Bar0     │
>                   │ PCI   │          │ Bar1     │
>                   │ Func  │          │ Bar2     │
>                   │       │          │ Bar3     │
>                   │       │          │ Bar4     │
>                   │       ├─────────►│          │
>                   └───────┘          └──────────┘

Nice diagram and explanation.  I suggest rewrapping to fit in 75
columns and including in one of the patches, probably the
pci-epf-vntb.c one.  Then it will be more likely to make it to the git
history where it will be useful.

> Many PCI controllers provided Endpoint functions.
> Generally PCI endpoint is hardware, which is not running a rich OS, like linux.
> 
> But Linux also supports endpoint functions.  PCI Host write bar<n> space like
> write to memory. The EP side can't know memory changed by the Host driver. 
>
> PCI Spec has not defined a standard method to do that.  Only define MSI(x) to let
> EP notified RC status change. 
> 
> The basic idea is to trigger an irq when PCI RC writes to a memory address.  That's
> what MSI controller provided.  EP drivers just need to request a platform MSI interrupt, 
> struct msi_msg *msg will pass down a memory address and data.  EP driver will
> map such memory address to one of PCI bar<n>.  Host just writes such an address to
> trigger EP side irq.
> 
> If system have gic-its, only need update PCI EP side driver. But i.MX have not chip
> support gic-ites yet. So we have to use MU to simulate a MSI controller. Although
> only 4 MSI irqs are simulated, it matched vntd network requirmenent.
> 
> After enable MSI, ping delay reduce < 1ms from ~8ms
> 
> irqchip: imx mu worked as msi controller: 
>      let imx mu worked as MSI controllers. Although IP is not design as MSI controller,
> we still can use it if limiated irq number to 4.
> 
> pcie: endpoint: pci-epf-vntb: add endpoint msi support
> 	 Based on ntb-next branch. https://github.com/jonmason/ntb/commits/ntb-next
> 	 Using MSI as door bell registers
> 
> i.MX EP function driver is upstreaming by Richard Zhu.
> Some dts change missed at this patches. below is reference dts change

s/bar/BAR/ (several)
s/irq/IRQ/ (several)
s/irqs/IRQs/
s/msi/MSI/
s/gic-ites/?  (capitalize if it's an acronym)
s/requirmenent/requirement/
s/limiated/limited/

You use both "gic-its" and "gic-ites".  I assume they should be the
same.

Not sure what "vntd" refers to.  Capitalize if it's an acronym.

> --- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> @@ -160,5 +160,6 @@ pcieb_ep: pcie_ep@5f010000 {
>                 num-ib-windows = <6>;
>                 num-ob-windows = <6>;
>                 status = "disabled";
> +               msi-parent = <&lsio_mu12>;
>         };
> 
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
> @@ -172,6 +172,19 @@ lsio_mu6: mailbox@5d210000 {
>                 status = "disabled";
>         };
> 
> +       lsio_mu12: mailbox@5d270000 {
> +               compatible = "fsl,imx6sx-mu-msi";
> +               msi-controller;
> +               interrupt-controller;
> +               reg = <0x5d270000 0x10000>,     /* A side */
> +                     <0x5d300000 0x10000>;     /* B side */
> +               reg-names = "a", "b";
> +               interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
> +               power-domains = <&pd IMX_SC_R_MU_12A>,
> +                               <&pd IMX_SC_R_MU_12B>;
> +               power-domain-names = "a", "b";
> +       };
> +
> 
> Change Log
> - from V1 to V2
>   Fixed fsl,mu-msi.yaml's problem
>   Fixed irq-imx-mu-msi.c problem according Marc Zyngier's feeback 
>   Added a new patch to allow pass down .pm by IRQCHIP_PLATFORM_DRIVER_END
> 
> -- 
> 2.35.1
> 

