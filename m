Return-Path: <ntb+bounces-849-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B49AB067
	for <lists+linux-ntb@lfdr.de>; Tue, 22 Oct 2024 16:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C0D4B218F3
	for <lists+linux-ntb@lfdr.de>; Tue, 22 Oct 2024 14:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D401419F406;
	Tue, 22 Oct 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nT065qt4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XB/MFvdM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nT065qt4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XB/MFvdM"
X-Original-To: ntb@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E419F41D
	for <ntb@lists.linux.dev>; Tue, 22 Oct 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606081; cv=none; b=BffZqlZkt7Bojun1TMZpjBzJ3oowCZwonMZL3db7drFBEq7k5Z69VKKVdubyXgQvCS6XnLr7txwVEC8zFOjO2aaGmI54I3dihj17Btthk346GSylC976M1uTNpmxVI4848k/tBdqCMVYbsQ6zhPQ0/HsEPfmaHVjgeAq5UM/ZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606081; c=relaxed/simple;
	bh=keN/OaFPBTwJRNnLclouCC/2PmyqicZ/HLWJKZaXkMw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VfSEGDrFJ36QRnTSsucusNhe2dhhrfTHJmOGecsGepl6QvEvFH6S36OIk0yv0Vts/1cwmo+df6EnVWYLSaa/8Afk91vLyo9VzszKYGMqV59GrMSJ5xneiwbmesUhbpY5COU7229v0cXKs401IuVHI4ft/n396y0u9jr1ehOsHRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nT065qt4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XB/MFvdM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nT065qt4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XB/MFvdM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DEB01FB4C;
	Tue, 22 Oct 2024 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729606078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I5YtkOoPrVW2kCBxPLqPAf7UD1c7Fz8OlNH1U+IqDi8=;
	b=nT065qt4F0yaxGQDtCajKU5QrE+p9X22fQ5X+uJrdOXhWH71O0XxqvB04DrSIvks57q6Cu
	JdoTUOrhC6F3VM2FqxvCZrrLy8dfmsvHOi34IxJPAYkskRCU+DNNNywW6lsBU0E9auNlTB
	K4vW+XGRe4RK0Vn8gIuK+2eJqjzzmJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729606078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I5YtkOoPrVW2kCBxPLqPAf7UD1c7Fz8OlNH1U+IqDi8=;
	b=XB/MFvdM6NJqGNpPMiucMvrGVCv1meVqHtwqyxogJgSr9p1OCl+lie6l0tPeIfBtUWHx0K
	qJIy2sce/WWFCkBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729606078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I5YtkOoPrVW2kCBxPLqPAf7UD1c7Fz8OlNH1U+IqDi8=;
	b=nT065qt4F0yaxGQDtCajKU5QrE+p9X22fQ5X+uJrdOXhWH71O0XxqvB04DrSIvks57q6Cu
	JdoTUOrhC6F3VM2FqxvCZrrLy8dfmsvHOi34IxJPAYkskRCU+DNNNywW6lsBU0E9auNlTB
	K4vW+XGRe4RK0Vn8gIuK+2eJqjzzmJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729606078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I5YtkOoPrVW2kCBxPLqPAf7UD1c7Fz8OlNH1U+IqDi8=;
	b=XB/MFvdM6NJqGNpPMiucMvrGVCv1meVqHtwqyxogJgSr9p1OCl+lie6l0tPeIfBtUWHx0K
	qJIy2sce/WWFCkBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 783A713894;
	Tue, 22 Oct 2024 14:07:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vT/NHL2xF2f0awAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Oct 2024 14:07:57 +0000
Date: Tue, 22 Oct 2024 16:08:58 +0200
Message-ID: <87v7xk2ps5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,	Basavaraj Natikar
 <basavaraj.natikar@amd.com>,	Jiri Kosina <jikos@kernel.org>,	Benjamin
 Tissoires <bentiss@kernel.org>,	Arnd Bergmann <arnd@arndb.de>,	Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,	Manish Chopra
 <manishc@marvell.com>,	"David S. Miller" <davem@davemloft.net>,	Eric
 Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,	Paolo
 Abeni <pabeni@redhat.com>,	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,	Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>,	Jon Mason <jdmason@kudzu.us>,	Dave Jiang
 <dave.jiang@intel.com>,	Allen Hubbe <allenbh@gmail.com>,	Bjorn Helgaas
 <bhelgaas@google.com>,	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,	Stefano Stabellini
 <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Chen Ni <nichen@iscas.ac.cn>,	Mario Limonciello
 <mario.limonciello@amd.com>,	Ricky Wu <ricky_wu@realtek.com>,	Al Viro
 <viro@zeniv.linux.org.uk>,	Breno Leitao <leitao@debian.org>,	Kevin Tian
 <kevin.tian@intel.com>,	Thomas Gleixner <tglx@linutronix.de>,	Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,	Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,	Mostafa Saleh
 <smostafa@google.com>,	Jason Gunthorpe <jgg@ziepe.ca>,	Yi Liu
 <yi.l.liu@intel.com>,	Christian Brauner <brauner@kernel.org>,	Ankit Agrawal
 <ankita@nvidia.com>,	Eric Auger <eric.auger@redhat.com>,	Reinette Chatre
 <reinette.chatre@intel.com>,	Ye Bin <yebin10@huawei.com>,	Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Rui Salvaterra <rsalvaterra@gmail.com>,
	linux-ide@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of pcim_intx()
In-Reply-To: <20241015185124.64726-3-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
	<20241015185124.64726-3-pstanner@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL41ih3fejwepcmbj4wj583m3u)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_GT_50(0.00)[66];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,omp.ru,amd.com,arndb.de,linuxfoundation.org,yahoo.com,marvell.com,davemloft.net,google.com,redhat.com,quantenna.com,gmail.com,kudzu.us,intel.com,suse.com,epam.com,perex.cz,iscas.ac.cn,realtek.com,zeniv.linux.org.uk,debian.org,linutronix.de,linux.intel.com,ziepe.ca,nvidia.com,huawei.com,invisiblethingslab.com,linux.dev,vger.kernel.org,lists.linux.dev,lists.xenproject.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 15 Oct 2024 20:51:12 +0200,
Philipp Stanner wrote:
> 
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> hda_intel enables its PCI-Device with pcim_enable_device(). Thus, it needs
> the always-managed version.
> 
> Replace pci_intx() with pcim_intx().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  sound/pci/hda/hda_intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index b4540c5cd2a6..b44ca7b6e54f 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip, int do_disconnect)
>  	}
>  	bus->irq = chip->pci->irq;
>  	chip->card->sync_irq = bus->irq;
> -	pci_intx(chip->pci, !chip->msi);
> +	pcim_intx(chip->pci, !chip->msi);
>  	return 0;
>  }
>  

Hm, it's OK-ish to do this as it's practically same as what pci_intx()
currently does.  But, the current code can be a bit inconsistent about
the original intx value.  pcim_intx() always stores !enable to
res->orig_intx unconditionally, and it means that the orig_intx value
gets overridden at each time pcim_intx() gets called.

Meanwhile, HD-audio driver does release and re-acquire the interrupt
after disabling MSI when something goes wrong, and pci_intx() call
above is a part of that procedure.  So, it can rewrite the
res->orig_intx to another value by retry without MSI.  And after the
driver removal, it'll lead to another state.

In anyway, as it doesn't change the current behavior, feel free to
take my ack for now:

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

