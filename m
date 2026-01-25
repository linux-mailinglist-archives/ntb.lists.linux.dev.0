Return-Path: <ntb+bounces-1751-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3HllEjKHdWn0FwEAu9opvQ
	(envelope-from <ntb+bounces-1751-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Sun, 25 Jan 2026 04:00:02 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD97F8AB
	for <lists+linux-ntb@lfdr.de>; Sun, 25 Jan 2026 04:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D4E53002F4A
	for <lists+linux-ntb@lfdr.de>; Sun, 25 Jan 2026 02:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF114202F65;
	Sun, 25 Jan 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIlLxKl/"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE881FBC8E;
	Sun, 25 Jan 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769309996; cv=none; b=E6PE6JAiCJOTwqEDB5MuV0TbT2BQfn/3ObZGF+5twUO/LjPL/8iXs1iRfmFGsBH33B40kWIQBR8RSWA0nwAJvLbTwYzhqqDjoF1DH+Zx1Jx1KfxTmRFIo8D+urKVH3+xjCDU2RCZ1NqYQd420uTOcgIbHGqLk0lYrI1/ST+8BIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769309996; c=relaxed/simple;
	bh=Hn3GRiIiMBORLFDcuECC3jGDWGMAQYl3UP/6hw/THqk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=s5QuxxW8aahT0dhXqOn+JrwkQLtIJestypQikBduoNcJv6SQHEnAFb79JiZE0wccIIpSPWkrk6KPCLDf3ugUD6C+jslflmmXZnDTJwVx7otDUpp77pfR4+eRnLSrpIZ8RWMT5Zy1YHIKcMAV7AkMevnEX33qqLqlzuPc4NBo9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIlLxKl/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5869CC116D0;
	Sun, 25 Jan 2026 02:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769309996;
	bh=Hn3GRiIiMBORLFDcuECC3jGDWGMAQYl3UP/6hw/THqk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sIlLxKl/px8R5zJfLPGoOAA/+jvKHrC9/g8OENptgUnagPL3WCnSVklYfFZJyPO+m
	 SYDg/872wdiVes/GYY+oQxQskU27ZVP1tMa08N9xlV7YIuJYvG5xIdSa52omxaS0Te
	 a/vdpgJc0TZv7A/oRpnxol7OfgpoLkBuQRhjJ6n4gaDPyNHJGSREZV/v+l4uanBbya
	 DwoibP90Rx8oHrFPbVX/Pv/xu1G8SJyTpq0LglZVf8EroG53PpIfdiTxbtuS3Uov5N
	 6Wah1GTRzIjqvJqRQ8KhrRgdA1fgDbFcAYy5xYrDwein7HsnvvLFBtnzo/CWqCgPFz
	 qJ42d3EmBl/0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DFA3809A00;
	Sun, 25 Jan 2026 02:59:52 +0000 (UTC)
Subject: Re: [GIT PULL] NTB bug fixes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aXVLXurQVtt7q6pf@athena.kudzu.us>
References: <aXVLXurQVtt7q6pf@athena.kudzu.us>
X-PR-Tracked-List-Id: <ntb.lists.linux.dev>
X-PR-Tracked-Message-Id: <aXVLXurQVtt7q6pf@athena.kudzu.us>
X-PR-Tracked-Remote: https://github.com/jonmason/ntb tags/ntb-6.19-bugfixes
X-PR-Tracked-Commit-Id: 2ccb5e8dbcd2dedf13e0270165ac48bd79b7f673
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d04ed417d20a79c111a7d8fef005ae9fe1e73b38
Message-Id: <176930999152.3419453.1182213195962744174.pr-tracker-bot@kernel.org>
Date: Sun, 25 Jan 2026 02:59:51 +0000
To: Jon Mason <jdmason@kudzu.us>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, ntb@lists.linux.dev
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1751-lists,linux-ntb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,ntb@lists.linux.dev];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ntb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6AAD97F8AB
X-Rspamd-Action: no action

The pull request you sent on Sat, 24 Jan 2026 17:44:46 -0500:

> https://github.com/jonmason/ntb tags/ntb-6.19-bugfixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d04ed417d20a79c111a7d8fef005ae9fe1e73b38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

