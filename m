Return-Path: <ntb+bounces-1298-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB5AEEFD4
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Jul 2025 09:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35B63BDE40
	for <lists+linux-ntb@lfdr.de>; Tue,  1 Jul 2025 07:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4495D25CC42;
	Tue,  1 Jul 2025 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iB2zyC5w"
X-Original-To: ntb@lists.linux.dev
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80201C5D6A
	for <ntb@lists.linux.dev>; Tue,  1 Jul 2025 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355427; cv=none; b=o4AsyhQUPZfG196ahY9KL3pGMgdTNa5wi7+WkXP2ErwG4IQbDpV+lP68Dl6aJDBQiMzXB5gwRkJh6QkMopdhoRliLMwHmtvsTQYeJ/4E9Zaa68UXu0aH9+S8zRsy62FVm77S5xmdczuTJ570NHJ9MWBNiAaluyzZVrbORWbWjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355427; c=relaxed/simple;
	bh=cCndqnCEV0L2x9DQeAD8r7njlV2XxiUC+AhkoZAasQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wz4uFUO41E0jxFEkk8FxH1/BpEHIn/4nT4yJNF39jn3viwUaHrwpz3vq5H0qvvej1JKhURdhIMiLkqxXYX0J/f1KUw+IR1rYX5pkG0kmyds0h7hKjLeCGXgQAbVyxBTVPXLae791x9PtZYqKQdBgymRRf3Wf4tOFLzEBNVRPqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iB2zyC5w; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so2909990f8f.0
        for <ntb@lists.linux.dev>; Tue, 01 Jul 2025 00:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751355423; x=1751960223; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84nXSAp/Z1PnLoZAVeblOFLGSiCihYkJz9aJ4vUdZ0A=;
        b=iB2zyC5wRiKHY0s8gX+AZOrnb9IT1pSxDwyH9cT7EZPpQ+eRDdJevRc7CxF7SwsbOw
         v75jiLOMICfvx+HLciNspm+lS+CqJzj3NxZs43r2yur+A1aNTbVfdzsJTlVs6rbC+Zag
         2Aas/SvHuBddzOwY1ZDmY7k3wyer1KUGdzQfdi1RRXRclBtnmTt/0+y29J5VwgOH37if
         pH1qG2rJejM2SIrbPMW+yjYJequ3fHog8KX/OyEi7wOtHXV9bSrjH1OvkNKxmrSnk8wP
         sfmMGYKAAMJT5XWycSBjfewnalqoxx6NBDlRd1nkKaaat9FXku0TonMkhgt1KJZHLvRP
         +Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355423; x=1751960223;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84nXSAp/Z1PnLoZAVeblOFLGSiCihYkJz9aJ4vUdZ0A=;
        b=dgqWuxjXcGqvE5N2uXsKMWaPHx8UoBQ+cqAA7pDJPE5fRhAgOgUD/sxTFGmUlD0B0s
         gGOPBkNzA5JpsWw2OhyEyb2nWAJQBJeshl9muVgnsbxHyrTJGME/xcvCT6u7zYEFp39N
         AWYb47aBhJqoA3fA8t9pWTM90EHrSMwsO22xZiT5uM/fWlwe6hB+7iN4VH4RuprXXk+p
         II1FgT6yoGsAP+NlQ2J9A1o5x04VW9rrQFqILEBQpipPhw4ecXRzDou2RtR8qnn0B1AX
         H34PrzQbfs6O5r+u5Ee6cIlZlj53BkiYD+yKmOgwTMkEWrYlb1O2BsewMRyaES8O1jji
         955w==
X-Forwarded-Encrypted: i=1; AJvYcCW9VJ7f8mfOS1nsd5aVfCQPuEp54y2/y4mLxSFwIHj1VIqmaHpFf6xm72g+h34ShxW9AAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaFMRaxA5PhZya2uI45T5H05uLd94Ch/3FiV5qhXvq5ROEUKvA
	KJANuQTw0vkeMzNTmUNnHOlR/UyRwLLZOT82yLh3o9z+NyyNwoMFbuxfASW0hSLIwfs=
