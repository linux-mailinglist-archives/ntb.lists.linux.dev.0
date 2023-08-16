Return-Path: <ntb+bounces-531-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6534E77EBA4
	for <lists+linux-ntb@lfdr.de>; Wed, 16 Aug 2023 23:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0E61C211A6
	for <lists+linux-ntb@lfdr.de>; Wed, 16 Aug 2023 21:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266FD1989D;
	Wed, 16 Aug 2023 21:22:17 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49C3D60
	for <ntb@lists.linux.dev>; Wed, 16 Aug 2023 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=sw8EX7W/LW/Jwme06SDZwl0frTKXlowZ9/wflHHWXPQ=; b=Aqu7s3SdwVz/lN2At96Rmazjj1
	8cWtZYYC1CTExE9ndC23BXoWFlx7H+PTgI7FHH7n6mxNqBAuSP5gjdehoXJQGpylYhWao/NPMdm21
	YhDMGKTMlJsCZxdpvdB9ClM2D62zF4GkBPIek643q7j/SI5+H+oRlmgIhtX69GAURgtvGQg7XHu3H
	jyPs7ZJZpfw6FqM/4EM9hEaGS+GbPs3ZuRnhvKUxa+P89mDtz9/p3uIpQlcaVo1ss+VSweWUDI081
	a/+5sGu9eLe6lpOGHgslbYPvrSYXrabwF26KeVSLL8AKawtkaBvee4kwjzFTcW7u4sSifW3HRUk+f
	MPJw7dig==;
Received: from d75-158-34-12.abhsia.telus.net ([75.158.34.12] helo=[192.168.11.155])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <logang@deltatee.com>)
	id 1qWNKz-00DCsd-UK; Wed, 16 Aug 2023 14:41:54 -0600
Message-ID: <36368b25-0c13-107b-d1ba-77df7fac036d@deltatee.com>
Date: Wed, 16 Aug 2023 14:41:51 -0600
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Yajun Deng <yajun.deng@linux.dev>, kurt.schwemmer@microsemi.com,
 jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com
Cc: linux-pci@vger.kernel.org, ntb@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230816083305.1426718-1-yajun.deng@linux.dev>
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20230816083305.1426718-1-yajun.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 75.158.34.12
X-SA-Exim-Rcpt-To: yajun.deng@linux.dev, kurt.schwemmer@microsemi.com, jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com, linux-pci@vger.kernel.org, ntb@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [PATCH] ntb_hw_switchtec: Fix shift-out-of-bounds in
 switchtec_ntb_mw_set_trans
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2023-08-16 02:33, Yajun Deng wrote:
> There is a kernel API ntb_mw_clear_trans() would pass 0 to both addr and
> size. This would make xlate_pos negative.
> 
> [   23.734156] switchtec switchtec0: MW 0: part 0 addr 0x0000000000000000 size 0x0000000000000000
> [   23.734158] ================================================================================
> [   23.734172] UBSAN: shift-out-of-bounds in drivers/ntb/hw/mscc/ntb_hw_switchtec.c:293:7
> [   23.734418] shift exponent -1 is negative
> 
> Ensuring xlate_pos is a positive or zero before BIT.
> 
> Fixes: 1e2fd202f859 ("ntb_hw_switchtec: Check for alignment of the buffer in mw_set_trans()")
> Signed-off-by: Yajun Deng <yajun.deng@linux.dev>

That makes sense. Thanks!

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Logan

