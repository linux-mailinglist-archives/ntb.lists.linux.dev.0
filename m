Return-Path: <ntb+bounces-712-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5699025AC
	for <lists+linux-ntb@lfdr.de>; Mon, 10 Jun 2024 17:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E84571F27716
	for <lists+linux-ntb@lfdr.de>; Mon, 10 Jun 2024 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318F713FD84;
	Mon, 10 Jun 2024 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/cDA5Mv"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78535140368
	for <ntb@lists.linux.dev>; Mon, 10 Jun 2024 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718033456; cv=none; b=Bbw4WFSgAk/6Ro73Hz/oJVbGLru8kzhIs7LK65IhAkXxXK46LhqcXwYVk6D7bsDt/6fG2ykq2cVqJ6dWv8l185Mf6b+v+ML5p+XPVbhgPXsy7u0roJQUhrDqEy/E6lkqrQGCQvPh33uqq5kwnpQTl5veu3GUVrGHTfvdumHS0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718033456; c=relaxed/simple;
	bh=iKyqX56r+EgSOmMQluTvLMOh9m7hcIcp9NB6Ui81e2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GERjR7jmurAAjiBLD/qKi0Tw45uTGaND91V5/gs3C8p1d1G/I2Dz7kwsMLGulbfVspzqVHvsEXSbUUSutXW8TOllhZXN+zZRi19ZcsIj+rJdLOvzRBAMfLC09CEFx03b2fWctFxxuJwLFo4w0Ti6Eo8ReiUXl/MtABkMTyU6bdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/cDA5Mv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718033454; x=1749569454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iKyqX56r+EgSOmMQluTvLMOh9m7hcIcp9NB6Ui81e2A=;
  b=W/cDA5MvuVlgsycJPzyEVl0sJcwz7JRflyACIkiTyE77aWwvu1w8mYRp
   cr8GeQZK5PpEHhc5YDXrfkGTB5l8+6A8XtgmoqD/MSL6Ipb8d8MAL+4vL
   AE2y79PLNCbqLZB143gwgl+pneptPDRe5FVnU+rsrf3pUZEuSnY4UaZHr
   qPwFYmWMMgzRRojpf0jlv2ghTo0xWDu3i/c6H9a3RcHSpAC+Q6bLMavpx
   Jw3vidV8yAhbNE4XcupNjThS4Z7w8Stt4E+2kiLw7eiCCpJ+RF27sdvaU
   dVodRkbEK35xb9kjpP2aHBAqdkMLwfCmNxBQ6S7hvJuDRx7QwX44mDHYS
   Q==;
X-CSE-ConnectionGUID: teQ7+a4uT0i+ehKmpRM6Fw==
X-CSE-MsgGUID: 29pG5Bx+SMewM50XP93zGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14854895"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14854895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 08:30:54 -0700
X-CSE-ConnectionGUID: OvsHo99mTbmHyP838esLMA==
X-CSE-MsgGUID: cZ9jOguASvm+QrACeEky3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="70267100"
Received: from unknown (HELO [10.125.110.62]) ([10.125.110.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 08:30:53 -0700
Message-ID: <aa8b551a-a2ba-408b-aaaf-8af363bed961@intel.com>
Date: Mon, 10 Jun 2024 08:30:52 -0700
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: switchtec: make switchtec_class constant
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 ntb@lists.linux.dev
References: <2024061053-online-unwound-b173@gregkh>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <2024061053-online-unwound-b173@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/24 1:20 AM, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, we should make all 'class' structures declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at runtime.
> 
> Cc: Kurt Schwemmer <kurt.schwemmer@microsemi.com>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Jon Mason <jdmason@kudzu.us>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Allen Hubbe <allenbh@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> Cc: ntb@lists.linux.dev
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/ntb/hw/mscc/ntb_hw_switchtec.c |  2 +-
>  drivers/pci/switch/switchtec.c         | 16 ++++++++--------
>  include/linux/switchtec.h              |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> index d6bbcc7b5b90..31946387badf 100644
> --- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> +++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> @@ -1565,7 +1565,7 @@ static struct class_interface switchtec_interface  = {
>  
>  static int __init switchtec_ntb_init(void)
>  {
> -	switchtec_interface.class = switchtec_class;
> +	switchtec_interface.class = &switchtec_class;
>  	return class_interface_register(&switchtec_interface);
>  }
>  module_init(switchtec_ntb_init);
> diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
> index 5a4adf6c04cf..c7e1089ffdaf 100644
> --- a/drivers/pci/switch/switchtec.c
> +++ b/drivers/pci/switch/switchtec.c
> @@ -37,7 +37,9 @@ MODULE_PARM_DESC(nirqs, "number of interrupts to allocate (more may be useful fo
>  static dev_t switchtec_devt;
>  static DEFINE_IDA(switchtec_minor_ida);
>  
> -struct class *switchtec_class;
> +const struct class switchtec_class = {
> +	.name = "switchtec",
> +};
>  EXPORT_SYMBOL_GPL(switchtec_class);
>  
>  enum mrpc_state {
> @@ -1363,7 +1365,7 @@ static struct switchtec_dev *stdev_create(struct pci_dev *pdev)
>  
>  	dev = &stdev->dev;
>  	device_initialize(dev);
> -	dev->class = switchtec_class;
> +	dev->class = &switchtec_class;
>  	dev->parent = &pdev->dev;
>  	dev->groups = switchtec_device_groups;
>  	dev->release = stdev_release;
> @@ -1851,11 +1853,9 @@ static int __init switchtec_init(void)
>  	if (rc)
>  		return rc;
>  
> -	switchtec_class = class_create("switchtec");
> -	if (IS_ERR(switchtec_class)) {
> -		rc = PTR_ERR(switchtec_class);
> +	rc = class_register(&switchtec_class);
> +	if (rc)
>  		goto err_create_class;
> -	}
>  
>  	rc = pci_register_driver(&switchtec_pci_driver);
>  	if (rc)
> @@ -1866,7 +1866,7 @@ static int __init switchtec_init(void)
>  	return 0;
>  
>  err_pci_register:
> -	class_destroy(switchtec_class);
> +	class_unregister(&switchtec_class);
>  
>  err_create_class:
>  	unregister_chrdev_region(switchtec_devt, max_devices);
> @@ -1878,7 +1878,7 @@ module_init(switchtec_init);
>  static void __exit switchtec_exit(void)
>  {
>  	pci_unregister_driver(&switchtec_pci_driver);
> -	class_destroy(switchtec_class);
> +	class_unregister(&switchtec_class);
>  	unregister_chrdev_region(switchtec_devt, max_devices);
>  	ida_destroy(&switchtec_minor_ida);
>  
> diff --git a/include/linux/switchtec.h b/include/linux/switchtec.h
> index 8d8fac1626bd..cdb58d61c152 100644
> --- a/include/linux/switchtec.h
> +++ b/include/linux/switchtec.h
> @@ -521,6 +521,6 @@ static inline struct switchtec_dev *to_stdev(struct device *dev)
>  	return container_of(dev, struct switchtec_dev, dev);
>  }
>  
> -extern struct class *switchtec_class;
> +extern const struct class switchtec_class;
>  
>  #endif

