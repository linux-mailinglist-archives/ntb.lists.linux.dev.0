Return-Path: <ntb+bounces-1226-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1BFA7CBC3
	for <lists+linux-ntb@lfdr.de>; Sat,  5 Apr 2025 22:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022301890054
	for <lists+linux-ntb@lfdr.de>; Sat,  5 Apr 2025 20:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B58D1AAA32;
	Sat,  5 Apr 2025 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apQqujuK"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163A1A840D;
	Sat,  5 Apr 2025 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743883441; cv=none; b=Q3FHZyExe+kJjvjYCqXSRRTlwW3oBu1XnZmjoXoBT3MUh6289MhNagm8o9XefFv02bR1W3jDWWkpt8WKKrA8XVmoiKkKTJrWfmJXd5W9FCzH7OyUXkV0zqzSP4kVmIZk3UdMsxX++BFbch8DWHfzsFJCHKdLkfvSlWun2Glh76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743883441; c=relaxed/simple;
	bh=FWBwk0Cr/rThQ6vVS3vU5yEyW68sRp7Z4RBTakOBlAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSXpmPWyYkSIFe7nId/HEQkdT4khPpxIjmBCSeqPYbKPu7d3fNQgBzUJuAci5qIccSX4xzwJ9uZJCSQ2GF+uRUcDk4ZcyM7QA2Axr48CscXBhSJvwqjYzWkh895FLT4TxM6IQ/wkTnPr+X4AbBTsZr5TJwC1pnb22BwoQ6NxENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apQqujuK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743883439; x=1775419439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FWBwk0Cr/rThQ6vVS3vU5yEyW68sRp7Z4RBTakOBlAc=;
  b=apQqujuKAtKyfPrPAJQ/fspgMZEMdZP80CUQjgS5C0Z/WkDmZNL3Phsw
   IiKsEQdNPaB+Ou/PhQFSXM8SLgwRulH0Px8VgYp3HbFFkvcUSXj/94zVm
   p+bw6e+lfvPHbcpRha2sQFFQZfdVnOWokterp5/1rCX5937lt8JUFd9qx
   nqRSwibpXO8fnwnGNS8uJXs/jbXXvnCM2bUffQwW+tS7vJs6QYfyz5laX
   sxMsTwy1VHK3OJGDJ/AdIGD0Y9Yoimxgv3AKNEL19rxobmA/TcEv6rG0/
   JUMz8YFVmbol/CAkwQ/Bpl4Y8+oxlkTD6kUeVbKyU51/LBhL+twSLDNSd
   Q==;
X-CSE-ConnectionGUID: l0GdMqSqTvGG/fLC45kptg==
X-CSE-MsgGUID: BW8iEZhuT2Ko1MdOKBI68g==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45191873"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="45191873"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 13:03:58 -0700
X-CSE-ConnectionGUID: uZExyyHDSgOxAu6cWrxDvw==
X-CSE-MsgGUID: AAqF7o+hRF2OuKRfTw9AfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="128081559"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2025 13:03:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u19k7-0002FD-2q;
	Sat, 05 Apr 2025 20:03:51 +0000
Date: Sun, 6 Apr 2025 04:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] PCI: endpoint: add epc_feature argument for
 pci_epf_free_space()
Message-ID: <202504060315.dkEQSXkB-lkp@intel.com>
References: <20250404-pci-ep-size-alignment-v2-1-c3a0db4cfc57@baylibre.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-pci-ep-size-alignment-v2-1-c3a0db4cfc57@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build errors:

[auto build test ERROR on dea140198b846f7432d78566b7b0b83979c72c2b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/PCI-endpoint-add-epc_feature-argument-for-pci_epf_free_space/20250405-014733
base:   dea140198b846f7432d78566b7b0b83979c72c2b
patch link:    https://lore.kernel.org/r/20250404-pci-ep-size-alignment-v2-1-c3a0db4cfc57%40baylibre.com
patch subject: [PATCH v2 1/3] PCI: endpoint: add epc_feature argument for pci_epf_free_space()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250406/202504060315.dkEQSXkB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060315.dkEQSXkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060315.dkEQSXkB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/target/pci-epf.c:2165:69: error: too few arguments to function call, expected 5, have 4
    2165 |         pci_epf_free_space(epf, nvme_epf->reg_bar, BAR_0, PRIMARY_INTERFACE);
         |         ~~~~~~~~~~~~~~~~~~                                                 ^
   include/linux/pci-epf.h:224:6: note: 'pci_epf_free_space' declared here
     224 | void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
         |      ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     225 |                         const struct pci_epc_features *epc_features,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     226 |                         enum pci_epc_interface_type type);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2165 drivers/nvme/target/pci-epf.c

0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2157  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2158  static void nvmet_pci_epf_free_bar(struct nvmet_pci_epf *nvme_epf)
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2159  {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2160  	struct pci_epf *epf = nvme_epf->epf;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2161  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2162  	if (!nvme_epf->reg_bar)
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2163  		return;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2164  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04 @2165  	pci_epf_free_space(epf, nvme_epf->reg_bar, BAR_0, PRIMARY_INTERFACE);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2166  	nvme_epf->reg_bar = NULL;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2167  }
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  2168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

