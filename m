Return-Path: <ntb+bounces-125-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06B58EE1C
	for <lists+linux-ntb@lfdr.de>; Wed, 10 Aug 2022 16:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5147280A7D
	for <lists+linux-ntb@lfdr.de>; Wed, 10 Aug 2022 14:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED6B290C;
	Wed, 10 Aug 2022 14:20:12 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDDE28F1
	for <ntb@lists.linux.dev>; Wed, 10 Aug 2022 14:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D543CC433C1;
	Wed, 10 Aug 2022 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660141210;
	bh=m3CoMnz7sNRQpMg68VArz8QaTvZrurPeO80ZShmkn7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gue/6h/jbi/tSLlPoXxOtWxTMbxFD2rydVL8uRERCDiH5xbl21UOuqObls52eyfke
	 m/w5zhtfAKonZDfu8sY13UAWx9x15Qfe3u4ZPXtislZABiOnUqt1j6Zy19jjsHYx0A
	 AOquMCfyfRA3do5NtnFuPSl4qMZVCl5iDGkE3WMsG/G9aX+KKhTycJHOWi2P01a28d
	 l7oT1SH34e1Pv+hp+9PzJJNs9RzwqqN4hWQqRmahy8kAEYPQ/y8CD/56vrycV3o89S
	 HepNnnPjGvuajTBIC4MrpQbT0SOaQKB4DKCotWuGN9V9wIkZuW8JHlPQhuGCHo18gy
	 yWZ5iB9fMHijQ==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1oLmZ6-0029I7-K1;
	Wed, 10 Aug 2022 15:20:08 +0100
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 10 Aug 2022 15:20:08 +0100
From: Marc Zyngier <maz@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Jon Mason <jdmason@kudzu.us>
Cc: Frank Li <Frank.Li@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof
 Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-kernel@vger.kernel.org" <kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, PCI <linux-pci@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Sascha
 Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, ntb@lists.linux.dev
Subject: Re: [PATCH v3 3/4] dt-bindings: irqchip: imx mu work as msi
 controller
In-Reply-To: <CAL_JsqJ_yAW=noPVe3LuG-ojG5ENe27to5OEzQSgGx6jHon43A@mail.gmail.com>
References: <20220720213036.1738628-1-Frank.Li@nxp.com>
 <20220720213036.1738628-4-Frank.Li@nxp.com>
 <CAL_JsqJ_yAW=noPVe3LuG-ojG5ENe27to5OEzQSgGx6jHon43A@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <32f06a0035c5b0760f5152c699f17af8@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: robh+dt@kernel.org, jdmason@kudzu.us, Frank.Li@nxp.com, tglx@linutronix.de, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kw@linux.com, bhelgaas@google.com, kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, peng.fan@nxp.com, aisheng.dong@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2022-08-10 15:01, Rob Herring wrote:
> On Wed, Jul 20, 2022 at 3:31 PM Frank Li <Frank.Li@nxp.com> wrote:
>> 
>> imx mu support generate irq by write a register.
>> provide msi controller support so other driver
>> can use it by standard msi interface.
>> 
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>  .../interrupt-controller/fsl,mu-msi.yaml      | 88 
>> +++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/interrupt-controller/fsl,mu-msi.yaml
> 
> This is failing in linux-next now, but I'm wondering why it is there
> given all the comments.

*BLINK*

Jon, please drop this and the corresponding irqchip changes
from -next. There is definitely not 6.1 material if the current
code is anything to go by. That'd be commits:

621b7555c914 ("dt-bindings: irqchip: imx mu work as msi controller")
893ae515ff8d ("irqchip: imx mu worked as msi controller")

Once it is ready, I'll take it via the irqchip tree. But only when
it is ready.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

