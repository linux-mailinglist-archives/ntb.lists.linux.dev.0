Return-Path: <ntb+bounces-309-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E85EDB20
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 13:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D5F1C20958
	for <lists+linux-ntb@lfdr.de>; Wed, 28 Sep 2022 11:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB54DEC1;
	Wed, 28 Sep 2022 11:06:29 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B997B
	for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 11:06:27 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id a2so19800100lfb.6
        for <ntb@lists.linux.dev>; Wed, 28 Sep 2022 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ORb9sERSxMIv63iY+ckgWmXixVq6oKHLVhNgSaE2Ouo=;
        b=OZ0Q7JmMWDkTXmGsaWHP4llTAtzRToP5F5/dVmXLLkBcuJI63vOWSy90xyHt6Fq4ji
         VN7Hf8EHcqsj3ocRrDb9N3A6fkCcX/509Uo4VC/BqMDhY87kM+5DZXgwpRMu1EX90dLh
         0suF3LUJFha/80A1QHoMhdrkjLqCVo5fY/8ScHpEl4YZ57h8BogjDUDKYzcBqE5QJNdE
         xGyIkjD6MRkgmjRO/wLG5HN1FKBSNLVsZquXd2ffMqeTM6YhPEIfBhih9YFItk8IBCl6
         NaAfoIerSUV3Xr0kxYYCxnFWLorEETJmPhRQg5yMFWbLvsXBoeq8qvSgjPZ+2OlOpP+/
         MQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ORb9sERSxMIv63iY+ckgWmXixVq6oKHLVhNgSaE2Ouo=;
        b=Z3uaHio66ZnRBKOTC/UOskmr/0wztnjjp0pEXTbfTwSb9Q8CGxBcw7FfiXe6YC7Pj+
         Go99O6JvXR66DpTHP9ELOF3Vo7cvOYBNR/N3W/aGHXjtF+YSkT8VCvaEmltFnUsZhhkW
         NLI24P3HuCCuO7Ck99OMNroaZBfBO3Lnzcpeb61DPj07XRop2QJVSaSC5aJnJWD39Qv5
         WINGsP9VcoDsR7LCR891Ie/SxstTpdMKw8BV3hw31Kukt3s5QJK5V9DM8p8gMIs9vMFc
         tbqgVJ0VsLzpyhODkxuy96vpS+juzutFT90nQastaxy71pAfJW117T0uMAQ7+CKAkS48
         V3zQ==
X-Gm-Message-State: ACrzQf2jiBOPFFQ+ounojUlQbE9YgsnUU39h3eM6JAgzTa1IdLtBNWzp
	2isDRM0ndYQtBsV+OLGsf34=
X-Google-Smtp-Source: AMsMyM4Dsy7g1ZA0z4B1Nrghs6PGyvITa8I/TiMTO6bSdlOIf8bjZ3vWDOaFkQ0AJceR/C7OBO/dHg==
X-Received: by 2002:a05:6512:3d87:b0:499:f2b6:7021 with SMTP id k7-20020a0565123d8700b00499f2b67021mr12387564lfv.103.1664363186093;
        Wed, 28 Sep 2022 04:06:26 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id m16-20020a056512115000b0048a9e18ae67sm446279lfg.84.2022.09.28.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 04:06:25 -0700 (PDT)
Date: Wed, 28 Sep 2022 14:06:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, bhelgaas@google.com,
	ruscur@russell.cc, oohall@gmail.com, jdmason@kudzu.us,
	dave.jiang@intel.com, allenbh@gmail.com, james.smart@broadcom.com,
	dick.kennedy@broadcom.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 0/9] PCI/AER: Fix and optimize usage of status
 clearing api
Message-ID: <20220928110623.b3vocoubasrshyzk@mobilestation>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>

On Wed, Sep 28, 2022 at 06:59:37PM +0800, Zhuo Chen wrote:
> Hello.
> 
> Here comes patch v3, which contains some fixes and optimizations of
> aer api usage. The v1 and v2 can be found on the mailing list.
> 
> v3:
> - Modifications to comments proposed by Sathyanarayanan.

> Remove
>   pci_aer_clear_nonfatal_status() call in NTB and improve commit log. 

Failed to see who has requested that...

-Sergey

> 
> v2:
> - Modifications to comments proposed by Bjorn. Split patch into more
>   obvious parts.
> 
> Zhuo Chen (9):
>   PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
>   PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
>     uncorrectable error status
>   NTB: Remove pci_aer_clear_nonfatal_status() call
>   scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
>   PCI/AER: Unexport pci_aer_clear_nonfatal_status()
>   PCI/AER: Move check inside pcie_clear_device_status().
>   PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
>   PCI/ERR: Clear fatal error status when pci_channel_io_frozen
>   PCI/AER: Refine status clearing process with api
> 
>  drivers/ntb/hw/idt/ntb_hw_idt.c |  2 --
>  drivers/pci/pci.c               |  7 +++--
>  drivers/pci/pci.h               |  2 ++
>  drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
>  drivers/pci/pcie/dpc.c          |  3 +--
>  drivers/pci/pcie/err.c          | 15 ++++-------
>  drivers/pci/pcie/portdrv_core.c |  3 +--
>  drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
>  include/linux/aer.h             |  4 +--
>  9 files changed, 44 insertions(+), 41 deletions(-)
> 
> -- 
> 2.30.1 (Apple Git-130)
> 

