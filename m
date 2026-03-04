Return-Path: <ntb+bounces-2004-lists+linux-ntb=lfdr.de@lists.linux.dev>
Delivered-To: lists+linux-ntb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHacAFfxp2mGmgAAu9opvQ
	(envelope-from <ntb+bounces-2004-lists+linux-ntb=lfdr.de@lists.linux.dev>)
	for <lists+linux-ntb@lfdr.de>; Wed, 04 Mar 2026 09:46:15 +0100
X-Original-To: lists+linux-ntb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7801FCD11
	for <lists+linux-ntb@lfdr.de>; Wed, 04 Mar 2026 09:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C573025D0E
	for <lists+linux-ntb@lfdr.de>; Wed,  4 Mar 2026 08:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4943B3909A8;
	Wed,  4 Mar 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="BD6Of9uc"
X-Original-To: ntb@lists.linux.dev
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020094.outbound.protection.outlook.com [52.101.229.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D0370D7D
	for <ntb@lists.linux.dev>; Wed,  4 Mar 2026 08:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613808; cv=fail; b=IEeHLFr+qx/ozPf+VWMPO0g00gI5Q6ZwtGax4npahvLzQ3LDb/QkZHosW5kDfFAyoLxewolRgFroimNT4kLgx7DXYlr8Gjco0Ihafxad+sjwLVudoIpxzF/+fGYHT50OZTx32j6P+kvaNJgjg27cbRAgpzoKuFeufTi9Arqco7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613808; c=relaxed/simple;
	bh=e7pPooZcJxxdIjhkHuxwkzF8hYv5cuuFKAeiJtBVMk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JN9QiqQxevmy75VnaGvVHLYfCgNbiUP458tJ8MmOcuZJoqnm/OGHNjCu4pfwTBpv6S1P+lOPgjo2pUi3prwif4IO/O0YcaYQVAPLN5qw5qa0XzLd1aXRiYcYqOkVElg0eSgrlbOMsxc2i60JIgbSFxdCJgemJE9GwMfXwEaddOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=BD6Of9uc; arc=fail smtp.client-ip=52.101.229.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekp2ylEgMuGM7UPzK2MXZZ9dHx56p8EYq79N4L0isuAnOaLYhxm3gcR7+Ip1VDzLejTfrTA3lxC/lraUPy5z6a7ztfwi3TPWhN/LUpaPtb2ZgWQdDCfCotrOB29euyCvG5EhMmnTpTLzmKN6epqsXnXV/AOoI3C6K+pxS1qAVXbJO85AO65nN28gytz7VTvb2Xty05/ZazWOHic5HslK9WC1X3c5yBtJaUhCx1ut9VXz2Kb/MyjJSgyInSx11q+rHw/CbkbQ1sHaUiJVO6Ip49yw0TOhvm3vchLj2PKYpFpVIK4hmNYBt6MxYB+yrcEJq0XgRAXKflebV3gaZDsd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNekAv816yYDMT7i9bekagUFqcaBUn+838KUF/9yOgY=;
 b=pb6kMYLbMRmAzaKnNbiNKx62mw3d7OgvGJ4boGFhorSvsteMSpyNqc4sIKQRsi2gi4F0HD1ti7ynDU600hibn64zlag+c6PVW3oxffCNOJ4fZiBnB6WGQyIJCAcKcQcB0/RtL19kMie86SGuJ2UxlgSvkkMf3W9laQlo6RHSo32m1XnTJhTsliOPeq5OkfW+kwCrdd6qEN6VVrAz2IbnJCwMKbX56C/XSBq7owv6h30MSlDyBA33us7gC03ki0vu8rhvzu4luKAbdTze5VMASA20xRAkGxsqWicw4lAcbDgF527qxEb5jTR0n314l16hWQXwhUC3J6Y/HKA58hWtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNekAv816yYDMT7i9bekagUFqcaBUn+838KUF/9yOgY=;
 b=BD6Of9ucm49oeT+MDrCADpylZO1W3i8EDAuKGcTzbrMYB83H1XwWWYdXYfi622Iv0o9PLC/ZkAMsFiaNkx3DIp+Lcd6t768SHVVdrvYUvzefQZhB0YrlQrckYY/7oQUNCP06hjxOfGGzhEMXs60ktgTWoCaWdVmSI8y0B0sZ58Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2649.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:24c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:43:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:43:24 +0000
Date: Wed, 4 Mar 2026 17:43:23 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, Jon Mason <jdmason@kudzu.us>, 
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, kwilczynski@kernel.org, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ye Bin <yebin10@huawei.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pci@vger.kernel.org, ntb@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/5] PCI: endpoint: pci-epf-*ntb: Harden vNTB
 resource management
