Return-Path: <ntb+bounces-80-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B838571744
	for <lists+linux-ntb@lfdr.de>; Tue, 12 Jul 2022 12:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F1C1C208EE
	for <lists+linux-ntb@lfdr.de>; Tue, 12 Jul 2022 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0303333E9;
	Tue, 12 Jul 2022 10:26:02 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F87A
	for <ntb@lists.linux.dev>; Tue, 12 Jul 2022 10:26:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id t1so9639617lft.8
        for <ntb@lists.linux.dev>; Tue, 12 Jul 2022 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yWy18Lynv1Yzq+NCbZJ0I3w7Y+py7fFlGQHV4YYmBEA=;
        b=YhUrQS7CDO/km6iLR9MKy/Th+0vO3y95kmZmpo9YfWSZCWrtTYqhGUt22TJf0sgNF/
         C+JiOOuBHD21fxx+xrndL2Oi6YlOy+vTCzh4BZ+hEF9CnS0AvbM9RiybI1P5Z6mNJpyC
         mOunPrv+UkIIZ14k9OKlCL0cx21CVlegXaM8bv0AfXrgDNd78ssPwLfSGpbeBp57Pjtc
         mQWG4UQm+xHtL+37DvflFUdlfnDkueQ3S1dHSlfvJ10j/T7f3hANdx6LdvY4iYj2OZLX
         IQ+JQQXwG13HZnxxo5KJ6Fqatq6Qw/fwBQnZMiDG4b47Qa5QpIxFbnK21hnZbv1RgkaP
         /lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yWy18Lynv1Yzq+NCbZJ0I3w7Y+py7fFlGQHV4YYmBEA=;
        b=FG+f+L3IwU1wvmyJvJfvRIIYsRUAcIcf43eBH7ZUOIG3rXfrZXdjsZkiy3aqUlkdIC
         lZbdE4WxRXWUhZx/2N3t/cuAmf28+d1MOEVy4wsKcEfxG5Q9ieblZZTRMHlhcHqi06rU
         At93lv6g2GHB3iUQdboVj/p35THLqNn7Ymurf09toc2Zl390eWJ6Tax6NnVXejAIF+s8
         wqu54fnE8Z6iDewv85vUPGvW2E7/UjydKXvPY6LZKlu5HjisEBWxE1rU2QG/7GV7zocR
         aattnOPpJLpUGauVNmC2/tYTC6awhXorqExLIszniek0vk4uC0Q8j5UWiVsa19uB9PD8
         i/nA==
X-Gm-Message-State: AJIora8S6bZ0d4Lj+NiCV+Ui7v8SFumvoxdRMI+WeGHEPi2lPLbs5rJt
	6WMFBYmAzd0sM1BXgqdqwTR4QA==
X-Google-Smtp-Source: AGRyM1vwP52r+DOrP+7+sPj3gLT+i3nLFiVYE70VJk0djpZK0MJCR7EkLpOI5uCX9GWZwUWm0oTzKg==
X-Received: by 2002:a05:6512:2030:b0:489:c8bf:3f29 with SMTP id s16-20020a056512203000b00489c8bf3f29mr12284746lfs.274.1657621558363;
        Tue, 12 Jul 2022 03:25:58 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id x3-20020a056512078300b00485e55192a3sm2097839lfr.72.2022.07.12.03.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 03:25:57 -0700 (PDT)
Message-ID: <d28ea0ac-ff1b-5394-4c76-1561353ab7ce@linaro.org>
Date: Tue, 12 Jul 2022 12:25:54 +0200
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: irqchip: imx mu work as msi controller
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, tglx@linutronix.de, maz@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kw@linux.com, bhelgaas@google.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 peng.fan@nxp.com, aisheng.dong@nxp.com, jdmason@kudzu.us
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev
References: <20220707210238.917477-1-Frank.Li@nxp.com>
 <20220707210238.917477-2-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707210238.917477-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/07/2022 23:02, Frank Li wrote:
> imx mu support generate irq by write a register.
> provide msi controller support so other driver
> can use it by standard msi interface.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../interrupt-controller/fsl,mu-msi.yaml      | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,mu-msi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,mu-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,mu-msi.yaml
> new file mode 100644
> index 0000000000000..b4ac583f60227
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,mu-msi.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,mu-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Messaging Unit (MU)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |
> +  The Messaging Unit module enables two processors within the SoC to
> +  communicate and coordinate by passing messages (e.g. data, status
> +  and control) through the MU interface. The MU also provides the ability
> +  for one processor to signal the other processor using interrupts.
> +
> +  Because the MU manages the messaging between processors, the MU uses
> +  different clocks (from each side of the different peripheral buses).
> +  Therefore, the MU must synchronize the accesses from one side to the
> +  other. The MU accomplishes synchronization using two sets of matching
> +  registers (Processor A-facing, Processor B-facing).
> +
> +  MU can work as msi interrupt controller to do doorbell
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx6sx-mu-msi
> +      - const: fsl,imx7ulp-mu-msi
> +      - const: fsl,imx8ulp-mu-msi
> +      - const: fsl,imx8-mu-msi
> +      - const: fsl,imx8ulp-mu-msi-s4

Use enum

> +      - items:
> +          - const: fsl,imx8ulp-mu-msi

Single item... why?

> +      - items:
> +          - enum:
> +              - fsl,imx7s-mu-msi
> +              - fsl,imx8mq-mu-msi
> +              - fsl,imx8mm-mu-msi
> +              - fsl,imx8mn-mu-msi
> +              - fsl,imx8mp-mu-msi
> +              - fsl,imx8qm-mu-msi

Why qm is here not compatible with qxp? It's already mentioned in
section below.

> +              - fsl,imx8qxp-mu-msi
> +          - const: fsl,imx6sx-mu-msi
> +      - description: MU work as msi controller
> +        items:
> +          - enum:
> +              - fsl,imx8qm-mu-msi
> +              - fsl,imx8qxp-mu-msi
> +          - const: fsl,imx6sx-mu-msi
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2

Instead describe the items.

> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - msi-controller

How this end up here?

Aren't you missing allOf with a reference to msi-controller?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    lsio_mu12: msi@5d270000 {
> +               compatible = "fsl,imx6sx-mu-msi-db";

???

> +               msi-controller;
> +               interrupt-controller;

??? How this appeared here

Also fix your indentation like in example-schema.

> +               reg = <0x5d270000 0x10000>,     /* A side */
> +                     <0x5d300000 0x10000>;     /* B side */
> +               reg-names = "a", "b";
> +               interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
> +               power-domains = <&pd IMX_SC_R_MU_12A>,
> +                               <&pd IMX_SC_R_MU_12B>;

Please do not send untested bindings. It's a waste of our time.

Really two items here? You just said only one is allowed.

> +               power-domain-names = "a", "b";

Sorry, this patch looks really poor. a/b is not a descriptive name and
they are not allowed by your own bindings. Please perform some internal
reviews...

> +    };


Best regards,
Krzysztof

