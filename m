Return-Path: <ntb+bounces-345-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AD60FB8F
	for <lists+linux-ntb@lfdr.de>; Thu, 27 Oct 2022 17:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698371C2092E
	for <lists+linux-ntb@lfdr.de>; Thu, 27 Oct 2022 15:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E054C2F31;
	Thu, 27 Oct 2022 15:12:29 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6242568
	for <ntb@lists.linux.dev>; Thu, 27 Oct 2022 15:12:27 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 3-20020a17090a0f8300b00212d5cd4e5eso6706876pjz.4
        for <ntb@lists.linux.dev>; Thu, 27 Oct 2022 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mp2QfpZmO5rJfMt8DbZa9LapRBZkl3HjpYw0dHrk4ws=;
        b=ohViZ2E6eRNBzkcum8lv+yv3Xb9PIK0nq6PHrcKNIfEc1x0MYgivtpDV47ZMF8QrG2
         WVYqtv3yx+RfaK+A3AlGqMVIkjg7GQVOkl5fQVhLNoaIRqfLj04BcdC50DzcQe16F/8y
         pHTHrAvOj9QShRVlzh/elVuIHQGRWFlcirF+gIxXYzSrNEOf1lHJ9hp53xFy5W8tkf7x
         aWiSmGDnz1dflJ7yaKybf4mOhk6+TIpuBLUP1PCwRAWAKLBGnsgDy58U6xQ5mgui4Zku
         ptWePwzoa0Tjfw8Tp3vfOBOCUPTveVEIbBguvcQVPeWHztGXeqhoJiHiAHfy+Dq4HU1a
         hfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mp2QfpZmO5rJfMt8DbZa9LapRBZkl3HjpYw0dHrk4ws=;
        b=sFPXschFMoK4PFmE1RpZ9Ii6DH9dGIYqb2K83CvXTU0XyaoM/Yp9bGk3hbrEi8q2iW
         HCSdFKR8VsXth91/YDKWJB6Q1LJ3w/U8r2r7rXdGYmYovRH+lC8axJCOLCjwvWuwlqMI
         9+j0cWYtYLZnNQCsTfj0TE0hlTUaCBJmNmpWA70JmlA1ypA7d3MR2v6B9AJaz8kVJJfy
         vjRwEGCg0lvN37ZbQCejAk+srdzFPYzfj3PTlGuGitLm09EgNnhGZpy9jsbyicok2Hp+
         Fhoew+gv0QYxvvgyK/TWUz95F5OVEs+mMJKuqZh3/PUPuKJy8FrCdALb/ZZDnFRQXxbz
         6ykg==
X-Gm-Message-State: ACrzQf2rjBRmUdJpYyErVPH5BbnsBGO6EYn9hIJiB2k0twoIhiYdsx4s
	KI3vQSwUhatpRonv4J7XFZiw
X-Google-Smtp-Source: AMsMyM7p+CRAKYs3BLseZhuWYJPr3tw47zQjRvSghbwJ0WT3ylRlT2ERiQZE/mS9iAjuNGTZh6WjUA==
X-Received: by 2002:a17:90a:e38b:b0:212:d42a:c0a9 with SMTP id b11-20020a17090ae38b00b00212d42ac0a9mr10566845pjz.179.1666883547265;
        Thu, 27 Oct 2022 08:12:27 -0700 (PDT)
Received: from thinkpad ([117.202.186.162])
        by smtp.gmail.com with ESMTPSA id d9-20020a621d09000000b005289a50e4c2sm1287181pfd.23.2022.10.27.08.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 08:12:26 -0700 (PDT)
Date: Thu, 27 Oct 2022 20:42:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <frank.li@nxp.com>
Cc: Shunsuke Mie <mie@igel.co.jp>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check
 for no epc alignment constraint
Message-ID: <20221027151220.GC76627@thinkpad>
References: <20220922092357.123732-1-mie@igel.co.jp>
 <20221025142143.GA109941@thinkpad>
 <HE1PR0401MB233126D2C7410EC5F6C3976488319@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <CANXvt5qjnbZMzFJt8kBtQz6FHc_QQYw7=fZp8kK87mZ-t75z+g@mail.gmail.com>
 <HE1PR0401MB23319EE329D62420919740C688339@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HE1PR0401MB23319EE329D62420919740C688339@HE1PR0401MB2331.eurprd04.prod.outlook.com>

