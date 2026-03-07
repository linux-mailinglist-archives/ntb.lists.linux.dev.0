Return-Path: <ntb+bounces-2025-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEHIHHKZq2nYegEAu9opvQ
	(envelope-from <ntb+bounces-2025-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Sat, 07 Mar 2026 04:20:18 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE89229D14
	for <lists+linux-ntb@lfdr.de>; Sat, 07 Mar 2026 04:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EFC930028EC
	for <lists+linux-ntb@lfdr.de>; Sat,  7 Mar 2026 03:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAB330BB8D;
	Sat,  7 Mar 2026 03:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUKBywx0"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3B3054C7;
	Sat,  7 Mar 2026 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853612; cv=none; b=h1jbB5CiQOjxuTTK/g3zObOw6zPw9wF+rbpNs2UT6tSpv1a2zhNMrmKE+FWg72xLKvby8LWn/EShT2ZM65CiFy/+iFh+BR86JAyhKD1hwAe4L2nXX5yuUeIjdfHpPxRnEVp0fvzm2ejHr7wA//mEvCyA/God6sJyFQD7bM71I/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853612; c=relaxed/simple;
	bh=YAXufbWgkljVb2zc+Vsma0Tuw/RMJ1QzfSEY5ACMmvA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kryqCUCMrQxrj9InguaznOx1NpeN4RPe2bssyIrJXVMNlrv4/X3QNri3LS1vJxAkSBOKXrkAIEyFVx7Q7CVmS4eFVlTrEkCt62DvYVX/zpZupGbDaieC/2uutBRm/fFSpcAM4mgGrqZjyErfUVxb8p55z3gVh0iHV1EeQYZq0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUKBywx0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ECBC19422;
	Sat,  7 Mar 2026 03:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772853611;
	bh=YAXufbWgkljVb2zc+Vsma0Tuw/RMJ1QzfSEY5ACMmvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kUKBywx0+ZOShg97Q/oObud3u3Bwjn11He7vzIHNA4BlF0b4e3bnoTdQXdFWLB8Q3
	 beJIZfeHkibIsCJ4UUpHUfpG8QvE7qotEYjxoPd2rEA4ZrJKBdv3rlouCDReIeuU2t
	 3YexLhpgUA3XepsLsFZEmJ1v7zKGaSPyK4gt401iZBdsc7m66OiKMKnjfbk0D27cxt
	 HYeQSCA1s6KG4OAmUjCcrqT4HFpssBpT+BOdSFja/a+ZJDYOisEsYYq6OFgVP5Ccao
	 Sx09P+UhzxCzgzJypdjSzz6QV84BWgN5ial9mysUYJTM+g4OjFRiqT4OAVswCduwlf
	 6bk5W2o+hZyWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0093808200;
	Sat,  7 Mar 2026 03:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] net: ntb_netdev: Add Multi-queue support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177285361030.137784.17755621686661718850.git-patchwork-notify@kernel.org>
Date: Sat, 07 Mar 2026 03:20:10 +0000
References: <20260305155639.1885517-1-den@valinux.co.jp>
In-Reply-To: <20260305155639.1885517-1-den@valinux.co.jp>
To: Koichiro Den <den@valinux.co.jp>
Cc: jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, ntb@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Rspamd-Queue-Id: 5AE89229D14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2025-lists,linux-ntb=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[kudzu.us,intel.com,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lists.linux.dev,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,ntb@lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ntb,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  6 Mar 2026 00:56:35 +0900 you wrote:
> Hi,
> 
> ntb_netdev currently hard-codes a single NTB transport queue pair, which
> means the datapath effectively runs as a single-queue netdev regardless
> of available CPUs / parallel flows.
> 
> The longer-term motivation here is throughput scale-out: allow
> ntb_netdev to grow beyond the single-QP bottleneck and make it possible
> to spread TX/RX work across multiple queue pairs as link speeds and core
> counts keep increasing.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] net: ntb_netdev: Introduce per-queue context
    https://git.kernel.org/netdev/net-next/c/ee970634c777
  - [v3,2/4] net: ntb_netdev: Gate subqueue stop/wake by transport link
    https://git.kernel.org/netdev/net-next/c/304132b7a5e6
  - [v3,3/4] net: ntb_netdev: Factor out multi-queue helpers
    https://git.kernel.org/netdev/net-next/c/b83bf617dc84
  - [v3,4/4] net: ntb_netdev: Support ethtool channels for multi-queue
    https://git.kernel.org/netdev/net-next/c/24d9e73c7e00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



