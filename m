Return-Path: <ntb+bounces-27-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926B5091C5
	for <lists+linux-ntb@lfdr.de>; Wed, 20 Apr 2022 23:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28A8280A76
	for <lists+linux-ntb@lfdr.de>; Wed, 20 Apr 2022 21:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5809A1FA5;
	Wed, 20 Apr 2022 21:10:14 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C407A
	for <ntb@lists.linux.dev>; Wed, 20 Apr 2022 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650489011; x=1682025011;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qfPmzOXCy/jS0SbJp3UivrAfDR/oQbAAo+F+9aVF3VE=;
  b=d0lGTuRuh+9q/zQjzh8czLIDwPsIBbJGgCr8wBr7fgdu1rBfCAFl3TH5
   Y7D+F7wy6GPpHNVPAsIChO7qCpUVXFTCn5FOP56kgcyYLK6RaliIngH0L
   0jTBTxhoL+bty0uxcT+jlTyUMMXiH5lL8Xbk+xHc326ENC3eqfXw1hrBZ
   3qUSQD7JbkBIXmsbFN89bJ07IQOaG+//76xy+eghOHz+hl73JV1vBXTdO
   nE7VFbNl0TtWVoDk4YIZwlL/mjZqok+oSSWNXfaXz1bH1TRB8OqAeu6Sr
   yxG4riTuac4MIkcfSbGGvPJcAMHSZ89OntII4f7RFqLX8cUC9YB1WAU8q
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263614543"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; 
   d="scan'208";a="263614543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 14:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; 
   d="scan'208";a="647826870"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2022 14:09:48 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhHa8-0007Se-4D;
	Wed, 20 Apr 2022 21:09:48 +0000
Date: Thu, 21 Apr 2022 05:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: patches@opensource.cirrus.com, ntb@lists.linux.dev,
 linux-mm@kvack.org, linux-media@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 io-uring@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 f1244c81da13009dbf61cb807f45881501c44789
Message-ID: <6260768f.VRPaab4qE9DNlcOi%lkp@intel.com>
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
branch HEAD: f1244c81da13009dbf61cb807f45881501c44789  Add linux-next specific files for 20220420

Error/Warning reports:

https://lore.kernel.org/linux-mm/202204081656.6x4pfen4-lkp@intel.com
https://lore.kernel.org/linux-mm/202204140108.DeRAhWEn-lkp@intel.com
https://lore.kernel.org/linux-mm/202204202059.7tV9FkRy-lkp@intel.com
https://lore.kernel.org/lkml/202204140043.Tx7BIBvI-lkp@intel.com
https://lore.kernel.org/llvm/202203241958.Uw9bWfMD-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-versatile/integrator_ap.c:148:13: warning: no previous prototype for 'ap_init_early' [-Wmissing-prototypes]
drivers/bus/mhi/host/main.c:787:13: warning: parameter 'event_quota' set but not used [-Wunused-but-set-parameter]
drivers/ntb/hw/idt/ntb_hw_idt.c:1116:1: warning: the frame size of 1288 bytes is larger than 1280 bytes [-Wframe-larger-than=]

Unverified Error/Warning (likely false positive, please contact us if interested):

