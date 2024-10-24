Return-Path: <ntb+bounces-915-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C08D9AEE70
	for <lists+linux-ntb@lfdr.de>; Thu, 24 Oct 2024 19:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BCCB1C212D0
	for <lists+linux-ntb@lfdr.de>; Thu, 24 Oct 2024 17:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A881F80B9;
	Thu, 24 Oct 2024 17:46:07 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE51D63E8;
	Thu, 24 Oct 2024 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791967; cv=none; b=lInlnErrEdTmVro7e76ram9WLCaGRmkfh6AiLBckz7BaFUs1qBLcswirIwm6dv2xu88FXFC37DWowcKw0IhqlDQZe4weBPqmq39kBGOz+6vAMMRqOZu2yI8aORsOTIoSPSoAb3vB/bo1rNPIaGeuJ9ohdGAkKFSXA8XOOXFUfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791967; c=relaxed/simple;
	bh=I9Q4P1XK4E+Wu/v/AH+WHEDOhWLlmc7Q+i47sR0qHAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eq1AmU3HVy9YgkmjIs/NOg1+CDkWp/CBNOETSTK2n3mXDRxsYHhJlYiTzAdDAg3+mT59OhODJc4Cww2kCnzdBVJ5ph7r6lvoHBFqMXbC2CrAK2ub1lZpx/eG37X9obTI0C31meq+m92p0FQqWZF5T60u0aNeYtTVFB7qHzI8CH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.90.120) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 24 Oct
 2024 20:45:45 +0300
Message-ID: <884de5fe-9f3b-4720-8be6-88972d8fc897@omp.ru>
Date: Thu, 24 Oct 2024 20:45:44 +0300
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Ivan Epifanov <isage.dna@gmail.com>, <andriy.shevchenko@intel.com>
CC: <aospan@netup.ru>, <conor.dooley@microchip.com>,
	<ddrokosov@sberdevices.ru>, <dmaengine@vger.kernel.org>, <dushistov@mail.ru>,
	<fancer.lancer@gmail.com>, <geert@linux-m68k.org>,
	<gregkh@linuxfoundation.org>, <hoan@os.amperecomputing.com>,
	<ink@jurassic.park.msu.ru>, <jeffbai@aosc.io>, <kexybiscuit@aosc.io>,
	<linux-alpha@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fpga@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
	<mattst88@gmail.com>, <netdev@vger.kernel.org>, <nikita@trvn.ru>,
	<ntb@lists.linux.dev>, <patches@lists.linux.dev>,
	<richard.henderson@linaro.org>, <serjk@netup.ru>, <shc_work@mail.ru>,
	<torvalds@linux-foundation.org>, <torvic9@mailbox.org>,
	<tsbogend@alpha.franken.de>, <v.georgiev@metrotek.ru>,
	<wangyuli@uniontech.com>, <wsa+renesas@sang-engineering.com>, <xeb@mail.ru>
References: <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
 <20241024170743.241144-1-isage.dna@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241024170743.241144-1-isage.dna@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/24/2024 17:32:48
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188703 [Oct 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 40 0.3.40
 cefee68357d12c80cb9cf2bdcf92256b1d238d22
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.90.120 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.90.120 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.90.120
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/24/2024 17:35:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/24/2024 2:57:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/24/24 8:07 PM, Ivan Epifanov wrote:
[...]

>> $ git log --author="andriy.shevchenko@intel.com"
>> $ 
> 
> Look who's talking

$ git shortlog | grep "Andy Shevchenko"
Andy Shevchenko (5564):
[...]

   Even I was surprised!

MBR, Sergey


