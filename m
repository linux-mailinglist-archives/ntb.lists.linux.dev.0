Return-Path: <ntb+bounces-198-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E745A9EC1
	for <lists+linux-ntb@lfdr.de>; Thu,  1 Sep 2022 20:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0775F280BEC
	for <lists+linux-ntb@lfdr.de>; Thu,  1 Sep 2022 18:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02F46D3F;
	Thu,  1 Sep 2022 18:16:56 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D64C6AD6
	for <ntb@lists.linux.dev>; Thu,  1 Sep 2022 18:16:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id fa2so10240159pjb.2
        for <ntb@lists.linux.dev>; Thu, 01 Sep 2022 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UHJ+wNg6rHSLjNi/6t6DVtAkUVcspchblfn/eFkKqsw=;
        b=HrJjbOMAscprcYO5PohMvHxByNRc1LKXTo6sQZuSzgC2XApf6bfM9LFErgYqRzoCgj
         dxDAMu9X4lyR7NRhOF5reb+70GOQgQhspYNlzgiePz3BU2vBiOTc/wCgQOTBX1nvY3rl
         gRAOXKbMZo6iWwdxi5XCFMyWAK0sm8241MmfzJSwrIHCME8q/lKFVw54cv+mMAQPeY+I
         CceuLNc7YMKHS9J6H0rqi3cuooZ6w2KLQeRcyB+ueRMsAHpJMRLidojb13a8cxBWurte
         4EKxdLd+1K5ihRfvnqll1rCH5Gk6uP70mqHUGIq9SNVjwOl+S/rBWIvlyRybEnmgp4Fk
         MA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UHJ+wNg6rHSLjNi/6t6DVtAkUVcspchblfn/eFkKqsw=;
        b=4V3wOZZ5rgo1CxRCm6UdKyYAppUCHEe8H1yXrUG41Vh10BLpBDaO6XfhSlU7iY9UAd
         qPhTDTNFH0zPAVS/kY0jZW1cAhqP7uLo4v8nm1AKfa0kYjgA9BDoHM0m8tFAw0Deo8rv
         vj0zkgNnMdH7iOPzLhfFJgGhmnwJcr4EsLhe/vSoOY1wuIUgmbXJxVML/HjByRvyhNkj
         9HQP7XjfVdw2Xasc+T2OC6TYh3mdv717mbwjadrX/fCEvR01lLOAte/MCShSoUMRRj2Z
         2yHPrksjOR3fyI3ii218ORbeyKW+anIaFPuBbdxNY8eo+yINAN1jqCxUeZ+lIgAFL34Z
         +fQw==
X-Gm-Message-State: ACgBeo20hRDOmXMuXU6RlpVGR+p0O/LZkgYP1MDVFpDGtnjQWgRzw9CL
	ROVSUigbI0kAOjiGGb7somncQQ==
X-Google-Smtp-Source: AA6agR6b8r7oRaI6ROi7pyqAyUtxNINQwKB8079M56A+1+FEt2RYm/zemPHbg56SBzgLUP1mE90YiA==
X-Received: by 2002:a17:903:22c7:b0:175:3682:9cf5 with SMTP id y7-20020a17090322c700b0017536829cf5mr11191184plg.150.1662056214062;
        Thu, 01 Sep 2022 11:16:54 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b0017519b86996sm6320538plh.218.2022.09.01.11.16.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2022 11:16:53 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: chenzhuo.1@bytedance.com,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 0/3] PCI/AER: Fix and optimize usage of status clear api
Date: Fri,  2 Sep 2022 02:16:31 +0800
Message-Id: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series contains some fixes and optimizations of aer api usage.
We add some process to clear uncorrectable error status, then add
distinction between fatal and nonfatal situations in pcie_do_recovery()
and reduce some redundant code. The series involves pci driver and
vendor driver.

Thanks,
Zhuo Chen

Zhuo Chen (3):
  PCI/AER: Use pci_aer_clear_uncorrect_error_status() to clear
    uncorrectable error status
  PCI/ERR: Clear fatal status in pcie_do_recovery()
  PCI/AER: Use pci_aer_raw_clear_status() to clear root port's AER error
    status

 drivers/ntb/hw/idt/ntb_hw_idt.c |  4 ++--
 drivers/pci/pci.h               |  2 ++
 drivers/pci/pcie/aer.c          | 30 +++++++++++++++++++-----------
 drivers/pci/pcie/dpc.c          |  3 +--
 drivers/pci/pcie/err.c          |  8 ++++++--
 drivers/scsi/lpfc/lpfc_attr.c   |  4 ++--
 include/linux/aer.h             |  4 ++--
 7 files changed, 34 insertions(+), 21 deletions(-)

-- 
2.30.1 (Apple Git-130)


