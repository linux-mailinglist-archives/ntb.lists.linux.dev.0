Return-Path: <ntb+bounces-582-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B06803C4A
	for <lists+linux-ntb@lfdr.de>; Mon,  4 Dec 2023 19:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739BE1C209E8
	for <lists+linux-ntb@lfdr.de>; Mon,  4 Dec 2023 18:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE98728694;
	Mon,  4 Dec 2023 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAdqp2C9"
X-Original-To: ntb@lists.linux.dev
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC25B2EAEE;
	Mon,  4 Dec 2023 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6cbe716b511so3612846b3a.3;
        Mon, 04 Dec 2023 10:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701713230; x=1702318030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnKGL9rVmaXJ0k7UQTGGb8qgGBw3yaFYXulmlj0ClVk=;
        b=BAdqp2C9jaqTixzb/RqbWj6j+fbXIo9g8Vr1IfcXLOi1ExQcsg6zD6XR3u3v0E9UXi
         dhKhR91o7S7Fyxu1wHgC6YwfemXBCCiKM9r8yGTQULCTxcHaNlWB7jFzQ5CYLEkKiJdz
         95tAIObV4J8/GrXsn+zPz/5/3y8ACVBHeCDWFyaibYjrONw9CaRCXfUYTP/pt35KIasG
         8EpV3FXB4Z8DpYkdQi1cSLd549vrG5X8zVE0uDeONDkrokG2h6XZrJP27Hp08mtLsJw7
         QU1gYxZj14F8i1GO3tt4gGRPO8ELfHGpqX5BLBtMk11LMwiuLtXZO3TbyHo1JgI4vqk0
         UaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713230; x=1702318030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnKGL9rVmaXJ0k7UQTGGb8qgGBw3yaFYXulmlj0ClVk=;
        b=he5SGYjKVGQARA/PhUYh56u7b9COctHmRVpEvbSz7KK/2uSG0YLAfLxJMrU/nP1ycl
         edoAUaM+7Ruv9ZrzciK6UuAW085vcISzTbAPCwF8/qKvJEJ9kxLrD9IVSOord/gDwDuz
         DwvjyxAsz+scA/fDyX1ZgjVKgAQ4y/ozSdhIcVg3txKem0UEO88E9EqAtvOu6Hy/n+Fm
         nFrlNnpgXUuwbl3MbcnXHzd+PT/OPX5sm8hxip+Ux3m9hR2P+a82q4FTSnxgmWPxmS0h
         m1TPaqX4RKlVvGlbdbzv3xugS+HKFGeuKO4UKePuG3bXN20/LJ7HV1n0GaDtTixBI+8h
         EA4Q==
X-Gm-Message-State: AOJu0YydfZPcS6PgUVsaogLiOEbfd1hnFxP74iScFY6v8cUwwIJwpDi+
	T8QYBxbgulxu5sCySBUC8XQ=
X-Google-Smtp-Source: AGHT+IGDIGeeBa7UWPj4E4w2SIGHBjZgGz8oxGqwAWzNb+KD7mpnEvIno4bt3NIHORxil3wMtNwC4w==
X-Received: by 2002:a05:6a20:1448:b0:18c:374c:6e64 with SMTP id a8-20020a056a20144800b0018c374c6e64mr27716780pzi.36.1701713229690;
        Mon, 04 Dec 2023 10:07:09 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::4:27ef])
        by smtp.gmail.com with ESMTPSA id u2-20020a056a00158200b006cdd507ca2esm7943470pfk.167.2023.12.04.10.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:07:09 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 4 Dec 2023 08:07:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Naohiro Aota <Naohiro.Aota@wdc.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"coreteam@netfilter.org" <coreteam@netfilter.org>,
	"dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>,
	"linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>,
	"open-iscsi@googlegroups.com" <open-iscsi@googlegroups.com>,
	"oss-drivers@corigine.com" <oss-drivers@corigine.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Performance drop due to alloc_workqueue() misuse and recent
 change
Message-ID: <ZW4VS3Z0auYCjg-W@slm.duckdns.org>
References: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>

Hello,

