Return-Path: <ntb+bounces-237-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F38A5B77BE
	for <lists+linux-ntb@lfdr.de>; Tue, 13 Sep 2022 19:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89CFF1C20914
	for <lists+linux-ntb@lfdr.de>; Tue, 13 Sep 2022 17:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F8D4A26;
	Tue, 13 Sep 2022 17:24:22 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2234E3C26
	for <ntb@lists.linux.dev>; Tue, 13 Sep 2022 17:24:21 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id fs14so11995814pjb.5
        for <ntb@lists.linux.dev>; Tue, 13 Sep 2022 10:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date;
        bh=f3cAxQlpr9MhS7L+K6LHuUXyazd8km8sEFTCZsuiIvQ=;
        b=fnJqn0M2B0RToDQUjjL1EmukHybpmMuK8fRRr2q+TZnOO9velXjw9L0tsaFiChol1x
         HFmaPuPVRqD3bA5j1y45QlOKmv0E9zL29sDq5zlxQptQqAr95+yNmRNBkfgHTKN18Oq9
         7VhYbBLoA+wgAA17xKfUP3OSQLW7Ww3VA7Bb+z207uDw8xCyLGgxovAXHA76HLCgKZIM
         rnXirn6N7I9db4jbQ8RTN3dlz0EAKr6D8warBfQynfE43xeS5nzpHXoErneWK+1FoXFD
         +YWEel/Rr+cNmBeEWbpeGdNUjWBSMj9xtonM3h4UHPJUgU/YAFHEEGoazJ4a5XRWP7Np
         RVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=f3cAxQlpr9MhS7L+K6LHuUXyazd8km8sEFTCZsuiIvQ=;
        b=3oZTNee1CDbvyumxY53rkc9aP1dcT4VyFjl1OMGQ7oOMlt6fJS+oV54CwkC1gD7nLf
         gqAD2hvnWWT2cMv4leVl/W/Lbe4zucdlBqfzooTAhXEk8v3wey2+NgrOpc58abb9zLyo
         7jQu8Nrc9YzZfVxO2ueeS3rkn/IacEYIEzgerxrtx4hX/rj3MwNgTC7dAYKiE4qmmpAv
         BBLfVecLY4L64VVsjg4rCJpXX9otADmo8p7nwnubIrnO1zBb5pStwQcZY2qUc2HpF5PF
         DLSu9qzR5sZ4W8L3xqtc/ffNtmSoW3e+tX3yureuEXAR0P9m6vwiqCxyZegm8+wEiE5T
         No/A==
X-Gm-Message-State: ACgBeo1CemmaVpbyIRzgKzfAteiI3dHS11JSLUiXsRDPzBQLNrt32S/2
	eEdrxhrCKExdrwzqYsnLXoK6
X-Google-Smtp-Source: AA6agR6ukeHUFbmmO6edAqgXbgWT6JjNXjHE/gxuAJ+TuicNIIQoj2Qr1icVvhmbbqft7T+tAYtj/A==
X-Received: by 2002:a17:902:d58a:b0:177:f86c:4456 with SMTP id k10-20020a170902d58a00b00177f86c4456mr25523705plh.171.1663089860501;
        Tue, 13 Sep 2022 10:24:20 -0700 (PDT)
Received: from workstation ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id 199-20020a6217d0000000b0053e3ed14419sm8169606pfx.48.2022.09.13.10.24.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 10:24:19 -0700 (PDT)
Date: Tue, 13 Sep 2022 22:54:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: maz@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kw@linux.com, bhelgaas@google.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	peng.fan@nxp.com, aisheng.dong@nxp.com, jdmason@kudzu.us,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev,
	lznuaa@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH v9 4/4] PCI: endpoint: Add vNTB MSI support
Message-ID: <20220913172411.GI25849@workstation>
References: <20220907034856.3101570-1-Frank.Li@nxp.com>
 <20220907034856.3101570-5-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907034856.3101570-5-Frank.Li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Sep 06, 2022 at 10:48:56PM -0500, Frank Li wrote:
