Return-Path: <ntb+bounces-257-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 654915BD311
	for <lists+linux-ntb@lfdr.de>; Mon, 19 Sep 2022 19:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962461C2099B
	for <lists+linux-ntb@lfdr.de>; Mon, 19 Sep 2022 17:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369A66AA8;
	Mon, 19 Sep 2022 17:02:57 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F16AA2;
	Mon, 19 Sep 2022 17:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33278C433D6;
	Mon, 19 Sep 2022 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663606975;
	bh=X4h9HckllndXS+TNcSz6L4GDhtvtdBz4D8Y07rreB3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kEHd9cE/KYe6tru3Ista5AFLiDJ5X39rzR3J7TjYfPmCCROsgrWkPSwzquxzD5P/p
	 XUsy59b/I6/KWxa000yEY9oC7baf3HYflwKSR2+fX91VoI0lyRDidwMghItFyRRiW0
	 U2vtNNQcRUNNjVL6nGD8a2v/T5xS0tTVmwzj2G/YcZva5sXPbFeBSpv/lp6O3fgWEf
	 aDHa8pRSy7yMfM+10RVhB9/UBnPmVqdFlzEiMWfPnRkeIRmzglFlrwJ2cAGViFU6Uq
	 Llc0f2Yy1wj6BSV5pdPnYTOYePBHF17bjLjWq2H/dOuWMFkP9aNDnwr0YlnBkU2+TA
	 9jw5Brdz3dUww==
Date: Mon, 19 Sep 2022 12:02:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: maz@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kw@linux.com, bhelgaas@google.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	peng.fan@nxp.com, aisheng.dong@nxp.com, jdmason@kudzu.us,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev,
	lznuaa@gmail.com, imx@lists.linux.dev,
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v11 5/6] PCI: endpoint: cleanup pci-epf-vntb.c
Message-ID: <20220919170253.GA1011825@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919154038.187168-6-Frank.Li@nxp.com>

In subject (I mentioned this last time, too):

  PCI: endpoint: pci-epf-vntb: Clean up

On Mon, Sep 19, 2022 at 10:40:37AM -0500, Frank Li wrote:
> Remove unused field: epf_db_phy.
> Remove __iomem before epf_db.
> Change epf_db to u32* from void *
> Remove dupicate check if (readl(ntb->epf_db + i * 4)).

s/dupicate/duplicate/

> Using sizeof(u32) instead of number 4 at all place.
> 
> Clean up sparse build warning
>   Using  epf_db[i] instead of readl() because epf_db is located in local memory
>   and allocated by dma_alloc_coherent()

Is "Using epf_db[i] ..." an sparse warning?  The indentation suggests
that it is, but it doesn't seem related.

> Replace pci_epc_mem_free_addr() with pci_epf_free_space() at error handle path
> to match pci_epf_alloc_space().
> 
> Cleanup warning found by scripts/kernel-doc
> Fix indentation of the struct epf_ntb_ctrl
> Consildate term

s/Consildate/Consolidate/

>   host, host1 to HOST
>   vhost, vHost, Vhost, VHOST2 to VHOST

