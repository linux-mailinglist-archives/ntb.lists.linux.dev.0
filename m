Return-Path: <ntb+bounces-1906-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEKsEi2rnWn4QwQAu9opvQ
	(envelope-from <ntb+bounces-1906-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Tue, 24 Feb 2026 14:44:13 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E9187EE9
	for <lists+linux-ntb@lfdr.de>; Tue, 24 Feb 2026 14:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A2F930F5265
	for <lists+linux-ntb@lfdr.de>; Tue, 24 Feb 2026 13:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8810539E6CC;
	Tue, 24 Feb 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuV/3bWa"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647C439E6CA;
	Tue, 24 Feb 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940319; cv=none; b=kTJHdMbz/DwcJo/wjgljOxyEyL+BEkX9Vc9F8WUPPJmEukb8FdmjU5pZYk6mINncChxGZlu461gsBlX3f4H1cM7+KmUO/zQpyuma+r/Y8dnHTksOitL7xYhnCyv7JY2UL5nnSpA1HD2gOom3wK3di9wDeD7PM+a2jBm5yR4T6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940319; c=relaxed/simple;
	bh=D6KDP7mLfC7K9PBYKLx9XDujyOIToWseGbbi633OOLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilsuBcH/lThtr5RiT6I97XOitqkT/tVd1sQ775K3ZUcaXPyvzC+xKdLOHTr9rycu7wWMAsyO3Lh5p7wkcygQE6WWwLdThivxxkTa8MDmXT0vbpBVoJifyJxjBlhPTtnIqfnZk2C8r+5c9wNV1d1+EmfIIkLiRpc59wW4uZLzkak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuV/3bWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9D5C116D0;
	Tue, 24 Feb 2026 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771940319;
	bh=D6KDP7mLfC7K9PBYKLx9XDujyOIToWseGbbi633OOLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuV/3bWaV0MvVBZJ/zWZCp2J6s24t7UDVy0m0GiSO24N2X4bT6Uxgl+P+3JKqgq6U
	 n3rR/QE9ajRDdxT1WZExIg51S7oRGQdawBGscOT2Rugb34S5QuzWyru6yyzktHgKUt
	 55TOh8EsEB+sLoez82FZ1n5z0u+v2GU8sP9gRAI5VMB51ePIuwNtOh5mUUq8TpL6j6
	 Qvpex8ClP1y8ftsg4gqQlZK+Iwe50FNCxvDiavtr9AvlHvz9UW00Dvx0jjIV7uVT4j
	 GExh3Aj4TZT/yeyPjIWpDhjQLTNNK9S/s9/Foq52qLXEehA53tD05YqUvlTviaw08J
	 1mmAWaEBUCOvQ==
Date: Tue, 24 Feb 2026 14:38:33 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: den@valinux.co.jp, jdmason@kudzu.us, dave.jiang@intel.com,
	allenbh@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
	kishon@kernel.org, bhelgaas@google.com, ntb@lists.linux.dev,
	linux-pci@vger.kernel.org, alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] PCI: endpoint: pci-epf-vntb: Check
 pci_epc_get_features() return value
Message-ID: <aZ2p08thDzZdSdNc@ryzen>
References: <20260224133112.1356612-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224133112.1356612-1-alok.a.tiwari@oracle.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1906-lists,linux-ntb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[valinux.co.jp,kudzu.us,intel.com,gmail.com,kernel.org,google.com,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,ntb@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-ntb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oracle.com:email]
X-Rspamd-Queue-Id: C04E9187EE9
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:31:03AM -0800, Alok Tiwari wrote:
> pci_epc_get_features() may return NULL for invalid function numbers or
> if the EPC driver does not provide feature information. Other EPF drivers
> such as pci-epf-ntb.c and pci-epf-test.c already handle this case.
> 
> Add a defensive NULL check to avoid a potential NULL pointer dereference.
> 
> No functional change intended.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

I think a better solution is to do like pci-epf-test.c, which calls
pci_epc_get_features() once in .bind() and if it fails, it fails bind(),
if it returns non-NULL, it caches the result:
https://github.com/torvalds/linux/blob/v6.19/drivers/pci/endpoint/functions/pci-epf-test.c#L1112-L1123

That way, all other functions do not need to NULL check
pci_epc_get_features(). (Instead it can use the cached value)

pci-epf-vntb.c should probably do something similar to avoid sprinkling
NULL checks all over pci-epf-vntb.c.

And, if there are any existing
if (!epc_features) return -EINVAL;

they can be removed once you've added the check in .bind().


Kind regards,
Niklas

