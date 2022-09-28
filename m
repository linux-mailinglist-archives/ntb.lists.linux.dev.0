Return-Path: <ntb+bounces-296-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADC5ED3E5
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 06:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA218280AB0
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 04:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381F3A28;
	Wed, 28 Sep 2022 04:30:54 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824067E8
	for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 04:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664339452; x=1695875452;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dpjycpQPackQteLHBBGJE4Wm5YPd9EdeBKzweZPn9SA=;
  b=iDBZWb2aRl4WRfhnu5e6L6QUEKm1g1qpYZe3sRCpDlnuxnNe/bQIeXgi
   DYlzBnzTo6tV5DHY/E+niNwCo8dBKDmTiDAhDvlLvAHQpepDIX0JLBMS0
   bFrZWbzguRCfWaxbEX9SslhtNZh17BHgZSblQ13XSMhvae58LdBKSlJhU
   XiZtNZ41iAR5KVfe+IGvjWHi6G+waH2439rwzIzu80vsOBjqeLx9Fao7F
   HcS2uFPAElgONrcKSKdQ7KHI32HOpBgpvLY2aADAByabDB9JDJVRR8l/G
   fgSjSf3rKHlQJJ0hxYo6TkEh9VUhy1D3mimWzG4WI4CxPUViLfHQiCliP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302413040"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="302413040"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 21:30:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="684250788"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="684250788"
Received: from weimingg-mobl.amr.corp.intel.com (HELO [10.212.244.112]) ([10.212.244.112])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 21:30:51 -0700
Message-ID: <d3a5edb8-03cb-2ecb-b54c-9a2e05765805@linux.intel.com>
Date: Tue, 27 Sep 2022 21:30:50 -0700
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [External] Re: [PATCH v2 3/9] NTB: Change to use
 pci_aer_clear_uncorrect_error_status()
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>, bhelgaas@google.com,
 ruscur@russell.cc, oohall@gmail.com, fancer.lancer@gmail.com,
 jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com,
 james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, linux-scsi@vger.kernel.org
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
 <20220927153524.49172-4-chenzhuo.1@bytedance.com>
 <d8123aa3-a5e0-6131-bd0d-109f67923ff2@linux.intel.com>
 <1d62d0ac-b47c-94b5-dd75-b7df71817d0d@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1d62d0ac-b47c-94b5-dd75-b7df71817d0d@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/27/22 9:20 PM, Zhuo Chen wrote:
> 
> 
> On 9/28/22 3:39 AM, Sathyanarayanan Kuppuswamy wrote:
>>
>>
>> On 9/27/22 8:35 AM, Zhuo Chen wrote:
>>> Status bits for ERR_NONFATAL errors only are cleared in
>>> pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
>>> error status in idt_init_pci(), so we change to use
>>> pci_aer_clear_uncorrect_error_status().
>>
>> You mean currently driver does not clear fatal errors now, and it is
>> a problem? Any error reported?
>>
> Hi Sathyanarayanan,
> 
> No error reports yet, I just changes the behavior back to what it was before commit e7b0b847de6d ("PCI/AER: Clear only ERR_NONFATAL bits during non-fatal recovery"), because this commit change the original function in commit bf2a952d31d2 ("NTB: Add IDT 89HPESxNTx PCIe-switches support").
> 

Ok. Thanks for clarifying.

>> Also, I am wondering why is it required to clear errors during init
>> code. Is it a norm?
>>
> I think there is no need to clear errors during init code.
>>>
>>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>>> ---
>>>   drivers/ntb/hw/idt/ntb_hw_idt.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
>>> index 0ed6f809ff2e..d5f0aa87f817 100644
>>> --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
>>> +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
>>> @@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
>>>       ret = pci_enable_pcie_error_reporting(pdev);
>>>       if (ret != 0)
>>>           dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
>>> -    else /* Cleanup nonfatal error status before getting to init */
>>> -        pci_aer_clear_nonfatal_status(pdev);
>>> +    else /* Cleanup uncorrectable error status before getting to init */
>>> +        pci_aer_clear_uncorrect_error_status(pdev);
>>>         /* First enable the PCI device */
>>>       ret = pcim_enable_device(pdev);
>>
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

