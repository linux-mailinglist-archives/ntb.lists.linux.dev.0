Return-Path: <ntb+bounces-363-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA5614A33
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Nov 2022 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECD571C208C6
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Nov 2022 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CCE1A61F;
	Tue,  1 Nov 2022 12:01:07 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217777E;
	Tue,  1 Nov 2022 12:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84A7C433D7;
	Tue,  1 Nov 2022 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667304064;
	bh=1UG0Z8pQ/J109xuJ1IrgXDMwvuaXAE5eOrFgATzvJfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYTxgSXp5TgTB1vek5Y60B9rEzaWvTaA6rOMLLYdWuVo2NkZnsb9rivI2Ua6phbce
	 YtEr2rjSsvwsHLeDHX9MOA/3h9embp8zZf+giC8mj5i8zqJfrYJQSFQPRdFgbiRzvb
	 0b6Q3YkhqZtQH6GiwkSnFEjO+tNhkPXB0/248KXeUS176ihkZzMhfcyHFwwTI1nRN4
	 0+haLR6nxQTbk4x0HI5E6kTZhCfCL5KN8KyBUZ3b1uXNhoTH262RMs7C3UzUOf93In
	 mdgr9vd20r/BXj3gf57N5Jp9Srp0NKSjMQhO+yWsPSuFpTfJXUUZ6ot8Ygyu+/RPNQ
	 wrDEoH+XEZO0A==
Date: Tue, 1 Nov 2022 17:30:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: allenbh@gmail.com, bhelgaas@google.com, dave.jiang@intel.com,
	helgaas@kernel.org, imx@lists.linux.dev, jdmason@kudzu.us,
	kw@linux.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org,
	ntb@lists.linux.dev
Subject: Re: [PATCH v14 5/7] PCI: endpoint: pci-epf-vntb: replace hardcode 4
 with sizeof(u32)
Message-ID: <20221101120053.GI54667@thinkpad>
References: <20221028155703.318928-1-Frank.Li@nxp.com>
 <20221028155703.318928-6-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028155703.318928-6-Frank.Li@nxp.com>

On Fri, Oct 28, 2022 at 11:57:01AM -0400, Frank Li wrote:
> From: Frank Li <frank.li@nxp.com>
> 
> ntb span entry item size is sizeof(u32).
> 

s/span/spad

> Signed-off-by: Frank Li <frank.li@nxp.com>

With that,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index ee66101cb5c4..54616281da9e 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -257,12 +257,12 @@ static void epf_ntb_cmd_handler(struct work_struct *work)
>  	ntb = container_of(work, struct epf_ntb, cmd_handler.work);
>  
>  	for (i = 1; i < ntb->db_count; i++) {
> -		if (readl(ntb->epf_db + i * 4)) {
> -			if (readl(ntb->epf_db + i * 4))
> +		if (readl(ntb->epf_db + i * sizeof(u32))) {
> +			if (readl(ntb->epf_db + i * sizeof(u32)))
>  				ntb->db |= 1 << (i - 1);
>  
>  			ntb_db_event(&ntb->ntb, i);
> -			writel(0, ntb->epf_db + i * 4);
> +			writel(0, ntb->epf_db + i * sizeof(u32));
>  		}
>  	}
>  
> @@ -433,7 +433,7 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
>  	spad_count = ntb->spad_count;
>  
>  	ctrl_size = sizeof(struct epf_ntb_ctrl);
> -	spad_size = 2 * spad_count * 4;
> +	spad_size = 2 * spad_count * sizeof(u32);
>  
>  	if (!align) {
>  		ctrl_size = roundup_pow_of_two(ctrl_size);
> @@ -463,7 +463,7 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
>  	ctrl->num_mws = ntb->num_mws;
>  	ntb->spad_size = spad_size;
>  
> -	ctrl->db_entry_size = 4;
> +	ctrl->db_entry_size = sizeof(u32);
>  
>  	for (i = 0; i < ntb->db_count; i++) {
>  		ntb->reg->db_data[i] = 1 + i;
> @@ -535,7 +535,7 @@ static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
>  	struct pci_epf_bar *epf_bar;
>  	void __iomem *mw_addr;
>  	enum pci_barno barno;
> -	size_t size = 4 * ntb->db_count;
> +	size_t size = sizeof(u32) * ntb->db_count;
>  
>  	epc_features = pci_epc_get_features(ntb->epf->epc,
>  					    ntb->epf->func_no,
> @@ -1121,11 +1121,11 @@ static int vntb_epf_link_enable(struct ntb_dev *ntb,
>  static u32 vntb_epf_spad_read(struct ntb_dev *ndev, int idx)
>  {
>  	struct epf_ntb *ntb = ntb_ndev(ndev);
> -	int off = ntb->reg->spad_offset, ct = ntb->reg->spad_count * 4;
> +	int off = ntb->reg->spad_offset, ct = ntb->reg->spad_count * sizeof(u32);
>  	u32 val;
>  	void __iomem *base = ntb->reg;
>  
> -	val = readl(base + off + ct + idx * 4);
> +	val = readl(base + off + ct + idx * sizeof(u32));
>  	return val;
>  }
>  
> @@ -1133,10 +1133,10 @@ static int vntb_epf_spad_write(struct ntb_dev *ndev, int idx, u32 val)
>  {
>  	struct epf_ntb *ntb = ntb_ndev(ndev);
>  	struct epf_ntb_ctrl *ctrl = ntb->reg;
> -	int off = ctrl->spad_offset, ct = ctrl->spad_count * 4;
> +	int off = ctrl->spad_offset, ct = ctrl->spad_count * sizeof(u32);
>  	void __iomem *base = ntb->reg;
>  
> -	writel(val, base + off + ct + idx * 4);
> +	writel(val, base + off + ct + idx * sizeof(u32));
>  	return 0;
>  }
>  
> @@ -1148,7 +1148,7 @@ static u32 vntb_epf_peer_spad_read(struct ntb_dev *ndev, int pidx, int idx)
>  	void __iomem *base = ntb->reg;
>  	u32 val;
>  
> -	val = readl(base + off + idx * 4);
> +	val = readl(base + off + idx * sizeof(u32));
>  	return val;
>  }
>  
> @@ -1159,7 +1159,7 @@ static int vntb_epf_peer_spad_write(struct ntb_dev *ndev, int pidx, int idx, u32
>  	int off = ctrl->spad_offset;
>  	void __iomem *base = ntb->reg;
>  
> -	writel(val, base + off + idx * 4);
> +	writel(val, base + off + idx * sizeof(u32));
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

