Return-Path: <ntb+bounces-1278-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DBABD179
	for <lists+linux-ntb@lfdr.de>; Tue, 20 May 2025 10:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8F987AE477
	for <lists+linux-ntb@lfdr.de>; Tue, 20 May 2025 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E59325D55D;
	Tue, 20 May 2025 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZrjibfnD"
X-Original-To: ntb@lists.linux.dev
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDA2255F59
	for <ntb@lists.linux.dev>; Tue, 20 May 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728402; cv=none; b=n0UZcp/efnQ+MmXy1m9P3Jp4utGqEyI+o3LDh+O3FglqkoSoMbCowG1MEExmH/QEb/mVmekbx/q+jH2Iq/djkpxUsaQgwqACYW6rhGDnfy5taSLU0wxH9k+odTy1ZbA1BJIC1Wg5SIk9laJVEUYYF7Q6a83KYuI+JHizin26KBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728402; c=relaxed/simple;
	bh=7hq9xppJGATalLspIPRjORoKIyFw7AsCtWrqZmHltok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YIgJiGHSSDyH4apM74IFnFuQElxOJN96Gg3wqL0lIWnyBvFC+duY4PRV2YASJ93xgvuFlmTvpjjG26xbR/GR7FQelNbAeyHX5BMbH/6wAfENofwgiC0SHcx8gBP5xMwpsho2ktDF8TstZARe9mrIbfm9pXAtqQvaq1A10F+fooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZrjibfnD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a365a68057so2546858f8f.0
        for <ntb@lists.linux.dev>; Tue, 20 May 2025 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747728396; x=1748333196; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UK2wFnTLr9HZhUbDpuGU238rNBNP0binx2ZU+9SZttQ=;
        b=ZrjibfnDvU3IhGxEtxRY9ugmmpG6+7ZKS9gX8V7IEI0s+X3dCdvJoptniVt6PCQgR2
         4xBvlLQ1NzsnN08u/82GDLBqbJiAGtzleS0dTtcXXIe6qcG1z87MkZj5y+7d7ALZztxb
         E3bMcObmwRcvFHRjvbEZ9Hv9t1/o7M2LYf4AB3TiRuBQLlYdtRRAYP809Pzki+vXbUvt
         NOErQ/7dyrnD8LidGG8nMjEuferMMkwWM3fAH0mKHoBew6mda5TPtC47vvxF6U/ThWn5
         A8rEVQvpesOWHr6ifJh+j4DLEF9Ea43ZehfWyYjCoSpF9NJsPDNPMjs+tguj5nct/mEU
         1UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728396; x=1748333196;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK2wFnTLr9HZhUbDpuGU238rNBNP0binx2ZU+9SZttQ=;
        b=FuSd7edaF2L+0Ik1Hd+WjsIOK2gVrEAvsi2F+KBGVt2X/apuJlHRBiwUHbomWdmU4z
         oxPFT9O74gf7sf14bO8GUWyfZNAKTSu35Lbifsl1db+cGLgu6Z+3QJ/pBxI4S3yvkvp3
         RNQ0yCbg9M9zOiqbQTzEkkfwfMaImL03CIxfRFb6BENok+dIfaMvk+TZghaV3/z1NRRZ
         e9/55MOOttuQIJRr4Uhk9C0UXA99Vth8w3cVtA1NMeH46NaBDmVL5MEzcIa8YzWqEgDq
         GzAC9PJfzUwJA3+qKhwDUNe23pBfImmBezG5v9sP++wvFqi/BnyuuanKGciQ+/mH0EUY
         XvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1PKnf7EA34wFf4M0he21aiQqrJZoUZzm3BdJ43Ecb0SjVyq0Igh2/1LqIqTTGtnt2gUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOJ0zjsHXAPMc6dj8f5ExwhuQfwRZBb3KlQ7K53Y/f7xU5oL/d
	A9PzjFlQPebBe1cJZn5RTOP4hREk9jucqEhz37S5Zsq54SOsZoJf6kAZTh3xvde0qxg=