On Thu, Oct 27, 2022 at 02:35:56PM +0000, Frank Li wrote:
> 
> 
> > -----Original Message-----
> > From: Shunsuke Mie <mie@igel.co.jp>
> > Sent: Wednesday, October 26, 2022 8:43 PM
> > To: Frank Li <frank.li@nxp.com>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>; Jon
> > Mason <jdmason@kudzu.us>; Dave Jiang <dave.jiang@intel.com>; Allen
> > Hubbe <allenbh@gmail.com>; Kishon Vijay Abraham I <kishon@ti.com>;
> > Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof Wilczyński
> > <kw@linux.com>; Bjorn Helgaas <bhelgaas@google.com>;
> > ntb@lists.linux.dev; linux-pci@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check for
> > no epc alignment constraint
> > 
> > Caution: EXT Email
> > 
> > Hi Frank,
> > 
> > 2022年10月26日(水) 1:07 Frank Li <frank.li@nxp.com>:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Sent: Tuesday, October 25, 2022 9:22 AM
> > > > To: Shunsuke Mie <mie@igel.co.jp>
> > > > Cc: Jon Mason <jdmason@kudzu.us>; Dave Jiang <dave.jiang@intel.com>;
> > > > Allen Hubbe <allenbh@gmail.com>; Kishon Vijay Abraham I
> > > > <kishon@ti.com>; Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof
> > > > Wilczyński <kw@linux.com>; Bjorn Helgaas <bhelgaas@google.com>;
> > > > ntb@lists.linux.dev; linux-pci@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > > > Subject: [EXT] Re: [PATCH v2] PCI: endpoint: pci-epf-{,v}ntb: fix a check for
> > no
> > > > epc alignment constraint
> > > >
> > > > Caution: EXT Email
> > > >
> > > > On Thu, Sep 22, 2022 at 06:23:57PM +0900, Shunsuke Mie wrote:
> > > > > Some PCI endpoint controllers have no alignment constraints, and the
> > > > > epc_features->align becomes 0. In this case, IS_ALIGNED() in
> > >
> > > [Frank Li] why not set epc_features->align 1
> > > no alignment constraints should mean align to byte.
> > It is one of the solutions too I think. But in that case,  we need to
> > write epc_features->align = 1 to all epc drivers, dwc, qcom, rcar,
> > tegra, and etc.
> > 
> > I think that my change is better.
> 
> I think it should be based on what original term defined. 
> It should be fixed at where make mistake. 
> 

1byte is the default alignment that drivers can assume, why do you want drivers
to set them explicitly when they do not want any special alignment?

I think this patch is fine.

Thanks,
Mani

> Are there other place use align == 0 means no alignment in kernel? 
> 
> > 
> > > > > epf_ntb_config_spad_bar_alloc() doesn't work well. Check for this
> > before
> > > > > IS_ALIGNED().
> > > > >
> > > > > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > > >
> > > > Reviewed-by: Manivannan Sadhasivam
> > > > <manivannan.sadhasivam@linaro.org>
> > > >
> > > > Thanks,
> > > > Mani
> > > >
> > > > > ---
> > > > > Changes in v2:
> > > > > * Fix the commit message in phrasings and words.
> > > > > ---
> > > > > ---
> > > > >  drivers/pci/endpoint/functions/pci-epf-ntb.c  | 2 +-
> > > > >  drivers/pci/endpoint/functions/pci-epf-vntb.c | 2 +-
> > > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > b/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > index 9a00448c7e61..f74155ee8d72 100644
> > > > > --- a/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > +++ b/drivers/pci/endpoint/functions/pci-epf-ntb.c
> > > > > @@ -1021,7 +1021,7 @@ static int
> > epf_ntb_config_spad_bar_alloc(struct
> > > > epf_ntb *ntb,
> > > > >       peer_size = peer_epc_features->bar_fixed_size[peer_barno];
> > > > >
> > > > >       /* Check if epc_features is populated incorrectly */
> > > > > -     if ((!IS_ALIGNED(size, align)))
> > > > > +     if (align && (!IS_ALIGNED(size, align)))
> > > > >               return -EINVAL;
> > > > >
> > > > >       spad_count = ntb->spad_count;
> > > > > diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > index 0ea85e1d292e..5e346c0a0f05 100644
> > > > > --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> > > > > @@ -418,7 +418,7 @@ static int epf_ntb_config_spad_bar_alloc(struct
> > > > epf_ntb *ntb)
> > > > >       size = epc_features->bar_fixed_size[barno];
> > > > >       align = epc_features->align;
> > > > >
> > > > > -     if ((!IS_ALIGNED(size, align)))
> > > > > +     if (align && !IS_ALIGNED(size, align))
> > > > >               return -EINVAL;
> > > > >
> > > > >       spad_count = ntb->spad_count;
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > > > --
> > > > மணிவண்ணன் சதாசிவம்
> > 
> > Best,
> > Shunsuke

-- 
மணிவண்ணன் சதாசிவம்

