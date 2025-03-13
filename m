Return-Path: <ntb+bounces-1162-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5FA5F9B9
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 16:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12FA3BDCC1
	for <lists+linux-ntb@lfdr.de>; Thu, 13 Mar 2025 15:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8D626138E;
	Thu, 13 Mar 2025 15:24:21 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DEF282FA
	for <ntb@lists.linux.dev>; Thu, 13 Mar 2025 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879461; cv=none; b=jj0ig8e8/U+7YzXRMKMSr4r359nNRxF7ElFFybyfs6/DugnShcu7S/f8HTxpP0PpXdFN29sz2GQBUk9p16oCZNcY9BDG99rzo9Ot9slT+NryBahSeynGHsnAG0X38LmfpmvVCTv5I4ddddH5wLSqDAd7lru9/n6LdKPnh86Pb+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879461; c=relaxed/simple;
	bh=+ELuKNX1HFVgjbSRI5y1fv9qDxURnwTRw7oZMaFAG7c=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fuTwbnZEpEXws/3dS3sNV0aG1AInUs+bn4pp1vGG0NV8DdZJpNM3eZUQAzzeXF8B9Q9u+mcq8hz+YQjzM9e9lczK9doxDIjA4/3WFAO5KqNvRuaqVQ9KsMulh1X6gI5inLL82/F9hua3P9Pp3jSoBHg0dZC9og++HyMgBQJzm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZDB6n6KKMz6JB00;
	Thu, 13 Mar 2025 23:21:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B4581400D9;
	Thu, 13 Mar 2025 23:24:16 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 13 Mar
 2025 16:24:14 +0100
Date: Thu, 13 Mar 2025 15:24:13 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Nishanth Menon <nm@ti.com>, "Dhruva Gole"
	<d-gole@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Dave Jiang
	<dave.jiang@intel.com>, Jon Mason <jdmason@kudzu.us>, Allen Hubbe
	<allenbh@gmail.com>, <ntb@lists.linux.dev>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-pci@vger.kernel.org>, Michael Kelley
	<mhklinux@outlook.com>, Wei Liu <wei.liu@kernel.org>, Haiyang Zhang
	<haiyangz@microsoft.com>, <linux-hyperv@vger.kernel.org>, Wei Huang
	<wei.huang2@amd.com>, Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>, Jonathan Cameron
	<Jonathan.Cameron@huwei.com>
Subject: Re: [patch V2 01/10] cleanup: Provide retain_ptr()
Message-ID: <20250313152413.0000581b@huawei.com>
In-Reply-To: <20250313130321.442025758@linutronix.de>
References: <20250313130212.450198939@linutronix.de>
	<20250313130321.442025758@linutronix.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 13 Mar 2025 14:03:38 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> In cases where an allocation is consumed by another function, the
> allocation needs to be retained on success or freed on failure. The code
> pattern is usually:
> 
> 	struct foo *f = kzalloc(sizeof(*f), GFP_KERNEL);
> 	struct bar *b;
> 
> 	,,,
> 	// Initialize f
> 	...
> 	if (ret)
> 		goto free;
>         ...
> 	bar = bar_create(f);
> 	if (!bar) {
> 		ret = -ENOMEM;
> 	   	goto free;
> 	}
> 	...
> 	return 0;
> free:
> 	kfree(f);
> 	return ret;
> 
> This prevents using __free(kfree) on @f because there is no canonical way
> to tell the cleanup code that the allocation should not be freed.
> 
> Abusing no_free_ptr() by force ignoring the return value is not really a
> sensible option either.
> 
> Provide an explicit macro retain_ptr(), which NULLs the cleanup
> pointer. That makes it easy to analyze and reason about.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>

Seems sensible to me and the resulting code is reasonably easy to
follow / contained in a small region.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/linux/cleanup.h |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> --- a/include/linux/cleanup.h
> +++ b/include/linux/cleanup.h
> @@ -216,6 +216,23 @@ const volatile void * __must_check_fn(co
>  
>  #define return_ptr(p)	return no_free_ptr(p)
>  
> +/*
> + * Only for situations where an allocation is handed in to another function
> + * and consumed by that function on success.
> + *
> + *	struct foo *f __free(kfree) = kzalloc(sizeof(*f), GFP_KERNEL);
> + *
> + *	setup(f);
> + *	if (some_condition)
> + *		return -EINVAL;
> + *	....
> + *	ret = bar(f);
> + *	if (!ret)
> + *		retain_ptr(f);
> + *	return ret;
> + */
> +#define retain_ptr(p)				\
> +	__get_and_null(p, NULL)
>  
>  /*
>   * DEFINE_CLASS(name, type, exit, init, init_args...):
> 


