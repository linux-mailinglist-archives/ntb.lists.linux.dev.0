Return-Path: <ntb+bounces-249-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6135BBDD9
	for <lists+linux-ntb@lfdr.de>; Sun, 18 Sep 2022 14:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB9D280C3C
	for <lists+linux-ntb@lfdr.de>; Sun, 18 Sep 2022 12:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03846810;
	Sun, 18 Sep 2022 12:53:40 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51D80C;
	Sun, 18 Sep 2022 12:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663505617; x=1695041617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIdiSWaX7Uitc1QR0Z7rthV8TdGu0odC19sBfo6JySg=;
  b=GRwVakgUi9PrvSNY2dEmUg4cYDdv56qiuheDmri+0d3zbLT8egwcV6kA
   LPqbxs69rOi1nXD4bSI9VQrI/iY19Klm8U1cdGYepxepwnSc8EzYm8JzS
   quFtLgJ0+5lBoHaD/ZtoLc8MHQRMFxOyTMGXbmqeAv5rlr0g7Ir0xtp6h
   9ty1mYMPrEoKDyEm3SfzcTBITb6H6KV0tHJS2gvZziahUqMpWOQt9Czer
   kXfKrW+REmv8MbSPfDKYfaEiV7mONAwk4cMkWIBpZSx/VGQpylgl141w4
   gqiJRSj2VMFwm2CchPQ2b124YXay9YWCTgelVo48QJYeuccVJyTQw6snu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="360970056"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="360970056"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 05:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="743821151"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2022 05:53:31 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZtne-0001C3-2M;
	Sun, 18 Sep 2022 12:53:30 +0000
Date: Sun, 18 Sep 2022 20:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, maz@kernel.org, tglx@linutronix.de,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kw@linux.com,
	bhelgaas@google.com
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, peng.fan@nxp.com, aisheng.dong@nxp.com,
	jdmason@kudzu.us, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com,
	ntb@lists.linux.dev, lznuaa@gmail.com, imx@lists.linux.dev,
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v10 5/6] PCI: endpoint: makeup pci-epf-vntb.c
Message-ID: <202209182035.SS1p5KkG-lkp@intel.com>
References: <20220913210957.3493826-6-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913210957.3493826-6-Frank.Li@nxp.com>

Hi Frank,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jonmason-ntb/ntb-next]
[also build test WARNING on driver-core/driver-core-testing linus/master v6.0-rc5 next-20220916]
[cannot apply to tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/platform-msi-export-symbol-platform_msi_create_irq_domain/20220914-060955
base:   https://github.com/jonmason/ntb ntb-next
config: mips-randconfig-s042-20220918 (https://download.01.org/0day-ci/archive/20220918/202209182035.SS1p5KkG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/c0b811e4bf3a50a612ed143d284880e09790eff5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frank-Li/platform-msi-export-symbol-platform_msi_create_irq_domain/20220914-060955
        git checkout c0b811e4bf3a50a612ed143d284880e09790eff5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:258:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:258:47: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/pci/endpoint/functions/pci-epf-vntb.c:258:47: sparse:     got void *
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:260:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:260:47: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/pci/endpoint/functions/pci-epf-vntb.c:260:47: sparse:     got void *
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *virt_addr @@     got void *[assigned] mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse:     expected void [noderef] __iomem *virt_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse:     got void *[assigned] mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1106:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1106:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1106:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1117:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1117:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1117:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1128:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1128:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1128:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1140:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1140:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1140:33: sparse:     got struct epf_ntb_ctrl *reg

vim +258 drivers/pci/endpoint/functions/pci-epf-vntb.c

   236	
   237	/**
   238	 * epf_ntb_cmd_handler() - Handle commands provided by the NTB Host
   239	 * @work: work_struct for the epf_ntb_epc
   240	 *
   241	 * Workqueue function that gets invoked for the two epf_ntb_epc
   242	 * periodically (once every 5ms) to see if it has received any commands
   243	 * from NTB host. The host can send commands to configure doorbell or
   244	 * configure memory window or to update link status.
   245	 */
   246	static void epf_ntb_cmd_handler(struct work_struct *work)
   247	{
   248		struct epf_ntb_ctrl *ctrl;
   249		u32 command, argument;
   250		struct epf_ntb *ntb;
   251		struct device *dev;
   252		int ret;
   253		int i;
   254	
   255		ntb = container_of(work, struct epf_ntb, cmd_handler.work);
   256	
   257		for (i = 1; i < ntb->db_count; i++) {
 > 258			if (readl_relaxed(ntb->epf_db + i * ENTRY_SIZE)) {
   259				ntb_db_event(&ntb->ntb, i);
 > 260				writel(0, ntb->epf_db + i * ENTRY_SIZE);
   261			}
   262		}
   263	
   264		ctrl = ntb->reg;
   265		command = ctrl->command;
   266		if (!command)
   267			goto reset_handler;
   268		argument = ctrl->argument;
   269	
   270		ctrl->command = 0;
   271		ctrl->argument = 0;
   272	
   273		ctrl = ntb->reg;
   274		dev = &ntb->epf->dev;
   275	
   276		switch (command) {
   277		case COMMAND_CONFIGURE_DOORBELL:
   278			ctrl->command_status = COMMAND_STATUS_OK;
   279			break;
   280		case COMMAND_TEARDOWN_DOORBELL:
   281			ctrl->command_status = COMMAND_STATUS_OK;
   282			break;
   283		case COMMAND_CONFIGURE_MW:
   284			ret = epf_ntb_configure_mw(ntb, argument);
   285			if (ret < 0)
   286				ctrl->command_status = COMMAND_STATUS_ERROR;
   287			else
   288				ctrl->command_status = COMMAND_STATUS_OK;
   289			break;
   290		case COMMAND_TEARDOWN_MW:
   291			epf_ntb_teardown_mw(ntb, argument);
   292			ctrl->command_status = COMMAND_STATUS_OK;
   293			break;
   294		case COMMAND_LINK_UP:
   295			ntb->linkup = true;
   296			ret = epf_ntb_link_up(ntb, true);
   297			if (ret < 0)
   298				ctrl->command_status = COMMAND_STATUS_ERROR;
   299			else
   300				ctrl->command_status = COMMAND_STATUS_OK;
   301			goto reset_handler;
   302		case COMMAND_LINK_DOWN:
   303			ntb->linkup = false;
   304			ret = epf_ntb_link_up(ntb, false);
   305			if (ret < 0)
   306				ctrl->command_status = COMMAND_STATUS_ERROR;
   307			else
   308				ctrl->command_status = COMMAND_STATUS_OK;
   309			break;
   310		default:
   311			dev_err(dev, "UNKNOWN command: %d\n", command);
   312			break;
   313		}
   314	
   315	reset_handler:
   316		queue_delayed_work(kpcintb_workqueue, &ntb->cmd_handler,
   317				   msecs_to_jiffies(5));
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