Message-ID: <wn6dgo3px5vuywv4nfzafysmwic5su3aahk2dzwspbmcewdvr2@rtvrdgbwiax5>
References: <20260226084142.2226875-1-den@valinux.co.jp>
 <177260647178.9422.9047695520369841203.b4-ty@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177260647178.9422.9047695520369841203.b4-ty@kernel.org>
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2649:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f2703e-2400-48ad-6fd1-08de79ca18d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	xLbiH2NbDzjt1HH3lq5Np6qaG8mNIVso7W+KN4EHQrLX6Kve/I6aEhPUvAsYmlXGasTEN7lGvhTqMBU1xfY8MVj7I8E1WHlVPJboA2lDLegYvjS7urvkr5tPXpYAaSpZMuww2ES3ZkdrZ3QrJWfJPwW5MI+UsrMFqbOriU81QrpcRtub6ul0wXOi5/2fq90t4zHf8RBLpErGmVPgma1aGRO7uQ4uQg/QXLBLgo1tOlC/hWZdy5ZymHYtdr+iMfW6N+kqNO/68ibO+jkBj10GmWipgnL5aIkLiqpeb4HKOpGbWdsQQ/ohHe4Esf0tw+Z1Uja9hm4uH1uoDeM61zmdjb9lCN33hzEhZe2NzajwnA5hgaxgUcW3HKwLNnLc8rqmYlEu2k1S7KtBfjbkv5vCe/lDZLwlu+HSP708dRhZb43v0RvMlIt9Vce8O70EQaxz9VwNW76mF5tzYID0lG/Y5lwgxGF76aQvGYWtkiDPggLZc+fDp/J/h6TZk5VFMmfuIdOu4luRRP1YvUpWAVxAt2RvyaIK5+gQTeS+QRJ3d+GBmQxn1975lv78BpteplfO54BJabUIyUnWCaxtlcNzR9SI2RoMlDjm3JbM8+BpP7S5ZAnJMDlREIAXmXgrttbY0Zb5XR7RfKBcUJ/Rcb6/L7ucm6pCdLDtnPwnjb2FEt6pZHLSlwnhtkpLprg7yhUtcB3YuMSs6PSOBeDaQbHxYVXkm6UO4fLJ3upiT6fq6XA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1su/jMyRaeCLihh7n1uG49RZq9MiCiq9NxR6RM3cOYc6tDQEz/2Z8ap03+Sg?=
 =?us-ascii?Q?w+L9/6klnyMsi+TBELOm0p1Cje/EO7CIEHjx39WrfsIaAU+1KnHLOp0ocxvL?=
 =?us-ascii?Q?xwePzgKIcdeyU0r9I83jmZ2KyhCK0hU5aAjqcoL7M8OimYUQVoXTaaIUNlep?=
 =?us-ascii?Q?UKgmJDrbjnhH4ewGvAV6YrItMPNofGQdez+/3aHS/hUnaIaOpq28UMt90cJ4?=
 =?us-ascii?Q?7elvGVgNafIKSn7hTKjB8OvklkF8WjDbG5Fu9q9E9xb9FASeUfZ71qcCtVAj?=
 =?us-ascii?Q?XsF4rIaRN1rndMtVd7Y69lMK+kiNo7HocjNc2KX9F4gBF/L6UjBjKKyNBVSv?=
 =?us-ascii?Q?2a3kc+YHAnElb8KY+oUJUqK5pQrTwqjlj3ShHs/HP6pfLkTtjYBMo+e6PlS+?=
 =?us-ascii?Q?4I3fdkDzX+d25ODkaI2+oFsKe2XuFPV4V2jR1g+PVE9ynnBmVxTFVlLdTCGd?=
 =?us-ascii?Q?8xihjPP1brSNtzMM8mA7oJIAGHmol/SujNVnArxnMPPGigLGlr81dpH9pryC?=
 =?us-ascii?Q?Vwp317twbdmAzNudIQcAnPwsV72tJTpG9pZxYSvyCm8MYgh5IggrmOugnXWN?=
 =?us-ascii?Q?004QiOQWLN1Nc8sPDodgeuJGxfGW3LcC1yhoU5t5T6DnUeKjmPKnajim63ca?=
 =?us-ascii?Q?xBz7dxNEaHmM5KOI4lD1GELqTMX/EmkbmWTgTobAKfnQWK1IB0yszzFnbTNw?=
 =?us-ascii?Q?RLffT3akUeDqICCwNbYhrPFnw1ihZD3D+aMldXfKKiCHMnIC2bSxkIYhnIWC?=
 =?us-ascii?Q?RSN9DbBoyarFWUmElYHVZNeQtawen8L2KdSAKW5H/9/yAz8qDQAOjC7pDn5O?=
 =?us-ascii?Q?sB591E3NG2L9sXkrksLm/9cHc2PAB6u4Omj1KLWjs8W2Wxrphq7ddR/TPScO?=
 =?us-ascii?Q?kldSnrjyIyHXamO+4LALJ0PA2GFCTbqyW7xiKHTzqUfVGyAqX+JuP0vWjcf3?=
 =?us-ascii?Q?ZUlq7kkllfctJnclRdgUMiVbY2TF39br34h2f3NHQ+jacy5/W43Vrqxpb8kp?=
 =?us-ascii?Q?HZUFL3tPi0kWcP4rwgQlnJ3F7FK8CcGNzpNkA99qfiGQGG7q5Zk/+eO+4zxf?=
 =?us-ascii?Q?rnbSeQ+curKm/49et7IwEAsuQYiNuasLqf1JG3XuILHae8eFWTCiahqN2+he?=
 =?us-ascii?Q?tsikghJV6QlB8Ku0DC+5LoFLU38dQZEGR0B45RDHWKDQ/yrr40iZa63KIMkl?=
 =?us-ascii?Q?yPpTLfAe7dMUvd5qQg8XoT+7GEAZv2vb3OQHGloH1nVQJ/5ErRWKD+dGLymT?=
 =?us-ascii?Q?NupEt3FXhrvpUithNtM3cO+zqKrkQ3WmMcvCZyv+jfJwGAgZ2/lRiwBBpDKc?=
 =?us-ascii?Q?YkM3Hnqykyk00fOvOriww1c3ES6V77/NtwgvjcZQ0XcozCnTLaLCzojeJUkA?=
 =?us-ascii?Q?QNtRST10deiMkecsWkblyq1wibMYRqECKoTqfXsf2oHECSHg740X24AujYVC?=
 =?us-ascii?Q?gKfOpH2CjyclYGJqvTXvKJ1sJy210CzO/xFzR1Bpo3LQU0CVHG/A+St9pKqd?=
 =?us-ascii?Q?WnBIcbsMBOU4hVUxB70A2VldVT2Vhth58pf9E+NRM6vR9c0DyokTANP47ZcK?=
 =?us-ascii?Q?I1kEGU9z1qaMAlKA8/YxMQFgtkZESqUqsJDpWMyi21kBwwHqFSW3mEooy3Y/?=
 =?us-ascii?Q?6n4Y6XqDIpbEpzN5/SdXoP0TOV1Wdtvdc+rsSV2K0ZAfqnuPEsVMtmwv9p0C?=
 =?us-ascii?Q?ujXG/Ct8fYibclTm4XwpHi3DkxCvKfZI175t1C+5NYioVw85crd4XQMdwZjB?=
 =?us-ascii?Q?tuPJeeely6/TJaFcPUlaPZjMoaa5icPHD0WK194TqQmguiHjuEXd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f2703e-2400-48ad-6fd1-08de79ca18d6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:43:24.1157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgIn3OmaR4xHBV7qvNDwOXBrM6jWchANi2/c2/Q5KNbgQ4ZtirYr0k8oZW41+xtJiSzltIt7YnwlyKuF0TiFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2649