X-Gm-Gg: ASbGncscgJSrZFvJI3i1o1faV66jMBl0pNsnXxLD1SD3W42QY1W5wZf7mEFPMkjz62n
	F/QJipTa0jNnb035KXUkrt6PeRIjHTNN/+2jUnqvJyJTn0FyTrOLz+M+UbcFjAVYlIKBOuKPfMG
	pXSMGH/LYTtyDuaXfkzL4UUvdw3x7MCc4o5VuqplTG4U0fw79XyuZxm+tYiyfxizT4C9PwqFi4y
	ayKwtYLR+/SA4IDYhUTVxmx+/65qnGwc2ZKUPh0mW7w+0PQUtX96qClTKAgpURsTnnUdGF2mzOf
	GY+Cp+o9SZRLEUqocfJXbpzAyxpOFm2S/zXZJQtLisv2GFHqhTYKInc67Tmb3Q==
X-Google-Smtp-Source: AGHT+IFjJP+l9Owhcenlw9SLs9bvnjDG/zUDl7SGdhqFX4q/YS2+JYr3fDMHgOByMEELdFSvV8KjEQ==
X-Received: by 2002:a05:6000:4009:b0:3a8:2f65:373f with SMTP id ffacd0b85a97d-3aa9fc2002dmr12597509f8f.16.1751355422716;
        Tue, 01 Jul 2025 00:37:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fbe8:19b9:f06d:d64c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a3fe0efsm154899435e9.24.2025.07.01.00.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:37:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jon Mason <jdmason@kudzu.us>,  Dave Jiang <dave.jiang@intel.com>,  Allen
 Hubbe <allenbh@gmail.com>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Kishon Vijay Abraham I
 <kishon@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>,  Frank Li
 <Frank.Li@nxp.com>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
  ntb@lists.linux.dev,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] PCI: endpoint: pci-epf-vntb: Allow BAR
 assignment via configfs
In-Reply-To: <20250630203842.GA1800194@bhelgaas> (Bjorn Helgaas's message of
	"Mon, 30 Jun 2025 15:38:42 -0500")
References: <20250630203842.GA1800194@bhelgaas>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 01 Jul 2025 09:37:01 +0200
Message-ID: <1jikkce50i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 30 Jun 2025 at 15:38, Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Tue, Jun 03, 2025 at 07:03:40PM +0200, Jerome Brunet wrote:
>> The current BAR configuration for the PCI vNTB endpoint function allocates
>> BARs in order, which lacks flexibility and does not account for
>> platform-specific quirks. This is problematic on Renesas platforms, where
>> BAR_4 is a fixed 256B region that ends up being used for MW1, despite being
>> better suited for doorbells.
>> 
>> Add new configfs attributes to allow users to specify arbitrary BAR
>> assignments. If no configuration is provided, the driver retains its
>> original behavior of sequential BAR allocation, preserving compatibility
>> with existing userspace setups.
>> 
>> This enables use cases such as assigning BAR_2 for MW1 and using the
>> limited BAR_4 for doorbells on Renesas platforms.
>
> Is there any documentation for how to use this new feature?

Indeed no. Thanks for the reminder.

Section 9.8.2 is no longer relevant with that change, I'll
try to add some explanation there. 

