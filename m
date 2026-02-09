Return-Path: <ntb+bounces-1776-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGPTNZsDimluFQAAu9opvQ
	(envelope-from <ntb+bounces-1776-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Mon, 09 Feb 2026 16:56:11 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABC11239F
	for <lists+linux-ntb@lfdr.de>; Mon, 09 Feb 2026 16:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28890300341C
	for <lists+linux-ntb@lfdr.de>; Mon,  9 Feb 2026 15:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A039284898;
	Mon,  9 Feb 2026 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pbh7Tdal"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13B37FF60
	for <ntb@lists.linux.dev>; Mon,  9 Feb 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652519; cv=none; b=T14AzkJ2ADbC9OT7wVXsFCnZ3v27Aa4YzQt4Ulixl0hfxnFg4RGGJ1HFVSbJcW3VHLJ1FdfCDva1vw/cS1otBHalzz+wVyKfgzKgbc+3sobdAPGE2azbofjsZYZfsnDjXQK3zZENHuTi6f4wNhA0OKmeVIOzPzqFUDTfua17fhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652519; c=relaxed/simple;
	bh=ul9V/OztywQVlLvI3V2sVmX/M238fBQSQnna8FAxplY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbEMXY/nnjsojxLFfA86xSYVflaMi67khSfQjRxP3HTZVr6kPdF2vWyDi+1iyOLq9jRbaRJWLVpRvEw8cwEs0D8wj2c6j3D1CSivWbED3jjA/QNGas7z/ctnYB7cVl3iieprhw/c50ikpIZH75pcuHZtNvLx/hF58BvwiYb8RiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pbh7Tdal; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770652519; x=1802188519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ul9V/OztywQVlLvI3V2sVmX/M238fBQSQnna8FAxplY=;
  b=Pbh7Tdaln3hHdnqxTiRNTR8MlsvFjUxzhy2w+OkuabxGgIJQcGVJxyLy
   PTUGY5v+/Mnd5U7/EZUyuB0xA22P/NSmUWFDR4Yh8THNiOwzQwQr9TG4E
   3EQVdX4EB1EYF7BUgKubrJgx/BCDIN85xGOEpJfmHxSJGhbPaOCw8GpeI
   b6Ny2rbd3p/1vOLP4co0n7p5D1s2k94SjBKFdGB3C53bt2AYot92alL0C
   7oP6mxLLj29QAumip24mu0b9vGPeRLbTx2vsqGuS35K8aoTCHved7kKI8
   YQRygbDzXUExXMA8T/K+LCeYZwqhww3qo28QVdzivq09iRPqaYztYjzg/
   w==;
X-CSE-ConnectionGUID: dRgFuvKkQLa5N5G4NaDUJQ==
X-CSE-MsgGUID: ZD2wkkniTvOeBfrCbkn7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82872733"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82872733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:55:19 -0800
X-CSE-ConnectionGUID: FvocvA0eQKuAOyVyn3tjIg==
X-CSE-MsgGUID: xkOeswHhR0a/C/5Xs1JL2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="234569649"
Received: from jmaxwel1-mobl.amr.corp.intel.com (HELO [10.125.111.252]) ([10.125.111.252])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:55:17 -0800
Message-ID: <9fb67762-2c4f-4f29-9cec-17769f5ecd92@intel.com>
Date: Mon, 9 Feb 2026 08:55:16 -0700
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntb_hw_amd: Fix incorrect debug message in link disable
 path
To: Alok Tiwari <alok.a.tiwari@oracle.com>, Basavaraj.Natikar@amd.com,
 Shyam-sundar.S-k@amd.com, jdmason@kudzu.us, allenbh@gmail.com,
 ntb@lists.linux.dev
Cc: alok.a.tiwarilinux@gmail.com
References: <20260208164902.349805-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260208164902.349805-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oracle.com,amd.com,kudzu.us,gmail.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-1776-lists,linux-ntb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.jiang@intel.com,ntb@lists.linux.dev];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ntb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oracle.com:email]
X-Rspamd-Queue-Id: 42ABC11239F
X-Rspamd-Action: no action



On 2/8/26 9:49 AM, Alok Tiwari wrote:
> amd_ntb_link_disable() prints "Enabling Link" which is misleading.
> Update the message to reflect that the link is being disabled.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/ntb/hw/amd/ntb_hw_amd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
> index 1a163596ddf5..df9150669ad3 100644
> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
> @@ -376,7 +376,7 @@ static int amd_ntb_link_disable(struct ntb_dev *ntb)
>  
>  	if (ndev->ntb.topo == NTB_TOPO_SEC)
>  		return -EINVAL;
> -	dev_dbg(&ntb->pdev->dev, "Enabling Link.\n");
> +	dev_dbg(&ntb->pdev->dev, "Disabling Link.\n");
>  
>  	return 0;
>  }


