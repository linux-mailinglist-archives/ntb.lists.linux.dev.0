Return-Path: <ntb+bounces-347-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CB60FCA9
	for <lists+linux-ntb@lfdr.de>; Thu, 27 Oct 2022 18:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9FA71C208FC
	for <lists+linux-ntb@lfdr.de>; Thu, 27 Oct 2022 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D9A46A6;
	Thu, 27 Oct 2022 16:09:42 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5D33FB
	for <ntb@lists.linux.dev>; Thu, 27 Oct 2022 16:09:39 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id v13-20020a17090a6b0d00b0021332e5388fso1895375pjj.1
        for <ntb@lists.linux.dev>; Thu, 27 Oct 2022 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cs6Se82l4PDsSj9I2mLI3f+GZ/GJF+Opr2Jjis5B+58=;
        b=gr/x3Rmw+ft/dWHSYXxVElM0ozip0qNvQoiaAb7SE3U23IY75AgH/lPJDcqT0638Ts
         KreY/MOQbHmTECj/j0eOSRu2dYoVj8QWWkrdhhF0zwCgqMm4Vb2P+VSLd/ZOEOdLpvPw
         N3cXmnt7x8itiPJ83eQQdCPR102fH5oJvdYV8Km7l48+hRK+ZiJbHT9YL9biHiH4gRGG
         pNRa2Dwd5DMHE8olSf37Q54BHys2n/JF58TJC1E34xWi6p61LXWrt4NXDGqzBv19Vj3f
         zw0eE/aO+D6k3bNTuYNBx5y+1k1QHVXR5642U/tDnaMj5t4/CuDfFZOvDrUnIfcDLroJ
         Yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cs6Se82l4PDsSj9I2mLI3f+GZ/GJF+Opr2Jjis5B+58=;
        b=73Bby6O6w9+VG5LIsVeihv1ol9qwP+4LprWsukQhXIo7nVzgBZyKcXWFPNyxLP1+Cg
         g+WiaCAS+zlYbCea94K7t1XWxSFX7C9IvZk/7U9SpcyW5X4WMEAR2rawz6bABRpBnZjA
         fkCLSHNBNvbkfldxr7ebm/RMM3BXIOLJdUXR1u7zoGb5buDtF/PfZRw2JJ3KebgnmG7d
         vTbKWTJB8CsEJYx6rjT+47bxBkrw1Zfih8eyLLbcM/cZ/ennGFJFY+Bw6AhinF9BUOzv
         DH8HyStgyFYaxuPaqYRuVJ1jZCBmB+ZGlGY/4vSaGWT0w5frZ7kh8NTcBqZ95NcNwk5r
         YhKg==
X-Gm-Message-State: ACrzQf1o/yvj6NA989LsIDmqkOhW7V3I48QcayzzhVV8uMSSmDDuN7h8
	4cGc1zCLQSloA07zws1yH89O
X-Google-Smtp-Source: AMsMyM53JceTu9c/G4onEt7iCb9cuuRM2cwy18Blh80zUk9iUEs6nhRalt+MMq6PmBPGozyinxPUNQ==
X-Received: by 2002:a17:902:f684:b0:17f:95cc:af8 with SMTP id l4-20020a170902f68400b0017f95cc0af8mr50148643plg.91.1666886979301;
        Thu, 27 Oct 2022 09:09:39 -0700 (PDT)
Received: from thinkpad ([117.202.186.162])
        by smtp.gmail.com with ESMTPSA id d1-20020a170902cec100b0018661d627d7sm1410039plg.59.2022.10.27.09.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 09:09:38 -0700 (PDT)
Date: Thu, 27 Oct 2022 21:39:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <frank.li@nxp.com>
Cc: Shunsuke Mie <mie@igel.co.jp>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	kishon@kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check
 for no epc alignment constraint
