Return-Path: <ntb+bounces-448-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4DB6AE5E3
	for <lists+linux-ntb@lfdr.de>; Tue,  7 Mar 2023 17:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9280F2809B3
	for <lists+linux-ntb@lfdr.de>; Tue,  7 Mar 2023 16:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553F2AD56;
	Tue,  7 Mar 2023 16:06:55 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2EAD49
	for <ntb@lists.linux.dev>; Tue,  7 Mar 2023 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678205213; x=1709741213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v6waBatXx3XkI8tF12MNTcc05fpv5KRWhE7ptpCmzDo=;
  b=jKQd2fKxk3FRG51sXPzs2vsdBHxTqh+BafyLikjgP3USM3cDXgdd0Pwm
   r7x8F28CeaXprSlsEEe0/zXgxtTzb4QyHAxn9pFZdOjW66z7c6NIAOLEx
   2jkHptXbWzuwMK+qV+HcshbKv9YVKS5aVtRmU+htGEeAV/zl3zyo6kiVT
   bjBKhlteq3icHYh0IgzLlQB6uLnOc7r4Mvgx8SFpSbkBd0Vu763O9iLBB
   BAfsHpn3+E/eazzRCFy9sdU+6Miena5aILq1ekXHMwNFCRq5wCGlnNPXX
   PHMJD0HPPPsU6FsZkjxpiUH2zcdQ75rrLmDhILtMoc/XYfuu4qVH/h/bL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334602816"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="334602816"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 08:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="850747989"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="850747989"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.212.116.173]) ([10.212.116.173])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 08:05:39 -0800
Message-ID: <e4ac3d74-9a91-e4ff-eee3-67237f35ac7b@intel.com>
Date: Tue, 7 Mar 2023 09:05:38 -0700
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v2] ntb_tool: check null return of devm_kcalloc in
 tool_init_mws
Content-Language: en-US
To: Kang Chen <void0red@gmail.com>, fancer.lancer@gmail.com
Cc: allenbh@gmail.com, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
 ntb@lists.linux.dev
References: <20230306152810.ptb622tfhoxehhdc@mobilestation>
 <20230307122021.1569285-1-void0red@gmail.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230307122021.1569285-1-void0red@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/7/23 5:20 AM, Kang Chen wrote:
> devm_kcalloc may fails, tc->peers[pidx].outmws might be null
> and will cause null pointer dereference later.
> 
> Fixes: 7f46c8b3a552 ("NTB: ntb_tool: Add full multi-port NTB API support")
> Signed-off-by: Kang Chen <void0red@gmail.com>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

You forgot to pick up my review tag. I do recommend using the tool 'b4'. 
It picks up all the tags for you and works rather well.

> ---
> v2 -> v1: add Fixes and Reviewed-by tags
> 
>   drivers/ntb/test/ntb_tool.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/ntb/test/ntb_tool.c b/drivers/ntb/test/ntb_tool.c
> index 5ee0afa62..eeeb4b1c9 100644
> --- a/drivers/ntb/test/ntb_tool.c
> +++ b/drivers/ntb/test/ntb_tool.c
> @@ -998,6 +998,8 @@ static int tool_init_mws(struct tool_ctx *tc)
>   		tc->peers[pidx].outmws =
>   			devm_kcalloc(&tc->ntb->dev, tc->peers[pidx].outmw_cnt,
>   				   sizeof(*tc->peers[pidx].outmws), GFP_KERNEL);
> +		if (tc->peers[pidx].outmws == NULL)
> +			return -ENOMEM;
>   
>   		for (widx = 0; widx < tc->peers[pidx].outmw_cnt; widx++) {
>   			tc->peers[pidx].outmws[widx].pidx = pidx;