X-Gm-Gg: ASbGncv+EU0I9gANpnmlDE7GyGIESjIZ8nEn7wp761c//UCu0bsgCgdxWQrzYmdyO6P
	1cBiHRakXzNjumGv5rEf6hY5LQwIMOYwob6Aq1yPBypvSBNKbZ/u3459WOxPHlGsedaxM0AzTzk
	W3LI9vpEIttKD8UyekiQWw9wIM4blD527m00WEFYhkrBLNKC+7060dEHjKmMyfbz8DRikWzmVi+
	X7QKY1buGoyI0zkA+BN7D6T9fRVOhaRg82lNz/NSm99ZV30IdYY7E3qm2YzncKO9KFXHnnAQC6I
	2o2ClJn6FIzd1NpdC0WquDRsV0aflUff0VmRjIAfVNmax3iCeGx7x3/xspbAAw==
X-Google-Smtp-Source: AGHT+IGSZt/4KnG4Y2TKf2q+PGeWcOFzQY8ZcRkev1avK2tlKMvpp8ag01XprGtJDEh2CCv0oaoeNg==
X-Received: by 2002:a05:6000:1786:b0:3a3:712e:c4c1 with SMTP id ffacd0b85a97d-3a3712ec586mr5907732f8f.44.1747728396189;
        Tue, 20 May 2025 01:06:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f683:3887:7e7c:b492])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a36c6eeaf8sm8000270f8f.48.2025.05.20.01.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:06:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jon Mason <jdmason@kudzu.us>,  Dave Jiang <dave.jiang@intel.com>,  Allen
 Hubbe <allenbh@gmail.com>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
  Kishon Vijay Abraham I <kishon@kernel.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  ntb@lists.linux.dev,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] PCI: endpoint: pci-epf-vntb: allow arbitrary BAR
 configuration
In-Reply-To: <aCuwy5ZjkhAiCPoZ@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Mon, 19 May 2025 18:29:31 -0400")
References: <20250505-pci-vntb-bar-mapping-v1-0-0e0d12b2fa71@baylibre.com>
	<20250505-pci-vntb-bar-mapping-v1-3-0e0d12b2fa71@baylibre.com>
	<aCuwy5ZjkhAiCPoZ@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 20 May 2025 10:06:35 +0200
Message-ID: <1j8qmrn1tg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 19 May 2025 at 18:29, Frank Li <Frank.li@nxp.com> wrote:

> On Mon, May 05, 2025 at 07:41:49PM +0200, Jerome Brunet wrote:
>> The BAR configuration used by the PCI vNTB endpoint function is rather
>> fixed and does not allow to account for platform quirks. It simply
>> allocate BAR in order.
>>
>> This is a problem on the Renesas platforms which have a 256B fixed BAR_4
>> which end-up being the MW1 BAR. While this BAR is not ideal for a MW, it
>> is adequate for the doorbells.
>>
>> Add more configfs attributes to allow arbitrary BAR configuration to be
>> provided through the driver configfs. If not configuration is provided,
>> the driver should retain the old behaviour and allocate BARs in order.
>> This should keep existing userspace scripts working.
>>
>> In the Renesas case mentioned above, the change allows to use BAR_2 as for
>> the MW1 region and BAR_4 for the doorbells.
>
> Suggest commit message.
>
> PCI: endpoint: pci-epf-vntb: Allow configurable BAR assignment via configfs
>
> The current BAR configuration for the PCI vNTB endpoint function allocates
> BARs in order, which lacks flexibility and does not account for
> platform-specific quirks. This is problematic on Renesas platforms, where
> BAR_4 is a fixed 256B region that ends up being used for MW1, despite being
> better suited for doorbells.
>
> Add new configfs attributes to allow users to specify arbitrary BAR
> assignments. If no configuration is provided, the driver retains its
> original behavior of sequential BAR allocation, preserving compatibility
> with existing userspace setups.
>
> This enables use cases such as assigning BAR_2 for MW1 and using the
> limited BAR_4 for doorbells on Renesas platforms.

