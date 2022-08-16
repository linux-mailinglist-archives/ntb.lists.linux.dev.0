Return-Path: <ntb+bounces-158-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE335962D1
	for <lists+linux-ntb@lfdr.de>; Tue, 16 Aug 2022 21:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCAD11C20903
	for <lists+linux-ntb@lfdr.de>; Tue, 16 Aug 2022 19:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4316AB5;
	Tue, 16 Aug 2022 19:05:07 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BC16AAE;
	Tue, 16 Aug 2022 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660676706; x=1692212706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fw20SIT8UosrRyl9DK6OBZL1qLEKx8DhIicuKy/Nujk=;
  b=SnNSVFEk85LBDnsXbOkaF8x8PpODHWIDJy4HMvCyGD3KUQuW8ubWWXjA
   LIntEJ5fTonYNRom/cc+Oft1hEiEhVRQF3VlGscnTYKJuai0JdC8/u5un
   E/9BL6BsZyI+FVWgYxNBusc2ER2uL/32wqE4dN9NZ0B+p9k/FsRtAQEhf
   Gd++bdbMCa6IUdXOJba3EQAHTqOqLhQqt0dU+tjhYnHpyrl6pYjOY8DxF
   CYlZHPpJiImiQc4Sk9H0dfQzS8lS4U29MiMAWnEvcIBbG+efhhiyETcMB
   l0Xms4HvceCog37hBLLvAFpkGPdwwJCH5q0KPjh9VvFMP+j7crfVPPhqQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="279267050"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="279267050"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 12:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="733409002"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2022 12:04:59 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oO1s3-00009Y-0i;
	Tue, 16 Aug 2022 19:04:59 +0000
Date: Wed, 17 Aug 2022 03:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, maz@kernel.org, tglx@linutronix.de,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kw@linux.com,
	bhelgaas@google.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	peng.fan@nxp.com, aisheng.dong@nxp.com, jdmason@kudzu.us,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	kishon@ti.com, lorenzo.pieralisi@arm.com, ntb@lists.linux.dev,
	lznuaa@gmail.com
Subject: Re: [PATCH v5 2/4] irqchip: Add IMX MU MSI controller driver
Message-ID: <202208170210.zGxvHnIZ-lkp@intel.com>
References: <20220815213936.2380439-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815213936.2380439-3-Frank.Li@nxp.com>

Hi Frank,

I love your patch! Yet something to improve:

[auto build test ERROR on jonmason-ntb/ntb-next]
[also build test ERROR on robh/for-next linus/master v6.0-rc1 next-20220816]
[cannot apply to tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/PCI-EP-driver-support-MSI-doorbell-from-host/20220816-131930
base:   https://github.com/jonmason/ntb ntb-next
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20220817/202208170210.zGxvHnIZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/71296e2ad757d90e870b2ab81f2b06b9c76e7c41
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frank-Li/PCI-EP-driver-support-MSI-doorbell-from-host/20220816-131930
        git checkout 71296e2ad757d90e870b2ab81f2b06b9c76e7c41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-mu-msi.c:124:13: error: use of undeclared identifier 'irq_chip_ack_parent'
           .irq_ack = irq_chip_ack_parent,
                      ^
   drivers/irqchip/irq-imx-mu-msi.c:127:30: error: variable has incomplete type 'struct msi_domain_ops'
   static struct msi_domain_ops imx_mu_msi_irq_ops = {
                                ^
   drivers/irqchip/irq-imx-mu-msi.c:127:15: note: forward declaration of 'struct msi_domain_ops'
   static struct msi_domain_ops imx_mu_msi_irq_ops = {
                 ^
   drivers/irqchip/irq-imx-mu-msi.c:131:12: error: use of undeclared identifier 'MSI_FLAG_USE_DEF_DOM_OPS'
           .flags  = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
                      ^
   drivers/irqchip/irq-imx-mu-msi.c:131:39: error: use of undeclared identifier 'MSI_FLAG_USE_DEF_CHIP_OPS'
           .flags  = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
                                                 ^
   drivers/irqchip/irq-imx-mu-msi.c:130:31: error: variable has incomplete type 'struct msi_domain_info'
   static struct msi_domain_info imx_mu_msi_domain_info = {
                                 ^
   drivers/irqchip/irq-imx-mu-msi.c:130:15: note: forward declaration of 'struct msi_domain_info'
   static struct msi_domain_info imx_mu_msi_domain_info = {
                 ^
   drivers/irqchip/irq-imx-mu-msi.c:203:3: error: field designator 'alloc' does not refer to any field in type 'const struct irq_domain_ops'
           .alloc  = imx_mu_msi_domain_irq_alloc,
            ^
   drivers/irqchip/irq-imx-mu-msi.c:204:3: error: field designator 'free' does not refer to any field in type 'const struct irq_domain_ops'
           .free   = imx_mu_msi_domain_irq_free,
            ^
   drivers/irqchip/irq-imx-mu-msi.c:241:25: error: call to undeclared function 'platform_msi_create_irq_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           msi_data->msi_domain = platform_msi_create_irq_domain(
                                  ^
   drivers/irqchip/irq-imx-mu-msi.c:295:32: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
           struct imx_mu_msi *msi_data, *priv;
                                         ^
   1 warning and 8 errors generated.


vim +/irq_chip_ack_parent +124 drivers/irqchip/irq-imx-mu-msi.c

   121	
   122	static struct irq_chip imx_mu_msi_irq_chip = {
   123		.name = "MU-MSI",
 > 124		.irq_ack = irq_chip_ack_parent,
   125	};
   126	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