Makefile:684: arch/h8300/Makefile: No such file or directory
arch/Kconfig:10: can't open file "arch/h8300/Kconfig"
arch/s390/include/asm/spinlock.h:81:3: error: unexpected token in '.rept' directive
arch/s390/include/asm/spinlock.h:81:3: error: unknown directive
arch/s390/include/asm/spinlock.h:81:3: error: unmatched '.endr' directive
arch/s390/lib/spinlock.c:78:3: error: unexpected token in '.rept' directive
arch/s390/lib/spinlock.c:78:3: error: unknown directive
arch/s390/lib/spinlock.c:78:3: error: unmatched '.endr' directive
drivers/dma-buf/st-dma-fence-unwrap.c:125:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
drivers/edac/edac_device.c:79 edac_device_alloc_ctl_info() warn: Please consider using kcalloc instead
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubp.c:57:6: warning: no previous prototype for 'hubp31_program_extended_blank' [-Wmissing-prototypes]
kernel/bpf/syscall.c:4944:13: warning: no previous prototype for function 'unpriv_ebpf_notify' [-Wmissing-prototypes]
make[1]: *** No rule to make target 'arch/h8300/Makefile'.
scripts/Makefile.clean:15: arch/h8300/Makefile: No such file or directory
sound/soc/codecs/wm8731.c:654:1: internal compiler error: Segmentation fault

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- alpha-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- alpha-randconfig-r024-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arc-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arc-randconfig-r002-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arc-randconfig-r043-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arm-integrator_defconfig
|   `-- arch-arm-mach-versatile-integrator_ap.c:warning:no-previous-prototype-for-ap_init_early
|-- arm-randconfig-c002-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- arm64-randconfig-c023-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- h8300-allyesconfig
|   |-- Makefile:arch-h8300-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-h8300-Kconfig
|   `-- make:No-rule-to-make-target-arch-h8300-Makefile-.
|-- h8300-randconfig-r003-20220420
|   `-- scripts-Makefile.clean:arch-h8300-Makefile:No-such-file-or-directory
|-- h8300-randconfig-r032-20220420
|   |-- Makefile:arch-h8300-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-h8300-Kconfig
|   `-- make:No-rule-to-make-target-arch-h8300-Makefile-.
|-- i386-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubp.c:warning:no-previous-prototype-for-hubp31_program_extended_blank
|-- i386-randconfig-m021
|   `-- drivers-edac-edac_device.c-edac_device_alloc_ctl_info()-warn:Please-consider-using-kcalloc-instead
|-- i386-randconfig-s001
|   |-- fs-io_uring.c:sparse:sparse:marked-inline-but-without-a-definition
|   |-- mm-memory.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t
|   `-- mm-memory.c:sparse:sparse:symbol-vma_needs_copy-was-not-declared.-Should-it-be-static
|-- i386-randconfig-s002
|   |-- fs-hugetlbfs-inode.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t-usertype
|   |-- mm-hugetlb.c:sparse:sparse:restricted-zap_flags_t-degrades-to-integer
|   |-- mm-memory.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t
|   `-- mm-memory.c:sparse:sparse:symbol-vma_needs_copy-was-not-declared.-Should-it-be-static
|-- ia64-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- ia64-buildonly-randconfig-r003-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- ia64-randconfig-c003-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- m68k-randconfig-r025-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- microblaze-randconfig-s031-20220420
|   |-- mm-memory.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t
|   `-- mm-memory.c:sparse:sparse:symbol-vma_needs_copy-was-not-declared.-Should-it-be-static
|-- mips-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- nios2-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- nios2-randconfig-r016-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- openrisc-randconfig-r004-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- powerpc64-randconfig-c024-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- powerpc64-randconfig-p002-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- powerpc64-randconfig-r003-20220420
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubp.c:warning:no-previous-prototype-for-hubp31_program_extended_blank
|-- powerpc64-randconfig-r033-20220420
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubp.c:warning:no-previous-prototype-for-hubp31_program_extended_blank
|-- riscv-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- riscv-randconfig-c023-20220420
|   `-- sound-soc-codecs-wm8731.c:internal-compiler-error:Segmentation-fault
|-- s390-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- s390-randconfig-r034-20220420
|   `-- drivers-ntb-hw-idt-ntb_hw_idt.c:warning:the-frame-size-of-bytes-is-larger-than-bytes
|-- sh-allmodconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- sparc-randconfig-c004-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- sparc-randconfig-m031-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- x86_64-randconfig-m001
|   `-- drivers-edac-edac_device.c-edac_device_alloc_ctl_info()-warn:Please-consider-using-kcalloc-instead
|-- x86_64-randconfig-s021
|   |-- fs-io_uring.c:sparse:sparse:marked-inline-but-without-a-definition
|   |-- mm-memory.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t
|   `-- mm-memory.c:sparse:sparse:symbol-vma_needs_copy-was-not-declared.-Should-it-be-static
|-- x86_64-randconfig-s022
|   |-- fs-hugetlbfs-inode.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t-usertype
|   |-- mm-hugetlb.c:sparse:sparse:restricted-zap_flags_t-degrades-to-integer
|   |-- mm-memory.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t
|   `-- mm-memory.c:sparse:sparse:symbol-vma_needs_copy-was-not-declared.-Should-it-be-static
|-- x86_64-rhel-8.3-kselftests
|   |-- fs-hugetlbfs-inode.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t-usertype
|   |-- fs-io_uring.c:sparse:sparse:marked-inline-but-without-a-definition
|   |-- mm-hugetlb.c:sparse:sparse:restricted-zap_flags_t-degrades-to-integer
|   |-- mm-memory.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-long-zap_flags-got-restricted-zap_flags_t
|   `-- mm-memory.c:sparse:sparse:symbol-vma_needs_copy-was-not-declared.-Should-it-be-static
|-- xtensa-allyesconfig
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|-- xtensa-randconfig-r013-20220420
|   `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
`-- xtensa-randconfig-r036-20220420
    `-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used

clang_recent_errors
|-- arm-randconfig-r005-20220420
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- arm-randconfig-r006-20220420
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- hexagon-buildonly-randconfig-r004-20220420
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- hexagon-randconfig-r041-20220420
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   `-- kernel-bpf-syscall.c:warning:no-previous-prototype-for-function-unpriv_ebpf_notify
|-- i386-randconfig-a011
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   `-- kernel-bpf-syscall.c:warning:no-previous-prototype-for-function-unpriv_ebpf_notify
|-- i386-randconfig-a013
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   `-- kernel-bpf-syscall.c:warning:no-previous-prototype-for-function-unpriv_ebpf_notify
|-- i386-randconfig-a015
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   `-- kernel-bpf-syscall.c:warning:no-previous-prototype-for-function-unpriv_ebpf_notify
|-- riscv-buildonly-randconfig-r005-20220420
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- riscv-randconfig-r042-20220420
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- s390-buildonly-randconfig-r006-20220420
|   |-- arch-s390-include-asm-spinlock.h:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unknown-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unmatched-.endr-directive
|   |-- arch-s390-lib-spinlock.c:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-lib-spinlock.c:error:unknown-directive
|   |-- arch-s390-lib-spinlock.c:error:unmatched-.endr-directive
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- s390-randconfig-r011-20220420
|   |-- arch-s390-include-asm-spinlock.h:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unknown-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unmatched-.endr-directive
|   |-- arch-s390-lib-spinlock.c:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-lib-spinlock.c:error:unknown-directive
|   |-- arch-s390-lib-spinlock.c:error:unmatched-.endr-directive
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- s390-randconfig-r044-20220420
|   |-- arch-s390-include-asm-spinlock.h:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unknown-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unmatched-.endr-directive
|   |-- arch-s390-lib-spinlock.c:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-lib-spinlock.c:error:unknown-directive
|   |-- arch-s390-lib-spinlock.c:error:unmatched-.endr-directive
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- x86_64-randconfig-a001
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   `-- kernel-bpf-syscall.c:warning:no-previous-prototype-for-function-unpriv_ebpf_notify
|-- x86_64-randconfig-a005
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|-- x86_64-randconfig-a012
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   `-- kernel-bpf-syscall.c:warning:no-previous-prototype-for-function-unpriv_ebpf_notify
|-- x86_64-randconfig-a014
|   `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
`-- x86_64-randconfig-a016
    `-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used

