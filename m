Return-Path: <ntb+bounces-685-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B0688A62B
	for <lists+linux-ntb@lfdr.de>; Mon, 25 Mar 2024 16:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54C521C3AA7F
	for <lists+linux-ntb@lfdr.de>; Mon, 25 Mar 2024 15:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13D1156C77;
	Mon, 25 Mar 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meT28BSM"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C9156892
	for <ntb@lists.linux.dev>; Mon, 25 Mar 2024 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370101; cv=none; b=t/K/HxjmIJelzUqlNj1OVaTZt5EYthHVrPhdoI09oUIq3bN/xNgbW7QRelLea4o5Ev0qZeGydvv9LE9xsQrNRpjXm/Lz66TaIIA2j+lGsLfsm4QrqqF3pKpZLxUqUml9XuuyqXk4cMqKeCwoft9iNvIbFmnOM19Z09lZWo05j0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370101; c=relaxed/simple;
	bh=6jzjiwrkhrrxiOb3ouQm9/gN7kt04YtLniYwKlTluek=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ZuVgnxzlozN+orPAtaL57jPtMXKKySkS9Xz3fAotdoYdG0pD5Hn7qvrsS8JE8xFfpZbVWJGD9rmwMuO3NkOU6IQ4wLcy1vgQzYmfbjDG9ANhb9ZPuVCpxBXoZ9yjv7XNOlx0p10H5ZBrYYkT0roXlt4OPGpCJ0D3VCsilER+uh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meT28BSM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711370100; x=1742906100;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=6jzjiwrkhrrxiOb3ouQm9/gN7kt04YtLniYwKlTluek=;
  b=meT28BSM18Q5CeqZIYtu9mWAq3MfHi6+rVVaqz1DPzkIq3liaJn3P1nk
   lVozH64N2x/0psEQgAfOFmvF3e+zH4/DTzZa5J5YU/rVSTzLrUfNefPTe
   dZVn1qfkyutYbO2Ki1kqY2fgWyxsSU9zzNEGyyHZAI8sMBo5yNoXu10lW
   Sm4T7w64g6350vGEibsVq1GtaPeTfFSM8fGikouNS7VRcsyhtbewvPC+G
   MeVcUrLnEMw2QsUeRaaFuFBxCM9x4MC/alv9yQ/Rk7DCnCEo37hTU6gJv
   BkyY4/xA0BUjxmkaXomk7MlO2Zg/X45Laz+QtIS39Gr2C2oBYiFku/oLM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10139995"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="10139995"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 05:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="16268554"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 05:34:54 -0700
Message-ID: <3edd5823-bf54-4898-bcee-e1628c863388@linux.intel.com>
Date: Mon, 25 Mar 2024 13:34:51 +0100
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/28] sound: intel: Use PCI_IRQ_INTX
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivami <manivannan.sadhasivam@linaro.org>,
 linux-scsi@vger.kernel.org, "Martin K . Petersen"
 <martin.petersen@oracle.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, ntb@lists.linux.dev,
 Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-rdma@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240325070944.3600338-1-dlemoal@kernel.org>
 <20240325070944.3600338-5-dlemoal@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240325070944.3600338-5-dlemoal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/2024 8:09 AM, Damien Le Moal wrote:
> Use the macro PCI_IRQ_INTX instead of the deprecated PCI_IRQ_LEGACY
> macro.
> 
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>   sound/soc/intel/avs/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index d7f8940099ce..69818e4b43da 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -343,7 +343,7 @@ static int avs_hdac_acquire_irq(struct avs_dev *adev)
>   	int ret;
>   
>   	/* request one and check that we only got one interrupt */
> -	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI | PCI_IRQ_LEGACY);
> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI | PCI_IRQ_INTX);
>   	if (ret != 1) {
>   		dev_err(adev->dev, "Failed to allocate IRQ vector: %d\n", ret);
>   		return ret;

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