>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 131 ++++++++++++++++++++++++--
>>  1 file changed, 124 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> index 2198282a80a40774047502a37f0288ca396bdb0e..7475d87659b1c70aa41b0999eabfa661f4ceed39 100644
>> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
>> @@ -73,6 +73,8 @@ enum epf_ntb_bar {
>>  	BAR_MW1,
>>  	BAR_MW2,
>>  	BAR_MW3,
>> +	BAR_MW4,
>> +	VNTB_BAR_NUM,
>>  };
>>  
>>  /*
>> @@ -132,7 +134,7 @@ struct epf_ntb {
>>  	bool linkup;
>>  	u32 spad_size;
>>  
>> -	enum pci_barno epf_ntb_bar[6];
>> +	enum pci_barno epf_ntb_bar[VNTB_BAR_NUM];
>>  
>>  	struct epf_ntb_ctrl *reg;
>>  
>> @@ -654,6 +656,62 @@ static void epf_ntb_epc_destroy(struct epf_ntb *ntb)
>>  	pci_epc_put(ntb->epf->epc);
>>  }
>>  
>> +
>> +/**
>> + * epf_ntb_is_bar_used() - Check if a bar is used in the ntb configuration
>> + * @ntb: NTB device that facilitates communication between HOST and VHOST
>> + * @barno: Checked bar number
>> + *
>> + * Returns: true if used, false if free.
>> + */
>> +static bool epf_ntb_is_bar_used(struct epf_ntb *ntb,
>> +				enum pci_barno barno)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < VNTB_BAR_NUM; i++) {
>> +		if (ntb->epf_ntb_bar[i] == barno)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * epf_ntb_find_bar() - Assign BAR number when no configuration is provided
>> + * @epc_features: The features provided by the EPC specific to this EPF
>> + * @ntb: NTB device that facilitates communication between HOST and VHOST
>> + * @barno: Bar start index
>> + *
>> + * When the BAR configuration was not provided through the userspace
>> + * configuration, automatically assign BAR as it has been historically
>> + * done by this endpoint function.
>> + *
>> + * Returns: the BAR number found, if any. -1 otherwise
>> + */
>> +static int epf_ntb_find_bar(struct epf_ntb *ntb,
>> +			    const struct pci_epc_features *epc_features,
>> +			    enum epf_ntb_bar bar,
>> +			    enum pci_barno barno)
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
>> +
>> +		barno += 1;
>> +	}
>> +
>> +	return barno;
>> +}
>> +
>>  /**
>>   * epf_ntb_init_epc_bar() - Identify BARs to be used for each of the NTB
>>   * constructs (scratchpad region, doorbell, memorywindow)
>> @@ -676,23 +734,21 @@ static int epf_ntb_init_epc_bar(struct epf_ntb *ntb)
>>  	epc_features = pci_epc_get_features(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no);
>>  
>>  	/* These are required BARs which are mandatory for NTB functionality */
>> -	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++, barno++) {
>> -		barno = pci_epc_get_next_free_bar(epc_features, barno);
>> +	for (bar = BAR_CONFIG; bar <= BAR_MW1; bar++) {
>> +		barno = epf_ntb_find_bar(ntb, epc_features, bar, barno);
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
>> +		barno = epf_ntb_find_bar(ntb, epc_features, bar, barno);
>>  		if (barno < 0) {
>>  			ntb->num_mws = i;
>>  			dev_dbg(dev, "BAR not available for > MW%d\n", i + 1);
>>  		}
>> -		ntb->epf_ntb_bar[bar] = barno;
>>  	}
>>  
>>  	return 0;
>> @@ -860,6 +916,37 @@ static ssize_t epf_ntb_##_name##_store(struct config_item *item,	\
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
>> +									\
>> +	return len;							\
>> +	}
>> +
>>  static ssize_t epf_ntb_num_mws_store(struct config_item *item,
>>  				     const char *page, size_t len)
>>  {
>> @@ -899,6 +986,18 @@ EPF_NTB_MW_R(mw3)
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
>> @@ -910,6 +1009,12 @@ CONFIGFS_ATTR(epf_ntb_, mw4);
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
>> @@ -922,6 +1027,12 @@ static struct configfs_attribute *epf_ntb_attrs[] = {
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
>> @@ -1379,6 +1490,7 @@ static int epf_ntb_probe(struct pci_epf *epf,
>>  {
>>  	struct epf_ntb *ntb;
>>  	struct device *dev;
>> +	int i;
>>  
>>  	dev = &epf->dev;
>>  
>> @@ -1389,6 +1501,11 @@ static int epf_ntb_probe(struct pci_epf *epf,
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

