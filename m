Return-Path: <ntb+bounces-1277-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A2ABD0D8
	for <lists+linux-ntb@lfdr.de>; Tue, 20 May 2025 09:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56AC98A545C
	for <lists+linux-ntb@lfdr.de>; Tue, 20 May 2025 07:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CF625E821;
	Tue, 20 May 2025 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mJcooetg"
X-Original-To: ntb@lists.linux.dev
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422225E47D
	for <ntb@lists.linux.dev>; Tue, 20 May 2025 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727240; cv=none; b=rlvUHEtUrTZRWX84cCyNUcXHBHU5dlHJAA2O4djUiFCcl+NAKpIj0C8pm9/z1Gbilm8JDPlAsztc0sLIbEO0gJcoad94prdT/SrLZOAovsM+02bLWoSG9CZSLjZJBfZYMMmx5HRo/Q+MUGA40vqIdugmlR0+rjzhvOgahSLLeFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727240; c=relaxed/simple;
	bh=Kpm9h0rvihffqis4R4vZ2mYBLP/Gag8NA4K5sznq4l8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kq2PVwShIabzZzI3ufw9r7Ax6+TA3Zbf7DZsWPrJiVzuO6sb7A2eTIQqBVZxjhTCXWe5C1qBaeYLduEcYxfLkJSKiP3r4X4VdQhmWCs7i8z6TQIHZt1Z9A/Urtei+DZSNy9orCGQF3IXxi3nxhI48B2CgnXN6s0eUzI4jV5xZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mJcooetg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a375888197so833897f8f.0
        for <ntb@lists.linux.dev>; Tue, 20 May 2025 00:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747727235; x=1748332035; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPt0o2K+oGzEB06+9C4F+pNiGIiK4IzFmR46KIgZKE8=;
        b=mJcooetgXdA3OUOh2cTclJuqs/lkHpJ5+WU/ojYv5rC6Qe1bN+fVrtw170rpDCZXlr
         LOTARxRM1ioH2IVAR+Bw/bOd/3nVGMP+/uIhR9+h6YG8Khrqob4ME+XvgpCzsJMwT8yL
         /IsMzol/iXQYNvGNkvgKX2OMwsyMegWRVF2ZHSzGBTVhqG898sUQeZDYWGt76FAdR2CJ
         Ckn5EZJN6bScMQv8OTZcriu/gqNFQeFg5UYBkBVQuhwawDVfHEXmjxZHC3o4aZ3LVV9R
         R+7RvxcCzw9MnBWDAEQ7gsKCsOY3T8lGLxqR4olDdNfthhC7qLhL6JI+r2noK9WqvMpo
         0phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727235; x=1748332035;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPt0o2K+oGzEB06+9C4F+pNiGIiK4IzFmR46KIgZKE8=;
        b=AYnTNYJwPHjc92in70qn8bv2cL9vvytmRGBzNgRj6vlVXD4GIwPN6RpoEc3Sy7iGch
         Z9lK8MykxcXTkOpthR/P9xI5Uc+6jaHr/eIX8eAhcIHzMUNxCr49boyjDsH71p4wsg2A
         uTGhM7NH56V/kX3oGKIQtpcynx9s1vnniQqsjKtBQPQCa1nGJy6tyGYocVvlsManKqug
         ZfYHOdDi+T4FVwuBhMN4gsDG1Erl4K8r/A5L+mFbCN+1Ci056aD/dF2V3qvZzi5+OmuL
         9WmXzEP/7ALqAxsIGzm8dqAGbVSKcmDSXixoDN42IK8Wr0IR9dtsK7xFdYFQHQO3bI0K
         TdoA==
X-Forwarded-Encrypted: i=1; AJvYcCUtKWG7nXh7+is3f6rHe7oiSlLCjfcGwMSt2DJRsvpM7aw7dPiZq+NCR3pEy2KXDN8ZRQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw79Kg42EbXnXzmZVslud7Rw/yh1jHuA1pEzQaX99TCyN0Y7FtR
	TInhYuvUXNJ/6LG0mRpEs4qFOu4fhVErAiWXoZEc5CQ1bRXcI9rLYHYg8e3CvOXH/vI=
X-Gm-Gg: ASbGnctYRsgqShbqmI2MVk2BXiR6aFa8gjvE/YVAMIWFidOn9vmbyAGhdAXOwbmFP7f
	qU0l7St3uqcAMDWfg8F/WqyRXOvm24/J1O/yqtMOGEQj4xpp5G/Ra2b0FR7JOV12iuIe03SU8OZ
	sK6mvJmQDOfFcGR2J6Yqb4j0pK5IqyhhZtbfvA49OOt20V3AVKyzPNGY6I7q9GTfBaxpRVF7vKI
	4s+OfUVPnVrnbo+dFWl7R4tX286k9HpjFHRL+K25TLXJkiZfzTz2TbSYpUsIH/GvEcElUno4Y6U
	gcJ5M4N+/GGkV2opKs2e5x2CPsV0NXQ9pTw0UneS+3glVBGL80I=
