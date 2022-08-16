Return-Path: <ntb+bounces-156-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E12595571
	for <lists+linux-ntb@lfdr.de>; Tue, 16 Aug 2022 10:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BE331C20939
	for <lists+linux-ntb@lfdr.de>; Tue, 16 Aug 2022 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE032F32;
	Tue, 16 Aug 2022 08:40:00 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310812F26;
	Tue, 16 Aug 2022 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660639198; x=1692175198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSEQvzyLuQNM7I4Q/O8zTlnKSg2x78+IvGBFvjba1ps=;
  b=nKCb98AGiWW42ZKDYnFkCLA/2gP4wyEraEHk5KaXljEeRhZc0bvHXttJ
   BK//0HJ0ncBN8hU+rnlfI8eEuC7zlrf4TL6WxjMmnNlvJsC00/oGg96WH
   7RYkMLvl1duUBDNZ/YKUx6j0cFOonsyGH8ydY5luirAfCtQleW3hiCKsB
   0ukCw5yiirvdVQIoQEVnCh6AL5iL6zoy2PI7Ofc/Hp3d7/JWyr2QtIpha
   OI387o3jH14ywXycPl3WbxS7wtnw1yumeGPNdSONfYWmbezTfOR2G+UuT
   wX5DDFC5hYoRaNOtLJXkVjt7UlMHiGjJ/L1EFuJAbiyYvjqmMtxoBT8eV
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292160467"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="292160467"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 01:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="710058969"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2022 01:39:52 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNs74-0001dx-2Y;
	Tue, 16 Aug 2022 08:39:50 +0000
Date: Tue, 16 Aug 2022 16:39:05 +0800
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
Message-ID: <202208161638.7Rn1SHT2-lkp@intel.com>
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on jonmason-ntb/ntb-next]
[also build test WARNING on robh/for-next linus/master v6.0-rc1 next-20220816]
[cannot apply to tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/PCI-EP-driver-support-MSI-doorbell-from-host/20220816-131930
base:   https://github.com/jonmason/ntb ntb-next
config: arm64-randconfig-r025-20220815 (https://download.01.org/0day-ci/archive/20220816/202208161638.7Rn1SHT2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/71296e2ad757d90e870b2ab81f2b06b9c76e7c41
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frank-Li/PCI-EP-driver-support-MSI-doorbell-from-host/20220816-131930
        git checkout 71296e2ad757d90e870b2ab81f2b06b9c76e7c41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-mu-msi.c:295:32: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
           struct imx_mu_msi *msi_data, *priv;
                                         ^
   1 warning generated.


vim +/priv +295 drivers/irqchip/irq-imx-mu-msi.c

   288	
   289	static int __init imx_mu_of_init(struct device_node *dn,
   290					 struct device_node *parent,
   291					 const struct imx_mu_dcfg *cfg
   292					)
   293	{
   294		struct platform_device *pdev = of_find_device_by_node(dn);
 > 295		struct imx_mu_msi *msi_data, *priv;
   296		struct device_link *pd_link_a;
   297		struct device_link *pd_link_b;
   298		struct resource *res;
   299		struct device *pd_a;
   300		struct device *pd_b;
   301		struct device *dev;
   302		int ret;
   303		int irq;
   304	
   305		if (!pdev)
   306			return -ENODEV;
   307	
   308		dev = &pdev->dev;
   309	
   310		priv = msi_data = devm_kzalloc(&pdev->dev, sizeof(*msi_data), GFP_KERNEL);
   311		if (!msi_data)
   312			return -ENOMEM;
   313	
   314		msi_data->cfg = cfg;
   315	
   316		msi_data->regs = devm_platform_ioremap_resource_byname(pdev, "processor a-facing");
   317		if (IS_ERR(msi_data->regs)) {
   318			dev_err(&pdev->dev, "failed to initialize 'regs'\n");
   319			return PTR_ERR(msi_data->regs);
   320		}
   321	
   322		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "processor b-facing");
   323		if (!res)
   324			return -EIO;
   325	
   326		msi_data->msiir_addr = res->start + msi_data->cfg->xTR;
   327	
   328		irq = platform_get_irq(pdev, 0);
   329		if (irq <= 0)
   330			return -ENODEV;
   331	
   332		platform_set_drvdata(pdev, msi_data);
   333	
   334		msi_data->clk = devm_clk_get(dev, NULL);
   335		if (IS_ERR(msi_data->clk)) {
   336			if (PTR_ERR(msi_data->clk) != -ENOENT)
   337				return PTR_ERR(msi_data->clk);
   338	
   339			msi_data->clk = NULL;
   340		}
   341	
   342		pd_a = dev_pm_domain_attach_by_name(dev, "processor a-facing");
   343		if (IS_ERR(pd_a))
   344			return PTR_ERR(pd_a);
   345	
   346		pd_b = dev_pm_domain_attach_by_name(dev, "processor b-facing");
   347		if (IS_ERR(pd_b))
   348			return PTR_ERR(pd_b);
   349	
   350		pd_link_a = device_link_add(dev, pd_a,
   351				DL_FLAG_STATELESS |
   352				DL_FLAG_PM_RUNTIME |
   353				DL_FLAG_RPM_ACTIVE);
   354	
   355		if (!pd_link_a) {
   356			dev_err(dev, "Failed to add device_link to mu a.\n");
   357			goto err_pd_a;
   358		}
   359	
   360		pd_link_b = device_link_add(dev, pd_b,
   361				DL_FLAG_STATELESS |
   362				DL_FLAG_PM_RUNTIME |
   363				DL_FLAG_RPM_ACTIVE);
   364	
   365	
   366		if (!pd_link_b) {
   367			dev_err(dev, "Failed to add device_link to mu a.\n");
   368			goto err_pd_b;
   369		}
   370	
   371		ret = imx_mu_msi_domains_init(msi_data, dev);
   372		if (ret)
   373			goto err_dm_init;
   374	
   375		irq_set_chained_handler_and_data(irq,
   376						 imx_mu_msi_irq_handler,
   377						 msi_data);
   378	
   379		pm_runtime_enable(dev);
   380	
   381		return 0;
   382	
   383	err_dm_init:
   384		device_link_remove(dev,	pd_b);
   385	err_pd_b:
   386		device_link_remove(dev, pd_a);
   387	err_pd_a:
   388		return -EINVAL;
   389	}
   390	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

