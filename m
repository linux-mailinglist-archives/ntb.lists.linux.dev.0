Return-Path: <ntb+bounces-1207-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B3A746C9
	for <lists+linux-ntb@lfdr.de>; Fri, 28 Mar 2025 11:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8233D16CC04
	for <lists+linux-ntb@lfdr.de>; Fri, 28 Mar 2025 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA2814A0B7;
	Fri, 28 Mar 2025 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uPOHRZOs"
X-Original-To: ntb@lists.linux.dev
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE42216E1B
	for <ntb@lists.linux.dev>; Fri, 28 Mar 2025 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156019; cv=none; b=j6PgE56/pUlUL1ZGsZQmZ4yt0aLiwjd3opOMy5pltKm6CRzBBHSP+ZGG+evLf870z49MLWybPUm/vSeRXIPqVRIGQNuXN23tojExo61qIU6zlWjLiLQGgjJA+BP1ToFZAqiOQnk3jek5d3LdYg0ws1EZrlbqZyU1ygIWWj8lgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156019; c=relaxed/simple;
	bh=VAxMnppZDd0EsjFlPAHPDvkheirt5PDlBP3XZemzIlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOjhDIRwGuyy/4MxqR7FOF4qikl+75pV3T1g2/bMZqY8uCA60LxCW/uN2//J09Zatg5uYfLbWJ9c+CYjus4kOPP5jaUugMadWgx59ZiGtA2XIogsue9Ma7ITaD2iJmbpZk1YQfFiqjy3SsFFWD/NA1OFA7n29V97tO8rVdVHdNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uPOHRZOs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-394780e98easo1111374f8f.1
        for <ntb@lists.linux.dev>; Fri, 28 Mar 2025 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743156015; x=1743760815; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMHy4UXVXze7CguX+fTXXYQovkguTPZAbEfyyQdz7+s=;
        b=uPOHRZOsjxpZN58N90DoZUWqJZT/UAHFxtaz20AZIda5z2sikXukdOMITmVBkoj/Gh
         j4Z+mBBk9xIrXLjwxtDvLJH3dAG2tXs8ceD+rH5ZEKzQVWSMgm7kbW+eeCiYgUopCvyX
         RD+PlOQ+pH5DxfEyi8rAY4yn6EpGZpueN3AYSdhbltFfDTkMhse6KnLGbFTZRRnZ2AFu
         tltBJpq4/Ip3wp1NlRKdLqFZRbPblNGS3/qddNuy6szKZgrsU73U7+h4Xe6L7FraxHGb
         RAIjNp6P7zq8CJtgvvSaj0CYT2oohjLbvu6KcB7vFVtNBWm/eTWxpjOTnrzCK0ztUxf2
         kbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156016; x=1743760816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMHy4UXVXze7CguX+fTXXYQovkguTPZAbEfyyQdz7+s=;
        b=fQNg01Ppj/uZw0UsI5JJaT1/TWK0RalzKgTZ12VT1MqbzBSOFecaoOMagZyvanREfO
         +G35mtHkJ38FznBnz3CZDGGJ8c2wN2llwgE8MhIUZIk7HqI/XVZKW5lSLQhwTCTJgG3v
         BXX4sBhgiyNUMPZV3ZKJwjcqWZptYg9FtYWPUSVTNC8Y0r9gWynlsa2Mw5H136kL7Ve8
         gtvdBraA8Oq+Y/Xcj5vanWO/Dxt3EeeaE/VNq4a5+FGN6ty7D6TBCQiEX1DpTmMCIIZ6
         41zgNrBKT4JxClmJSgZ45oNk8NR9Ndf2V8YjO4ujk/wEqQP4v+GItRFZpoCyUTzN7uTt
         34JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuH6l6YnxXmI2JHLoVdvsb52K+BJ7DFWaHzXxqEugNPNbHhsdaD2i2Xk1TtCRPcckJti8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa8rJiTwtlxNKh4n7a6M+IgDPNfgLSGmcrmMkAWQ9rJWaO1kem
	wYiMfftuxsvxOOzBp4OY6J0BFwbkkopLVyxfoQfZhpONHUiC/9lNU4kk8cTaqxc=
X-Gm-Gg: ASbGnctMyn/Q0VBfbj8bVu+AvAujIGPALoKudHVgslzVrkQ6pvL779V7QheiIqf0BDV
	tugMi/T7vr34+jFbMHJNdxp0Dv+91BPeaOV3Dpz/OETFIXJdaNThWIjyGqkgB7ct6I0m0QW8e81
	QuEos5hz8fVoMIR/4AjFmY41JaHiFb0ImzNGxFYTjkZtrkr5UI5y0luCcYbqwy5JboSxs03vFPc
	s+hni6FMF2MTU7uznSGmKCMQI6XjoJjyrZsF9+Gp7RMOq/t0hScKdvuuJ8ILKaXpl7heBSPo1Ml
	5jZ4RgoFjb7iQTnwet8qMDZU4SCDp8oHNK8os0VfvAZAWDkfb9Wuz0sFW0np
X-Google-Smtp-Source: AGHT+IGj9pQvphUGd9QRvl74y+vh1brVfy4aIv4DoMY75sWkzHFUx8Bt1I9v28FP8We3YasMPehrOQ==
X-Received: by 2002:a05:6000:1fa9:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39ad17505efmr6306834f8f.23.1743156015550;
        Fri, 28 Mar 2025 03:00:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fccfe2fsm22243795e9.22.2025.03.28.03.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:00:15 -0700 (PDT)
Date: Fri, 28 Mar 2025 13:00:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Nishanth Menon <nm@ti.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dhruva Gole <d-gole@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Dave Jiang <dave.jiang@intel.com>, Jon Mason <jdmason@kudzu.us>,
	Allen Hubbe <allenbh@gmail.com>, ntb@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>, Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	linux-hyperv@vger.kernel.org, Wei Huang <wei.huang2@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huwei.com>
Subject: Re: [patch V2 09/10] scsi: ufs: qcom: Remove the MSI descriptor abuse
Message-ID: <f0df759f-42b2-450c-90c6-25953093e244@stanley.mountain>
References: <20250313130212.450198939@linutronix.de>
 <20250313130321.963504017@linutronix.de>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313130321.963504017@linutronix.de>

On Thu, Mar 13, 2025 at 02:03:51PM +0100, Thomas Gleixner wrote:
> @@ -1799,8 +1803,7 @@ static irqreturn_t ufs_qcom_mcq_esi_hand
>  static int ufs_qcom_config_esi(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct msi_desc *desc;
> -	struct msi_desc *failed_desc = NULL;
> +	struct ufs_qcom_irq *qi;
>  	int nr_irqs, ret;
>  
>  	if (host->esi_enabled)
> @@ -1811,47 +1814,47 @@ static int ufs_qcom_config_esi(struct uf
>  	 * 2. Poll queues do not need ESI.
>  	 */
>  	nr_irqs = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
> +	qi = devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
> +	if (qi)

This NULL check is reversed.  Missing !.

regards,
dan carpenter

> +		return -ENOMEM;
> +
>  	ret = platform_device_msi_init_and_alloc_irqs(hba->dev, nr_irqs,
>  						      ufs_qcom_write_msi_msg);


