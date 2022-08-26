Return-Path: <ntb+bounces-190-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF65A3139
	for <lists+linux-ntb@lfdr.de>; Fri, 26 Aug 2022 23:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16814280C9C
	for <lists+linux-ntb@lfdr.de>; Fri, 26 Aug 2022 21:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C24C9C;
	Fri, 26 Aug 2022 21:44:56 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7974C94
	for <ntb@lists.linux.dev>; Fri, 26 Aug 2022 21:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3760CC433C1;
	Fri, 26 Aug 2022 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661550295;
	bh=QbcjoAXjiFWU9vxCFk6C5gnBz0Q3lczFup9Tn77hNSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n5hExFACqMdBH7Mswx/Mth6yD0o7SJLutKkZHYQ6mNaw4mDHeuSd2nH5Iv1arO5P5
	 zl/MA8SAuA5KUqWAPUhCRMbMHhgBJrlab2dLOSUdHj6GgU22fG6ig7lK7kUjAaHclF
	 YHCENsm1n24TZXAs+s7vkpR/YoBzcROCR/RQ4W4nVFCs+EzCLO8SbzBJQ3LvlK9JhT
	 JXZrsVqsBhj5lp68sbl5jq9RM1Yk/2esehnpFmmQx8q94OHRb/R2GJDaMDCa7F+c6F
	 k+AxRaDOIJTyNrGBu76ru3WXOeGy6PpVbw0cbbDb7aPFfArreG6GkL7A4/rGE3kLPz
	 GMsyCza7l0pXw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1oRh8G-0063gX-TC;
	Fri, 26 Aug 2022 22:44:53 +0100
Date: Fri, 26 Aug 2022 22:44:52 +0100
Message-ID: <87zgfqvfvv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Frank Li <frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
	"kw@linux.com" <kw@linux.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Aisheng Dong
	<aisheng.dong@nxp.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com"
	<festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	"kishon@ti.com"
	<kishon@ti.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>,
	"lznuaa@gmail.com"
	<lznuaa@gmail.com>
Subject: Re: [EXT] Re: [PATCH v7 3/4] dt-bindings: irqchip: imx mu work as msi controller
In-Reply-To: <PAXPR04MB918607281F6389092924EE6488759@PAXPR04MB9186.eurprd04.prod.outlook.com>
References: <20220822155130.2491006-1-Frank.Li@nxp.com>
	<20220822155130.2491006-4-Frank.Li@nxp.com>
	<20220825212130.GA1705214-robh@kernel.org>
	<PAXPR04MB9186201A03037BA7DC74D52B88729@PAXPR04MB9186.eurprd04.prod.outlook.com>
	<871qt2x38f.wl-maz@kernel.org>
	<PAXPR04MB918607281F6389092924EE6488759@PAXPR04MB9186.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: frank.li@nxp.com, robh@kernel.org, tglx@linutronix.de, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kw@linux.com, bhelgaas@google.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, peng.fan@nxp.com, aisheng.dong@nxp.com, jdmason@kudzu.us, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev, lznuaa@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 26 Aug 2022 19:59:44 +0100,
Frank Li <frank.li@nxp.com> wrote:
> 
> > And I stand by my initial request. "a" doesn't convey any sort of
> > useful information. Why not "I" and "II", while we're at it? Or
> > something even funkier?
> 
> MU spec use term "a" and "b",  user have to map "I" an "II" to 
> "a" and "b" when read MU spec and code. it is not straightforward.
> 
> I quote a part of spec. 
> " The MU is connected as a peripheral under the Peripheral bus on both sides-on
> the Processor A-side, the Processor A Peripheral Bus, and on the Processor B side,
> the Processor B Peripheral Bus."
> 
> Rob Herring and Marc Zynginer:
> I can change to any name, which you agree both. 
> 
> Some options:
> 1. "a", "b"
> 2. "a-side", "b-side"
> 3. "a-facing", "b-facing"
> 4. "I", "II"

Use the wording indicated in the spec: "processor-a-side", and
"processor-b-side". This is what I asked the first place.

	M.

-- 
Without deviation from the norm, progress is not possible.

