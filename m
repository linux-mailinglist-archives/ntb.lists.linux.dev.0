Return-Path: <ntb+bounces-86-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3AA576750
	for <lists+linux-ntb@lfdr.de>; Fri, 15 Jul 2022 21:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6709F280CCA
	for <lists+linux-ntb@lfdr.de>; Fri, 15 Jul 2022 19:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5A4C69;
	Fri, 15 Jul 2022 19:23:00 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929654C65
	for <ntb@lists.linux.dev>; Fri, 15 Jul 2022 19:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG+hgzGnWJfix+YaAuKzHFQMXPIa1hidwoCYDTzdmy1S+WVs+I5DWAMFiu1kg5CmBxUlgii1puPMayRt8k4OC0TDFHDRvA1m5+O7Rz7RWff+L5bUE6Wr/V/HXJ0grQFFjh3eSzDbiXYeutSsXuS3GVVtLs/2u+4XQOK7nar785wHTRapa+925I1mFCpPkfJlmDrEmkIUlI8DOvWNYI1mqImSCgV7/zBg3/pnefM1elmiHj4+FBL3nT8GfDednwA019PoIjop7xPlAo4DkqbtiA0aDtNR3khFc5VBPFb+1HJ3ktZhxXJUHqbxWtQJCxY36STuMkWL6zdZy+L4ZNmbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asF68cMe4bNr/uSmcUlFQoSaQguF0PwRWXCflrxEx8I=;
 b=C7LXqHiJn6esYrR0CcT4WYEPE1DHuGo70QGZ9nKGjI1JeXFfMLXpZznwe+1YBCkLFUOfs1ub6TCpuT/pVwchxwD5OrUSProMEYGh2nWxUNKW119qcee0w1cRjdeg2NYl6XJw529ezR75iuMS35H38TDmv/kKhHMFf+Rp64ZBv/ipI8nJoYM88vR6cWjtGbo67nfVYuXZOmyfaQCZjlBez2apcwh0GqMlBgZoQWKNqC/mNaRM5VpNOh/pisHkDaV5OYMEQA17P7VAdZl/UGBaGUCe98+iOcULMkGMyKrvzFoOXPm/0tli9wypx+F89cAKgs4NzI2f9kscEJ1hF2/VEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asF68cMe4bNr/uSmcUlFQoSaQguF0PwRWXCflrxEx8I=;
 b=lN0qBighQHLxvm9L/eHTwEY9cM1GoXo9ZUB2N5Ki9X95QT7PQz+ffUuMKYem2TMkFNUOeX2c1FrrhN1DqkTAnxgY/IvIuYDPZaTHIz2/w08xwGWboH31PZN7Yppdxv2wR/64QBbHVXvPhjPPiSRQFMwjpgsqXQZFdzuWZvJ7ExM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18)
 by HE1PR0401MB2490.eurprd04.prod.outlook.com (2603:10a6:3:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Fri, 15 Jul
 2022 19:22:54 +0000
Received: from PAXPR04MB9186.eurprd04.prod.outlook.com
 ([fe80::54aa:b7cb:a13c:66ab]) by PAXPR04MB9186.eurprd04.prod.outlook.com
 ([fe80::54aa:b7cb:a13c:66ab%7]) with mapi id 15.20.5438.017; Fri, 15 Jul 2022
 19:22:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: maz@kernel.org,
	tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kw@linux.com,
	bhelgaas@google.com
Cc: kernel@vger.kernel.org,
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
	ntb@lists.linux.dev
Subject: [PATCH v2 2/4] irqchip: imx mu worked as msi controller
Date: Fri, 15 Jul 2022 14:22:17 -0500
Message-Id: <20220715192219.1489403-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220715192219.1489403-1-Frank.Li@nxp.com>
References: <20220715192219.1489403-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To PAXPR04MB9186.eurprd04.prod.outlook.com
 (2603:10a6:102:232::18)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03bcfd0-9192-4c6e-d4c4-08da66976a14
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2490:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OM6HVsxRxRLaPwhA7Wjp6qhw/+YC3B3WwoqFiuxjbHMbcQIRC9Y71A2pyusCTfPTHLYmE7XGog4CR6ejZJuk7/RY34hGiJEtPhPLJhkQjxiebMSU3h3Q0DuMmbN2miwkYXD+IDgnlfdIHFvKxPCjrO8BTxZFWRgGKnABDrm+FIHUwM1LkIU38Q7//QTRn/98V+g3Q82LycJBdQglZkq/7r0AA85h+QQcRDn5SBAxkoNoEqmNkZCYwKIG1sXwt9u1bzd+1Mn95h/XwqOYYgDSNEvvsWlN9YH1+JRNfSx6WbZwKjtx45LgD6+LOV4uXbj1OWOeTif6/xOqet+/2oGy17GNmfxi//x44cpcZkxN6zAgSaDGvWDQtc8dgfcDgC/fGhmlsX8ueluJA5c5ZDjEMI+3aeVja6yv4kL/BGsr1ATIVQLuKlGm49K2UeAsA15K+lf3h88zCbK8XzASKXyPWqBmb6z1SBU+cACH2ytp8CoNEz/vhl2mQXdYLXgqRj9KMaWT8pG3Weo6lqiCO/jYcdoMbmWqk0fJ+O55lCAlfZnZCU2LhfgGZIIw1UeiDurfcN74IZr4dptMzdtNXMsMSpsRSz8ZA64mMnse8ffKt0J/WAQM3sjdRY9ueuwjyZYSqKr56F2r971yIkp4dri2lBogJWLBWwU1Nx/wACgocBVNeFM3MaqWg14NCUohylJOtfPPLySd33hF3DVRsPA665WMe6rai1vRvZqrptyCFVW4j0zUTHIm69oJYE7tZNYKI8hlQUP0et1pmP42pkxqED3Waii8/ul2j87Fb6RvV/j+2y4GUEEyxzElFl1+PRfi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9186.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(316002)(186003)(5660300002)(86362001)(8936002)(66476007)(66946007)(1076003)(66556008)(6486002)(4326008)(8676002)(6512007)(2616005)(41300700001)(38100700002)(38350700002)(478600001)(26005)(6666004)(6506007)(52116002)(2906002)(30864003)(36756003)(7416002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wXQvp+J0MLWwiX3l27ARzwsyOJCkK9HGS697G3gD7Iun1xwijzsAlDbtfr+u?=
 =?us-ascii?Q?X+w1PML0ax9iFWNCmVdOZqYzs+y9vL5luNPqfo4iW8qs0T0nLQeMAgwcWoU7?=
 =?us-ascii?Q?dT0H6jPn5Mz3hAROU/oeaVj4cCWYI+ZUSXzNrntIwxmXX+15WHrFtrkR2qSz?=
 =?us-ascii?Q?WEBHadsMf2SOALWeeomJxyc8ijfeb4NfSARuNrF4T2aDJBB3YYKqIEz8V4AK?=
 =?us-ascii?Q?pgilajuL2riSYQgiu5cibqJxD5jOFX0B7ceISdheroT0E1eXSE7jJy7hXLVA?=
 =?us-ascii?Q?e1xFLmAsGXes/aZkd1zUTXWs2Wmn+qlU/fIGQJ0fZ0wfFVnFd+Y247IJJevJ?=
 =?us-ascii?Q?CtDK9ovba2gILFHkym6osFAgC1XU94sOlfqwtQNqoT1bPwbnCl0IQ5nskhp+?=
 =?us-ascii?Q?zcb+ST9pjzgKXnA/RCAycbQ3KwyUmRaSnvpiWzLCyFD6/6p4ElX2RMbga3YU?=
 =?us-ascii?Q?TUnUYRzFMU6nOZ2lE0wvOwg/Y0jYEu+Rh/QT3YKg6+Gixh8fUGphuZHo5In5?=
 =?us-ascii?Q?Fkh4ztOqFqYMwr02+4Hgy8SA2CBEfXPEcH4O37dDDh3gvBavG7g9yco0JqEs?=
 =?us-ascii?Q?iy8o3z/CoNHBrqEuIeH1EXlgWRoVPc0UuGDbHhnOtDVrDuw0EsvMh1D6V354?=
 =?us-ascii?Q?eWLGuRjjMHupI5mVz4C9yaChoM/3LiaZmt15K7xl6qkwZmlcZXOcJIOCZzoz?=
 =?us-ascii?Q?zziJXy4Ch0qaBy0KNEXvZo68UWD1JNWnuYMkQLT84lPDmvmVHqULcZNL+E3z?=
 =?us-ascii?Q?lCdYDBezz23Mj/y/dfzU2p9gaXWtqMYxnxn8PhV5yIJiA+KozPouorcSyyRc?=
 =?us-ascii?Q?YO4TneMTC0KsW5vPLgefMR7RLr9GPc9Re8N2AIsp2CxlKAOWYnbmnNu2/6k7?=
 =?us-ascii?Q?7MycVmkiI6uXvvLCpWw1FCX8LZKsg23HhUYHt68Ui9SUAXz/dv4aHqpdqN9+?=
 =?us-ascii?Q?CafUGtoPjr8DabslNnrOo7z9CDMyLUaK8lcCoglcardVSdp9YkfpVxIpQvFL?=
 =?us-ascii?Q?l7JOElHJ0io/DyXhtUNs40YqOrJ724fAEPt1+R+zM53HqHE1jbE9DH9udjqs?=
 =?us-ascii?Q?jT5iTMUA5ecg40FFo5tSEpguYa7FiGd+FluzcBH5L/+wjwLT5R9Y2D9m2Tt/?=
 =?us-ascii?Q?oio0W/ah+8PQT24COHTI1bYVO1r6RukyYtHLhjlbWv/Udwvm0c8rEVfKKXrj?=
 =?us-ascii?Q?95gf1RaIPI0rYDIaL2jeJ3dKMXH7X90dhBDKexB4RziAXROx4rRjgAmqnosh?=
 =?us-ascii?Q?GQW7rnQe4I4furDm4spQZs48F090GpijTICJT6mnYux47wi/lezHpiJrDXUi?=
 =?us-ascii?Q?E0R+MTXbwQce9cH5ryivNyDv+7KD4CAGMTkdRxeR+VmgTTx1Lztivpo8OKNe?=
 =?us-ascii?Q?SHXFjw6xtYGorlKaGiPbtsVrPqbSdT8SwVS/0VEAbAur3AMEsoVg4m4LcIJq?=
 =?us-ascii?Q?HpM2LH0HLdBpXW+Tx1TrKG5VOGbL2OzMbuKqA6+eH0QCHJK5gPItPQ8AkQFK?=
 =?us-ascii?Q?AV7m7/n144cWhjv9/fs6zqj5IW0fsSbRARe6yze9QK6akWkbK/AtVoOcZTVV?=
 =?us-ascii?Q?/RZINtku+OLSjT8DKWQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03bcfd0-9192-4c6e-d4c4-08da66976a14
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9186.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 19:22:53.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlSslJ8N6Lkq3qRax7ykotemyHPYJz1ACeWLL7ipzpKcmev4oTCfrX7IpdhN64Uvuz6xuovstUEzgPXXW1KOhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2490

MU support generate irq by write data to a register.
This patch make mu worked as msi controller.
So MU can do doorbell by using standard msi api.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/irqchip/Kconfig          |   7 +
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-imx-mu-msi.c | 462 +++++++++++++++++++++++++++++++
 3 files changed, 470 insertions(+)
 create mode 100644 drivers/irqchip/irq-imx-mu-msi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 5e4e50122777d..4599471d880c0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -470,6 +470,13 @@ config IMX_INTMUX
 	help
 	  Support for the i.MX INTMUX interrupt multiplexer.
 
+config IMX_MU_MSI
+	bool "i.MX MU work as MSI controller"
+	default y if ARCH_MXC
+	select IRQ_DOMAIN
+	help
+	  MU work as MSI controller to do general doorbell
+
 config LS1X_IRQ
 	bool "Loongson-1 Interrupt Controller"
 	depends on MACH_LOONGSON32
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 5d8e21d3dc6d8..870423746c783 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
+obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
 obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
 obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
new file mode 100644
index 0000000000000..8277dba857759
--- /dev/null
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * NXP MU worked as MSI controller
+ *
+ * Copyright (c) 2018 Pengutronix, Oleksij Rempel <o.rempel@pengutronix.de>
+ * Copyright 2022 NXP
+ *	Frank Li <Frank.Li@nxp.com>
+ *	Peng Fan <peng.fan@nxp.com>
+ *
+ * Based on drivers/mailbox/imx-mailbox.c
+ */
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of_irq.h>
+#include <linux/of_pci.h>
+#include <linux/of_platform.h>
+#include <linux/spinlock.h>
+#include <linux/dma-iommu.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+
+
+#define IMX_MU_CHANS            4
+
+enum imx_mu_xcr {
+	IMX_MU_GIER,
+	IMX_MU_GCR,
+	IMX_MU_TCR,
+	IMX_MU_RCR,
+	IMX_MU_xCR_MAX,
+};
+
+enum imx_mu_xsr {
+	IMX_MU_SR,
+	IMX_MU_GSR,
+	IMX_MU_TSR,
+	IMX_MU_RSR,
+};
+
+enum imx_mu_type {
+	IMX_MU_V1 = BIT(0),
+	IMX_MU_V2 = BIT(1),
+	IMX_MU_V2_S4 = BIT(15),
+};
+
+/* Receive Interrupt Enable */
+#define IMX_MU_xCR_RIEn(type, x) (type & IMX_MU_V2 ? BIT(x) : BIT(24 + (3 - (x))))
+#define IMX_MU_xSR_RFn(type, x) (type & IMX_MU_V2 ? BIT(x) : BIT(24 + (3 - (x))))
+
+struct imx_mu_dcfg {
+	enum imx_mu_type type;
+	u32     xTR;            /* Transmit Register0 */
+	u32     xRR;            /* Receive Register0 */
+	u32     xSR[4];         /* Status Registers */
+	u32     xCR[4];         /* Control Registers */
+};
+
+struct imx_mu_msi {
+	spinlock_t			lock;
+	struct platform_device		*pdev;
+	struct irq_domain		*parent;
+	struct irq_domain		*msi_domain;
+	void __iomem			*regs;
+	phys_addr_t			msiir_addr;
+	const struct imx_mu_dcfg	*cfg;
+	unsigned long			used;
+	u32				gic_irq;
+	struct clk			*clk;
+	struct device			*pd_a;
+	struct device			*pd_b;
+	struct device_link		*pd_link_a;
+	struct device_link		*pd_link_b;
+};
+
+static void imx_mu_write(struct imx_mu_msi *msi_data, u32 val, u32 offs)
+{
+	iowrite32(val, msi_data->regs + offs);
+}
+
+static u32 imx_mu_read(struct imx_mu_msi *msi_data, u32 offs)
+{
+	return ioread32(msi_data->regs + offs);
+}
+
+static u32 imx_mu_xcr_rmw(struct imx_mu_msi *msi_data, enum imx_mu_xcr type, u32 set, u32 clr)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&msi_data->lock, flags);
+	val = imx_mu_read(msi_data, msi_data->cfg->xCR[type]);
+	val &= ~clr;
+	val |= set;
+	imx_mu_write(msi_data, val, msi_data->cfg->xCR[type]);
+	spin_unlock_irqrestore(&msi_data->lock, flags);
+
+	return val;
+}
+
+static void imx_mu_msi_mask_irq(struct irq_data *data)
+{
+	struct imx_mu_msi *msi_data = irq_data_get_irq_chip_data(data->parent_data);
+
+	imx_mu_xcr_rmw(msi_data, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(msi_data->cfg->type, data->hwirq));
+}
+
+static void imx_mu_msi_unmask_irq(struct irq_data *data)
+{
+	struct imx_mu_msi *msi_data = irq_data_get_irq_chip_data(data->parent_data);
+
+	imx_mu_xcr_rmw(msi_data, IMX_MU_RCR, IMX_MU_xCR_RIEn(msi_data->cfg->type, data->hwirq), 0);
+}
+
+static struct irq_chip imx_mu_msi_irq_chip = {
+	.name = "MU-MSI",
+	.irq_mask       = imx_mu_msi_mask_irq,
+	.irq_unmask     = imx_mu_msi_unmask_irq,
+};
+
+static struct msi_domain_ops its_pmsi_ops = {
+};
+
+static struct msi_domain_info imx_mu_msi_domain_info = {
+	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS |
+		   MSI_FLAG_USE_DEF_CHIP_OPS |
+		   MSI_FLAG_PCI_MSIX),
+	.ops	= &its_pmsi_ops,
+	.chip	= &imx_mu_msi_irq_chip,
+};
+
+static void imx_mu_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
+{
+	struct imx_mu_msi *msi_data = irq_data_get_irq_chip_data(data);
+
+	msg->address_hi = upper_32_bits(msi_data->msiir_addr);
+	msg->address_lo = lower_32_bits(msi_data->msiir_addr + 4 * data->hwirq);
+	msg->data = data->hwirq;
+
+	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), msg);
+}
+
+static int imx_mu_msi_set_affinity(struct irq_data *irq_data,
+				   const struct cpumask *mask, bool force)
+
+{
+	return IRQ_SET_MASK_OK;
+}
+
+static struct irq_chip imx_mu_msi_parent_chip = {
+	.name			= "MU",
+	.irq_compose_msi_msg	= imx_mu_msi_compose_msg,
+	.irq_set_affinity = imx_mu_msi_set_affinity,
+};
+
+static int imx_mu_msi_domain_irq_alloc(struct irq_domain *domain,
+					unsigned int virq,
+					unsigned int nr_irqs,
+					void *args)
+{
+	struct imx_mu_msi *msi_data = domain->host_data;
+	msi_alloc_info_t *info = args;
+	int pos, err = 0;
+
+	WARN_ON(nr_irqs != 1);
+
+	spin_lock(&msi_data->lock);
+	pos = find_first_zero_bit(&msi_data->used, IMX_MU_CHANS);
+	if (pos < IMX_MU_CHANS)
+		__set_bit(pos, &msi_data->used);
+	else
+		err = -ENOSPC;
+	spin_unlock(&msi_data->lock);
+
+	if (err)
+		return err;
+
+	err = iommu_dma_prepare_msi(info->desc, msi_data->msiir_addr + pos * 4);
+	if (err)
+		return err;
+
+	irq_domain_set_info(domain, virq, pos,
+			    &imx_mu_msi_parent_chip, msi_data,
+			    handle_simple_irq, NULL, NULL);
+	return 0;
+}
+
+static void imx_mu_msi_domain_irq_free(struct irq_domain *domain,
+				       unsigned int virq, unsigned int nr_irqs)
+{
+	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+	struct imx_mu_msi *msi_data = irq_data_get_irq_chip_data(d);
+
+	spin_lock(&msi_data->lock);
+	__clear_bit(d->hwirq, &msi_data->used);
+	spin_unlock(&msi_data->lock);
+}
+
+static const struct irq_domain_ops imx_mu_msi_domain_ops = {
+	.alloc	= imx_mu_msi_domain_irq_alloc,
+	.free	= imx_mu_msi_domain_irq_free,
+};
+
+static void imx_mu_msi_irq_handler(struct irq_desc *desc)
+{
+	struct imx_mu_msi *msi_data = irq_desc_get_handler_data(desc);
+	u32 status;
+	int i;
+
+	status = imx_mu_read(msi_data, msi_data->cfg->xSR[IMX_MU_RSR]);
+
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
+	for (i = 0; i < IMX_MU_CHANS; i++) {
+		if (status & IMX_MU_xSR_RFn(msi_data->cfg->type, i)) {
+			imx_mu_read(msi_data, msi_data->cfg->xRR + i * 4);
+			generic_handle_domain_irq(msi_data->parent, i);
+		}
+	}
+	chained_irq_exit(irq_desc_get_chip(desc), desc);
+}
+
+static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data)
+{
+	/* Initialize MSI domain parent */
+	msi_data->parent = irq_domain_add_linear(dev_of_node(&msi_data->pdev->dev),
+						 IMX_MU_CHANS,
+						 &imx_mu_msi_domain_ops,
+						 msi_data);
+	if (!msi_data->parent) {
+		dev_err(&msi_data->pdev->dev, "failed to create IRQ domain\n");
+		return -ENOMEM;
+	}
+
+	msi_data->msi_domain = platform_msi_create_irq_domain(
+				of_node_to_fwnode(msi_data->pdev->dev.of_node),
+				&imx_mu_msi_domain_info,
+				msi_data->parent);
+
+	if (!msi_data->msi_domain) {
+		dev_err(&msi_data->pdev->dev, "failed to create MSI domain\n");
+		irq_domain_remove(msi_data->parent);
+		return -ENOMEM;
+	}
+
+	irq_domain_set_pm_device(msi_data->parent, &msi_data->pdev->dev);
+
+	return 0;
+}
+
+/* Register offset of different version MU IP */
+static const struct imx_mu_dcfg imx_mu_cfg_imx6sx = {
+	.xTR    = 0x0,
+	.xRR    = 0x10,
+	.xSR    = {0x20, 0x20, 0x20, 0x20},
+	.xCR    = {0x24, 0x24, 0x24, 0x24},
+};
+
+static const struct imx_mu_dcfg imx_mu_cfg_imx7ulp = {
+	.xTR    = 0x20,
+	.xRR    = 0x40,
+	.xSR    = {0x60, 0x60, 0x60, 0x60},
+	.xCR    = {0x64, 0x64, 0x64, 0x64},
+};
+
+static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp = {
+	.type   = IMX_MU_V2,
+	.xTR    = 0x200,
+	.xRR    = 0x280,
+	.xSR    = {0xC, 0x118, 0x124, 0x12C},
+	.xCR    = {0x110, 0x114, 0x120, 0x128},
+};
+
+static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp_s4 = {
+
+	.type   = IMX_MU_V2 | IMX_MU_V2_S4,
+	.xTR    = 0x200,
+	.xRR    = 0x280,
+	.xSR    = {0xC, 0x118, 0x124, 0x12C},
+	.xCR    = {0x110, 0x114, 0x120, 0x128},
+};
+
+static int __init imx_mu_of_init(struct device_node *dn,
+				 struct device_node *parent,
+				 const struct imx_mu_dcfg *cfg)
+{
+	struct platform_device *pdev = of_find_device_by_node(dn);
+	struct imx_mu_msi *msi_data, *priv;
+	struct resource *res;
+	struct device *dev;
+	int ret;
+
+	if (!pdev)
+		return -ENODEV;
+
+	dev = &pdev->dev;
+
+	priv = msi_data = devm_kzalloc(&pdev->dev, sizeof(*msi_data), GFP_KERNEL);
+	if (!msi_data)
+		return -ENOMEM;
+
+	msi_data->cfg = cfg;
+
+	msi_data->regs = devm_platform_ioremap_resource_byname(pdev, "a");
+	if (IS_ERR(msi_data->regs)) {
+		dev_err(&pdev->dev, "failed to initialize 'regs'\n");
+		return PTR_ERR(msi_data->regs);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "b");
+	if (!res)
+		return -EIO;
+
+	msi_data->msiir_addr = res->start + msi_data->cfg->xTR;
+
+	msi_data->pdev = pdev;
+
+	msi_data->gic_irq = platform_get_irq(msi_data->pdev, 0);
+	if (msi_data->gic_irq <= 0)
+		return -ENODEV;
+
+	platform_set_drvdata(pdev, msi_data);
+
+	msi_data->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(msi_data->clk)) {
+		if (PTR_ERR(msi_data->clk) != -ENOENT)
+			return PTR_ERR(msi_data->clk);
+
+		msi_data->clk = NULL;
+	}
+
+	ret = clk_prepare_enable(msi_data->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	priv->pd_a = dev_pm_domain_attach_by_name(dev, "a");
+	if (IS_ERR(priv->pd_a))
+		return PTR_ERR(priv->pd_a);
+
+	priv->pd_link_a = device_link_add(dev, priv->pd_a,
+			DL_FLAG_STATELESS |
+			DL_FLAG_PM_RUNTIME |
+			DL_FLAG_RPM_ACTIVE);
+
+	if (!priv->pd_link_a) {
+		dev_err(dev, "Failed to add device_link to mu a.\n");
+		return -EINVAL;
+	}
+
+	priv->pd_b = dev_pm_domain_attach_by_name(dev, "b");
+	if (IS_ERR(priv->pd_b))
+		return PTR_ERR(priv->pd_b);
+
+	priv->pd_link_b = device_link_add(dev, priv->pd_b,
+			DL_FLAG_STATELESS |
+			DL_FLAG_PM_RUNTIME |
+			DL_FLAG_RPM_ACTIVE);
+
+	if (!priv->pd_link_b) {
+		dev_err(dev, "Failed to add device_link to mu a.\n");
+		return -EINVAL;
+	}
+
+	ret = imx_mu_msi_domains_init(msi_data);
+	if (ret)
+		return ret;
+
+	irq_set_chained_handler_and_data(msi_data->gic_irq,
+					 imx_mu_msi_irq_handler,
+					 msi_data);
+
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		goto disable_runtime_pm;
+	}
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0)
+		goto disable_runtime_pm;
+
+	clk_disable_unprepare(msi_data->clk);
+
+	return 0;
+
+disable_runtime_pm:
+	pm_runtime_disable(dev);
+	clk_disable_unprepare(msi_data->clk);
+
+	return ret;
+}
+
+static int __maybe_unused imx_mu_runtime_suspend(struct device *dev)
+{
+	struct imx_mu_msi *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static int __maybe_unused imx_mu_runtime_resume(struct device *dev)
+{
+	struct imx_mu_msi *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		dev_err(dev, "failed to enable clock\n");
+
+	return ret;
+}
+
+static const struct dev_pm_ops imx_mu_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx_mu_runtime_suspend,
+			   imx_mu_runtime_resume, NULL)
+};
+
+static int __init imx_mu_imx7ulp_of_init(struct device_node *dn,
+					 struct device_node *parent)
+{
+	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx7ulp);
+}
+
+static int __init imx_mu_imx6sx_of_init(struct device_node *dn,
+					struct device_node *parent)
+{
+	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx6sx);
+}
+
+static int __init imx_mu_imx8ulp_of_init(struct device_node *dn,
+					 struct device_node *parent)
+{
+	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx8ulp);
+}
+
+static int __init imx_mu_imx8ulp_s4_of_init(struct device_node *dn,
+					    struct device_node *parent)
+{
+	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx8ulp_s4);
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
+IRQCHIP_MATCH("fsl,imx7ulp-mu-msi", imx_mu_imx7ulp_of_init)
+IRQCHIP_MATCH("fsl,imx6sx-mu-msi", imx_mu_imx6sx_of_init)
+IRQCHIP_MATCH("fsl,imx8ulp-mu-msi", imx_mu_imx8ulp_of_init)
+IRQCHIP_MATCH("fsl,imx8ulp-mu-msi-s4", imx_mu_imx8ulp_s4_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
+
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("Freescale MU work as MSI controller driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1