elapsed time: 735m

configs tested: 110
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
arm                       aspeed_g5_defconfig
sh                              ul2_defconfig
arc                        nsim_700_defconfig
arm                            qcom_defconfig
ia64                             alldefconfig
mips                  maltasmvp_eva_defconfig
powerpc                   motionpro_defconfig
sh                   secureedge5410_defconfig
sparc                            allyesconfig
arm                      jornada720_defconfig
arm                        shmobile_defconfig
s390                       zfcpdump_defconfig
powerpc                      bamboo_defconfig
arm                         nhk8815_defconfig
ia64                          tiger_defconfig
arc                     haps_hs_smp_defconfig
openrisc                         alldefconfig
arc                     nsimosci_hs_defconfig
m68k                        mvme147_defconfig
sh                        dreamcast_defconfig
mips                         cobalt_defconfig
sh                   rts7751r2dplus_defconfig
arm                  randconfig-c002-20220420
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
nios2                               defconfig
alpha                               defconfig
csky                                defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220420
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220420
powerpc                        icon_defconfig
arm                         shannon_defconfig
powerpc                      katmai_defconfig
mips                     loongson2k_defconfig
powerpc                      pmac32_defconfig
arm                         mv78xx0_defconfig
powerpc                  mpc885_ads_defconfig
mips                       lemote2f_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220420
s390                 randconfig-r044-20220420
hexagon              randconfig-r045-20220420
riscv                randconfig-r042-20220420

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

