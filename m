Return-Path: <ntb+bounces-1108-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BAEA41EDF
	for <lists+linux-ntb@lfdr.de>; Mon, 24 Feb 2025 13:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91B4E19C1493
	for <lists+linux-ntb@lfdr.de>; Mon, 24 Feb 2025 12:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F9223370F;
	Mon, 24 Feb 2025 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgOB4+I0"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98521931E;
	Mon, 24 Feb 2025 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399737; cv=none; b=SW5yuoWz7C1QoKz9MjW7I7Wy4z2UVvdmI5/ZFbqagbgw+XCpuPdpcogdX7kghA2oArChdx+hooSIE8hf868t2G5RG0uDHJBJJqDtmyy4yTySutXASFEwAgh77kWpBxSrQzgdp0tTCsi2GfOyYdTeajaamGs2FCb7ubGNJIcIgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399737; c=relaxed/simple;
	bh=HFUefC/P5P0u1guY5j9N980bP23neVViId3YrVW8xJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax0T1H/b51tRMIJCTwYelYfanSAKtnEUxXpd1XbR4Ks1iU1jJzWf5WTfphYbUlS1/rXTG+dosb6P80sBaQ+yJspkB9h1syEFcBlBJuq0BaOJ1XW8chgFyEzHgUXU2SWxMV9e9uTKckZriVZf28Gr+F8Q5i1HHTRpl+lyjSsxGiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgOB4+I0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740399736; x=1771935736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFUefC/P5P0u1guY5j9N980bP23neVViId3YrVW8xJ4=;
  b=WgOB4+I0DzWSlyqMzsmrTdq8bK6COP2BFnsR30cPKNz6l/3yIB4bCiaK
   tcLmRrZ4xPvlmySdwxyXYaSf1vUJzM4zK8T8Mo0CrPkC+2UFJ8SWSwC9Q
   B65A/sL1hBAwfkzLPJ3ogL886hTKCrfSdSFt2bZCTpq/OPvv2O1VXM4tL
   UpGrAlZf7LLffpT58ZiPA+eOOdQF+ugppVdREpXdZQhlAjo+gN/cB2Sq0
   Zea7KVYs/1+6LmZ549+r/lvD5t1ZELzfpIfhGAtHhexw6EQajYh9+tqHq
   2m15rACDVR7YESYU+kZhZDxG2/Bq6taKJ1+SeVPLE1wvqnDffzBw98LaV
   Q==;
X-CSE-ConnectionGUID: llT9giXCR5GXhIzIhm6EXQ==
X-CSE-MsgGUID: 6k5CVTPMRGKyJi+Te411ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52552228"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="52552228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:22:15 -0800
X-CSE-ConnectionGUID: ZrQLmEUcTo+rS7YahFOsHQ==
X-CSE-MsgGUID: a+u+R8KQQWaj7Y8awt/CjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116034465"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:22:10 -0800
Date: Mon, 24 Feb 2025 14:22:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, perex@perex.cz, tiwai@suse.com,
	broonie@kernel.org, lgirdwood@gmail.com, deller@gmx.de,
	sre@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, jdmason@kudzu.us, fancer.lancer@gmail.com,
	oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/13] fbdev: pxafb: use devm_kmemdup_array()
Message-ID: <Z7xkb9m_Qc54znOH@black.fi.intel.com>
References: <20250221165333.2780888-8-raag.jadav@intel.com>
 <202502220449.DvJuMgsL-lkp@intel.com>
 <Z7xQ2y-7U5-OhzhB@smile.fi.intel.com>
 <Z7xW2AIz6vUo6mu-@black.fi.intel.com>
 <Z7xa0cGZvGxsGCrI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7xa0cGZvGxsGCrI@smile.fi.intel.com>

On Mon, Feb 24, 2025 at 01:41:05PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 24, 2025 at 01:24:08PM +0200, Raag Jadav wrote:
> > On Mon, Feb 24, 2025 at 12:58:35PM +0200, Andy Shevchenko wrote:
> > > On Sat, Feb 22, 2025 at 05:41:24AM +0800, kernel test robot wrote:
> > > > Hi Raag,
> > > > 
> > > > kernel test robot noticed the following build warnings:
> > > > 
> > > > [auto build test WARNING on b16e9f8547a328b19af59afc213ce323124d11e9]
> > > > 
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/ASoC-Intel-avs-use-devm_kmemdup_array/20250222-010322
> > > > base:   b16e9f8547a328b19af59afc213ce323124d11e9
> > > > patch link:    https://lore.kernel.org/r/20250221165333.2780888-8-raag.jadav%40intel.com
> > > > patch subject: [PATCH v1 07/13] fbdev: pxafb: use devm_kmemdup_array()
> > > > config: arm-randconfig-004-20250222 (https://download.01.org/0day-ci/archive/20250222/202502220449.DvJuMgsL-lkp@intel.com/config)
> > > > compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220449.DvJuMgsL-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202502220449.DvJuMgsL-lkp@intel.com/
> > > > 
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > >    drivers/video/fbdev/pxafb.c: In function 'pxafb_probe':
> > > > >> drivers/video/fbdev/pxafb.c:2236:13: warning: unused variable 'i' [-Wunused-variable]
> > > >     2236 |         int i, irq, ret;
> > > >          |             ^
> > > 
> > > Ragg, please, fix this, and issue a v2 with the link to fixed PR:
> > > https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com.
> > 
> > Sure, but perhaps wait a few days for review comments.
> 
> Then perhaps answering to the cover letter that the maintainers who want to
> apply should use the updated PR?

Okay, but I'm not sure how this plays out for those who already pulled
the old PR, i.e. Sebastian.

Anything to worry about here?

Raag