X-Rspamd-Queue-Id: 5C7801FCD11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2004-lists,linux-ntb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[nxp.com,kudzu.us,intel.com,gmail.com,kernel.org,google.com,glider.be,huawei.com,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,ntb@lists.linux.dev];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ntb,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,valinux.co.jp:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:11:11PM +0530, Manivannan Sadhasivam wrote:
> 
> On Thu, 26 Feb 2026 17:41:37 +0900, Koichiro Den wrote:
> > The vNTB endpoint function (pci-epf-vntb) can be configured and
> > reconfigured through configfs (link/unlink functions, start/stop the
> > controller, update parameters). In practice, several pitfalls present:
> > duplicate EPC teardown that leads to oopses, a work item running after
> > resources were torn down, and inability to re-link/restart fundamentally
> > because ntb_dev was embedded and the vPCI bus teardown was incomplete.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] PCI: endpoint: pci-epf-vntb: Remove duplicate resource teardown
>       commit: 0da63230d3ec1ec5fcc443a2314233e95bfece54
> [2/5] PCI: endpoint: pci-epf-ntb: Remove duplicate resource teardown
>       commit: 3446beddba450c8d6f9aca2f028712ac527fead3
> [3/5] PCI: endpoint: pci-epf-vntb: Stop cmd_handler work in epf_ntb_epc_cleanup
>       commit: d799984233a50abd2667a7d17a9a710a3f10ebe2

Thanks for taking the subset, Mani.

I'll prepare the remaining patches as a separate series after taking another
careful look.

Best regards,
Koichiro

> 
> Best regards,
> -- 
> Manivannan Sadhasivam <mani@kernel.org>
> 