>                       ┌───────┐                   ┌──────────┐
>                       │       │                   │          │
>     ┌─────────────┐   │ PCI   │                   │ PCI Host │
>     │ MSI         │◄┐ │ EP    │                   │          │
>     │ Controller  │ │ │       │ 3.MSI Write       │          │
>     └────────┬────┘ └─┼───────┼───────────────────┤          │
>       ▲      │        │       │                   ├─BAR_n    │
>       │      └────────┼───────┼──────────────────►│          │
>       │               │       │ 2.Call Back       │          │
>       │               │       │   write_msi_msg() │          │
>       │               │       │                   │          │
>       │               └───┬───┘                   └──────────┘
>       │                   │
>       └───────────────────┘
>       1.platform_msi_domain_alloc_irqs()
> 
> There is no defined way of raising IRQs by PCI host to the PCI endpoint.
> Only define MSI/MSI-X to let EP notified RC status change.
> 
> The memory assigned for BAR region by the PCI host is mapped to the
> message address of platform msi interrupt controller in PCI Endpoint.
> Such that, whenever the PCI host writes to the BAR region, it will
> trigger an IRQ in the Endpoint.
> 
> Basic working follow as
> 1. EP function driver call platform_msi_domain_alloc_irqs() alloc a
> MSI irq from MSI controller with call back function write_msi_msg();
> 2. write_msg_msg will config BAR and map to address defined in msi_msg;
> 3. Host side trigger an IRQ in Endpoint by write to BAR region.
> 
> Add MSI support for pci-epf-vntb. Query if system has an MSI controller.
> Set up doorbell address according to struct msi_msg.
> 
> So PCI RC can write this doorbell address to trigger EP side's IRQ.
> 
> If no MSI controller exists, fall back to software polling.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 155 +++++++++++++++---
>  1 file changed, 128 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index 1466dd1904175..426205b980a09 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -44,6 +44,7 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  #include <linux/ntb.h>
> +#include <linux/msi.h>
>  
>  static struct workqueue_struct *kpcintb_workqueue;
>  
> @@ -136,13 +137,15 @@ struct epf_ntb {
>  
>  	struct epf_ntb_ctrl *reg;
>  
> -	phys_addr_t epf_db_phy;
> +	phys_addr_t epf_db_phys;

This should be part of a separate patch.

>  	void __iomem *epf_db;
>  
>  	phys_addr_t vpci_mw_phy[MAX_MW];
>  	void __iomem *vpci_mw_addr[MAX_MW];
>  
>  	struct delayed_work cmd_handler;
> +
> +	int msi_virqbase;
>  };
>  
>  #define to_epf_ntb(epf_group) container_of((epf_group), struct epf_ntb, group)
> @@ -253,13 +256,15 @@ static void epf_ntb_cmd_handler(struct work_struct *work)
>  
>  	ntb = container_of(work, struct epf_ntb, cmd_handler.work);
>  
> -	for (i = 1; i < ntb->db_count; i++) {
> -		if (readl(ntb->epf_db + i * 4)) {
> -			if (readl(ntb->epf_db + i * 4))
> -				ntb->db |= 1 << (i - 1);
> +	if (!ntb->epf_db_phys) {
> +		for (i = 1; i < ntb->db_count; i++) {
> +			if (readl(ntb->epf_db + i * 4)) {
> +				if (readl(ntb->epf_db + i * 4))

Why are you reading twice? And why cannot you use _relaxed() variant
here and below?

> +					ntb->db |= 1 << (i - 1);
>  
> -			ntb_db_event(&ntb->ntb, i);
> -			writel(0, ntb->epf_db + i * 4);
> +				ntb_db_event(&ntb->ntb, i);
> +				writel(0, ntb->epf_db + i * 4);
> +			}
>  		}
>  	}
>  
> @@ -454,11 +459,9 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
>  	ctrl->num_mws = ntb->num_mws;
>  	ntb->spad_size = spad_size;
>  
> -	ctrl->db_entry_size = 4;
> -
>  	for (i = 0; i < ntb->db_count; i++) {
>  		ntb->reg->db_data[i] = 1 + i;
> -		ntb->reg->db_offset[i] = 0;
> +		ntb->reg->db_offset[i] = 4 * i;

4 should be defined as a macro of what it represents.

>  	}
>  
>  	return 0;
> @@ -509,6 +512,28 @@ static int epf_ntb_configure_interrupt(struct epf_ntb *ntb)
>  	return 0;
>  }
>  
> +static int epf_ntb_db_size(struct epf_ntb *ntb)
> +{
> +	const struct pci_epc_features *epc_features;
> +	size_t size = 4 * ntb->db_count;

Here also.

> +	u32 align;
> +
> +	epc_features = pci_epc_get_features(ntb->epf->epc,
> +					    ntb->epf->func_no,
> +					    ntb->epf->vfunc_no);
> +	align = epc_features->align;
> +
> +	if (size < 128)
> +		size = 128;
> +
> +	if (align)
> +		size = ALIGN(size, align);
> +	else
> +		size = roundup_pow_of_two(size);
> +
> +	return size;
> +}
> +
>  /**
>   * epf_ntb_db_bar_init() - Configure Doorbell window BARs
>   * @ntb: NTB device that facilitates communication between HOST and vHOST
> @@ -522,33 +547,32 @@ static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
>  	struct pci_epf_bar *epf_bar;
>  	void __iomem *mw_addr;
>  	enum pci_barno barno;
> -	size_t size = 4 * ntb->db_count;
> +	size_t size;
>  
>  	epc_features = pci_epc_get_features(ntb->epf->epc,
>  					    ntb->epf->func_no,
>  					    ntb->epf->vfunc_no);
>  	align = epc_features->align;
> -
> -	if (size < 128)
> -		size = 128;
> -
> -	if (align)
> -		size = ALIGN(size, align);
> -	else
> -		size = roundup_pow_of_two(size);
> +	size = epf_ntb_db_size(ntb);
>  
>  	barno = ntb->epf_ntb_bar[BAR_DB];
> +	epf_bar = &ntb->epf->bar[barno];
>  
> -	mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
> -	if (!mw_addr) {
> -		dev_err(dev, "Failed to allocate OB address\n");
> -		return -ENOMEM;
> +	if (ntb->epf_db_phys) {
> +		mw_addr = NULL;
> +		epf_bar->phys_addr = ntb->epf_db_phys;
> +		epf_bar->barno = barno;
> +		epf_bar->size = size;
> +	} else {
> +		mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
> +		if (!mw_addr) {
> +			dev_err(dev, "Failed to allocate door bell address\n");

doorbell

> +			return -ENOMEM;
> +		}
>  	}
>  
>  	ntb->epf_db = mw_addr;
>  
> -	epf_bar = &ntb->epf->bar[barno];
> -
>  	ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
>  	if (ret) {
>  		dev_err(dev, "Doorbell BAR set failed\n");
> @@ -704,6 +728,82 @@ static int epf_ntb_init_epc_bar(struct epf_ntb *ntb)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
> +static void epf_ntb_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> +{
> +	struct epf_ntb *ntb = dev_get_drvdata(desc->dev);
> +	struct epf_ntb_ctrl *reg = ntb->reg;
> +	int size = epf_ntb_db_size(ntb);
> +	u64 addr;
> +
> +	addr = msg->address_hi;
> +	addr <<= 32;
> +	addr |= msg->address_lo;
> +
> +	reg->db_data[desc->msi_index] = msg->data;
> +
> +	if (desc->msi_index == 0)

if (!desc->msi_index)

> +		ntb->epf_db_phys = round_down(addr, size);
> +
> +	reg->db_offset[desc->msi_index] = addr - ntb->epf_db_phys;
> +}
> +#endif
> +
> +static irqreturn_t epf_ntb_interrupt_handler(int irq, void *data)
> +{
> +	struct epf_ntb *ntb = data;
> +	int index;
> +
> +	index = irq - ntb->msi_virqbase;
> +	ntb->db |= 1 << (index - 1);
> +	ntb_db_event(&ntb->ntb, index);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void epf_ntb_epc_msi_init(struct epf_ntb *ntb)

Why cannot you guard this whole function with CONFIG_GENERIC_MSI_IRQ_DOMAIN?

> +{
> +	struct device *dev = &ntb->epf->dev;
> +	struct irq_domain *domain;
> +	int virq;
> +	int ret;
> +	int i;
> +
> +	domain = dev_get_msi_domain(ntb->epf->epc->dev.parent);
> +	if (!domain)
> +		return;
> +
> +	dev_set_msi_domain(dev, domain);
> +
> +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
> +	if (platform_msi_domain_alloc_irqs(&ntb->epf->dev,
> +		ntb->db_count,
> +		epf_ntb_write_msi_msg)) {
> +		dev_info(dev, "Can't allocate MSI, fall back to poll mode\n");

falling back to polling mode

Should this be dev_err?

> +		return;
> +	}
> +#else
> +	return;
> +#endif
> +	dev_info(dev, "vntb use MSI as doorbell\n");

Using MSI as a doorbell

> +
> +	for (i = 0; i < ntb->db_count; i++) {
> +		virq = msi_get_virq(dev, i);
> +		ret = devm_request_irq(dev, virq,
> +			       epf_ntb_interrupt_handler, 0,
> +			       "vntb", ntb);

s/vntb/pci_epf_vntb

> +
> +		if (ret) {
> +			dev_err(dev, "devm_request_irq() failure, fall back to poll mode\n");

Failed to request doorbell IRQ! Falling back to polling mode

> +			ntb->epf_db_phys = 0;
> +			break;
> +		}
> +
> +		if (!i)
> +			ntb->msi_virqbase = virq;

A comment here would be helpful

Thanks,
Mani

> +	}
> +}
> +
>  /**
>   * epf_ntb_epc_init() - Initialize NTB interface
>   * @ntb: NTB device that facilitates communication between HOST and vHOST2
> @@ -1299,14 +1399,15 @@ static int epf_ntb_bind(struct pci_epf *epf)
>  		goto err_bar_alloc;
>  	}
>  
> +	epf_set_drvdata(epf, ntb);
> +	epf_ntb_epc_msi_init(ntb);
> +
>  	ret = epf_ntb_epc_init(ntb);
>  	if (ret) {
>  		dev_err(dev, "Failed to initialize EPC\n");
>  		goto err_bar_alloc;
>  	}
>  
> -	epf_set_drvdata(epf, ntb);
> -
>  	pci_space[0] = (ntb->vntb_pid << 16) | ntb->vntb_vid;
>  	pci_vntb_table[0].vendor = ntb->vntb_vid;
>  	pci_vntb_table[0].device = ntb->vntb_pid;
> -- 
> 2.35.1
> 

