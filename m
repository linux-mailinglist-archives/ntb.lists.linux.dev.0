Return-Path: <ntb+bounces-634-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A884A486
	for <lists+linux-ntb@lfdr.de>; Mon,  5 Feb 2024 20:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C521C228AF
	for <lists+linux-ntb@lfdr.de>; Mon,  5 Feb 2024 19:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B826151CF3;
	Mon,  5 Feb 2024 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w/LVjnzT"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38D151CC0;
	Mon,  5 Feb 2024 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159834; cv=none; b=i3Q4nYwMFINhO1uqzzeQcLDZU12Px0Qtmkp065NvQf3Ks376N5FaOje1Rlkxrw1W1L4DKoxsBGt6ggBRUtuZu9akbkZSeMv/zV8hdhzZvumFIvS/ZnyRniiMrCRhKuTHsnPThAyLDDzgYbhCbxUwAV196WwwMDlKJpH2QYOPa4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159834; c=relaxed/simple;
	bh=enzvkJrZvs3n5pWxdWktechxKDk4+Wgewr4aMoQPZwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAFiYmAdDwEAiXBaXW4TbrCC8MYzafg+2C3l6tcacMgpllTjyX3ELf9zyf/UgFVhLuPNfxWTRvJqkS4cBFdKc+4e3NtF02LyS7XYFMbR/9MJrluyEJuq+GaqZtCsgW6TSC8qehOHPOkF85RTX5Df17m7Aql4LcikgXpWZ0eDV8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w/LVjnzT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B5EC433F1;
	Mon,  5 Feb 2024 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159833;
	bh=enzvkJrZvs3n5pWxdWktechxKDk4+Wgewr4aMoQPZwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w/LVjnzT8l2qgzEmU9rx1cqnYnPC+iBVCEy8u1XjN0zQTEXsoLkDUu/dnj+JnWkcl
	 UKX+KVoSGM1SOFOR8+y1SqFKhjL51wec7oUxQqAFWOhUWB7ca6xVzfPaSqrl43r4Zc
	 N+A4zV0IthN2Zm5B/jcldWl227tvgX1iqaRScrTM=
Date: Mon, 5 Feb 2024 04:49:55 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>, ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ntb: struct bus_type cleanup
Message-ID: <2024020550-protract-deviator-0b35@gregkh>
References: <20240204-bus_cleanup-ntb-v1-0-155184f60d5f@marliere.net>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-ntb-v1-0-155184f60d5f@marliere.net>

On Sun, Feb 04, 2024 at 01:21:59PM -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]). Specifically, this series is part of the task of
> splitting one of his TODOs [2].
> 
> ---
> [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=bus_cleanup&id=26105f537f0c60eacfeb430abd2e05d7ddcdd8aa
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> 
> ---
> Ricardo B. Marliere (2):
>       ntb: ntb_transport: make ntb_transport_bus const
>       ntb: core: make ntb_bus const

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

