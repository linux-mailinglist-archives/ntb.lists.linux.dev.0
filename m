Return-Path: <ntb+bounces-241-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 625655B7C83
	for <lists+linux-ntb@lfdr.de>; Tue, 13 Sep 2022 23:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB261280997
	for <lists+linux-ntb@lfdr.de>; Tue, 13 Sep 2022 21:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B506710;
	Tue, 13 Sep 2022 21:10:38 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7F670F;
	Tue, 13 Sep 2022 21:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lccy+mPUat0ON3YiiiGjiPwGgFsjCrJLd+4YLnG8DkjKnyVSGfa3NbJA5vHPioZttk5IcgiVJCXFMgxVsp2UXZuOFjg7qL12FTlEoebuCIN4R7hQgICRvMJ/N6e9Of3wV4PEsXtTxNxfVJPc419Uh7XKGQLWlRuPbXfeUw/YR6o4ub1j8Rdz+9FgmaMk+Oc+ViSI605Fv3WQfbdcLASKNdxLS5XhDl2RJUZlqlWxsbXyNcBDvvzIbTNcBPt++LJcRDe0m+SGbeEIhEQetFAEUfBfdQyVMrGyefFBeesUM1nXvFy6NCdhuZladWMaFBpKttKJNCZpV4FVdgFSstOjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxyZmoQ4HPxt9JAZN3QVzBllZWpIazPpqniEWrzTllw=;
 b=X+/kX/BlgiwFh97xgDfaqoU9tmvoj7aZugGcBPiQlc6/FZ6CkEu8W4+0apcahB6g1Zj5Xw+UXC0sDINy4DxuCsKqHpRVovI6dYZqkbDj/s8uSkkNEEaVo4WZt8gmZVgzkV+z4meW9XRcNNgvNQb+3m0SohKHAbbhR/OstX0B6aAEoXVbYfVxvP51A2fsBdCuQLm0WYU7tEa825buILnwSU+fE/E4zATV0RwdYqiijk5vwuCpuCZS3U7aOU4HDeMD6HrTvC0gAbupz++zEpeND10LB5H867qHg4Mxeeh0M19lOXWGx7V8rcNGi1U0ihpUS2bw44/nZPAzJFLzAe7Yaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxyZmoQ4HPxt9JAZN3QVzBllZWpIazPpqniEWrzTllw=;
 b=NDAeFdqdI8QbfqwpkTeA2X600Plo7iYkR2CmFlvq25CFeMAzz0foucRFqPLZxXLqoYLPM3E1qtoMCR7Spksr1F7kxe9DdM1XOehzI3jSMzkHYkFPuEfNkicqCvZlElF7Z+Fueu4uViqOm82EZ1bskexDWy9NVa+CJyFgnexPoOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8793.eurprd04.prod.outlook.com (2603:10a6:20b:408::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 21:10:28 +0000
Received: from AM9PR04MB8793.eurprd04.prod.outlook.com
 ([fe80::e5ca:22d0:52e2:15f5]) by AM9PR04MB8793.eurprd04.prod.outlook.com
 ([fe80::e5ca:22d0:52e2:15f5%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 21:10:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: maz@kernel.org,
	tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kw@linux.com,
	bhelgaas@google.com
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	peng.fan@nxp.com,
	aisheng.dong@nxp.com,
	jdmason@kudzu.us,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	kishon@ti.com,
	lorenzo.pieralisi@arm.com,
	ntb@lists.linux.dev,
	lznuaa@gmail.com,
	imx@lists.linux.dev,
	manivannan.sadhasivam@linaro.org
Subject: [PATCH v10 2/6] irqchip: allow pass down .pm field at IRQCHIP_PLATFORM_DRIVER_END
Date: Tue, 13 Sep 2022 16:09:53 -0500
Message-Id: <20220913210957.3493826-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913210957.3493826-1-Frank.Li@nxp.com>
References: <20220913210957.3493826-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To AM9PR04MB8793.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::22)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8793:EE_|PAXPR04MB8621:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b286fa-b0cb-4c2f-40f6-08da95cc6254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jGXvcIg4aOuYJpCTTjy6rjoFLXaukFIpTD1wWI5WbheZopT33U6rinS7z6j8XnG1gldD4ZhlHCZoNSn0TBdknDrJWjz1gTjjFM2v5/OZNB2PuVAntkc7bDsx5zDtleLHompujmh+Bk1EHYwJhCA9Mg+XcXf0gShiLrHon2EtdwZBDQG6Owdmh/QRBiIGH9rA+YuZLaIVvQ3b14ouWCFzNozd1D8x++8KezkOdbrbkUZFisOonaz2M2/XIBr9pQsfC+INiEsRa5gQIMLCf21b9bEABnsS14vpTBK9trB42gvjK3MZA65EvqGQBTebHc0c1TbBb/wqW3UHduXCHPRgCiGCvtnpoHSHl7l5udz5rRK0QZNDA8ZU+fa/8m4uAkM+jwvPRSGOHQJ0dAQF8oWiTHG2mTSEhRVMr8n9DsXAGDcJda96laOdV3pzakkvhRcOlhcPElSWOO5iW4HTspv+XKb3+A+ma/FHYAUMpXBdM7rd5sbrQa2cpr3PRfDJlSLBufUKbgrVVycqyzYCu5M2gnMk10not4wN7y5vFLZfdg7A2HLNZ3i3gH2yvpMBFa7RZDfcYQlooWJ5iJb3+kr/q4nOk+8Ohzd4AUpJs+35B3s8C9MS5mnfPqt9oMF0C+ASJijGfR7qCnC5Pgi5bkFeWKefgBv6BZCC1VMdDXuzEMjrTU/qBp7efPEGlzpLPx7erQNVWF41Wol/iIRTd4WU5nFIQGPMdw9hPuttRh3StTc2EO4qcbKoh+Z2NadSzZFxdAq+ZhrIjZ2VSNrGZYpvpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8793.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(38100700002)(478600001)(316002)(83380400001)(36756003)(8676002)(66556008)(2906002)(26005)(52116002)(2616005)(6486002)(66476007)(66946007)(6512007)(86362001)(6506007)(4326008)(41300700001)(7416002)(38350700002)(6666004)(8936002)(5660300002)(1076003)(186003)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXhc/YAPnCCO8nL0n/k8vsGq1LMkXTGY1uEu5iCPqWaQswKji2jTEkUPcvTx?=
 =?us-ascii?Q?ehD79dmagtG+SHESQ0KFyOxu3qRc6MKTh4bH5P48qoDVs6yh5h9FKZaFcswj?=
 =?us-ascii?Q?p4ZjDeT+ahhtBSM2Rc7kWKb8q1fHlB3/Gamf2+5FVSpZxdMmWvp4VKYnbbxi?=
 =?us-ascii?Q?MMxLm17Dk/7LtYpopKjHEiltDjSwakOzl0wFOX5+vqRxIstLc81oMVoRuFMT?=
 =?us-ascii?Q?FUyJ9Lj92RrXHnByatxVVg6FiL7QLYmLvCakHGI8FLR23aSii43imiwqOIw+?=
 =?us-ascii?Q?4CEnG4qM0M9K0rddYwPqznikBxDVx7Tg2DONAsBY0z+sMu9doT20n5Y/p1Wp?=
 =?us-ascii?Q?Z6q2uijIJThHtrJrGxWl8XVWEgW+kjglD7yBdr9M78YFW+EOYJAjb3WyR0cj?=
 =?us-ascii?Q?ogL8NEG19XTbn+dhTFWAzK/9Kf5+2pdvG5IPq5fOWBQQVLyLtMLUgoFo1NUk?=
 =?us-ascii?Q?XMNoiEw8iPC8oS53Ei9hVxGrRda/Kfmdjpync2KN2VdfpluMVK9Mr3+NM8Mn?=
 =?us-ascii?Q?oFhm8BoCBSZKo9LEnCdYdupzvs4ZZBmye+Zj5kIeoDZDY7b2OW7TbfpmHDWB?=
 =?us-ascii?Q?fFS90FzbPqb6VU1Gna9O8+xxA8dGp5duPhtJ593ral3th2Ya4ht5uMt0y0t2?=
 =?us-ascii?Q?nakzfeybbtk1Hm5OB+SEkpt/x96UkJrGKgIAyj8p5dT7SmjQeQIjG0I7OMvb?=
 =?us-ascii?Q?qqK4FdlKU8434WjkboL+io9+foYfrejXcbOyxS2A7BJFJtIm+7jK18zpUlyc?=
 =?us-ascii?Q?nZ/PoH2mLsCFC+C5apUZ6ftwA17xM37nFQX1AGz5wgoI7MYwKbaxx4b40xf7?=
 =?us-ascii?Q?y00QWhG7ZTr60GQLo5jwTJB/6CPpwPqn/hnVxuzJLUe5gGorqGmW3TMLv3PC?=
 =?us-ascii?Q?FhLt6m/lm+5U3z0h+y8z7i06jvF6XA6TW0F3FqidMPFEX9MNKYCoM0KnaIrk?=
 =?us-ascii?Q?Iq5CYUosekMT0ENCcFmBGl+7+jMZUzQDac7tfxLYgvsrUOGxqiL2TY6IVjTV?=
 =?us-ascii?Q?+uKSfVb2FWRwlFSGd1QPO9oPYQCTI8seUEGZgWvThVYcgfNpz30yVayw1qpl?=
 =?us-ascii?Q?SXVUAb+bhmlcDwDGW8+hZz4rXmmW/46bfK7NPIr4u3VpdlwBzzp5QCnkFzHB?=
 =?us-ascii?Q?JakYZw3lEGP/H9HgqxjCzG+oxoaNdvCc66XZLECK23nV/PDvXn54BptaexCl?=
 =?us-ascii?Q?AyJDd6Ko/eKR4UUw7BJ7xewflyze/tS9ckAXd5j5ZmOZzekfZgrzXgX6Kv4T?=
 =?us-ascii?Q?GhPecLwML4TZ9usRWG8/E6wV+hMmJKAsEiqPxdUr3LCEdTuZt1t86P3DuU1N?=
 =?us-ascii?Q?/b3U+kT+y3yIcjEWNcuk7GdrpQqrLCke3P/WNS570MHkV1A/fe8cKrFF2D9C?=
 =?us-ascii?Q?zLQ5x34zzv6iOUoEQnMojE6GT6KEJTVvK486C30MGprcO+tu0zA+q3mSRTOh?=
 =?us-ascii?Q?OMI1KXXGrnxwPrQX5LIUczkdI4lI2g5uXX2YfZrn7+gVsxVUtGRcvq+Hw/ed?=
 =?us-ascii?Q?rHi2wFfXTgLZ6ydvR2rIFtpHTVxLFIvnf6nOBM03o5hQT6HS4Yq0DhJBQHBz?=
 =?us-ascii?Q?2NrozT0I1u0FeHksuXE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b286fa-b0cb-4c2f-40f6-08da95cc6254
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 21:10:28.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX+l9COKQBq53UJp1NWgNo3B1kSpRHwIsMbKi5QdFiqVKc8lD1q+ZYkSxlaNVyL0PHruy4xFsoTbRZvu+35D3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621

IRQCHIP_PLATFORM_DRIVER_* compilation define platform_driver
for irqchip. But can't set .pm field of platform_driver.
Added variadic macros to set .pm field or other field if need.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 include/linux/irqchip.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
index 3a091d0710ae1..d5e6024cb2a8c 100644
--- a/include/linux/irqchip.h
+++ b/include/linux/irqchip.h
@@ -44,7 +44,8 @@ static const struct of_device_id drv_name##_irqchip_match_table[] = {
 #define IRQCHIP_MATCH(compat, fn) { .compatible = compat,		\
 				    .data = typecheck_irq_init_cb(fn), },
 
-#define IRQCHIP_PLATFORM_DRIVER_END(drv_name)				\
+
+#define IRQCHIP_PLATFORM_DRIVER_END(drv_name, ...)			\
 	{},								\
 };									\
 MODULE_DEVICE_TABLE(of, drv_name##_irqchip_match_table);		\
@@ -56,6 +57,7 @@ static struct platform_driver drv_name##_driver = {			\
 		.owner = THIS_MODULE,					\
 		.of_match_table = drv_name##_irqchip_match_table,	\
 		.suppress_bind_attrs = true,				\
+		__VA_ARGS__						\
 	},								\
 };									\
 builtin_platform_driver(drv_name##_driver)
-- 
2.35.1


