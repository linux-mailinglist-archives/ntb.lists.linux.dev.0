Return-Path: <ntb+bounces-1169-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADDA650D1
	for <lists+linux-ntb@lfdr.de>; Mon, 17 Mar 2025 14:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904E83A1723
	for <lists+linux-ntb@lfdr.de>; Mon, 17 Mar 2025 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3142236F8;
	Mon, 17 Mar 2025 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yr6pc4Xe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EaILQh/X"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBCE7DA8C
	for <ntb@lists.linux.dev>; Mon, 17 Mar 2025 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218165; cv=none; b=LxcNtKz1CStkP/FS6Uhqy1v9k5HzmNwNAf+RJyeEFzOn4xjbs++XqYKUCJDzQtPtCV39Jfu62uXZn7cRnRRHdBJRGE69Vsein3DVI+iZt4U8r5tRRM7dGx902/nJFDoM9KXVhxXLaYQs2epFYsGhZDh6MbBZ0I60qbGAyg8Imkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218165; c=relaxed/simple;
	bh=H5ugNwb/4njRzQNXYV96KTDFYqXK4NXqoPzX+JIOneY=;
	h=Message-ID:From:To:Cc:Subject:Date; b=RCm8RHFIMCnbsKPzm7/K4/wJIORoXIUhl5OV+Wzaqv1Y1Q8GvaHlzbuytgcro695Yvgg8hgN9a8sElkF6Vg6awX4Z0Y+op+oa9Q4dkHrJ3AKLhQGl9rOxUTuWzZoczaacwQDNaIUjRJr5cMASPx5gDYI74+oz9DMoqUz5WciXis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yr6pc4Xe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EaILQh/X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250317092919.008573387@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742218162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=/tkx7mGZE55fKVFe1pUE/8sU5HhoRIfrbJei1zExT88=;
	b=yr6pc4XeAhEidQ4Km4UJn9OshKsObaGeBldPzvf7ipJh1aJrkKOsrbFSSayGf2ONl7jkjt
	Gq9vZKyYyBb6PgpBAy1JBx4YSZI80w2S8Xv0qSC5vxD6Htqgy40sWtrAEmALuCV0zPzFNo
	c2xsUNpRoVdpUNgt+uR9cGCLiqRRjqVpFVjysPVTqBBlQINju3iDrZ7/S5BSxJkxq+BPcc
	Zz0KbulOOw4mlce14M49OIVdBVCBvPCZJ6vvcJ2IIxHZOjKiHiXXiDLxZ1PrCu4qGb9i60
	okcHhMaovtVZaUXdkVPe/4gPWg03yvtjY5JQzoOiMO47xVkALXk9xn6kZ37z5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742218162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=/tkx7mGZE55fKVFe1pUE/8sU5HhoRIfrbJei1zExT88=;
	b=EaILQh/XO5ohqXn/oN1aidRsCBODBkFh26xjmaN6HX+y99Kiv74r1Ikip1b7S+v9PkPcN7
	8X6tfx1Os50KkXDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nishanth Menon <nm@ti.com>,
 Dhruva Gole <d-gole@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>,
 ntb@lists.linux.dev,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org,
 Michael Kelley <mhklinux@outlook.com>,
 Wei Liu <wei.liu@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 linux-hyperv@vger.kernel.org,
 Wei Huang <wei.huang2@amd.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huwei.com>
Subject: [patch V3 00/10] genirq/msi: Spring cleaning
Date: Mon, 17 Mar 2025 14:29:21 +0100 (CET)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>

This is version 3 of the cleanup work. The previous version can be found
here:

   https://lore.kernel.org/all/20250313130212.450198939@linutronix.de

While converting the MSI descriptor locking to a lock guard() I stumbled
over various abuse of MSI descriptors (again).

The following series cleans up the offending code and converts the MSI
descriptor locking over to lock guards.

Changes vs. V2:

   - Use __free() in __msix_setup_interrupts() - PeterZ

   - Fix a typo in the msi core code

   - Collect Reviewed/Tested/Acked-by tags where appropriate

Patches 1, 3-4, 6-10 are unmodifed.

The series applies on:

    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/msi

and is available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/msi

Thanks,

	tglx
---
 drivers/ntb/msi.c                   |   22 +---
 drivers/pci/controller/pci-hyperv.c |   14 --
 drivers/pci/msi/api.c               |    6 -
 drivers/pci/msi/msi.c               |  171 ++++++++++++++++++++++--------------
 drivers/pci/pci.h                   |    9 +
 drivers/pci/tph.c                   |   44 ---------
 drivers/soc/ti/ti_sci_inta_msi.c    |   10 --
 drivers/ufs/host/ufs-qcom.c         |   75 ++++++++-------
 include/linux/cleanup.h             |   17 +++
 include/linux/irqdomain.h           |    2 
 include/linux/msi.h                 |    7 +
 kernel/irq/msi.c                    |  125 ++++++++++----------------
 12 files changed, 249 insertions(+), 253 deletions(-)

