Return-Path: <ntb+bounces-127-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C075911D1
	for <lists+linux-ntb@lfdr.de>; Fri, 12 Aug 2022 16:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EDF71C20988
	for <lists+linux-ntb@lfdr.de>; Fri, 12 Aug 2022 14:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792D41384;
	Fri, 12 Aug 2022 14:05:05 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78731371
	for <ntb@lists.linux.dev>; Fri, 12 Aug 2022 14:05:02 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id i24so804218qkg.13
        for <ntb@lists.linux.dev>; Fri, 12 Aug 2022 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=D56Mud74vCI6N1/lgYEGfcIlJUwB4pVaZJEBFueVf7g=;
        b=MUAJFyKWInuYGTg1DPA6NdHS/xXJQjtPIYaYci/ieyDy69WGWQS1Sawj8jDqXNo63n
         BVz7zoedAJDmFUY6Yb4A2zm6Dj/6AFzDifNqNZ2OL9d7AMuMXGtrKr1DTVF3bEys2Baj
         IqkIr/pvDnvgcTkduuXXYL+azLlvIG4D1CmQY5iNRJ2G/AYgpCEHKxchUYl5/8yl0GRR
         fGmssnHB8Semrj3xW1ARCMG4rN2HWdxTZ8BTOcsMrVJBUgVl+oFncd4E/sO4tnuz8EXH
         nTVM1LCGTB+2WvmObf9pIn9eLHWisDJSfLLhGCVH8B/ozY2/caqhGCM7gAJBIZUsTbFw
         YEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=D56Mud74vCI6N1/lgYEGfcIlJUwB4pVaZJEBFueVf7g=;
        b=X55H54i2xc2TM1rKjeqP+9pyo+R0wJ1g0becNqhe8+/yJJT7L9ohuR4gDpJ91igKs1
         sraFeUxrCh36922DLP7LmBBAZl3qQN4yOYtM8JDsZ/MKBsq11USa/C7ifs5B68SvCzoS
         QWCZYFMnUhBYlaNJWvxbkKc2KzeG3CD7Tj4VjkC5SlIn6VELA3vcK2ljahlRBAObmIxT
         +KOOUCS0Wx9KztuVmRs9AyZ4SxxQjRrYsIhtCDwh0T7HcI3Lj7YGUmJtbNlyLrcwCctL
         UJBv3knQux2AoOuxPk8EXtTWEf2/EihfaEEqFMCF3ZByr5NP8pchB+hG4TTjXHusTFs/
         Wurw==
X-Gm-Message-State: ACgBeo0Q+wLX1thvF61z+Enf6GsDIMQOH10VHFbBJb4tvmX1ScfE9Rog
	LTXkWN6/kzQa6EIGfpK/kVb7ww==
X-Google-Smtp-Source: AA6agR7nxb07266cxjR5MgHS3f09EC1lGUgYiw88+OBXkBnCgUu/xylB3nDXXaDsf/pzJUikgnKOcA==
X-Received: by 2002:a05:620a:414c:b0:6b5:cd90:6d27 with SMTP id k12-20020a05620a414c00b006b5cd906d27mr3069749qko.238.1660313101628;
        Fri, 12 Aug 2022 07:05:01 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id u12-20020ac858cc000000b003437b558f48sm608037qta.3.2022.08.12.07.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 07:05:01 -0700 (PDT)
Date: Fri, 12 Aug 2022 10:04:59 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Alexander Fomichev <a.fomichev@yadro.com>, ntb@lists.linux.dev,
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ntb_perf: Fix 64-bit division on 32-bit architectures
Message-ID: <YvZeC2UDZFdfb71M@kudzu.us>
References: <20220622174326.1832697-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622174326.1832697-1-nathan@kernel.org>

On Wed, Jun 22, 2022 at 10:43:26AM -0700, Nathan Chancellor wrote:
> When compiling for a 32-bit architecture, such as arm, an error occurs
> during modpost:
> 
>   ERROR: modpost: "__aeabi_uldivmod" [drivers/ntb/test/ntb_perf.ko] undefined!
> 
> The tries member of struct perf_thread is u64 so a 64-bit division
> helper is needed. Use div_u64_rem() to get the remainder of the division
> so that it can be checked against zero.
> 
> Fixes: dc150dfb081f ("ntb_perf: extend with burst latency measurement")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/ntb/test/ntb_perf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ntb/test/ntb_perf.c b/drivers/ntb/test/ntb_perf.c
> index 23e154bd41b9..4e05c7aa070d 100644
> --- a/drivers/ntb/test/ntb_perf.c
> +++ b/drivers/ntb/test/ntb_perf.c
> @@ -1118,6 +1118,7 @@ static int perf_run_latency(struct perf_thread *pthr)
>  	void __iomem *flt_dst, *bnd_dst;
>  	void *flt_src;
>  	u64 stop_at;
> +	u32 rem;
>  	int ret;
>  
>  	pthr->tries = 0;
> @@ -1146,7 +1147,8 @@ static int perf_run_latency(struct perf_thread *pthr)
>  		}
>  
>  		/* Avoid processor soft lock-ups */
> -		if (!(pthr->tries % RESCHEDULE_RATIO))
> +		div_u64_rem(pthr->tries, RESCHEDULE_RATIO, &rem);
> +		if (!rem)
>  			schedule();
>  	}
>  
> 
> base-commit: 0c4b285d9636cc850f55151fa6a250dd131e5192
> -- 
> 2.37.0.rc1
> 

Sorry for the extremely long delay in response.  This patch is in my
ntb branch and will be in my pull request for v5.20 which should be
going out later today.

Thanks,
Jon