Great, thanks

>
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 127 ++++++++++++++++++++++++--
>>  1 file changed, 120 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> index f9f4a8bb65f364962dbf1e9011ab0e4479c61034..3cdccfe870e0cf738c93ca7c525fa2daa7c87fcb 100644
>> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> @@ -74,6 +74,7 @@ enum epf_ntb_bar {
>>  	BAR_MW2,
>>  	BAR_MW3,
>>  	BAR_MW4,
>> +	VNTB_BAR_NUM,
>>  };
>>
>>  /*
>> @@ -133,7 +134,7 @@ struct epf_ntb {
>>  	bool linkup;
>>  	u32 spad_size;
>>
>> -	enum pci_barno epf_ntb_bar[6];
>> +	enum pci_barno epf_ntb_bar[VNTB_BAR_NUM];
>
> It should be PCI_STD_NUM_BARS

I thought so too initially but that's actually not the same thing and
wrong, if it happens to be 6 here.

This tracks the mapping of function to bar number, not which function is
assigned to a BAR.

>
>>
>>  	struct epf_ntb_ctrl *reg;
>>
>> @@ -655,6 +656,59 @@ static void epf_ntb_epc_destroy(struct epf_ntb *ntb)
>>  	pci_epc_put(ntb->epf->epc);
>>  }
>>
>> +
>> +/**
>> + * epf_ntb_is_bar_used() - Check if a bar is used in the ntb configuration
>
> epf_ntb_is_bar_pre_reverved()?

That would be mis-leading because the result change as the sequential
allocation goes, so it is not limited to pre-reservation.

>
>> + * @ntb: NTB device that facilitates communication between HOST and VHOST
>
> missed @barno
>
>> + *
>> + * Returns: 0 if unused, 1 if used.
>> + */
>> +static int epf_ntb_is_bar_used(struct epf_ntb *ntb,
>> +			   enum pci_barno barno)
>
> return value bool is better

Fine by me