X-Google-Smtp-Source: AGHT+IEb01nulIXG8TDu/HvYRGPeBja6SuFSoReBd0lMj3lS0DdvyZ5S4ftHcPw+KDy6kEhj4gctzA==
X-Received: by 2002:a05:6000:186d:b0:3a3:6b0c:a8a3 with SMTP id ffacd0b85a97d-3a36b0ca9b1mr6702803f8f.17.1747727235544;
        Tue, 20 May 2025 00:47:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f683:3887:7e7c:b492])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d105sm15702162f8f.11.2025.05.20.00.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 00:47:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jon Mason <jdmason@kudzu.us>,  Dave Jiang <dave.jiang@intel.com>,  Allen
 Hubbe <allenbh@gmail.com>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
  Kishon Vijay Abraham I <kishon@kernel.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  ntb@lists.linux.dev,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI: endpoint: pci-epf-vntb: align mw naming with
 config names
In-Reply-To: <aCugvDoKTflV9+P0@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Mon, 19 May 2025 17:21:00 -0400")
References: <20250505-pci-vntb-bar-mapping-v1-0-0e0d12b2fa71@baylibre.com>
	<20250505-pci-vntb-bar-mapping-v1-2-0e0d12b2fa71@baylibre.com>
	<aCugvDoKTflV9+P0@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 20 May 2025 09:47:14 +0200
Message-ID: <1jecwjn2pp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 19 May 2025 at 17:21, Frank Li <Frank.li@nxp.com> wrote:

> On Mon, May 05, 2025 at 07:41:48PM +0200, Jerome Brunet wrote:
>
> PCI tree require keep consistent at subject
> git log --oneline drivers/pci/endpoint/functions/pci-epf-vntb.c
>
> require first char is UP case.

Noted

>
> Align memory window naming with configfs names.
>
>> The config file related to the memory windows start the numbering of
>
>                                  memory windows (MW)
>  then you can use MW later.

Sure

>
>> the MW from 1. The other NTB function does the same, yet the enumeration
>> defining the BARs of the vNTB function starts numbering the MW from 0.
>>
>> Both numbering are fine I suppose but mixing the two is a bit confusing.
>> The configfs file being the interface with userspace, lets keep that stable
>> and consistently start the numbering of the MW from 1.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> index 35fa0a21fc91100a5539bff775e7ebc25e1fb9c1..f9f4a8bb65f364962dbf1e9011ab0e4479c61034 100644
>> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> @@ -70,9 +70,10 @@ static struct workqueue_struct *kpcintb_workqueue;
>>  enum epf_ntb_bar {
>>  	BAR_CONFIG,
>>  	BAR_DB,
>> -	BAR_MW0,
>>  	BAR_MW1,
>>  	BAR_MW2,
>> +	BAR_MW3,
>> +	BAR_MW4,
>
> where use BAR_MW3 and BAR_MW4?

This is aligned with the file available in configfs and what is possible
in theory with the function, same as the NTB function and NTB host driver.

Stopping at MW1 because it is only one used in the driver would be weird
and the number later introduced would be wrong.


>
> Frank
>>  };
>>
>>  /*
>> @@ -576,7 +577,7 @@ static int epf_ntb_mw_bar_init(struct epf_ntb *ntb)
>>
>>  	for (i = 0; i < ntb->num_mws; i++) {
>>  		size = ntb->mws_size[i];
>> -		barno = ntb->epf_ntb_bar[BAR_MW0 + i];
>> +		barno = ntb->epf_ntb_bar[BAR_MW1 + i];
>>
>>  		ntb->epf->bar[barno].barno = barno;
>>  		ntb->epf->bar[barno].size = size;
>> @@ -629,7 +630,7 @@ static void epf_ntb_mw_bar_clear(struct epf_ntb *ntb, int num_mws)
>>  	int i;
>>
>>  	for (i = 0; i < num_mws; i++) {
>> -		barno = ntb->epf_ntb_bar[BAR_MW0 + i];
>> +		barno = ntb->epf_ntb_bar[BAR_MW1 + i];
>>  		pci_epc_clear_bar(ntb->epf->epc,
>>  				  ntb->epf->func_no,
>>  				  ntb->epf->vfunc_no,
>> @@ -676,7 +677,7 @@ static int epf_ntb_init_epc_bar(struct epf_ntb *ntb)
>>  	epc_features = pci_epc_get_features(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no);
>>
>>  	/* These are required BARs which are mandatory for NTB functionality */
>> -	for (bar = BAR_CONFIG; bar <= BAR_MW0; bar++, barno++) {
>> +	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++, barno++) {
>>  		barno = pci_epc_get_next_free_bar(epc_features, barno);
>>  		if (barno < 0) {
>>  			dev_err(dev, "Fail to get NTB function BAR\n");
>> @@ -1048,7 +1049,7 @@ static int vntb_epf_mw_set_trans(struct ntb_dev *ndev, int pidx, int idx,
>>  	struct device *dev;
>>
>>  	dev = &ntb->ntb.dev;
>> -	barno = ntb->epf_ntb_bar[BAR_MW0 + idx];
>> +	barno = ntb->epf_ntb_bar[BAR_MW1 + idx];
>>  	epf_bar = &ntb->epf->bar[barno];
>>  	epf_bar->phys_addr = addr;
>>  	epf_bar->barno = barno;
>>
>> --
>> 2.47.2
>>

-- 
Jerome

