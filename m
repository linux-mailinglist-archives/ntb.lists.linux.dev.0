Return-Path: <ntb+bounces-719-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9F91E743
	for <lists+linux-ntb@lfdr.de>; Mon,  1 Jul 2024 20:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8846B233D9
	for <lists+linux-ntb@lfdr.de>; Mon,  1 Jul 2024 18:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D958B16DC3A;
	Mon,  1 Jul 2024 18:15:41 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF416EBEA;
	Mon,  1 Jul 2024 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719857741; cv=none; b=j6ZQGr8BoLk+K/tU1y+EB2+64KXcMI3k0Kh+OR8aBN0j1YadjREoht62SD6Zvv1JZ0OGfpccr3UxkUOnkwH7CkzwOBOFRsbrDjL/HRp44k3Wv/qIbNzl3O83ftr4Zaf7r2uzqziWnxqTKXAnuDHbTCv6ykwPDQZZ/eKGC4iRAng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719857741; c=relaxed/simple;
	bh=S600UQAxJgzDB/3bWRjamJDTEfzcPwFyBjfO+zT/Tuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3Jj7wkMElEN4QyhWj6prxd6EyqF1548tn1dPkpv4ZX9lNVniZ49bgzpIdZbrEXkzzrIqr5iR1wi/KEvADFdLlpHFIGXlobQIJaRUGN3P3JV24fB7E+vNzfSa0+Lki9UFTkcsPxD7KuT/iHJ9ImaYHn+Ba/FoDiOKzaaM/61zJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADB3C116B1;
	Mon,  1 Jul 2024 18:15:41 +0000 (UTC)
From: Dave Jiang <dave.jiang@intel.com>
To: ntb@lists.linux.dev,
	netdev@vger.kernel.org
Cc: jdmason@kudzu.us,
	allenbh@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	abeni@redhat.com,
	Jerry Dai <jerry.dai@intel.com>
Subject: [PATCH v2] net: ntb_netdev: Move ntb_netdev_rx_handler() to call netif_rx() from __netif_rx()
Date: Mon,  1 Jul 2024 11:15:38 -0700
Message-ID: <20240701181538.3799546-1-dave.jiang@intel.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following is emitted when using idxd (DSA) dmanegine as the data
mover for ntb_transport that ntb_netdev uses.

[74412.546922] BUG: using smp_processor_id() in preemptible [00000000] code: irq/52-idxd-por/14526
[74412.556784] caller is netif_rx_internal+0x42/0x130
[74412.562282] CPU: 6 PID: 14526 Comm: irq/52-idxd-por Not tainted 6.9.5 #5
[74412.569870] Hardware name: Intel Corporation ArcherCity/ArcherCity, BIOS EGSDCRB1.E9I.1752.P05.2402080856 02/08/2024
[74412.581699] Call Trace:
[74412.584514]  <TASK>
[74412.586933]  dump_stack_lvl+0x55/0x70
[74412.591129]  check_preemption_disabled+0xc8/0xf0
[74412.596374]  netif_rx_internal+0x42/0x130
[74412.600957]  __netif_rx+0x20/0xd0
[74412.604743]  ntb_netdev_rx_handler+0x66/0x150 [ntb_netdev]
[74412.610985]  ntb_complete_rxc+0xed/0x140 [ntb_transport]
[74412.617010]  ntb_rx_copy_callback+0x53/0x80 [ntb_transport]
[74412.623332]  idxd_dma_complete_txd+0xe3/0x160 [idxd]
[74412.628963]  idxd_wq_thread+0x1a6/0x2b0 [idxd]
[74412.634046]  irq_thread_fn+0x21/0x60
[74412.638134]  ? irq_thread+0xa8/0x290
[74412.642218]  irq_thread+0x1a0/0x290
[74412.646212]  ? __pfx_irq_thread_fn+0x10/0x10
[74412.651071]  ? __pfx_irq_thread_dtor+0x10/0x10
[74412.656117]  ? __pfx_irq_thread+0x10/0x10
[74412.660686]  kthread+0x100/0x130
[74412.664384]  ? __pfx_kthread+0x10/0x10
[74412.668639]  ret_from_fork+0x31/0x50
[74412.672716]  ? __pfx_kthread+0x10/0x10
[74412.676978]  ret_from_fork_asm+0x1a/0x30
[74412.681457]  </TASK>

The cause is due to the idxd driver interrupt completion handler uses
threaded interrupt and the threaded handler is not hard or soft interrupt
context. However __netif_rx() can only be called from interrupt context.
Change the call to netif_rx() in order to allow completion via normal
context for dmaengine drivers that utilize threaded irq handling.

While the following commit changed from netif_rx() to __netif_rx(),
baebdf48c360 ("net: dev: Makes sure netif_rx() can be invoked in any context."),
the change should've been a noop instead. However, the code precedes this
fix should've been using netif_rx_ni() or netif_rx_any_context().

Fixes: 548c237c0a99 ("net: Add support for NTB virtual ethernet device")
Reported-by: Jerry Dai <jerry.dai@intel.com>
Tested-by: Jerry Dai <jerry.dai@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>

---
v2:
- Move fixes tag to original issue (Jakub)
  - I couldn't find the special dependency tag to make note of the situation.
---
 drivers/net/ntb_netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ntb_netdev.c b/drivers/net/ntb_netdev.c
index 536bd6564f8b..dade51cf599c 100644
--- a/drivers/net/ntb_netdev.c
+++ b/drivers/net/ntb_netdev.c
@@ -119,7 +119,7 @@ static void ntb_netdev_rx_handler(struct ntb_transport_qp *qp, void *qp_data,
 	skb->protocol = eth_type_trans(skb, ndev);
 	skb->ip_summed = CHECKSUM_NONE;
 
-	if (__netif_rx(skb) == NET_RX_DROP) {
+	if (netif_rx(skb) == NET_RX_DROP) {
 		ndev->stats.rx_errors++;
 		ndev->stats.rx_dropped++;
 	} else {
-- 
2.45.1


