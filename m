Return-Path: <ntb+bounces-433-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF064C818
	for <lists+linux-ntb@lfdr.de>; Wed, 14 Dec 2022 12:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7376F280AC3
	for <lists+linux-ntb@lfdr.de>; Wed, 14 Dec 2022 11:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A92A6133;
	Wed, 14 Dec 2022 11:35:16 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C16121;
	Wed, 14 Dec 2022 11:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206B5C433EF;
	Wed, 14 Dec 2022 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671017714;
	bh=x7XLustHOSDMG59c5AzsLExjEBqxv5w3RXRg+AC/mSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ri1Pco7zC/ok/zYT6h2PWNnIHK2RNawvDZX9FiEpoJl+S23tlzZGSIHZBl6yU3/zN
	 GHAHDIO/ww1H6rViDM9KUg4CjJL2XeUOhVyK8eqkMOjl/snhyNWaz4xUl9hHY1l72o
	 KyNC7tzgoEhvKHnz3oKpOk4eijW52/Z4raA8iwN8ltFiYRq1UDS+dEpQw22ThfLET6
	 U6TWWVJnRTe+GVrVBDh0ygY/o0H2HAg65rWExss/baKkJSa/keiRBcS8dsezvWjd2T
	 s1r6ZOyh3RtMNPB+le95RLL+M14nJmp3PGMV0lAr0s6yC5ZrPRIl2Tdh9MgZYCqq+p
	 RWTcUR7hzlLJQ==
Date: Wed, 14 Dec 2022 05:35:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <frank.li@nxp.com>
Cc: "mani@kernel.org" <mani@kernel.org>,
	"allenbh@gmail.com" <allenbh@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>,
	"kw@linux.com" <kw@linux.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH v16 7/7] PCI: endpoint: pci-epf-vntb: fix
 sparse build warning at ntb->reg
Message-ID: <20221214113512.GA247043@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0401MB2331E04D41F5EF9F6F1E326288E09@HE1PR0401MB2331.eurprd04.prod.outlook.com>

On Wed, Dec 14, 2022 at 12:49:15AM +0000, Frank Li wrote:
> > 
> > On Wed, Nov 02, 2022 at 10:10:14AM -0400, Frank Li wrote:
> > > From: Frank Li <frank.li@nxp.com>
> > >
> > >   pci-epf-vntb.c:1128:33: sparse:     expected void [noderef] __iomem
> > *base
> > >   pci-epf-vntb.c:1128:33: sparse:     got struct epf_ntb_ctrl *reg
> > >
> > > Add __iomem type convert in vntb_epf_peer_spad_read() and
> > > vntb_epf_peer_spad_write().
> > 
> > I don't understand all the bits and pieces here, but I'm a little
> > dubious about adding all these "(void __iomem *)"casts.  There are
> > very few of them in drivers/pci/, and I doubt this driver is so unique
> > that it needs them.
> 
> sparse compiler report warning without cast.  I write it at commit message.

As a matter of fact, I did read your commit message.  My point is that
I don't think littering the code with casts is the best solution.  I
wrote more details below; please read the entire email.

> > > @@ -1121,7 +1121,7 @@ static u32 vntb_epf_spad_read(struct ntb_dev
> > *ndev, int idx)
> > >       struct epf_ntb *ntb = ntb_ndev(ndev);
> > >       int off = ntb->reg->spad_offset, ct = ntb->reg->spad_count *
> > sizeof(u32);
> > >       u32 val;
> > > -     void __iomem *base = ntb->reg;
> > > +     void __iomem *base = (void __iomem *)ntb->reg;
> > >
> > >       val = readl(base + off + ct + idx * sizeof(u32));
> > >       return val;
> > > @@ -1132,7 +1132,7 @@ static int vntb_epf_spad_write(struct ntb_dev
> > *ndev, int idx, u32 val)
> > >       struct epf_ntb *ntb = ntb_ndev(ndev);
> > >       struct epf_ntb_ctrl *ctrl = ntb->reg;
> > >       int off = ctrl->spad_offset, ct = ctrl->spad_count * sizeof(u32);
> > > -     void __iomem *base = ntb->reg;
> > > +     void __iomem *base = (void __iomem *)ntb->reg;
> > >
> > >       writel(val, base + off + ct + idx * sizeof(u32));
> > 
> > These things look gratuitously different to begin with:
> > 
> >   int off = ntb->reg->spad_offset, ct = ntb->reg->spad_count * sizeof(u32);
> >   int off = ctrl->spad_offset, ct = ctrl->spad_count * sizeof(u32);
> > 
> > They're doing the same thing, and they should do it the same way.
> > 
> > Since db_data[] and db_offset[] are never referenced except to be
> > initialized to zero, I'm guessing the point of vntb_epf_spad_read()
> > and vntb_epf_spad_write() is to read/write things in those arrays?
> > 
> > You access other things in ntb->reg directly by dereferencing a
> > pointer, e.g.,
> > 
> >   ntb->reg->link_status |= LINK_STATUS_UP;
> >   addr = ntb->reg->addr;
> >   ctrl->command_status = COMMAND_STATUS_OK;
> > 
> > Why don't you just compute the appropriate *index* and access the
> > array directly instead of using readl() and writel()?
> > 
> > Bjorn

