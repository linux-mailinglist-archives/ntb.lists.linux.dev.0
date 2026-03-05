Return-Path: <ntb+bounces-2019-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFYaJcCwqWlXCgEAu9opvQ
	(envelope-from <ntb+bounces-2019-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Thu, 05 Mar 2026 17:35:12 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE221574B
	for <lists+linux-ntb@lfdr.de>; Thu, 05 Mar 2026 17:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CD9E30FED6B
	for <lists+linux-ntb@lfdr.de>; Thu,  5 Mar 2026 16:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299723D34AA;
	Thu,  5 Mar 2026 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqekTMVt"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143A3093C6
	for <ntb@lists.linux.dev>; Thu,  5 Mar 2026 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728371; cv=none; b=sXuo6bNJyCIeH50re3WvwBrtV8baslyKY3JBQ0gn0yhxxshzCLmWVe69ichLYeH9zboKRSZoj56v2EHWug2WY6NK1UDfWUz1p/d17N+xPFSbmTx1eHK2Q8t8E+f2Rv2M6aNHy//R7qLRiCcZV/fLeqNJYiZi9yP80UOfAeTOTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728371; c=relaxed/simple;
	bh=/j3JWFGvhOct2mNLMxpVlx3tr4B/fG6y4LhAshf9ybM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIWPc9alEv7trDb1bK5cwws5AcNr9Hw6K8hni++fcAyJ4u/WA4kGSOhCINZMIDsj8G2sApqmFQFHFNVS3aa6josl8Q5aSkETR8uA95YejmZFhJVEp+pcOWCnrbGTDXMitfNWy6LMpJ2y5i4zZi1wS+qwJo0+DpQOyX/RToJFr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqekTMVt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772728369; x=1804264369;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/j3JWFGvhOct2mNLMxpVlx3tr4B/fG6y4LhAshf9ybM=;
  b=WqekTMVtpJ5hye/0lEeKBGgk/KDlwPuMhDCpw6gaASJFlpMlHoZ2t8X6
   lUkkn0P3Yf0mJX7GMMGdHXTU4PHU9L3kHMwBdB9QaRasZWDHbYfCCWuOv
   cdZEkOEP5VeFjfUVrdSmvKexgSAnzT4ndsyLSCdL4lBUxEMKyhbgmuyUl
   JmOf1Xgj4Vy1zWfLWvhVpG7hxHrbzEaXC7vQ4ad1+p/fyvnFGUxJC2SGn
   Tadu9wZ7H8wCpj9BczNfi+rwrgSZ0mnwmeAVcoQ8lqyAkyWqKnLUrXLzk
   sysRyTlDfMhKygwW7bxEWmdXMYjlPxDd7rHlMlOjLP3J/3lqLDrkIeU86
   w==;
X-CSE-ConnectionGUID: Qvf+zWKFSI2gaIc2xgaJDg==
X-CSE-MsgGUID: bHWEAbKhSbm/qfF/weai5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74013268"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="74013268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:32:49 -0800
X-CSE-ConnectionGUID: j7tiy0gGT32b/267iuzf/A==
X-CSE-MsgGUID: 01QCRghWTeW0NFGR6vwU9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249193182"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.109.42]) ([10.125.109.42])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:32:49 -0800
Message-ID: <17cdfa38-16d5-49cc-ac61-20b606a4308b@intel.com>
Date: Thu, 5 Mar 2026 09:32:47 -0700
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] NTB: Allow drivers to provide DMA mapping device
To: Koichiro Den <den@valinux.co.jp>, Jon Mason <jdmason@kudzu.us>
Cc: Allen Hubbe <allenbh@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Niklas Cassel <cassel@kernel.org>, ntb@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260302144522.750620-1-den@valinux.co.jp>
 <3ddba488-6577-4f04-8a50-d64850b7cc5b@intel.com>
 <2jb2u6hm2u7dcmexzhi45kaclgfysfhr3nxomvqfnxbp5dlwfx@dt7hraa6u52v>
 <244af3c1-21f4-4023-b465-0ccd85e1eb79@intel.com>
 <lycec7prrdejp3mpzrn5rzh5252vi7c7yypjiggrr74mcutdvq@y7kzzjm332rm>
 <b17c238b-3d0a-49b3-a012-a6e33766b8b0@intel.com>
 <lwayvep2vqwplyc45nr45zcz7rawutxe6q637p6gagw6asmlu3@ohqlnlmoymwl>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <lwayvep2vqwplyc45nr45zcz7rawutxe6q637p6gagw6asmlu3@ohqlnlmoymwl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3EFE221574B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,nxp.com,kernel.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2019-lists,linux-ntb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.jiang@intel.com,ntb@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ntb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action



On 3/4/26 8:23 PM, Koichiro Den wrote:
> On Wed, Mar 04, 2026 at 09:53:42AM -0700, Dave Jiang wrote:

<snip>

>> Probably should include it with this series if it's small. Having the user with new code is usually preferred.
> 
> I thought that, since the vNTB patch wouldn't work until the NTB changes are in,
> asking both the NTB and PCI EP maintainers to coordinate the apply order might
> be a bit awkward.
> 
> That said, if preferable, I can include the vNTB change in this series and
> explicitly ask the PCI EP maintainers not to pick up (new) Patch 3 until the NTB
> maintainers have acked and applied Patch 1-2.

Given that most of the patches are PCI EP, I think with acks from NTB, the whole thing can go through PCI EP if that works for you.

DJ

> 
> I'd also appreciate any thoughts from Jon or others on this (i.e. keeping
> this series NTB tree-only vs. including the vNTB change as well), as well
> as any feedback on this v1 series itself.
> 
> P.S. I sent a corrected code snippet a few minutes after my original post. The
> original snippet above was wrong, as it would violate the kernel-doc in Patch 1:
> 
>   "Drivers that implement .get_dma_dev() must return a non-NULL pointer."
> 
> Best regards,
> Koichiro
> 
>>