Message-ID: <20221027160932.GD76627@thinkpad>
References: <20220922092357.123732-1-mie@igel.co.jp>
 <20221025142143.GA109941@thinkpad>
 <HE1PR0401MB233126D2C7410EC5F6C3976488319@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <CANXvt5qjnbZMzFJt8kBtQz6FHc_QQYw7=fZp8kK87mZ-t75z+g@mail.gmail.com>
 <HE1PR0401MB23319EE329D62420919740C688339@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <20221027151220.GC76627@thinkpad>
 <HE1PR0401MB233111DEC8F76341029183F188339@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HE1PR0401MB233111DEC8F76341029183F188339@HE1PR0401MB2331.eurprd04.prod.outlook.com>

[Added Kishon's new email address and removed the old one]

On Thu, Oct 27, 2022 at 03:34:11PM +0000, Frank Li wrote:
> 
> 
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Thursday, October 27, 2022 10:12 AM
> > To: Frank Li <frank.li@nxp.com>
> > Cc: Shunsuke Mie <mie@igel.co.jp>; Jon Mason <jdmason@kudzu.us>; Dave
> > Jiang <dave.jiang@intel.com>; Allen Hubbe <allenbh@gmail.com>; Kishon
> > Vijay Abraham I <kishon@ti.com>; Lorenzo Pieralisi <lpieralisi@kernel.org>;
> > Krzysztof Wilczyński <kw@linux.com>; Bjorn Helgaas
> > <bhelgaas@google.com>; ntb@lists.linux.dev; linux-pci@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check for
> > no epc alignment constraint
> > 
> > Caution: EXT Email
> > 
> > On Thu, Oct 27, 2022 at 02:35:56PM +0000, Frank Li wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Shunsuke Mie <mie@igel.co.jp>
> > > > Sent: Wednesday, October 26, 2022 8:43 PM
> > > > To: Frank Li <frank.li@nxp.com>
> > > > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>; Jon
> > > > Mason <jdmason@kudzu.us>; Dave Jiang <dave.jiang@intel.com>; Allen
> > > > Hubbe <allenbh@gmail.com>; Kishon Vijay Abraham I <kishon@ti.com>;
> > > > Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof Wilczyński
> > > > <kw@linux.com>; Bjorn Helgaas <bhelgaas@google.com>;
> > > > ntb@lists.linux.dev; linux-pci@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > > > Subject: Re: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check
> > for
> > > > no epc alignment constraint
> > > >
> > > > Caution: EXT Email
> > > >
> > > > Hi Frank,
> > > >
> > > > 2022年10月26日(水) 1:07 Frank Li <frank.li@nxp.com>:
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > Sent: Tuesday, October 25, 2022 9:22 AM
> > > > > > To: Shunsuke Mie <mie@igel.co.jp>
> > > > > > Cc: Jon Mason <jdmason@kudzu.us>; Dave Jiang
> > <dave.jiang@intel.com>;
> > > > > > Allen Hubbe <allenbh@gmail.com>; Kishon Vijay Abraham I
> > > > > > <kishon@ti.com>; Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof
> > > > > > Wilczyński <kw@linux.com>; Bjorn Helgaas <bhelgaas@google.com>;
> > > > > > ntb@lists.linux.dev; linux-pci@vger.kernel.org; linux-
> > > > kernel@vger.kernel.org
> > > > > > Subject: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check
> > for
> > > > no
> > > > > > epc alignment constraint
> > > > > >
> > > > > > Caution: EXT Email
> > > > > >
> > > > > > On Thu, Sep 22, 2022 at 06:23:57PM +0900, Shunsuke Mie wrote:
> > > > > > > Some PCI endpoint controllers have no alignment constraints, and
> > the
> > > > > > > epc_features->align becomes 0. In this case, IS_ALIGNED() in
> > > > >
> > > > > [Frank Li] why not set epc_features->align 1
> > > > > no alignment constraints should mean align to byte.
> > > > It is one of the solutions too I think. But in that case,  we need to
> > > > write epc_features->align = 1 to all epc drivers, dwc, qcom, rcar,
> > > > tegra, and etc.
> > > >
> > > > I think that my change is better.
> > >
> > > I think it should be based on what original term defined.
> > > It should be fixed at where make mistake.
> > >
> > 
> > 1byte is the default alignment that drivers can assume, why do you want
> > drivers
> > to set them explicitly when they do not want any special alignment?
> 
> What's definition of not alignment by align variable?
> Using both 0 and 1 as no alignment is not good enough. 
> 
> I grep whole kernel driver directory, not one use 
> 	If (align && IS_ALIGNED(x, align))  statement.    

I can see multiple hits:

lib/ubsan.c
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
drivers/gpu/drm/i915/i915_vma.c
drivers/nvdimm/pfn_devs.c
drivers/misc/pci_endpoint_test.c

But in most of the places, the alignment is guaranteed to be set by the client
drivers because they might be read from the hardware register or fixed for an
IP. But in this case, I don't think we should _force_ the drivers to set
alignment to 1 (default) if they don't really care about it.

Thanks,
Mani

> 
> There are a common convention, align is 2^n
> 
> 
> > 
> > I think this patch is fine.
> > 
> > Thanks,
> > Mani
> > 
> > > Are there other place use align == 0 means no alignment in kernel?
> > >
> > > >
> > > > > > > epf_ntb_config_spad_bar_alloc() doesn't work well. Check for this
> > > > before
> > > > > > > IS_ALIGNED().
> > > > > > >
> > > > > > > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > > > > >
> > > > > > Reviewed-by: Manivannan Sadhasivam
> > > > > > <manivannan.sadhasivam@linaro.org>
> > > > > >
> > > > > > Thanks,
> > > > > > Mani
> > > > > >
> > > > > > > ---
> > > > > > > Changes in v2:
> > > > > > > * Fix the commit message in phrasings and words.
> > > > > > > ---
> > > > > > > ---
> > > > > > >  drivers/pci/endpoint/functions/pci-epf-ntb.c  | 2 +-
> > > > > > >  drivers/pci/endpoint/functions/pci-epf-vntb.c | 2 +-
> > > > > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > > b/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > > > index 9a00448c7e61..f74155ee8d72 100644
> > > > > > > --- a/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > > > +++ b/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > > > @@ -1021,7 +1021,7 @@ static int
> > > > epf_ntb_config_spad_bar_alloc(struct
> > > > > > epf_ntb *ntb,
> > > > > > >       peer_size = peer_epc_features->bar_fixed_size[peer_barno];
> > > > > > >
> > > > > > >       /* Check if epc_features is populated incorrectly */
> > > > > > > -     if ((!IS_ALIGNED(size, align)))
> > > > > > > +     if (align && (!IS_ALIGNED(size, align)))
> > > > > > >               return -EINVAL;
> > > > > > >
> > > > > > >       spad_count = ntb->spad_count;
> > > > > > > diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > > b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > > > index 0ea85e1d292e..5e346c0a0f05 100644
> > > > > > > --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > > > +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > > > @@ -418,7 +418,7 @@ static int
> > epf_ntb_config_spad_bar_alloc(struct
> > > > > > epf_ntb *ntb)
> > > > > > >       size = epc_features->bar_fixed_size[barno];
> > > > > > >       align = epc_features->align;
> > > > > > >
> > > > > > > -     if ((!IS_ALIGNED(size, align)))
> > > > > > > +     if (align && !IS_ALIGNED(size, align))
> > > > > > >               return -EINVAL;
> > > > > > >
> > > > > > >       spad_count = ntb->spad_count;
> > > > > > > --
> > > > > > > 2.17.1
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > மணிவண்ணன் சதாசிவம்
> > > >
> > > > Best,
> > > > Shunsuke
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

