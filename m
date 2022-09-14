Return-Path: <ntb+bounces-246-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C82C95B7CF3
	for <lists+linux-ntb@lfdr.de>; Wed, 14 Sep 2022 00:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6CB81C20926
	for <lists+linux-ntb@lfdr.de>; Tue, 13 Sep 2022 22:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EA06719;
	Tue, 13 Sep 2022 22:19:20 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6C23C3F;
	Tue, 13 Sep 2022 22:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E8FC433C1;
	Tue, 13 Sep 2022 22:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663107558;
	bh=vOM7sqZItl/trS+7jw/NfA7mCPUKtLKs8p8juFEz1LQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PqY2sMOHIFT9Hb81j94J0rf9pS4s4sfT4NMscI+2mfmuako+a2b4cqOx8dG/wawnr
	 Jh5hfF3unFix49Lcr+LmcEVF6JQ+zzbUJj/toSoRvoTw/5VVUpbrR+xLpAu3fZauyk
	 Rx8/zEI88uPJ/xbsGWJTH2tyyZ7PzfNw0miGbHeXfoVKCy50rqL7VeYow23AQUEnq4
	 n/hKChC9+JbfnKuz5cl04SNOvomK8erZlvC948pmx9bnHood+2BbE8a07mJ5/Ue7fe
	 LCJW18jHOZcHWunYifNqxyn1pYn/oFCUMLwPNzLJF4XSCJR4oIHlec/buR4H9G26Lo
	 cO2ze6p4tuRDw==
Date: Tue, 13 Sep 2022 17:19:16 -0500
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
Subject: Re: [PATCH v10 5/6] PCI: endpoint: makeup pci-epf-vntb.c
Message-ID: <20220913221916.GA627631@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913210957.3493826-6-Frank.Li@nxp.com>

In subject, capitalize and change "makeup" to "Clean up":

  PCI: endpoint: pci-epf-vntb: Clean up

On Tue, Sep 13, 2022 at 04:09:56PM -0500, Frank Li wrote:
> Remove unused field: epf_db_phy.
> Remove __iomem before epf_db.
> Remove dupicate check if (readl(ntb->epf_db + i * 4)).
> Using readl_relaxed instead of readl.
> Using marco ENTRY_SIZE instead of number 4 at all place.

Add "()" after function names.

s/marco/macro/

It would be nice if "ENTRY_SIZE" had a hint about what kind of entry
we're talking about.

Since this is a collection of random cleanups, I noticed a typo in
epf_ntb_configure_interrupt() kernel-doc: s/capaiblity/capability/

The struct epf_ntb_ctrl definition is also whitespace-damaged.  The
members of struct epf_ntb_ctrl and struct epf_ntb should follow the
same indentation style.  Some members of struct epf_ntb_ctrl are
indented with a tab, others with space.  Either make them all tabs and
indent struct epf_ntb similarly, or indent the struct epf_ntb_ctrl
members with a single space.

The comments in the file have a whole collection of ways to spell
vhost: Virtual Host, VHOST, VHost, vHOST, vhost.  Make them all the
same, please.  You can use "Virtual Host (VHOST)" or whatever the
first time if you want to use the short version later.

Same for host/HOST/etc.  I don't want to read things like this:

  @ntb: NTB device that facilitates communication between HOST and vHOST2

  Wrapper to initialize a particular EPC interface and start the
  workqueue to check for commands from host.

and wonder whether "host" is supposed to be the same as "HOST".  Also,
why does that say "vHOST*2*"?

There are several instances of "HOST1" and "HOST2" (and "vHOST2").
Should those appear somewhere in the diagram at the top of the file?

The diagram starts with "/**" which means it's kernel-doc, but the
diagram is not kernel-doc.  Please run this:

  scripts/kernel-doc -v -none drivers/pci/endpoint/functions/pci-epf-vntb.c

and fix all the warnings.

Bjorn

