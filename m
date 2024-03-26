Return-Path: <ntb+bounces-697-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2C88BC4B
	for <lists+linux-ntb@lfdr.de>; Tue, 26 Mar 2024 09:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA67AB21F56
	for <lists+linux-ntb@lfdr.de>; Tue, 26 Mar 2024 08:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB3413440D;
	Tue, 26 Mar 2024 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tB1ZpUTW"
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA813340F;
	Tue, 26 Mar 2024 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711441689; cv=none; b=etrinfO74AaAUX3gIHB5YECUxaOxu1RRLPGBafvraAuzA8V59r3oElB2ifSfIZB8rsSWzf6/NCPiuabG/CKRJTh39tf/YHd+zkiTsS061VHKVZSuO/GQ/Isy5kdHFLg1azJyyC+bm00TjYy9MKg8iS4H1vWl+7/Jbjl/Ar5jwhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711441689; c=relaxed/simple;
	bh=z8NWPUYJmsGr2kxmH7x6UVeDQ82FujFPnCIU10rlyEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpH8WinnPKihamZaagIlo8EwIRFyh3JHVMwpXJAyHMZFSPlu+31NFbiJ1AbGKYiLd0Ooe0U5YQ+Pvtm8kmNrbe347zqNDp+eCUt9xJVRnwaVZ2puKZjtMaVe+vv5MKTOw2GLvi5qRsfUyHX1/hKxWoCAz0f9WN/HlFp71A6gQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tB1ZpUTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637A1C43390;
	Tue, 26 Mar 2024 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711441689;
	bh=z8NWPUYJmsGr2kxmH7x6UVeDQ82FujFPnCIU10rlyEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tB1ZpUTW2ejyYSpF1sL5KF9xdmawbP/bYgHV0o8zoCnWbYB+zWxgVfZC9VmmsDxRe
	 9Li/QYAVZZ9cYAApZZOLdhuOLhHI/0HdpUGvFYKlCdmhgYPyyoiFNzVBKPNxFotoDc
	 dZFP5wMuDVQ0yHno98bexW+DaBUriDW9d2uLr37A=
Date: Tue, 26 Mar 2024 09:28:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivami <manivannan.sadhasivam@linaro.org>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org, ntb@lists.linux.dev,
	Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
	amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/28] tty: 8250_pci: Use PCI_IRQ_INTX
Message-ID: <2024032658-rescuer-dial-49da@gregkh>
References: <20240325070944.3600338-1-dlemoal@kernel.org>
 <20240325070944.3600338-7-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325070944.3600338-7-dlemoal@kernel.org>

On Mon, Mar 25, 2024 at 04:09:17PM +0900, Damien Le Moal wrote:
> Use the macro PCI_IRQ_INTX instead of the deprecated PCI_IRQ_LEGACY
> macro.
> 
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

