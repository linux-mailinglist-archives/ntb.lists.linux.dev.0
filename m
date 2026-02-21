Return-Path: <ntb+bounces-1887-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBRZM+H5mWmuXgMAu9opvQ
	(envelope-from <ntb+bounces-1887-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Sat, 21 Feb 2026 19:30:57 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51516D80F
	for <lists+linux-ntb@lfdr.de>; Sat, 21 Feb 2026 19:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2C413041A54
	for <lists+linux-ntb@lfdr.de>; Sat, 21 Feb 2026 18:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BBE1E1DEC;
	Sat, 21 Feb 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyNpppFg"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CEE7263B;
	Sat, 21 Feb 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698655; cv=none; b=KYbTrbw8Ka9kbHwDSZ8v1njioAF/Qk+UNtvlqVuOBQc/WX80fETQrU+gvMagfn0pbT6yN8iksDyznFc4AjoBFV8Vn8gANBP7ZKNkw458IUspWbMDTR8USPaJFN345goGGOUZAOgk1eHwVE/CUQmuRW3QJS4qnHUFaU4FAbVwKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698655; c=relaxed/simple;
	bh=N7Gf91nmKEnSIjbF/YhhwfvRBzUjozDoDKpOFtzkXJA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B/+PSTnFVa/KzBAeQ06mySrS4nsXRSNoHmB8kjvxkTUsmzYuKBFg/UOQidFsc/8uL4rpI+HcrGhpkZSssUFswDWPTT2a3DKEj5oJUKAfbpZVkwjjrAKt5G+B05PHiX/xLyjdZjmeXgktYp7OA+gLwnsJuGrAmcW+j2ZuZhnxMJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyNpppFg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59180C4CEF7;
	Sat, 21 Feb 2026 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771698655;
	bh=N7Gf91nmKEnSIjbF/YhhwfvRBzUjozDoDKpOFtzkXJA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GyNpppFgUee2r36zcxkmT097KozrNWh3nWeV9gGLCVfS1e6rs/ZIbchnn9YJbGbta
	 i/vYHKxzBrOD7l2UvaaPSTO0SzfUCR0kfJOgjm/J/QjdICSWnz0zEpC52h6P+lY3G/
	 /vMJFO1Tn23ItDzOQeExnbiiqcTy8d19HkUxBWOSAt6G+19MI+m93GVVSlk5d2bMYO
	 b9HJRAaGS+KNYtCUIhYodBgWbgZ7XswewZ7Oq7clDtqXN09Ac+MpVYQSQsCrSP4whk
	 iIPvwK/FsaSul9DGbqjgpDoftb0Iua0vVtIMUkC+DvZr3zyaXlq24tWyaxiXExXQVL
	 iLAHgIxgKSulw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0307A3808200;
	Sat, 21 Feb 2026 18:31:04 +0000 (UTC)
Subject: Re: [GIT PULL] NTB bug fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZnSC9wgzEOq8fb2@athena.kudzu.us>
References: <aZnSC9wgzEOq8fb2@athena.kudzu.us>
X-PR-Tracked-List-Id: <ntb.lists.linux.dev>
X-PR-Tracked-Message-Id: <aZnSC9wgzEOq8fb2@athena.kudzu.us>
X-PR-Tracked-Remote: https://github.com/jonmason/ntb tags/ntb-7.0
X-PR-Tracked-Commit-Id: 8c1f92ca8bca3ce2d2c085571af89503bc7bc7c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 981361604566a28517a518c317943d9b7c392217
Message-Id: <177169866272.1180555.7380921246803401132.pr-tracker-bot@kernel.org>
Date: Sat, 21 Feb 2026 18:31:02 +0000
To: Jon Mason <jdmason@kudzu.us>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, ntb@lists.linux.dev
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-1887-lists,linux-ntb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,ntb@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ntb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F51516D80F
X-Rspamd-Action: no action

The pull request you sent on Sat, 21 Feb 2026 10:40:59 -0500:

> https://github.com/jonmason/ntb tags/ntb-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/981361604566a28517a518c317943d9b7c392217

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