>
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < VNTB_BAR_NUM; i++) {
>
> PCI_STD_NUM_BARS

As noted above, it is easy to get confused on this but that would be incorrect.

>
>> +		if (ntb->epf_ntb_bar[i] == barno)
>> +			return 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * epf_ntb_set_bar() - Assign BAR number when no configuration is provided
>
> Look like it is find a free bar number, which have not reserved by configfs.
> so
> epf_ntb_find_bar() or epf_ntb_alloc_bar()?

I'll replace with find_bar sure.

>
>> + * @ntb: NTB device that facilitates communication between HOST and VHOST
>
> missed bar and barno
>
>> + *
>> + * When the BAR configuration was not provided through the userspace
>> + * configuration, automatically assign BAR as it has been historically
>> + * done by this endpoint function.
>> + *
>> + * Returns: the BAR number found, if any. -1 otherwise
>> + */
>> +static int epf_ntb_set_bar(struct epf_ntb *ntb,
>> +			   const struct pci_epc_features *epc_features,
>> +			   enum epf_ntb_bar bar,
>> +			   enum pci_barno barno)
>> +{
>> +	while (ntb->epf_ntb_bar[bar] < 0) {
>> +		barno = pci_epc_get_next_free_bar(epc_features, barno);
>> +		if (barno < 0)
>> +			break; /* No more BAR available */
>> +
>> +		/*
>> +		 * Verify if the BAR found is not already assigned
>> +		 * through the provided configuration
>> +		 */
>> +		if (!epf_ntb_is_bar_used(ntb, barno))
>> +			ntb->epf_ntb_bar[bar] = barno;
>
> missed "break" ? you find one free bar.

No ... the while exit condition is already correct I think

>
>> +
>> +		barno += 1;
>> +	}
>> +
>> +	return barno;
>
>
> return ntb->epf_ntb_bar[bar] ?
>
> if pre reserved, while loop will be skipped.  reversed bar number should be
> return, instead of input barno.

I don't think so.

Say a config sets DB on BAR6, while still having everything unused from
2 to 5, you'd get stuck with what you are proposing. What's done here
emulate the old behavior while making sure we iterate over all BARs

That being said, mixing the old ways with explicit config would be weird
but it is possible.

>
>> +}
>> +
>>  /**
>>   * epf_ntb_init_epc_bar() - Identify BARs to be used for each of the NTB
>>   * constructs (scratchpad region, doorbell, memorywindow)
>> @@ -677,23 +731,21 @@ static int epf_ntb_init_epc_bar(struct epf_ntb *ntb)
>>  	epc_features = pci_epc_get_features(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no);
>>
>>  	/* These are required BARs which are mandatory for NTB functionality */
>> -	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++, barno++) {
>> -		barno = pci_epc_get_next_free_bar(epc_features, barno);
>> +	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++) {
>> +		barno = epf_ntb_set_bar(ntb, epc_features, bar, barno);
>>  		if (barno < 0) {
>>  			dev_err(dev, "Fail to get NTB function BAR\n");
>>  			return -EINVAL;
>>  		}
>> -		ntb->epf_ntb_bar[bar] = barno;
>>  	}
>>
>>  	/* These are optional BARs which don't impact NTB functionality */
>> -	for (bar = BAR_MW1, i = 1; i < num_mws; bar++, barno++, i++) {
>> -		barno = pci_epc_get_next_free_bar(epc_features, barno);
>> +	for (bar = BAR_MW1, i = 1; i < num_mws; bar++, i++) {
>> +		barno = epf_ntb_set_bar(ntb, epc_features, bar, barno);
>>  		if (barno < 0) {
>>  			ntb->num_mws = i;
>>  			dev_dbg(dev, "BAR not available for > MW%d\n", i + 1);
>>  		}
>> -		ntb->epf_ntb_bar[bar] = barno;
>>  	}
>>
>>  	return 0;
>> @@ -861,6 +913,37 @@ static ssize_t epf_ntb_##_name##_store(struct config_item *item,	\
>>  	return len;							\
>>  }
>>
>> +#define EPF_NTB_BAR_R(_name, _id)					\
>> +	static ssize_t epf_ntb_##_name##_show(struct config_item *item,	\
>> +					      char *page)		\
>> +	{								\
>> +		struct config_group *group = to_config_group(item);	\
>> +		struct epf_ntb *ntb = to_epf_ntb(group);		\
>> +									\
>> +		return sprintf(page, "%d\n", ntb->epf_ntb_bar[_id]);	\
>> +	}
>> +
>> +#define EPF_NTB_BAR_W(_name, _id)					\
>> +	static ssize_t epf_ntb_##_name##_store(struct config_item *item, \
>> +					       const char *page, size_t len) \
>> +	{								\
>> +	struct config_group *group = to_config_group(item);		\
>> +	struct epf_ntb *ntb = to_epf_ntb(group);			\
>> +	int val;							\
>> +	int ret;							\
>> +									\
>> +	ret = kstrtoint(page, 0, &val);					\
>> +	if (ret)							\
>> +		return ret;						\
>> +									\
>> +	if (val < NO_BAR || val > BAR_5)				\
>> +		return -EINVAL;						\
>> +									\
>> +	ntb->epf_ntb_bar[_id] = val;					\
>
> do you need check the same val to assign two difference ntb bar?

I rely on the user input being correct indeed. Worst case, an allocation
will fail later on. I could try to implement something in that direction
but will get complex. For example, I would eventually like to allow
sharing the BAR for DB and MW1, as done on the NTB function. (The idea
is to get 2nd MW and enable MSI on the ntb transport but I'm not there yet)

>
> Frank
>
>> +									\
>> +	return len;							\
>> +	}
>> +
>>  static ssize_t epf_ntb_num_mws_store(struct config_item *item,
>>  				     const char *page, size_t len)
>>  {
>> @@ -900,6 +983,18 @@ EPF_NTB_MW_R(mw3)
>>  EPF_NTB_MW_W(mw3)
>>  EPF_NTB_MW_R(mw4)
>>  EPF_NTB_MW_W(mw4)
>> +EPF_NTB_BAR_R(ctrl_bar, BAR_CONFIG)
>> +EPF_NTB_BAR_W(ctrl_bar, BAR_CONFIG)
>> +EPF_NTB_BAR_R(db_bar, BAR_DB)
>> +EPF_NTB_BAR_W(db_bar, BAR_DB)
>> +EPF_NTB_BAR_R(mw1_bar, BAR_MW1)
>> +EPF_NTB_BAR_W(mw1_bar, BAR_MW1)
>> +EPF_NTB_BAR_R(mw2_bar, BAR_MW1)
>> +EPF_NTB_BAR_W(mw2_bar, BAR_MW1)
>> +EPF_NTB_BAR_R(mw3_bar, BAR_MW3)
>> +EPF_NTB_BAR_W(mw3_bar, BAR_MW3)
>> +EPF_NTB_BAR_R(mw4_bar, BAR_MW4)
>> +EPF_NTB_BAR_W(mw4_bar, BAR_MW4)
>>
>>  CONFIGFS_ATTR(epf_ntb_, spad_count);
>>  CONFIGFS_ATTR(epf_ntb_, db_count);
>> @@ -911,6 +1006,12 @@ CONFIGFS_ATTR(epf_ntb_, mw4);
>>  CONFIGFS_ATTR(epf_ntb_, vbus_number);
>>  CONFIGFS_ATTR(epf_ntb_, vntb_pid);
>>  CONFIGFS_ATTR(epf_ntb_, vntb_vid);
>> +CONFIGFS_ATTR(epf_ntb_, ctrl_bar);
>> +CONFIGFS_ATTR(epf_ntb_, db_bar);
>> +CONFIGFS_ATTR(epf_ntb_, mw1_bar);
>> +CONFIGFS_ATTR(epf_ntb_, mw2_bar);
>> +CONFIGFS_ATTR(epf_ntb_, mw3_bar);
>> +CONFIGFS_ATTR(epf_ntb_, mw4_bar);
>>
>>  static struct configfs_attribute *epf_ntb_attrs[] = {
>>  	&epf_ntb_attr_spad_count,
>> @@ -923,6 +1024,12 @@ static struct configfs_attribute *epf_ntb_attrs[] = {
>>  	&epf_ntb_attr_vbus_number,
>>  	&epf_ntb_attr_vntb_pid,
>>  	&epf_ntb_attr_vntb_vid,
>> +	&epf_ntb_attr_ctrl_bar,
>> +	&epf_ntb_attr_db_bar,
>> +	&epf_ntb_attr_mw1_bar,
>> +	&epf_ntb_attr_mw2_bar,
>> +	&epf_ntb_attr_mw3_bar,
>> +	&epf_ntb_attr_mw4_bar,
>>  	NULL,
>>  };
>>
>> @@ -1380,6 +1487,7 @@ static int epf_ntb_probe(struct pci_epf *epf,
>>  {
>>  	struct epf_ntb *ntb;
>>  	struct device *dev;
>> +	int i;
>>
>>  	dev = &epf->dev;
>>
>> @@ -1390,6 +1498,11 @@ static int epf_ntb_probe(struct pci_epf *epf,
>>  	epf->header = &epf_ntb_header;
>>  	ntb->epf = epf;
>>  	ntb->vbus_number = 0xff;
>> +
>> +	/* Initially, no bar is assigned */
>> +	for (i = 0; i < VNTB_BAR_NUM; i++)
>> +		ntb->epf_ntb_bar[i] = NO_BAR;
>> +
>>  	epf_set_drvdata(epf, ntb);
>>
>>  	dev_info(dev, "pci-ep epf driver loaded\n");
>>
>> --
>> 2.47.2
>>

-- 
Jerome

