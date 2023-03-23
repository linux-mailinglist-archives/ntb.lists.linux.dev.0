Return-Path: <ntb+bounces-460-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE086C698D
	for <lists+linux-ntb@lfdr.de>; Thu, 23 Mar 2023 14:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F660280A75
	for <lists+linux-ntb@lfdr.de>; Thu, 23 Mar 2023 13:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E417C9446;
	Thu, 23 Mar 2023 13:33:00 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E88F6D;
	Thu, 23 Mar 2023 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679578378; x=1711114378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uqQSc+v2/TMDzubfF7ygdSeqEdNvDr6jR/3c2Yhry5Q=;
  b=P/pFwZSsYD4lJWhTjdkUwan1xr5qqZt5y8ia86YcLCW3iJS/qUG5yvVm
   As9JC/2Nm0UItSLz9LsC+zUmQUbbVViDi45MivtiwB2Ld5xuoLlhgwzf5
   DcSoYXaD9IrNS9rGTn7VrYwcyt5kcChDIhMXfdwFnnfGnsU3MxIvKylcG
   cB5IccNWjFP5L3dT8an0n12EorwxO+zwhZVuBFswT55knKZnPKIKcAoUz
   HMEJGrEsO+iF1g9odRjnriQ6BL4jxfsHbpsF7Bytj7x9eiA2AydX3+QUo
   ugXgvhTcPfcvOY5uIiu3rgEfniaLkzY/io+5TdBbUARd/pmJEAMklSwj2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341031974"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341031974"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746711569"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746711569"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:15:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfKms-000ENk-2n;
	Thu, 23 Mar 2023 13:15:26 +0000
Date: Thu, 23 Mar 2023 21:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	ntb@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ntb: epf: Remove redundant pci_clear_master
Message-ID: <202303232151.ldN29HC6-lkp@intel.com>
References: <20230323115336.12986-2-cai.huoqing@linux.dev>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323115336.12986-2-cai.huoqing@linux.dev>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on jonmason-ntb/ntb-next]
[also build test ERROR on linus/master v6.3-rc3 next-20230323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/ntb-epf-Remove-redundant-pci_clear_master/20230323-195616
base:   https://github.com/jonmason/ntb ntb-next
patch link:    https://lore.kernel.org/r/20230323115336.12986-2-cai.huoqing%40linux.dev
patch subject: [PATCH 2/3] ntb: epf: Remove redundant pci_clear_master
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303232151.ldN29HC6-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aa42a659eb567a583441b91cb47fd1727fa714df
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/ntb-epf-Remove-redundant-pci_clear_master/20230323-195616
        git checkout aa42a659eb567a583441b91cb47fd1727fa714df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/ntb/hw/epf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232151.ldN29HC6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ntb/hw/epf/ntb_hw_epf.c: In function 'ntb_epf_init_pci':
>> drivers/ntb/hw/epf/ntb_hw_epf.c:609:25: error: label 'err_dma_mask' used but not defined
     609 |                         goto err_dma_mask;
         |                         ^~~~


vim +/err_dma_mask +609 drivers/ntb/hw/epf/ntb_hw_epf.c

812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  565  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  566  static int ntb_epf_init_pci(struct ntb_epf_dev *ndev,
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  567  			    struct pci_dev *pdev)
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  568  {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  569  	struct device *dev = ndev->dev;
e75d5ae8ab88b7 Frank Li               2022-02-22  570  	size_t spad_sz, spad_off;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  571  	int ret;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  572  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  573  	pci_set_drvdata(pdev, ndev);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  574  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  575  	ret = pci_enable_device(pdev);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  576  	if (ret) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  577  		dev_err(dev, "Cannot enable PCI device\n");
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  578  		goto err_pci_enable;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  579  	}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  580  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  581  	ret = pci_request_regions(pdev, "ntb");
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  582  	if (ret) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  583  		dev_err(dev, "Cannot obtain PCI resources\n");
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  584  		goto err_pci_regions;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  585  	}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  586  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  587  	pci_set_master(pdev);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  588  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  589  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  590  	if (ret) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  591  		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  592  		if (ret) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  593  			dev_err(dev, "Cannot set DMA mask\n");
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  594  			goto err_dma_mask;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  595  		}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  596  		dev_warn(&pdev->dev, "Cannot DMA highmem\n");
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  597  	}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  598  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  599  	ndev->ctrl_reg = pci_iomap(pdev, ndev->ctrl_reg_bar, 0);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  600  	if (!ndev->ctrl_reg) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  601  		ret = -EIO;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  602  		goto err_dma_mask;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  603  	}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  604  
e75d5ae8ab88b7 Frank Li               2022-02-22  605  	if (ndev->peer_spad_reg_bar) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  606  		ndev->peer_spad_reg = pci_iomap(pdev, ndev->peer_spad_reg_bar, 0);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  607  		if (!ndev->peer_spad_reg) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  608  			ret = -EIO;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02 @609  			goto err_dma_mask;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  610  		}
e75d5ae8ab88b7 Frank Li               2022-02-22  611  	} else {
e75d5ae8ab88b7 Frank Li               2022-02-22  612  		spad_sz = 4 * readl(ndev->ctrl_reg + NTB_EPF_SPAD_COUNT);
e75d5ae8ab88b7 Frank Li               2022-02-22  613  		spad_off = readl(ndev->ctrl_reg + NTB_EPF_SPAD_OFFSET);
e75d5ae8ab88b7 Frank Li               2022-02-22  614  		ndev->peer_spad_reg = ndev->ctrl_reg + spad_off  + spad_sz;
e75d5ae8ab88b7 Frank Li               2022-02-22  615  	}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  616  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  617  	ndev->db_reg = pci_iomap(pdev, ndev->db_reg_bar, 0);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  618  	if (!ndev->db_reg) {
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  619  		ret = -EIO;
aa42a659eb567a Cai Huoqing            2023-03-23  620  		goto err_pci_regions;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  621  	}
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  622  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  623  	return 0;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  624  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  625  err_pci_regions:
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  626  	pci_disable_device(pdev);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  627  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  628  err_pci_enable:
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  629  	pci_set_drvdata(pdev, NULL);
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  630  
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  631  	return ret;
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  632  }
812ce2f8d14ea7 Kishon Vijay Abraham I 2021-02-02  633  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

