Return-Path: <ntb+bounces-1104-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94183A406D9
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Feb 2025 10:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8CC19C6123
	for <lists+linux-ntb@lfdr.de>; Sat, 22 Feb 2025 09:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E97C206F05;
	Sat, 22 Feb 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uk6WzGwz"
X-Original-To: ntb@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E681FF1CC
	for <ntb@lists.linux.dev>; Sat, 22 Feb 2025 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216436; cv=none; b=ExxUHJCgIo9Ql6FkrDCqs4uwX1H38XZdT1VsgbVIgMoA60dtv8IOJE8pQXRk5J2N1adwEU9mybPmB5iKdpEyURi8fOYOOKuhol0VbGNy2rpKBbTb4/qC5XRGVNNnabUpdizPsmqSg14QqVHH7KoarS3dOvEY0KdUFlnmpp2NcC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216436; c=relaxed/simple;
	bh=FVev92UU+75tG8hx10C4TAKPLDZ2pUimCKieA9mNh48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVy/rIAtDXcG/dNMshxUPjAxUXkcgWM+gbp80SXJCFW8hat0RG1MjKgtua/y39p3zebhNDvKsHCnxXU7K/1QBGDePEKKFbUOgNCJw0p5lhmb7gm5pzXS3xkIQyy62r15+F4Y0+3PEBmIy6jCmQsEgClVRDEYxoO4jzXxjHeNFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uk6WzGwz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740216434; x=1771752434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FVev92UU+75tG8hx10C4TAKPLDZ2pUimCKieA9mNh48=;
  b=Uk6WzGwzfwh2gpmbyUpGbt4yJbc2JM4jk5fxVZae2hVjK1tcuNWyf55O
   7bqOLRJzHLmyBA4jBbgW8rjB7TYp+5zJMpGjaEYvAvom/B+CndC1c/h5U
   jG80bnWWdaltEOHpanQz1j7CH34JVRprAlMA/9GuKWi2whgK0BNVUggms
   nTvHMYTU+esgan7ZbvSvNsP6ukoURBphq2ANbKcxsyuQ8cua2ULdSTU97
   PD+kfRKoQqLHoNA0G70HUu3fNYRj1yvhIfYBoIgCEz2gP0VXzAVpwZyt+
   7+/43pS56dZrBLGPYiK25F5I3foNpTamBg02D0cUNE+CYulVlZzzEqbSZ
   A==;
X-CSE-ConnectionGUID: bK+maibnQfSvMUkjYjHPfg==
X-CSE-MsgGUID: UoELCSzlR7mXb86M6Fo9vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40745137"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="40745137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 01:27:14 -0800
X-CSE-ConnectionGUID: ZBKg+MGISfGi3IcZZFNFGw==
X-CSE-MsgGUID: MwAuPv4vQXKtJC2OCII72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="138814785"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 01:27:10 -0800
Date: Sat, 22 Feb 2025 11:27:06 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, lgirdwood@gmail.com,
	deller@gmx.de, andriy.shevchenko@linux.intel.com, sre@kernel.org,
	sakari.ailus@linux.intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, jdmason@kudzu.us, fancer.lancer@gmail.com,
	linux-sound@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
	ntb@lists.linux.dev, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH v1 13/13] ntb: idt: use devm_kmemdup_array()
Message-ID: <Z7mYanh-5Q7-cU9j@black.fi.intel.com>
References: <20250221165333.2780888-1-raag.jadav@intel.com>
 <20250221165333.2780888-14-raag.jadav@intel.com>
 <43c873e1-737a-4119-abb7-49cc51acd6a0@intel.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43c873e1-737a-4119-abb7-49cc51acd6a0@intel.com>

Cc: Arnd

On Fri, Feb 21, 2025 at 10:05:09AM -0700, Dave Jiang wrote:
> On 2/21/25 9:53 AM, Raag Jadav wrote:
> > Convert to use devm_kmemdup_array() which is more robust.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> I think this patch [1] from earlier today makes this change unnecessary now.
> 
> [1]: https://lore.kernel.org/ntb/20250221085748.2298463-1-arnd@kernel.org/

Sure, in that case we can drop this one. Thanks for noticing.

Raag

> > ---
> >  drivers/ntb/hw/idt/ntb_hw_idt.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
> > index 544d8a4d2af5..dbfc53d0ef0c 100644
> > --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
> > +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
> > @@ -1103,16 +1103,11 @@ static struct idt_mw_cfg *idt_scan_mws(struct idt_ntb_dev *ndev, int port,
> >  		}
> >  	}
> >  
> > -	/* Allocate memory for memory window descriptors */
> > -	ret_mws = devm_kcalloc(&ndev->ntb.pdev->dev, *mw_cnt, sizeof(*ret_mws),
> > -			       GFP_KERNEL);
> > -	if (!ret_mws)
> > -		return ERR_PTR(-ENOMEM);
> > -
> >  	/* Copy the info of detected memory windows */
> > -	memcpy(ret_mws, mws, (*mw_cnt)*sizeof(*ret_mws));
> > +	ret_mws = devm_kmemdup_array(&ndev->ntb.pdev->dev, mws, *mw_cnt,
> > +				     sizeof(mws[0]), GFP_KERNEL);
> >  
> > -	return ret_mws;
> > +	return ret_mws ?: ERR_PTR(-ENOMEM);
> >  }
> >  
> >  /*
> 

