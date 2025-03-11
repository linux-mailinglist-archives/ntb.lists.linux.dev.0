Return-Path: <ntb+bounces-1139-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51250A5CD55
	for <lists+linux-ntb@lfdr.de>; Tue, 11 Mar 2025 19:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7AD17C96A
	for <lists+linux-ntb@lfdr.de>; Tue, 11 Mar 2025 18:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02372627EC;
	Tue, 11 Mar 2025 18:11:04 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04C262D31
	for <ntb@lists.linux.dev>; Tue, 11 Mar 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716664; cv=none; b=p7GP2e2sU1oRbH4HrhVBewu60OAEQrkWP4w7YogMo2EDQ8jDj+NLTiVN73SAcsIS/suVuDVF7CGXdTWShEu325DfrTEHYJt6oTQnlqkdBwTYwFeG10ceCakIlAC7M6MnDKPHj8nS3Mkq7Wkx8h/teAOdDMWGE3XW3dKNUmQPmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716664; c=relaxed/simple;
	bh=nW6kcnaVPnd2s0tPsVOrq9MHgOdzd6vGVvSPXXLhxKk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqeTwXHjg6OjQ3/o27+JODUG2pH6ITgNytkiAB9IpLLFt5DGsKwysc76LvzvgB1O+AHCqQTB9cAfaReNmGwbvcIuwAwtzLUgxwgxzWZwLX9LLR9NGDX/Iv6QZRdjRkYq/JwDeRYOpOuoh+4FfhKTv6/tDF10+j26C6bDfTcg1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZC1vZ0Mhpz6H7Wy;
	Wed, 12 Mar 2025 02:07:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E7771401F1;
	Wed, 12 Mar 2025 02:11:01 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 11 Mar
 2025 19:11:00 +0100
Date: Tue, 11 Mar 2025 18:10:58 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, <linux-hyperv@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Jon Mason
	<jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe
	<allenbh@gmail.com>, <ntb@lists.linux.dev>, Wei Huang <wei.huang2@amd.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>
Subject: Re: [patch 06/10] PCI: hv: Switch MSI descriptor locking to guard()
Message-ID: <20250311181058.00000621@huawei.com>
In-Reply-To: <20250309084110.521468021@linutronix.de>
References: <20250309083453.900516105@linutronix.de>
	<20250309084110.521468021@linutronix.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Sun,  9 Mar 2025 09:41:51 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> Convert the code to use the new guard(msi_descs_lock).
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-hyperv@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

