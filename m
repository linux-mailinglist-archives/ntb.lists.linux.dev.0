Return-Path: <ntb+bounces-1818-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGB8KT0Gk2nF0wEAu9opvQ
	(envelope-from <ntb+bounces-1818-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Mon, 16 Feb 2026 12:57:49 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC11432DF
	for <lists+linux-ntb@lfdr.de>; Mon, 16 Feb 2026 12:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 118C4300E27E
	for <lists+linux-ntb@lfdr.de>; Mon, 16 Feb 2026 11:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E1B3081C2;
	Mon, 16 Feb 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7iUezNE"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C8301493;
	Mon, 16 Feb 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243066; cv=none; b=rk/05XrR1jcaNOH69qWL/zKsZE9+LmiwO418IQx3TtLDOq+I5WWs36wT733ZiwMWxtaGkJGtNAr5hIG5C1Af/dRqHLO5tNqr43ft1MMkFXuh9vbhnCPiCgVi/AhRewQlBk4C76B8Hc4+S0VZ6lG3ZQJj0EfByP2X5fGlbtmlCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243066; c=relaxed/simple;
	bh=PIu8mPBAJoeMwO2/sVA8OUXI8GPaq8/JW8r+wKcyloY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ny0FcEbikRN+7FK4vgMJH3V5SsRpvXPL2gDArtNkHHGI8X7gyS2rzHjWrpeY2e7pR2sm6bYjhj28dN8nkQHfrKrpeiAsq6HBt7lGSQpNaSCZXUKtFvstXAtPxl82XHrHbBddoZgY5HlYlERmDnCZ1dDSetz4yCLfXCdKEAbJ+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7iUezNE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A96C116C6;
	Mon, 16 Feb 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771243066;
	bh=PIu8mPBAJoeMwO2/sVA8OUXI8GPaq8/JW8r+wKcyloY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7iUezNEhgvnYCK9Il9kQLjLcMzYyoA5DoSiyCaCxBfWe8iFv2c3DxqtEehMC5lo+
	 ARVxnC6vpf7gm31hC0Zm0Dyf/Fj4OWgeT3JDG1NMpz3ZW3sXx8Qfb/dD+yUdti8v8G
	 Kh8qV5q3lCtZ7IZFXNzA1IUYobL2yKMj+qcQodJREcJbLYYiDDEOULvs/geEsFe41S
	 FK3w2JW8m1T0ojnZfMRl99FZLj/DBfVo0zJYzyMshDH+UVOt/LjkJHFxRdQBjcAra8
	 /bkAd9+kRM56h6cUyycyYZEFeCKtNK5ZP5PeDQYZYN9BYvAy3Fz8YB3ka+9cdqeObK
	 Fkwyv3MhwyJdw==
Date: Mon, 16 Feb 2026 12:57:41 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: mani@kernel.org, kwilczynski@kernel.org, kishon@kernel.org,
	bhelgaas@google.com, jdmason@kudzu.us, dave.jiang@intel.com,
	allenbh@gmail.com, Frank.Li@nxp.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, ntb@lists.linux.dev
Subject: Re: [PATCH 4/4] PCI: endpoint: pci-ep-msi: Fix error unwind and
 prevent double alloc
Message-ID: <aZMGNed0JChM9GEa@ryzen>
References: <20260215150914.3392479-1-den@valinux.co.jp>
 <20260215150914.3392479-5-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215150914.3392479-5-den@valinux.co.jp>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1818-lists,linux-ntb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,kudzu.us,intel.com,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,ntb@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-ntb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,valinux.co.jp:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19FC11432DF
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:09:14AM +0900, Koichiro Den wrote:
> pci_epf_alloc_doorbell() stores the allocated doorbell message array in
> epf->db_msg/epf->num_db before requesting MSI vectors. If MSI allocation
> fails, the array is freed but the EPF state may still point to freed
> memory.
> 
> Clear epf->db_msg and epf->num_db on the MSI allocation failure path so
> that later cleanup cannot double-free the array and callers can retry
> allocation.
> 
> Also return -EBUSY when doorbells have already been allocated to prevent
> leaking or overwriting an existing allocation.
> 
> Fixes: 1c3b002c6bf6 ("PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

