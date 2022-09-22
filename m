Return-Path: <ntb+bounces-271-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B45E6DA9
	for <lists+linux-ntb@lfdr.de>; Thu, 22 Sep 2022 23:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4DD3280D1C
	for <lists+linux-ntb@lfdr.de>; Thu, 22 Sep 2022 21:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896022560;
	Thu, 22 Sep 2022 21:08:57 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC281FBA
	for <ntb@lists.linux.dev>; Thu, 22 Sep 2022 21:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2E9C433C1;
	Thu, 22 Sep 2022 21:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663880935;
	bh=Gs1easMEUixl0oFKypteShhqardlbobN+iwArzVzzxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ail1Z8lWsVe2AZcWMJhdoj5Dv1rS1X+P6kDATJnbQGX6WpxbizbzFaGOgsFfzeThS
	 VrLZN5RhwDn8YVI/6RnyAulzF6fn6Xvfq+dQrL4tR0FGqVk9Csr4C0YvJl2UTy3YvB
	 EPLI81GxHt1kd2qC8XJ/uBwegiF2nO7SnLL4BGziDDgXXmViIH2+zY7t2RsN9HXQ4q
	 ObwF6dRDlMai49sEHgBSq80J96Wf6guMvcarpZiZOaW1LKhvF70HDrEzroeZnFnO90
	 6aa3MqfIT3b3PG09+phRqvPcfOoTxGZnImar0DzMmwgdLDVY5BRk/98zH9LiMhlH0w
	 eyrtuPJ4rN+EA==
Date: Thu, 22 Sep 2022 16:08:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Cc: fancer.lancer@gmail.com, jdmason@kudzu.us, dave.jiang@intel.com,
	allenbh@gmail.com, bhelgaas@google.com, ruscur@russell.cc,
	oohall@gmail.com, james.smart@broadcom.com,
	dick.kennedy@broadcom.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] PCI/ERR: Clear fatal status in pcie_do_recovery()
Message-ID: <20220922210853.GA1335665@bhelgaas>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901181634.99591-3-chenzhuo.1@bytedance.com>

On Fri, Sep 02, 2022 at 02:16:33AM +0800, Zhuo Chen wrote:
> When state is pci_channel_io_frozen in pcie_do_recovery(),
> the severity is fatal and fatal status should be cleared.
> So we add pci_aer_clear_fatal_status().

Seems sensible to me.  Did you find this by code inspection or by
debugging a problem?  If the latter, it would be nice to mention the
symptoms of the problem in the commit log.

> Since pcie_aer_is_native() in pci_aer_clear_fatal_status()
> and pci_aer_clear_nonfatal_status() contains the function of
> 'if (host->native_aer || pcie_ports_native)', so we move them
> out of it.

Wrap commit log to fill 75 columns.

> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/pci/pcie/err.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 0c5a143025af..e0a8ade4c3fe 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -243,10 +243,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	 * it is responsible for clearing this status.  In that case, the
>  	 * signaling device may not even be visible to the OS.
>  	 */
> -	if (host->native_aer || pcie_ports_native) {
> +	if (host->native_aer || pcie_ports_native)
>  		pcie_clear_device_status(dev);

pcie_clear_device_status() doesn't check for pcie_aer_is_native()
internally, but after 068c29a248b6 ("PCI/ERR: Clear PCIe Device Status
errors only if OS owns AER") and aa344bc8b727 ("PCI/ERR: Clear AER
status only when we control AER"), both callers check before calling
it.

I think we should move the check inside pcie_clear_device_status().
That could be a separate preliminary patch.

There are a couple other places (aer_root_reset() and
get_port_device_capability()) that do the same check and could be
changed to use pcie_aer_is_native() instead.  That could be another
preliminary patch.


> +	if (state == pci_channel_io_frozen)
> +		pci_aer_clear_fatal_status(dev);
> +	else
>  		pci_aer_clear_nonfatal_status(dev);
> -	}
> +
>  	pci_info(bridge, "device recovery successful\n");
>  	return status;
>  
> -- 
> 2.30.1 (Apple Git-130)
> 

