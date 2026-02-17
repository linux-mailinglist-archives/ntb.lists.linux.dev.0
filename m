Return-Path: <ntb+bounces-1854-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKEXFE9ylGnVDwIAu9opvQ
	(envelope-from <ntb+bounces-1854-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Tue, 17 Feb 2026 14:51:11 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB114CC17
	for <lists+linux-ntb@lfdr.de>; Tue, 17 Feb 2026 14:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1951230470D5
	for <lists+linux-ntb@lfdr.de>; Tue, 17 Feb 2026 13:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E804236AB66;
	Tue, 17 Feb 2026 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVD+eCtg"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214A3542ED;
	Tue, 17 Feb 2026 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336231; cv=none; b=G784i7vEIcqwH16cOjE2IoEUX+imDQzxXrXrOF5fDhzxYlzAkFQ/q6YNDipaDdL30i76xMzBT/7vnMHDb1uBwE51X3/CO2lQ/bqFOxfhqOAmae5fy/AKdvpAhSbWDaQ/uGe3Jrw3dWV9uaEWVOxbsUXouJJWiirGs+YXu4Q44Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336231; c=relaxed/simple;
	bh=y5yo4Zpt3xnQpLbxCqpVsgRD77KZMMuqX3rb9y+7A/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz+i3iRujInavOgVQCFsiAolmtpB+Dt3zfk7DDaGEftdG0BUzHFgYp87uNmjkGpK7GSWCYCbWbol5vrdjlkj39cVbVVQZ/ka5DmhfAYDrvLYLeLGMzBnrtKhLhncmQ6+Ogw1nfXnDYGQ0XMpCk+kX0I5RZtOrkvPC2SodA8VpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVD+eCtg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AF3C19425;
	Tue, 17 Feb 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771336231;
	bh=y5yo4Zpt3xnQpLbxCqpVsgRD77KZMMuqX3rb9y+7A/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVD+eCtga3zw7z33rd8brssDTgS15iwIBz/QtZ7Q+3b9fOs44tcJFv3GQkqUuLiw1
	 U540ecfhN2JwEPZf8Y07TfjpS0dtl3T+6lSIpvet7O8kdPm9HS0H5YLtboCQ1qKLaO
	 EqJqw1Sg49XAOWgAxTrJmQZzHvtt72hOf9SYhdWNHI/qJpUNOQybdES3ULDoc0L6kI
	 8IgZm+7LI+PsjgW2WF9kXeUClj4jt+FW/IMZInzqyap2ZFIDkMpangHNiib/sb6gHi
	 V9NROpQCSB+kU3aJuHzkzpbFPOPfQn93RkUA47b2yNQu5vYQ+dxVp8AKAjCqphECDd
	 4Keo/qYF0F46g==
Date: Tue, 17 Feb 2026 19:20:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com, 
	kwilczynski@kernel.org, kishon@kernel.org, bhelgaas@google.com, ntb@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: endpoint: pci-epf-vntb: Use array_index_nospec() on
 mws_size[] access
Message-ID: <n7griejk7mlutc5mdi6b3ysedn2dgcius43urhxnfohjeo32fc@d5gymxxhrutw>
References: <20260105075606.1253697-1-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105075606.1253697-1-den@valinux.co.jp>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1854-lists,linux-ntb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kudzu.us,intel.com,gmail.com,kernel.org,google.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,ntb@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-ntb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valinux.co.jp:email,nxp.com:email]
X-Rspamd-Queue-Id: C6BB114CC17
X-Rspamd-Action: no action

On Mon, Jan 05, 2026 at 04:56:06PM +0900, Koichiro Den wrote:
> Follow common kernel idioms for indices derived from configfs attributes
> and suppress Smatch warnings:
> 
>   epf_ntb_mw1_show() warn: potential spectre issue 'ntb->mws_size' [r]
>   epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
> 
> Also fix the error message for out-of-range MW indices and %lld format
> for unsigned values.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Base: https://github.com/jonmason/ntb/commit/68113d260674 (ntb-next)
> This is a spin-off patch from the following series:
> https://lore.kernel.org/all/20251217151609.3162665-2-den@valinux.co.jp/
> 
>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 24 +++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index 83e9ab10f9c4..192dd4f4de8d 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -876,17 +876,19 @@ static ssize_t epf_ntb_##_name##_show(struct config_item *item,		\
>  	struct config_group *group = to_config_group(item);		\
>  	struct epf_ntb *ntb = to_epf_ntb(group);			\
>  	struct device *dev = &ntb->epf->dev;				\
> -	int win_no;							\
> +	int win_no, idx;						\
>  									\
>  	if (sscanf(#_name, "mw%d", &win_no) != 1)			\
>  		return -EINVAL;						\
>  									\
> -	if (win_no <= 0 || win_no > ntb->num_mws) {			\
> -		dev_err(dev, "Invalid num_nws: %d value\n", ntb->num_mws); \
> +	idx = win_no - 1;						\
> +	if (idx < 0 || idx >= ntb->num_mws) {				\
> +		dev_err(dev, "MW%d out of range (num_mws=%d)\n",	\
> +			win_no, ntb->num_mws);				\
>  		return -EINVAL;						\

This should be -ERANGE, but in a separate patch.

>  	}								\
> -									\
> -	return sprintf(page, "%lld\n", ntb->mws_size[win_no - 1]);	\
> +	idx = array_index_nospec(idx, ntb->num_mws);			\
> +	return sprintf(page, "%llu\n", ntb->mws_size[idx]);		\
>  }
>  
>  #define EPF_NTB_MW_W(_name)						\
> @@ -896,7 +898,7 @@ static ssize_t epf_ntb_##_name##_store(struct config_item *item,	\
>  	struct config_group *group = to_config_group(item);		\
>  	struct epf_ntb *ntb = to_epf_ntb(group);			\
>  	struct device *dev = &ntb->epf->dev;				\
> -	int win_no;							\
> +	int win_no, idx;						\
>  	u64 val;							\
>  	int ret;							\
>  									\
> @@ -907,12 +909,14 @@ static ssize_t epf_ntb_##_name##_store(struct config_item *item,	\
>  	if (sscanf(#_name, "mw%d", &win_no) != 1)			\
>  		return -EINVAL;						\
>  									\
> -	if (win_no <= 0 || win_no > ntb->num_mws) {			\
> -		dev_err(dev, "Invalid num_nws: %d value\n", ntb->num_mws); \
> +	idx = win_no - 1;						\
> +	if (idx < 0 || idx >= ntb->num_mws) {				\
> +		dev_err(dev, "MW%d out of range (num_mws=%d)\n",	\
> +			win_no, ntb->num_mws);				\
>  		return -EINVAL;						\

Same here.

- Mani

>  	}								\
> -									\
> -	ntb->mws_size[win_no - 1] = val;				\
> +	idx = array_index_nospec(idx, ntb->num_mws);			\
> +	ntb->mws_size[idx] = val;					\
>  									\
>  	return len;							\
>  }
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

