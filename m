Return-Path: <ntb+bounces-58-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9FD55BBC0
	for <lists+linux-ntb@lfdr.de>; Mon, 27 Jun 2022 21:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 4550B2E09F8
	for <lists+linux-ntb@lfdr.de>; Mon, 27 Jun 2022 19:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE873D6B;
	Mon, 27 Jun 2022 19:40:54 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813C83D68
	for <ntb@lists.linux.dev>; Mon, 27 Jun 2022 19:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656358852; x=1687894852;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8CuvkP0vcHWHYz4O+MpXmhInxvjdtTkynfXQVhQtVvU=;
  b=k6zUTvFJKgtc5OFbeAry6vgypr945i7FrCKf1UUKCPV9JGFqQPwLkvHH
   C+msc8m9cYee/uMGPrzg9zepGRLy1P2lcMyMkhIjSQXXwsT8CR2NGMAem
   nhhRaHaVuGI6OC+/Ti/y0mrladebnRkqlDB0Z6XZopszXphmFT6HwD1uZ
   77wHXqdDcoPEmJNbRgeZgH1OFNPdD4Pn/Xeby//aXSDAMzj8wD+vgbPzA
   B8mMOXEL8UwnjbnPn0VhbEVkEI1jK0jzpFbrpkFKiwKQmxcw1gCCsD0Am
   dlnhlOCwxFp4klmFVjfr6K95EnsyX0zm8gAfjLbG3Fffsm+r2Mu9xw8Qi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="270291911"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="270291911"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 12:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="766877478"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Jun 2022 12:40:46 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5ubG-0008wF-9g;
	Mon, 27 Jun 2022 19:40:46 +0000
Date: Tue, 28 Jun 2022 03:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sound-open-firmware@alsa-project.org, ntb@lists.linux.dev,
 mjpeg-users@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 aab35c3d5112df6e329a1a5a5a1881e5c4ca3821
Message-ID: <62ba07b9.qFa7tsWUZhZoW2FF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: aab35c3d5112df6e329a1a5a5a1881e5c4ca3821  Add linux-next specific files for 20220627

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/interrupt.c:542:55: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1025:33: warning: variable 'pre_connection_type' set but not used [-Wunused-but-set-variable]
drivers/ntb/test/ntb_perf.c:1145: undefined reference to `__umoddi3'
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
vmlinux.o: warning: objtool: __ct_user_enter+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_enter+0x19: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_enter+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_exit+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter_state+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x53: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_nmi_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/acpi/scan.c:615:35: warning: Uninitialized variable: acpi_device_bus_id->bus_id [uninitvar]
drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
drivers/soc/mediatek/mtk-mutex.c:799:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36016.c:430:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36050.c:829:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36060.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/thunderbolt/tmu.c:758:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
sound/soc/sof/intel/mtl.c:547:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   |-- drivers-soc-mediatek-mtk-mutex.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36016.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36050.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36060.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-thunderbolt-tmu.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   `-- sound-soc-sof-intel-mtl.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-randconfig-a013-20220627
|   `-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|-- i386-randconfig-m021-20220627
|   `-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
|-- i386-randconfig-p001-20220627
|   `-- drivers-acpi-scan.c:warning:Uninitialized-variable:acpi_device_bus_id-bus_id-uninitvar
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- powerpc-allmodconfig
|   |-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- powerpc-allnoconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-buildonly-randconfig-r003-20220627
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-buildonly-randconfig-r005-20220627
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- powerpc-randconfig-r023-20220627
|   `-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- riscv-randconfig-r012-20220627
|   |-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- s390-buildonly-randconfig-r001-20220627
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- sparc-randconfig-r032-20220627
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- x86_64-randconfig-a011-20220627
|   |-- vmlinux.o:warning:objtool:__ct_user_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_idle_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_idle_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_irq_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_irq_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_enter_state:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_exit_state:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   `-- vmlinux.o:warning:objtool:ct_nmi_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|-- x86_64-randconfig-m001-20220627
|   `-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
`-- xtensa-randconfig-r024-20220627
    `-- drivers-ntb-test-ntb_perf.c:undefined-reference-to-__umoddi3

clang_recent_errors
`-- riscv-randconfig-c006-20220617
    `-- drivers-phy-qualcomm-phy-qcom-qmp-combo.c:warning:Value-stored-to-qmp-during-its-initialization-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 726m

configs tested: 52
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a016-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a013-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a016-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
i386                 randconfig-a001-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a004-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

