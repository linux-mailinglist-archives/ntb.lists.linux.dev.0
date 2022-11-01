Return-Path: <ntb+bounces-364-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32118614A8F
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Nov 2022 13:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A686C2808F2
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Nov 2022 12:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AF71FA4;
	Tue,  1 Nov 2022 12:24:46 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8C7E;
	Tue,  1 Nov 2022 12:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF1CC433D6;
	Tue,  1 Nov 2022 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667305483;
	bh=bSa8Tet80b1soioHlSxW/ocDO2rBr47g7tjRPLUY5Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7TVodMdDhVwZCdw5dhm2FhqjUF0iegwejsl9wx6PG4uV7m/y71oEddEpf06q4oGU
	 P3n1ow/9ga8zLF8+HX1QPEVm3NBv/iWhfzQS+npmwwrJlr+2HCMF1RhP9yAJr02otV
	 4JgTrjQ8fBr1synmKNwYCQtI3RIk1QfeaQY8Xrc61ZjcmK05nBoP7YFBAE5XPkG8Qv
	 SN/9uaB4VhoUGvt9YhMTkrbE9h0128ijRhOoHeOkDIsxD1Zptx4sAcz7W+pzfWuyD8
	 z13vS042QOGK3fAKcPBIJ0Av+a065094FxEIT/k1pY1Z1eDL+yR914RMdbcda4kUKn
	 6zwtE3fzmyTIw==
Date: Tue, 1 Nov 2022 17:54:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: allenbh@gmail.com, bhelgaas@google.com, dave.jiang@intel.com,
	helgaas@kernel.org, imx@lists.linux.dev, jdmason@kudzu.us,
	kw@linux.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org,
	ntb@lists.linux.dev
Subject: Re: [PATCH v14 6/7] PCI: endpoint: pci-epf-vntb: fix sparse build
 warning at epf_db
Message-ID: <20221101122431.GJ54667@thinkpad>
References: <20221028155703.318928-1-Frank.Li@nxp.com>
 <20221028155703.318928-7-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028155703.318928-7-Frank.Li@nxp.com>

On Fri, Oct 28, 2022 at 11:57:02AM -0400, Frank Li wrote:
> From: Frank Li <frank.li@nxp.com>
> 
> Using epf_db[i] instead of readl() because epf_db is in local
> system memory and allocated by dma_alloc_coherent().
> 
> Signed-off-by: Frank Li <frank.li@nxp.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index 54616281da9e..db3455c1589b 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -136,7 +136,7 @@ struct epf_ntb {
>  
>  	struct epf_ntb_ctrl *reg;
>  
> -	void __iomem *epf_db;
> +	u32 *epf_db;
>  
>  	phys_addr_t vpci_mw_phy[MAX_MW];
>  	void __iomem *vpci_mw_addr[MAX_MW];
> @@ -257,12 +257,9 @@ static void epf_ntb_cmd_handler(struct work_struct *work)
>  	ntb = container_of(work, struct epf_ntb, cmd_handler.work);
>  
>  	for (i = 1; i < ntb->db_count; i++) {
> -		if (readl(ntb->epf_db + i * sizeof(u32))) {
> -			if (readl(ntb->epf_db + i * sizeof(u32)))
> -				ntb->db |= 1 << (i - 1);

Why did you remove above line?

Thanks,
Mani

> -
> +		if (ntb->epf_db[i]) {
>  			ntb_db_event(&ntb->ntb, i);
> -			writel(0, ntb->epf_db + i * sizeof(u32));
> +			ntb->epf_db[i] = 0;
>  		}
>  	}
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

