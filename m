Return-Path: <ntb+bounces-161-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B33597E59
	for <lists+linux-ntb@lfdr.de>; Thu, 18 Aug 2022 08:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028F0280C43
	for <lists+linux-ntb@lfdr.de>; Thu, 18 Aug 2022 06:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FB35C89;
	Thu, 18 Aug 2022 06:02:37 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EEB7B
	for <ntb@lists.linux.dev>; Thu, 18 Aug 2022 06:02:36 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 24so518138pgr.7
        for <ntb@lists.linux.dev>; Wed, 17 Aug 2022 23:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=zK72A8q5XD2E3NomsnJJ4xt124GNl/LXJjyyFVpPi3Q=;
        b=vDSQyxgLF0rPsGm3whfGWvdwuXaaggJm3hBiEY2XXtCdUbBAxBskXAwmyUgst2JRgh
         0+RpDuL0rmCPrMNVzxiAFW+s4D4T6kN/boLgbrVPavMoHdMdjN1qjyA7UBlRv4NrB0tb
         UElnczihsgdB6AyXrjodapbcspF13GOULens5dy15Q9P/Pu5fSXPeGA/MtKUJlA4qOKK
         v4Anr60vZYM+arsPw9kr8FN6TRaKylEE/YYCjthoJvysvh9bjoxiX8OisPgsih0ZhD2U
         oUy91KJDxhT6SWgkhXQgljljmB6vMtYNr/bY6i7F7nDTEdgaIuEVIPJQAo/aL2M223or
         Pf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=zK72A8q5XD2E3NomsnJJ4xt124GNl/LXJjyyFVpPi3Q=;
        b=krHn5Osdpw3QtGDe2dV15BuzOkdsNrFy71cjdCCtsS8leEg0eFRhGJZlTRSTl+qzrZ
         NdGeGcF5E1H8nQg6rZPN1EcItXpEolQrgk1NsWu+euwjzkrUwn3Nz01DEQPh9F07C7dU
         7W/NooIXhKwHaIRVQrZfHdjjgB5WYmS6xhVQep0u/RmWiI5I2IsFkw8g14psrVREgEX3
         rr0gA+0UoHfFR2gRh3xLsxGj9cYy9eC7RmSmfyjOG9TwAEj54i+MA/p+qn35cQ8Vsq4L
         nXv/6sxrSM2G/ZP+DJjUSOcwDx3A8B8AOl2sADc3TOMTUbxEPeFqC0hvkjH/fVVrhNXg
         7qDg==
X-Gm-Message-State: ACgBeo2v9HIMWMAtRhERC06C5dHw8bRYkefT8jSJyIrT8PP/YGIKCoU3
	3qsRDXh2cGcSSbDApQmI2mFe
X-Google-Smtp-Source: AA6agR5S8mPl/SarYfDESuLsWayOu8NNUQMOoFIcC5tZbb45kGSDfEw9qTui2H5mFYBnpeNL3hk41Q==
X-Received: by 2002:a05:6a00:4509:b0:52d:4943:90b4 with SMTP id cw9-20020a056a00450900b0052d494390b4mr1569547pfb.22.1660802555747;
        Wed, 17 Aug 2022 23:02:35 -0700 (PDT)
Received: from thinkpad ([117.202.186.191])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c10d00b0016d737bff00sm454658pli.220.2022.08.17.23.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:02:35 -0700 (PDT)
Date: Thu, 18 Aug 2022 11:32:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: ntb@lists.linux.dev, Bjorn Helgaas <helgaas@kernel.org>,
	Frank.Li@nxp.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kishon@ti.com
Subject: Re: [PATCH] MAINTAINERS: add PCI Endpoint NTB drivers to NTB files
Message-ID: <20220818060230.GA12008@thinkpad>
References: <20220812194205.388967-1-jdmason@kudzu.us>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220812194205.388967-1-jdmason@kudzu.us>

+ Kishon (PCI EP Maintainer)

On Fri, Aug 12, 2022 at 03:42:05PM -0400, Jon Mason wrote:
> The PCI Endpoint NTB drivers are under the NTB umbrella.  Add an entry
> there to allow for notification of changes for it.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>

Hi Jason,

I know that this patch is already in Linus's tree but I think this PCI Endpoint
VNTB driver is not going in a correct path. First, Kishon is not convinced with
the way the PCI Endpoint VNTB function driver is written currently. He prefers
the VirtIO approach over the current one [1].

But while the conversation was still going on, the series got merged via NTB
tree without any ACKs from the PCI/PCI_EP maintainers. Also, note that there
was a patch touching the PCI Controller driver as well and that was also not
ACKed [2].

If this trend is going to continue in the coming days, then I'm afraid that NTB
might end up being a backdoor for PCI/PCI_EP patches :(

Thanks,
Mani

[1] https://lore.kernel.org/all/20220222162355.32369-4-Frank.Li@nxp.com
[2] https://lore.kernel.org/all/20220222162355.32369-2-Frank.Li@nxp.com

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64379c699903..47e9f86bd712 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14254,6 +14254,7 @@ W:	https://github.com/jonmason/ntb/wiki
>  T:	git git://github.com/jonmason/ntb.git
>  F:	drivers/net/ntb_netdev.c
>  F:	drivers/ntb/
> +F:	drivers/pci/endpoint/functions/pci-epf-*ntb.c
>  F:	include/linux/ntb.h
>  F:	include/linux/ntb_transport.h
>  F:	tools/testing/selftests/ntb/
> -- 
> 2.30.2
> 

-- 
மணிவண்ணன் சதாசிவம்

