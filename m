Return-Path: <ntb+bounces-878-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618639ADADC
	for <lists+linux-ntb@lfdr.de>; Thu, 24 Oct 2024 06:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F161C2145A
	for <lists+linux-ntb@lfdr.de>; Thu, 24 Oct 2024 04:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E3B16CD1D;
	Thu, 24 Oct 2024 04:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQGXcgyV"
X-Original-To: ntb@lists.linux.dev
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB822EED
	for <ntb@lists.linux.dev>; Thu, 24 Oct 2024 04:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729744073; cv=none; b=Kos3FDtwkfdo6N/12qTJ3e4GlIsE2ttG3EplQFNqyvT/+O7hhphOJOhjusDUcIBf9adX2CffHFoMtJ52w07C7yfd2n/Zs5hKbqY9xNr82fWQHB8oa5NMViLhrSMSie7AqW8aPP3e+fh2X/CQzXeovX9IQrkqhHRC0gKVwJq9OGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729744073; c=relaxed/simple;
	bh=udiji3e41S/dEoTtioHNHBTyRBA79emtkJvqRGsL3OU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5z3THrshSel4bVqVUa1NvcqTnlwKg5YbZbtN/eV/6itBbVA85YNg3IYYxyxPiNzAn7Tagu9mH1wgdgCRYCHBbh8RY2clnJmvCPsw0guKwA5JUEz8URxgKPUljT47AT81u8PCGw2Rj+bBjwCeHnpZOTLfTuWf6+EbtK0Zp7SvAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQGXcgyV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso6412541fa.1
        for <ntb@lists.linux.dev>; Wed, 23 Oct 2024 21:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729744068; x=1730348868; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ryd5TahOZqM0bMgqhyVoGsVt3QmLd20VHwwITcjUN10=;
        b=DQGXcgyVpqbmWaDWDHoCgabxAxP8rt6GK/vTvwDkxhiiLig9Mdp2a5W8gHsM6n8yCB
         jLUbmxBR4Zc2hUSMDeyuuk18+WxssF6L6kEbCdLZ1Jsij9J3FrjNAzLczpvRlkLPIGGF
         mijUrH1CBinUw2fu9bYS8YmaIR2xidGNidEKH7WPqOekMdlVbYiie09aeJwDqjES9KmT
         ORAqyj2dPns6wtbzbdxNbPBBSNPsalcb/3A5Y5htdkN6kIcSidFaB5fpfBLzPWqAg1p9
         wx/Eh+yJWvcLRCrRsvc8AGIeotzExev9DVTMPGQ2xhnnrrVysAaIL8TVsBd/Q/6tDuiS
         q+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729744068; x=1730348868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ryd5TahOZqM0bMgqhyVoGsVt3QmLd20VHwwITcjUN10=;
        b=trIiyZsvlzqNDiaLZvVMu9+Wt3/smicjZmRiBOjW+oF9QaZu8eFpEV5dyF8Kh0RrW7
         CTZZhcLDx5bC/W3FJBcHOWC8nmXFwh5z5kdcGVaYo3aNhies4aFbXiFLyAFtC6QNzI+q
         bbz0iaRefIijVZARqXEsj6uLip0ObKUUa8TccMPRkJNjA902Ormf3dWRSXpybSTL8hjw
         07oC8F8QrWq9YklosU+iHH2cqjfIzO5YkyhQVU5v1goi9Wkc6/FF5LHoaHWSLMrbyuG9
         mVXfsN4jX7KYCkoTMu7oYkx1+W622Q0VwjgFG2VUvRSveuAvXb8yEJMuwotfguuLpfV/
         O3bg==
X-Forwarded-Encrypted: i=1; AJvYcCVLOR9S5MNlMGwdhWX9YDtsCbHJQ7l7Nb7kdKSAmaaN2KIGyvKu9koTAnuZrZwPiPw/YYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX1gkCFtavkDk2XhAF0wSLu6pXgC3qGps1Z76RJ6V5GUqupjxe
	bn2SsYAHpns29up6EuF5ELc3MPaQ1C0+8/LWrLpVoUYed/DPWwiS
X-Google-Smtp-Source: AGHT+IHZKxth9EOfqbWIOdrXsG+AxCKWQsu8nuoHzE9Doq8P4mdvScM2YJyFjW8FpHm5SXynKLpdUw==
X-Received: by 2002:a05:6512:350e:b0:53b:1e70:6ab4 with SMTP id 2adb3069b0e04-53b1e706b9fmr2494138e87.14.1729744067950;
        Wed, 23 Oct 2024 21:27:47 -0700 (PDT)
