Return-Path: <ntb+bounces-400-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5F6366B7
	for <lists+linux-ntb@lfdr.de>; Wed, 23 Nov 2022 18:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5FFD28093F
	for <lists+linux-ntb@lfdr.de>; Wed, 23 Nov 2022 17:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C3A46A7;
	Wed, 23 Nov 2022 17:12:03 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C82F4699;
	Wed, 23 Nov 2022 17:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481B1C433D6;
	Wed, 23 Nov 2022 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669223522;
	bh=a81ckGxirIH6Asoiw6/cJVl5Ehwh4kZoTuM4zBBmWxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=izmtaBSFLiyc52jNd0kuciaBQZJ+mOeuBCv1OqXfHjkHwXYfzGSGZ1wyQi0dG+CYo
	 lzp65Eoa1TPcPr0lNgIpma+FA7cVgiwwCPJ30gL4lriCh6ZxCoS+Cg5LWK4PfFbz3L
	 j34WzvRGHdwPw0WhEKstFE4VZrU401wd6ltsqAXEWEzYc2z9jQS+4PV/2qdmwBIpv4
	 8L6uoUyCTwSw52rjhXYA9eunKGBXzn8VSfcn2nD02e5aocbgM31q3uW7K1D1iDU4x4
	 /31w8kLc95wtGM2GeTwfGP671wPKKOQ4AxkqHZ0DySvNQZPMdouVqyx78xt170BfYq
	 PY+toJQ2T0WXQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: mani@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	bhelgaas@google.com,
	allenbh@gmail.com,
	dave.jiang@intel.com,
	kw@linux.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	helgaas@kernel.org,
	ntb@lists.linux.dev,
	jdmason@kudzu.us
Subject: Re: [PATCH v16 0/7] pci-epf-vntb clean up
Date: Wed, 23 Nov 2022 18:11:54 +0100
Message-Id: <166922348979.29467.5900392743930970597.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102141014.1025893-1-Frank.Li@nxp.com>
References: <20221102141014.1025893-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 2 Nov 2022 10:10:07 -0400, Frank Li wrote:
> continue patch series https://www.spinics.net/lists/linux-pci/msg130372.html
> https://www.spinics.net/lists/linux-pci/msg130924.html
> 
> Lorenzo suggest create new series. Version number continue from old one
> Change from v15 to v16
>   consistent subject
>   Add () after pci_epc_mem_free_addr
> 
> [...]

Applied to pci/endpoint, thanks!

[1/7] PCI: endpoint: pci-epf-vntb: clean up kernel_doc warning
      https://git.kernel.org/lpieralisi/pci/c/929880484045
[2/7] PCI: endpoint: pci-epf-vntb: fix indentation of the struct epf_ntb_ctrl
      https://git.kernel.org/lpieralisi/pci/c/1d118fed348f
[3/7] PCI: endpoint: pci-epf-vntb: fix call pci_epc_mem_free_addr() at err path
      https://git.kernel.org/lpieralisi/pci/c/0c031262d2dd
[4/7] PCI: endpoint: pci-epf-vntb: remove unused field epf_db_phy
      https://git.kernel.org/lpieralisi/pci/c/03d426ae5426
[5/7] PCI: endpoint: pci-epf-vntb: replace hardcode 4 with sizeof(u32)
      https://git.kernel.org/lpieralisi/pci/c/2b35c886556a
[6/7] PCI: endpoint: pci-epf-vntb: fix sparse build warning at epf_db
      https://git.kernel.org/lpieralisi/pci/c/01dcec6d57ce
[7/7] PCI: endpoint: pci-epf-vntb: fix sparse build warning at ntb->reg
      https://git.kernel.org/lpieralisi/pci/c/5f697b25009c

Thanks,
Lorenzo