On Mon, Dec 04, 2023 at 04:03:47PM +0000, Naohiro Aota wrote:
> Recently, commit 636b927eba5b ("workqueue: Make unbound workqueues to use
> per-cpu pool_workqueues") changed WQ_UNBOUND workqueue's behavior. It
> changed the meaning of alloc_workqueue()'s max_active from an upper limit
> imposed per NUMA node to a limit per CPU. As a result, massive number of
> workers can be running at the same time, especially if the workqueue user
> thinks the max_active is a global limit.
> 
> Actually, it is already written it is per-CPU limit in the documentation
> before the commit. However, several callers seem to misuse max_active,
> maybe thinking it is a global limit. It is an unexpected behavior change
> for them.

Right, and the behavior has been like that for a very long time and there
was no other way to achieve reasonable level of concurrency, so the current
situation is expected.

> For example, these callers set max_active = num_online_cpus(), which is a
> suspicious limit applying to per-CPU. This config means we can have nr_cpu
> * nr_cpu active tasks working at the same time.

Yeah, that sounds like a good indicator.

> fs/f2fs/data.c: sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
> fs/f2fs/data.c-                                          WQ_UNBOUND | WQ_HIGHPRI,
> fs/f2fs/data.c-                                          num_online_cpus());
> 
> fs/crypto/crypto.c:     fscrypt_read_workqueue = alloc_workqueue("fscrypt_read_queue",
> fs/crypto/crypto.c-                                              WQ_UNBOUND | WQ_HIGHPRI,
> fs/crypto/crypto.c-                                              num_online_cpus());
> 
> fs/verity/verify.c:     fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
> fs/verity/verify.c-                                               WQ_HIGHPRI,
> fs/verity/verify.c-                                               num_online_cpus());
> 
> drivers/crypto/hisilicon/qm.c:  qm->wq = alloc_workqueue("%s", WQ_HIGHPRI | WQ_MEM_RECLAIM |
> drivers/crypto/hisilicon/qm.c-                           WQ_UNBOUND, num_online_cpus(),
> drivers/crypto/hisilicon/qm.c-                           pci_name(qm->pdev));
> 
> block/blk-crypto-fallback.c:    blk_crypto_wq = alloc_workqueue("blk_crypto_wq",
> block/blk-crypto-fallback.c-                                    WQ_UNBOUND | WQ_HIGHPRI |
> block/blk-crypto-fallback.c-                                    WQ_MEM_RECLAIM, num_online_cpus());
> 
> drivers/md/dm-crypt.c:          cc->crypt_queue = alloc_workqueue("kcryptd/%s",
> drivers/md/dm-crypt.c-                                            WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
> drivers/md/dm-crypt.c-                                            num_online_cpus(), devname);

Most of these work items are CPU bound but not completley so. e.g.
kcrypt_crypt_write_continue() does wait_for_completion(), so setting
max_active to 1 likely isn't what they want either. They mostly want some
reasonable system-wide concurrency limit w.r.t. the CPU count while keeping
some level of flexibility in terms of task placement.

The previous max_active wasn't great for this because its meaning changed
depending on the number of nodes. Now, the meaning doesn't change but it's
not really useful for the above purpose. It's only useful for avoiding
melting the system completely.

One way to go about it is to declare that concurrency level management for
unbound workqueue is on users but that seems not ideal given many use cases
would want it anyway.

Let me think it over but I think the right way to go about it is going the
other direction - ie. making max_active apply to the whole system regardless
of the number of nodes / ccx's / whatever.

> Furthermore, the change affects performance in a certain case.
> 
> Btrfs creates several WQ_UNBOUND workqueues with a default max_active =
> min(NRCPUS + 2, 8). As my machine has 96 CPUs with NUMA disabled, this
> max_active config allows running over 700 active works. Before the commit,
> it is limited to 8 if NUMA is disabled or limited to 16 if NUMA nodes is 2.
> 
> I reverted the workqueue code back to before the commit, and I ran the
> following fio command on RAID0 btrfs on 6 SSDs.
> 
> fio --group_reporting --eta=always --eta-interval=30s --eta-newline=30s \
>     --rw=write --fallocate=none \
>     --direct=1 --ioengine=libaio --iodepth=32 \
>     --filesize=100G \
>     --blocksize=64k \
>     --time_based --runtime=300s \
>     --end_fsync=1 \
>     --directory=${MNT} \
>     --name=writer --numjobs=32
> 
> By changing workqueue's max_active, the result varies.
> 
> - wq max_active=8   (intended limit by btrfs?)
>   WRITE: bw=2495MiB/s (2616MB/s), 2495MiB/s-2495MiB/s (2616MB/s-2616MB/s), io=753GiB (808GB), run=308953-308953msec
> - wq max_active=16  (actual limit on 2 NUMA nodes setup)
>   WRITE: bw=1736MiB/s (1820MB/s), 1736MiB/s-1736MiB/s (1820MB/s-1820MB/s), io=670GiB (720GB), run=395532-395532msec
> - wq max_active=768 (simulating current limit)
>   WRITE: bw=1276MiB/s (1338MB/s), 1276MiB/s-1276MiB/s (1338MB/s-1338MB/s), io=375GiB (403GB), run=300984-300984msec
> 
> The current performance is slower than the previous limit (max_active=16)
> by 27%, or it is 50% slower than the intended limit.  The performance drop
> might be due to contention of the btrfs-endio-write works. There are over
> 700 kworker instances were created and 100 works are on the 'D' state
> competing for a lock.
> 
> More specifically, I tested the same workload on the commit.
> 
> - At commit 636b927eba5b ("workqueue: Make unbound workqueues to use per-cpu pool_workqueues")
>   WRITE: bw=1191MiB/s (1249MB/s), 1191MiB/s-1191MiB/s (1249MB/s-1249MB/s), io=350GiB (376GB), run=300714-300714msec
> - At the previous commit = 4cbfd3de73 ("workqueue: Call wq_update_unbound_numa() on all CPUs in NUMA node on CPU hotplug")
>   WRITE: bw=1747MiB/s (1832MB/s), 1747MiB/s-1747MiB/s (1832MB/s-1832MB/s), io=748GiB (803GB), run=438134-438134msec
> 
> So, it is -31.8% performance down with the commit.
> 
> In summary, we misuse max_active, considering it is a global limit. And,
> the recent commit introduced a huge performance drop in some cases.  We
> need to review alloc_workqueue() usage to check if its max_active setting
> is proper or not.

Thanks a lot for the report. I think it's a lot more reasonable to assume
that max_active is global for unbound workqueues. The current workqueue
behavior is not very intuitive or useful. I'll try to find something more
reasonable. Thanks for the report and analysis. Much appreciated.

Thanks.

-- 
tejun

