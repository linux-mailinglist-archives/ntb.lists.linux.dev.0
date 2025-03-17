Return-Path: <ntb+bounces-1170-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDBA650D8
	for <lists+linux-ntb@lfdr.de>; Mon, 17 Mar 2025 14:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9C867A7AC2
	for <lists+linux-ntb@lfdr.de>; Mon, 17 Mar 2025 13:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFAB23F39A;
	Mon, 17 Mar 2025 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ikfuYWB2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9YalfP8x"
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B531459F7
	for <ntb@lists.linux.dev>; Mon, 17 Mar 2025 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218166; cv=none; b=pJWrQMmFR568JzvRO0ibDJgURrOAb4Zk8jhMaDwZljGjoXZzPkr2IdM1NwtQ6IR3AF4tlZOZ0ptzx7ApqQJBC8OI/AOatpa0ljqAZs4PvaPDJqIekGeTnw5BCmcL9J0CyLEQ8hClbHKt2wuyB2hbyzR2B0pOHTRisxX7A5QjjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218166; c=relaxed/simple;
	bh=ho8Pzt9rnRzxEycPk61Hi2KRQSUXlk2Hs9Tw9uulgDA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=OXiqd9ChWkIirWOa8ackVi3v1lYQ4dsSoJroLkUI5o6sPP+h2YqL87A4Y/0XY7XqXNqCT+tcnYndXsIsEpSyjqUP90b6+zYvq+AzELI0n8zLoyOKBTu4FAjDeV7XuUGXVHtm+ZKlQFmgibGbci5wrcnEDp8MuUz47h+XqTX5hNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ikfuYWB2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9YalfP8x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <20250317092945.764490535@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742218163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dp0eYeKfrNlzvU3/WMfnQjPzD6qavekPLwUv4OZ2OOs=;
	b=ikfuYWB22wmHGAZ1ZCYxuHRBkfaFcMntu8Y2Xs5ZKHP20JMm5tpDEfW6mSqnqvIO7/Ajcd
	T6v6qi7q6R4ILWkgkDOA9Euq/2Zb29uV0VXgMO3S6EOiTvIiTE+3fMRc2bW6TgCzStokN0
	2qNbE69vg0xjvKiRyG8sm76ROcQAiH7DcvK+2xFh2EUbUaH3RmjIZEbbqrki7c8bXpVgqd
	r29lTkocOA2rivUwQDjCvDUL23d+Y5cLsrbZNqF9pkBjMX/+mz0WWQ4SK1qFQ2nxUnM/Od
	+UNYZUNZd4i2O78LP2ilCXUXc58YfEFyuX8tC6NzyGzyPdar813GtKp6JAeFXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742218163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dp0eYeKfrNlzvU3/WMfnQjPzD6qavekPLwUv4OZ2OOs=;
	b=9YalfP8xBbKHQiBQ+hYehlm/nMIPvpPeNa78JCueUr9eWpmBcupHLF1l2sIP1/dDDyvv38
	onqG0szZCKhD09Cg==
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
Subject: [patch V3 01/10] cleanup: Provide retain_ptr()
References: <20250317092919.008573387@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 14:29:22 +0100 (CET)

In cases where an allocation is consumed by another function, the
allocation needs to be retained on success or freed on failure. The code
pattern is usually:

	struct foo *f = kzalloc(sizeof(*f), GFP_KERNEL);
	struct bar *b;

	,,,
	// Initialize f
	...
	if (ret)
		goto free;
        ...
	bar = bar_create(f);
	if (!bar) {
		ret = -ENOMEM;
	   	goto free;
	}
	...
	return 0;
free:
	kfree(f);
	return ret;

This prevents using __free(kfree) on @f because there is no canonical way
to tell the cleanup code that the allocation should not be freed.

Abusing no_free_ptr() by force ignoring the return value is not really a
sensible option either.

Provide an explicit macro retain_ptr(), which NULLs the cleanup
pointer. That makes it easy to analyze and reason about.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>

---
 include/linux/cleanup.h |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -216,6 +216,23 @@ const volatile void * __must_check_fn(co
 
 #define return_ptr(p)	return no_free_ptr(p)
 
+/*
+ * Only for situations where an allocation is handed in to another function
+ * and consumed by that function on success.
+ *
+ *	struct foo *f __free(kfree) = kzalloc(sizeof(*f), GFP_KERNEL);
+ *
+ *	setup(f);
+ *	if (some_condition)
+ *		return -EINVAL;
+ *	....
+ *	ret = bar(f);
+ *	if (!ret)
+ *		retain_ptr(f);
+ *	return ret;
+ */
+#define retain_ptr(p)				\
+	__get_and_null(p, NULL)
 
 /*
  * DEFINE_CLASS(name, type, exit, init, init_args...):




