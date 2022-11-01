Return-Path: <ntb+bounces-365-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD10614A9D
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Nov 2022 13:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03B92809A7
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Nov 2022 12:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E8E20F2;
	Tue,  1 Nov 2022 12:27:30 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70237E;
	Tue,  1 Nov 2022 12:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2981EC433C1;
	Tue,  1 Nov 2022 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667305648;
	bh=SK4dyF0brKJtStfMTi8gUxZoC7HL5prGtib7M7fQaSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9ZRiJwumBpfKyBy3NofyOY2BWpUBrYax/A5FBUEUCxMFHrHA8X9Gfx/UZEB9QS02
	 VCyYed3iEfcTXAOFIf7pnTZVdxKEsMpXZpJEngNj+e8GZC8qdudX0qJWYOpiWd+ZTX
	 NhIdffY03DefK78I6948ALnWXBUYZUwsbdqQro+mrQRChWmilH2J5tRy+Uj/AvAlkv
	 l166fdTItW7neijAWiXYR8Lc/8x1cAQig69cvq6H81nbomnC0NuAf+IaRqxaUsCuek
	 2HtvCJVTu9LgeOlhkywFuGjg5m2cKjouZetijh4kEDRKpHedguZ6DlCJVUOmTXXnj4
	 WLGNQL3b04TQA==
Date: Tue, 1 Nov 2022 17:57:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: allenbh@gmail.com, bhelgaas@google.com, dave.jiang@intel.com,
	helgaas@kernel.org, imx@lists.linux.dev, jdmason@kudzu.us,
	kw@linux.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org,
	ntb@lists.linux.dev
Subject: Re: [PATCH v14 7/7] PCI: endpoint: pci-epf-vntb: fix sparse build
 warning at ntb->reg
Message-ID: <20221101122715.GK54667@thinkpad>
References: <20221028155703.318928-1-Frank.Li@nxp.com>
 <20221028155703.318928-8-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028155703.318928-8-Frank.Li@nxp.com>

On Fri, Oct 28, 2022 at 11:57:03AM -0400, Frank Li wrote:
> From: Frank Li <frank.li@nxp.com>
> 
>   pci-epf-vntb.c:1128:33: sparse:     expected void [noderef] __iomem *base
>   pci-epf-vntb.c:1128:33: sparse:     got struct epf_ntb_ctrl *reg
> 
> Add __iomem type convert in vntb_epf_peer_spad_read() and
> vntb_epf_peer_spad_write().
> 
> Signed-off-by: Frank Li <frank.li@nxp.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index db3455c1589b..55b7599345c6 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -1120,7 +1120,7 @@ static u32 vntb_epf_spad_read(struct ntb_dev *ndev, int idx)
>  	struct epf_ntb *ntb = ntb_ndev(ndev);
>  	int off = ntb->reg->spad_offset, ct = ntb->reg->spad_count * sizeof(u32);
>  	u32 val;
> -	void __iomem *base = ntb->reg;
> +	void __iomem *base = (void __iomem *)ntb->reg;
>  
>  	val = readl(base + off + ct + idx * sizeof(u32));
>  	return val;
> @@ -1131,7 +1131,7 @@ static int vntb_epf_spad_write(struct ntb_dev *ndev, int idx, u32 val)
>  	struct epf_ntb *ntb = ntb_ndev(ndev);
>  	struct epf_ntb_ctrl *ctrl = ntb->reg;
>  	int off = ctrl->spad_offset, ct = ctrl->spad_count * sizeof(u32);
> -	void __iomem *base = ntb->reg;
> +	void __iomem *base = (void __iomem *)ntb->reg;
>  
>  	writel(val, base + off + ct + idx * sizeof(u32));
>  	return 0;
> @@ -1142,7 +1142,7 @@ static u32 vntb_epf_peer_spad_read(struct ntb_dev *ndev, int pidx, int idx)
>  	struct epf_ntb *ntb = ntb_ndev(ndev);
>  	struct epf_ntb_ctrl *ctrl = ntb->reg;
>  	int off = ctrl->spad_offset;
> -	void __iomem *base = ntb->reg;
> +	void __iomem *base = (void __iomem *)ntb->reg;
>  	u32 val;
>  
>  	val = readl(base + off + idx * sizeof(u32));
> @@ -1154,7 +1154,7 @@ static int vntb_epf_peer_spad_write(struct ntb_dev *ndev, int pidx, int idx, u32
>  	struct epf_ntb *ntb = ntb_ndev(ndev);
>  	struct epf_ntb_ctrl *ctrl = ntb->reg;
>  	int off = ctrl->spad_offset;
> -	void __iomem *base = ntb->reg;
> +	void __iomem *base = (void __iomem *)ntb->reg;
>  
>  	writel(val, base + off + idx * sizeof(u32));
>  	return 0;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