Received: from mobilestation ([85.249.18.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224319a7sm1242740e87.230.2024.10.23.21.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 21:27:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 07:27:41 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
	Allen Hubbe <allenbh@gmail.com>, ntb@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-spi@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, 
	Paul Burton <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-pci@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King <linux@armlinux.org.uk>, Vladimir Oltean <olteanv@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Yanteng Si <siyanteng@loongson.cn>, netdev@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	linux-edac@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-serial@vger.kernel.org
Cc: Andrew Halaney <ajhalaney@gmail.com>, Nikita Travkin <nikita@trvn.ru>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Shiyan <shc_work@mail.ru>, Dmitry Kozlov <xeb@mail.ru>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Evgeniy Dushistov <dushistov@mail.ru>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: linux: Goodbye from a Linux community volunteer
Message-ID: <2m53bmuzemamzc4jzk2bj7tli22ruaaqqe34a2shtdtqrd52hp@alifh66en3rj>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Linux-kernel community,

I am sure you have already heard the news caused by the recent Greg' commit
6e90b675cf942e ("MAINTAINERS: Remove some entries due to various compliance
requirements."). As you may have noticed the change concerned some of the
Ru-related developers removal from the list of the official kernel maintainers,
including me.

The community members rightly noted that the _quite_ short commit log contained
very vague terms with no explicit change justification. No matter how hard I
tried to get more details about the reason, alas the senior maintainer I was
discussing the matter with haven't given an explanation to what compliance
requirements that was. I won't cite the exact emails text since it was a private
messaging, but the key words are "sanctions", "sorry", "nothing I can do", "talk
to your (company) lawyer"... I can't say for all the guys affected by the
change, but my work for the community has been purely _volunteer_ for more than
a year now (and less than half of it had been payable before that). For that
reason I have no any (company) lawyer to talk to, and honestly after the way the
patch has been merged in I don't really want to now. Silently, behind everyone's
back, _bypassing_ the standard patch-review process, with no affected
developers/subsystem notified - it's indeed the worse way to do what has been
done. No gratitude, no credits to the developers for all these years of the
devoted work for the community. No matter the reason of the situation but
haven't we deserved more than that? Adding to the GREDITS file at least, no?..

I can't believe the kernel senior maintainers didn't consider that the patch
wouldn't go unnoticed, and the situation might get out of control with
unpredictable results for the community, if not straight away then in the middle
or long term perspective. I am sure there have been plenty ways to solve the
problem less harmfully, but they decided to take the easiest path. Alas what's
done is done. A bifurcation point slightly initiated a year ago has just been
fully implemented. The reason of the situation is obviously in the political
ground which in this case surely shatters a basement the community has been built
on in the first place. If so then God knows what might be next (who else might
be sanctioned...), but the implemented move clearly sends a bad signal to the
Linux community new comers, to the already working volunteers and hobbyists like
me.

Thus even if it was still possible for me to send patches or perform some
reviews, after what has been done my motivation to do that as a volunteer has
simply vanished. (I might be doing a commercial upstreaming in future though).
But before saying goodbye I'd like to express my gratitude to all the community
members I have been lucky to work with during all these years. Specifically:

NTB-folks, Jon, Dave, Allen. NTB was my starting point in the kernel upstream
work. Thanks for the initial advices and despite of very-very-very tough reviews
with several complete patchset refactorings, I learned a lot back then. That
experience helped me afterwards. Thanks a lot for that. BTW since then I've got
several thank-you letters for the IDT NTB and IDT EEPROM drivers. If not for you
it wouldn't have been possible.

Andy, it's hard to remember who else would have given me more on my Linux kernel
journey as you have. We first met in the I2C subsystem review of my DW I2C
driver patches. Afterwards we've got to be frequently meeting here and there -
GPIO, SPI, TTY, DMA, NET, etc, clean/fixes/features patch(set)s. Quite heat
discussions in your first reviews drove me crazy really. But all the time we
managed to come up with some consensus somehow. And you never quit the
discussions calmly explaining your point over and over. You never refused to
provide more detailed justification to your requests/comments even though you
didn't have to. Thanks to that I learned how to be patient to reviewers
and reviewees. And of course thank you for the Linux-kernel knowledges and all
the tips and tricks you shared.

* Andy, please note due to the situation I am not going to work on my DW DMAC
fixes patchset anymore. So if you ever wish to have DW UART stably working with the
DW DMA-engine driver, then feel free to pick the series up:
Link: https://lore.kernel.org/dmaengine/20240911184710.4207-1-fancer.lancer@gmail.com/

Linus (Walleij), after you merged one of my pretty much heavy patchset in you
suggested to me to continue the DW APB GPIO driver maintaining. It was a first
time I was asked to maintain a not-my driver. Thank you for the trust. I'll
never forget that.

Mark, thank you very much for entrusting the DW APB SSI driver maintenance to
me. I've put a lot of efforts into making it more generic and less errors-prune,
especially when it comes working under a DMA-engine control or working in the
mem-ops mode. I am sure the results have been beneficial to a lot of DW
SPI-controller users since then.

Damien, our first and last meeting was at my generic AHCI-platform and DW AHCI
SATA driver patches review. You didn't make it a quick and easy path. But still
all the reviews comments were purely on the technical basis, and the patches
were eventually merged in. Thank you for your time and experience I've got from
the reviews.

Paul, Thomas, Arnd, Jiaxun, we met several times in the mailing list during my
MIPS P5600 patches and just generic MIPS patches review. It was always a
pleasure to discuss the matters with such brilliant experts in the field. Alas
I've spent too much time working on the patches for another subsystems and
failed to submit all the MIPS-related bits. Sorry I didn't keep my promise, but
as you can see the circumstances have suddenly drawn its own deadline.

Bjorn, Mani, we were working quite a lot with you in the framework of the DW
PCIe RC drivers. You reviewed my patches. I helped you to review another patches
for some time. Despite of some arguing it was always a pleasure to work with
you.  Mani, special thanks for the cooperative DW eDMA driver maintenance. I
think we were doing a great work together.

Paolo, Jakub, David, Andrew, Vladimir, Russell. The network subsystem and
particularly the STMMAC driver (no doubt the driver sucks) have turned to be a
kind of obstacle on which my current Linux-kernel activity has stopped. I really
hope that at least in some way my help with the incoming STMMAC and DW XPCS
patches reviews lightened up your maintainance duty. I know Russell might
disagree, but I honestly think that all our discussions were useful after all,
at least for me. I also think we did a great work working together with Russell
on the DW GMAC/QoS ETH PCS patches. Hopefully you'll find a time to finish it up
after all. 

Rob, Krzysztof, from your reviews I've learned a lot about the most hardwary part
of the kernel - DT sources and DT-bindings. All your comments have been laconic
and straight to the point. That made reviews quick and easy. Thank you very
much for that.

Guenter, special thanks for reviewing and accepting my patches to the hwmon and
watchdog subsystems. It was pleasure to be working with you.

Borislav, we disagreed and argued a lot. So my DW uMCTL2 DDRC EDAC patches even
got stuck in limbo for quite a long time. Anyway thank you for the time
you spent reviewing my patches and trying to explain your point.

* Borislav, it looks like I won't be able to work on my Synopsys EDAC patchsets
anymore. If you or somebody else could pick them up and finish up the work it
would be great (you can find it in the lore archive). The patches convert the
mainly Zynq(MP)-specific Synopsys EDAC driver to supporting the generic DW
uMCTL2 DDRC. It would be very beneficial for each platform based on that
controller.

Greg, we met several times in the mailing lists. You reviewed my patches sent
for the USB and TTY subsystems, and all the time the process was straight,
highly professional, and simpler than in the most of my other case.
Thank you very much for that.

Yoshihiro, Keguang, Yanteng, Kory, Cai and everybody I was lucky to meet in the
kernel mailing lists, but forgot to mention here. Thank you for the time spent
for our cooperative work on making the Linux kernel better. It was a pleasure to
meet you here.

I also wish to say huge thanks to the community members trying to
defend the kicked off maintainers and for support you expressed in
these days. It means a lot.

A little bit statics of my kernel-work at the end:

Signed-off patches:		518
Reviewed and Acked patches:	253
Tested patches:			80

You might say not the greatest achievement for seven years comparing to some
other developers. Perhaps. But I meant each of these tags, be sure.

I guess that's it. If you ever need some info or consultation regarding the
drivers I used to maintain or the respective hardware or the Synopsys IP-cores
(about which I've got quite comprehensive knowledge by this time), feel free to
reach me out via this email. I am always willing to help to the community
members.

Hope we'll meet someday in more pleasant circumstances and drink a
couple or more beers together. But now it's time to say good bye.
Sorry for a long-read text. I wish good luck on your Linux-way.

Best Regards,
-Serge(y)

