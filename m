Return-Path: <ntb+bounces-195-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B601D5A82EE
	for <lists+linux-ntb@lfdr.de>; Wed, 31 Aug 2022 18:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21881C20993
	for <lists+linux-ntb@lfdr.de>; Wed, 31 Aug 2022 16:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99E74A19;
	Wed, 31 Aug 2022 16:19:24 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD2B4A0D
	for <ntb@lists.linux.dev>; Wed, 31 Aug 2022 16:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m74tN8O5D5vmZSnCg1EZ++vzWX1ELpDXRYgx162p5iubdIpZcWkILaP9c90savFGlfsHyq24IYMfG6zZdXp9neXmFXsBz7kOOYWGhX3NJwhvIebNjJ3nVf9IF/tSK4Soe8HiSwPZn0yhC41WRpme9S1y9cQAS0zkvxT29SzMSHQO9SDY4XlDmSyJqwkBGLg9nVLlhKsr5LRyOs4Mq+f0j/n+/x9eZ26zyiVAavr7gjSfiC511sSPavTwRrVmLRpRO/E75clI0G+rvXshylbjqG9+RvBvgW7obGz2V8tU1kYk+ul/tD9jTsdl6AsR9ZhNjghHhg+TvOfzhAzSOXZHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOrum+Fts3ecuREtcgfY5QxahZlyAfq9ePiBgzbgH/k=;
 b=UClyKbb74k7yWtxUrTk9d1msEHnoIrj5y+XlixfgPWAo9CNpeAOh2ktAyUQXn1JAvpMZv+3ca+TvlWJFFkmrKO0awklCwhyAxh+QKfJnf/ioLZhfRgAA73gDgfyjBrG2E0Mx1LfWp60b2cLahMi2uAAWk0DJxNvau+aC8EMQuty55SMu3b7piRIgJRVDGwpkOCFGSEYJhKSYIw6G4GyBf3Crrye/lFm7C+qvULskheFaldYYRfxJ89UvEoevE8FskV3HZWfyxkV9DkTaWLa5vYl3gUr7BP1pKz3IzWmVtAA0Qk2o6Ij10noUfTvudMevSm1sBNgEkUVE6EYE6v+dqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOrum+Fts3ecuREtcgfY5QxahZlyAfq9ePiBgzbgH/k=;
 b=ZlPOvwHFaf8QHnH5sHuDJ1PP7fjQ9M7+k83o2hRSJ6OrZZfPK7r2tbuQBnIPdgHQDHYh3LOO72LBMx2SvFxivYcmMuzjF3480Nl+kqsh1wnWVuQxLjHlfoHYGUwJUFAp/2cEEKaRp2T/yLRv87d2OPKlWavSl/JX0yW0Ur6syUE=
Received: from AM9PR04MB8793.eurprd04.prod.outlook.com (2603:10a6:20b:408::22)
 by DU2PR04MB8775.eurprd04.prod.outlook.com (2603:10a6:10:2e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 16:19:17 +0000
Received: from AM9PR04MB8793.eurprd04.prod.outlook.com
 ([fe80::1c3e:36a0:1adc:beb]) by AM9PR04MB8793.eurprd04.prod.outlook.com
 ([fe80::1c3e:36a0:1adc:beb%8]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 16:19:17 +0000
From: Frank Li <frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "maz@kernel.org" <maz@kernel.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kw@linux.com" <kw@linux.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "kishon@ti.com"
	<kishon@ti.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	"ntb@lists.linux.dev" <ntb@lists.linux.dev>, "lznuaa@gmail.com"
	<lznuaa@gmail.com>
Subject: RE: [EXT] Re: [PATCH v6 4/4] pcie: endpoint: pci-epf-vntb: add
 endpoint MSI support
Thread-Topic: [EXT] Re: [PATCH v6 4/4] pcie: endpoint: pci-epf-vntb: add
 endpoint MSI support
Thread-Index: AQHYsxTj8ial5WQflUOYb2uoUuXnWa3I5nOAgABYdCA=
Date: Wed, 31 Aug 2022 16:19:17 +0000
Message-ID:
 <AM9PR04MB8793BEEC8B2F1713C252B4CA88789@AM9PR04MB8793.eurprd04.prod.outlook.com>
References: <20220818151127.2449064-1-Frank.Li@nxp.com>
 <20220818151127.2449064-5-Frank.Li@nxp.com> <20220831104203.GD5076@thinkpad>
In-Reply-To: <20220831104203.GD5076@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f04bfd1a-3eee-4204-ddc7-08da8b6c8d6f
x-ms-traffictypediagnostic: DU2PR04MB8775:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BIQInsjioObbyDgw+WKHdrXPMimbJSnrpZ8MjlKmoUMOI7WraSl1M6yjzbiW2NVTCqUFWm7mzB60xWdkwjDLdGsMZNBzftXzvkJGv4mqkOo0kM+BnGVjnnYw/tLmPbOyUhPPvkRaF8Zwp3x/d59flWckC/sJS6p6n0Yf3MCs765sLYoNZXnNwjLY4qFZlLn4lDzUJrNKfPqBjcdbU7Ee8ljFxLxWgiQlo29ED6vgCq4xH43auSkS3kL4IA5ZRyqP6oUJ2rwWpmBKsGmFhuwDQwyCnwLwRkFPLafhMlHMqfz25dNyzsrDs6jPZq/CWsh40ULVXiz0n9GRIySxr5IRTEL+3w+xaxN8A5AuaeDrzBV1uMt59kPGcRHy9967PuioZJx/JsE03A7Uu1J3Ib4nBsOH8KsC+h3o+PR9dSj563VO1ykv38mGd22ijwHUk2bABRci7CBwdm8eXynIrUj4tOIuB6zVrmXPUao48zpCc67K8uKmdrly9nmHBeewqiwER+P4yf1WjpOpsb3UdaTXr786ibLfD6JztO36PABKSk0bOmQ8kDHzevLqujuANdxYygxt79bpxELnsauVmYp12bMRIeyOkEES0nRetjTnF8ZKbsxEX8wgVYHN5Rx5C8WQ9fXO0aH1TbxRkZTIUS559rpUdFaBa8sia/teM4x0R/aaQXjGdcbMMeLP7nQB8Cp8Qjsx3rArEuMPoIQxokqoRYsxQ+oDbATrBhLt2F72JCAk4Y1kv4VX0FAO+YHcNRpVSQ5qQXfpaZubjfX3Ti11HQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8793.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(8676002)(122000001)(4326008)(30864003)(66476007)(66446008)(66556008)(64756008)(44832011)(186003)(76116006)(7416002)(5660300002)(53546011)(6506007)(55236004)(316002)(41300700001)(38100700002)(66946007)(7696005)(9686003)(26005)(86362001)(478600001)(2906002)(54906003)(6916009)(55016003)(8936002)(33656002)(83380400001)(52536014)(71200400001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V01oVW44UmdOdVdNUkdBeFRMcngvRVEvWGVGZzY2RGpTMHYxNmlYckFPcFpL?=
 =?utf-8?B?VHcvY1o3WHlHc09RcXNPNTNKcTkycmNwK205bHBPNmIwUm9GQnFMUWx6a0VE?=
 =?utf-8?B?VXZFaDQ0N2REQUxidFlYd21EcDlWM1RiaHhQWlFDV3lhTWN5ejUzSTJOSktn?=
 =?utf-8?B?cUlsc0NSczRlSzhIYzhRM2lNNnc5SEdxREhSOC9NUDBDM0NZRTlBU0VLS1Ns?=
 =?utf-8?B?ZW5vdHdjOEo3c05NQ2psRlBybGtBNFk4WGZVRzFlNnp3dC8yK1FrQWNndFBS?=
 =?utf-8?B?N2tBQTE4b291Uk0wYUFzc3Zub0lIeWZ0dzNkSXhGSWtQYUpyak91WVRTcm5L?=
 =?utf-8?B?SkMwTVorcE51WS84TndYQmtuc0FjY2tBelRmRGpoM2xDUi9pYnF3c1ZrM1BO?=
 =?utf-8?B?RkVCaFA3QU4xRHRNdDB0bXEvUjRhTEQwRUdwejNxU3daS05xcW11ZzlyWjFs?=
 =?utf-8?B?cGZNYnZxcmJyeklRa21xcXVISXZYQW9GdTMyV0FhUlU3eFRjKzdlaTZhRXlv?=
 =?utf-8?B?RW1ORi84RlZIdWNGa0RONHh5cXdNNGJpM0J3Ty9OWjFJRk8yOHN3dVAyQnZi?=
 =?utf-8?B?UzBCQVRaWC9aSGgyaUpWWXpQczh4eWF5VWJHamh5QzI5VXRCL3hibnY5cXhv?=
 =?utf-8?B?SnZReVZtRUdEUW1reFY4S05WaE1QNjhjTzRVcGFSNWVqcE9HTXZXWURmdGNG?=
 =?utf-8?B?MW02bmZnbks1R3NMK2FCK25Wc25JWWdwM2J4ZFhDbU9aMlh6dXEyT3B2bVJq?=
 =?utf-8?B?Q2tydEJoaWovV3owZzVaQkJlQlFiVVM4WjFTa3JKbm9ZcThVa1hlSnN4UUll?=
 =?utf-8?B?WG9raWwxR3FNUlc2bXBzL2Y5dUtabWJrL3NaaTV6bFo2WjFwL09aV2U4QkM0?=
 =?utf-8?B?T3VwOFM4WFBDeUQ5TUtqbXRhZDN5NTI4eHUxbzhnVEZHVDh0UHQrNFk5VVhS?=
 =?utf-8?B?VnVmS0t6TWNoSnVtZ3pNSC9YcDFzWmxoK25SaFRGVDdVampJdFE1QTF4cmpn?=
 =?utf-8?B?cDF2WGxYMTFQSEwxRERLWk5tYXhueHViY1FHWEpHK2NMamNaZE1lTWxuN21F?=
 =?utf-8?B?VnNUTGt2ZlMrRnQ2MGl3OEJvcGI3VDIzMlJMVmpnZ3dMbTZ5eU01aERxRmNy?=
 =?utf-8?B?WWswTE54SGt6cjlMRk5vamEyWXFDdWY5aHYzZmVPa29TbkdMT2JUTDBxcnoz?=
 =?utf-8?B?ZXBLdEFpajBOeDhyT29CZHNYT2NoSkpiK1lGeW9EdGFFNVc3aWFGN0l1Z2I5?=
 =?utf-8?B?dks3RkxOc0xCdXRlSjg1SWZ0QU5NNTJhYmoyRmwyTWRjWUcxcS8ySEhIaXJC?=
 =?utf-8?B?SXA4UndnSnJlWVkwb2xoSnJnQVFCM0J5b2R5U2JBZG9WUWdLbll2eWpEaE9x?=
 =?utf-8?B?dlgxd3VIZ1FTQW0rVm0xa1VDUUpqLzgyUmlBcS9oakZCeE5pQmVuL3VRN0lR?=
 =?utf-8?B?dW9nbjJTMHEreVowc3hPa3cvNVNSMDhpYVQwMXZINTFCOWMwRzV6SmtPYjFE?=
 =?utf-8?B?Rm1TbXhPWEZYQ1J0MzdWbU9jVU5xdGhZYmNiZVZERElyNDB5bnBpRnA0T1hh?=
 =?utf-8?B?Ly8yQVJkcWd4Rkx0dnBENXlHTFB3M2w3LzB2cTZ4QzJ4dU9vTE1SUFRVM1Q3?=
 =?utf-8?B?djVVVzZOdlZrTEdDc0IyVWx5VjhLRWd4WGNHSGdDQnR2NjhVRmFhczF6aUE1?=
 =?utf-8?B?ZTRmZ3F5Q212NDExSjJrNnB4V3VlOWE0ZUk3bFExRDY4RjNyV0tBQkkrOHRF?=
 =?utf-8?B?MUVQTEMxTVYxZWh4TWRSNXdsdFBpazhCUXdGMnNHd3YwY1FsRHgrUndEZUIw?=
 =?utf-8?B?by91UFdJOTUvZ2ZJdmRaenpHM290aW40blpzdVV0cnhvZXNqUWk1MUV6T1Ra?=
 =?utf-8?B?L2pHS2FFczdiSzZRcnplazhYbi9ZdDRyTkVrbXhYSjNLQnZENldXcE1QbnBj?=
 =?utf-8?B?ZjVoT1E5WUF6V25pNFF5WWZmbmhSMWQ2VnlETHc1T2c1NERZV01wSkVCSHFD?=
 =?utf-8?B?Z2hKK0VmcU94Sm1FUXQ3cVJ1MzUvM0xTYXIyUTluMVVRVlJHWnRWbU1hV29i?=
 =?utf-8?B?dVJoQ2lXRlhxSy95NXIrWVZqb05hRmVBVzB6QU9TSUlpRTdyc1hnc2VQWnF6?=
 =?utf-8?Q?o/j0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04bfd1a-3eee-4204-ddc7-08da8b6c8d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 16:19:17.1513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0+yUSiZJCLHsRNn179OJjBrsdCGIa2gTZN3gnFr1usxW5xLsL0EkozpaWpKGBJJbObkHDChovWxqIwn7LPBYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8775

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVz
ZGF5LCBBdWd1c3QgMzEsIDIwMjIgNTo0MiBBTQ0KPiBUbzogRnJhbmsgTGkgPGZyYW5rLmxpQG54
cC5jb20+DQo+IENjOiBtYXpAa2VybmVsLm9yZzsgdGdseEBsaW51dHJvbml4LmRlOyByb2JoK2R0
QGtlcm5lbC5vcmc7DQo+IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgc2hhd25n
dW9Aa2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsga3dAbGludXguY29tOyBi
aGVsZ2Fhc0Bnb29nbGUuY29tOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IFBlbmcgRmFuDQo+IDxwZW5nLmZh
bkBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47DQo+IGpkbWFz
b25Aa3VkenUudXM7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBk
bC1saW51eC0NCj4gaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IGtpc2hvbkB0aS5jb207IGxvcmVu
em8ucGllcmFsaXNpQGFybS5jb207DQo+IG50YkBsaXN0cy5saW51eC5kZXY7IGx6bnVhYUBnbWFp
bC5jb20NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2NiA0LzRdIHBjaWU6IGVuZHBvaW50
OiBwY2ktZXBmLXZudGI6IGFkZCBlbmRwb2ludA0KPiBNU0kgc3VwcG9ydA0KPiANCj4gQ2F1dGlv
bjogRVhUIEVtYWlsDQo+IA0KPiBPbiBUaHUsIEF1ZyAxOCwgMjAyMiBhdCAxMDoxMToyN0FNIC0w
NTAwLCBGcmFuayBMaSB3cm90ZToNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICDilIzilIDi
lIDilIDilIDilIDilIDilIDilJAgICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSQDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg4pSCICAgICAgIOKUgiAgICAg
ICAgICDilIIgICAgICAgICAg4pSCDQo+ID4gICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSQICAg4pSCICAgICAgIOKUgiAgICAgICAgICDilIIgUENJIEhv
c3Qg4pSCDQo+ID4gICAgICAg4pSCIE1TSSAgICAgICAgIOKUguKXhOKUkCDilIIgICAgICAg4pSC
ICAgICAgICAgIOKUgiAgICAgICAgICDilIINCj4gPiAgICAgICDilIIgQ29udHJvbGxlciAg4pSC
IOKUgiDilIIgICAgICAg4pSCICAgICAgICAgIOKUgiAgICAgICAgICDilIINCj4gPiAgICAgICDi
lJTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgg4pSU4pSA4pS84pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSADQo+IOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
vOKUgEJBUjAgICAgIOKUgg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIOKUgiBQQ0kgICDi
lIIgICAgICAgICAg4pSCIEJBUjEgICAgIOKUgg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IOKUgiBGdW5jICDilIIgICAgICAgICAg4pSCIEJBUjIgICAgIOKUgg0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIOKUgiAgICAgICDilIIgICAgICAgICAg4pSCIEJBUjMgICAgIOKUgg0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIOKUgiAgICAgICDilIIgICAgICAgICAg4pSCIEJBUjQg
ICAgIOKUgg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIOKUgiAgICAgICDilJzilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilrrilIIgICAgICAgICAg4pSCDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYICAgICAgICAgIOKUlOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiA+DQo+IA0KPiBUaGlzIGRpYWdyYW0gZG9l
c24ndCBzYXkgd2hpY2ggc2lkZSBpcyBob3N0IGFuZCB3aGljaCBvbmUgaXMgZW5kcG9pbnQuDQo+
IEFuZCBub3QgY29udmV5aW5nIGFueSB1c2VmdWwgaW5mb3JtYXRpb24uDQoNCltGcmFuayBMaV0g
QXQgVjIgdmVyc2lvbiwgdGhpcyBkaWFncmFtIGlzIGluIGNvdmVyIGxldHRlci4gIEJqb3JuIHN1
Z2dlc3QgbW92ZSB0byBoZXJlLg0KSSB0aGluayB5b3UgaGF2ZSBnb29kIGJhY2tncm91bmQga25v
d2xlZGdlLiAgQnV0IGl0IHNob3VsZCBiZSBoZWxwZnVsIGZvciBuZXcNClBlb3BsZSwgIHdobyBq
dXN0IHRvdWNoIHRoaXMgYXJlYS4gDQoNCkkgYWxyZWFkeSBtYXJrICJQQ0kgRnVuYyIgYW5kICJQ
Q0kgSG9zdCIuICANCg0KPiANCj4gPiBMaW51eCBzdXBwb3J0cyBlbmRwb2ludCBmdW5jdGlvbnMu
IFBDSSBIb3N0IHdyaXRlIEJBUjxuPiBzcGFjZSBsaWtlIHdyaXRlDQo+ID4gdG8gbWVtb3J5LiBU
aGUgRVAgc2lkZSBjYW4ndCBrbm93IG1lbW9yeSBjaGFuZ2VkIGJ5IHRoZSBob3N0IGRyaXZlci4N
Cj4gPg0KPiANCj4gSSB0aGluayB5b3UganVzdCBzYXksIHRoYXQgdGhlcmUgaXMgbm8gZGVmaW5l
ZCB3YXkgb2YgcmFpc2luZyBJUlFzIGJ5IGhvc3QNCj4gdG8gdGhlIGVuZHBvaW50Lg0KPiANCj4g
PiBQQ0kgU3BlYyBoYXMgbm90IGRlZmluZWQgYSBzdGFuZGFyZCBtZXRob2QgdG8gZG8gdGhhdC4g
T25seSBkZWZpbmUgTVNJKHgpDQo+ID4gdG8gbGV0IEVQIG5vdGlmaWVkIFJDIHN0YXR1cyBjaGFu
Z2UuDQo+ID4NCj4gDQo+IE1TSSBpcyBmcm9tIEVQLCByaWdodD8gVGhyb3VnaG91dCB0aGUgZHJp
dmVyIHlvdSBzaG91bGQgY2FsbCBpdCBhcyAiZG9vcmJlbGwiDQo+IGFuZCBub3QgTVNJLg0KDQpb
RnJhbmsgTGldIFdoYXQncyBJIHdhbnQgc2FpZCBpcyB0aGF0IFBDSSBzdGFuZGFyZCBkZWZpbmUg
TVNJKHgpIHRvIGxldCBFUCBub3RpZnkgUkMuIA0KQnV0IHRoZXJlIGFyZSBub3Qgc3RhbmRhcmQg
d2F5IGZvciByZXZlcnNlIGRpcmVjdGlvbi4gIE1TSSBzaG91bGQgYmUgY29ycmVjdCBoZXJlLg0K
DQo+IA0KPiA+IFRoZSBiYXNpYyBpZGVhIGlzIHRvIHRyaWdnZXIgYW4gSVJRIHdoZW4gUENJIFJD
IHdyaXRlcyB0byBhIG1lbW9yeQ0KPiA+IGFkZHJlc3MuIFRoYXQncyB3aGF0IE1TSSBjb250cm9s
bGVyIHByb3ZpZGVkLiBFUCBkcml2ZXJzIGp1c3QgbmVlZCB0bw0KPiA+IHJlcXVlc3QgYSBwbGF0
Zm9ybSBNU0kgaW50ZXJydXB0LCBzdHJ1Y3QgbXNpX21zZyAqbXNnIHdpbGwgcGFzcyBkb3duIGEN
Cj4gPiBtZW1vcnkgYWRkcmVzcyBhbmQgZGF0YS4gRVAgZHJpdmVyIHdpbGwgbWFwIHN1Y2ggbWVt
b3J5IGFkZHJlc3MgdG8gb25lDQo+IG9mDQo+ID4gUENJIEJBUjxuPi4gIEhvc3QganVzdCB3cml0
ZXMgc3VjaCBhbiBhZGRyZXNzIHRvIHRyaWdnZXIgRVAgc2lkZSBpcnEuDQo+ID4NCj4gDQo+IElJ
VUMgKGJ5IGxvb2tpbmcgYXQgb3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzKSwgdGhlIG1lbW9y
eSBhc3NpZ25lZCBmb3IgQkFSDQo+IHJlZ2lvbiBieSB0aGUgUENJIGhvc3QgaXMgbWFwcGVkIHRv
IHRoZSBwbGF0Zm9ybSBpbnRlcnJ1cHQgY29udHJvbGxlciBpbg0KPiBQQ0kgRW5kcG9pbnQuIFN1
Y2ggdGhhdCwgd2hlbmV2ZXIgdGhlIFBDSSBob3N0IHdyaXRlcyB0byB0aGUgQkFSIHJlZ2lvbiwg
aXQNCj4gd2lsbCB0cmlnZ2VyIGFuIElSUSBpbiB0aGUgRW5kcG9pbnQuDQo+IA0KPiBUaGlzIGtp
bmQgb2Ygc2V0dXAgaXMgYXZhaWxhYmxlIGluIG90aGVyIHBsYXRmb3JtcyBsaWtlIFF1YWxjb21t
IHdoZXJlIHRoZQ0KPiBtYXBwaW5nIG9mIGEgcmVnaXN0ZXIgcmVnaW9uIGF2YWlsYWJsZSBpbiBC
QVIwIGFuZCBpbnRlcnJ1cHQgY29udHJvbGxlciBpcw0KPiBkb25lIGluIHRoZSBoYXJkd2FyZSBp
dHNlbGYuIFNvIHdoZW5ldmVyIHRoZSBQQ0kgaG9zdCB3cml0ZXMgdG8gdGhhdCByZWdpc3Rlcg0K
PiBpbiBCQVIwLCBhbiBJUlEgd2lsbCBiZSBkZWxpdmVyZWQgdG8gdGhlIGVuZHBvaW50Lg0KDQpb
RnJhbmsgTGldIFllcywgIG5vdCBhbGwgcGxhdGZvcm0gaGF2ZSBpdC4gQW5kIEVQIGRyaXZlciBo
YXZlIG5vdCBwcm92aWRlIGEgQVBJDQp0byBnZXQgcmVnaXN0ZXIgcmVnaW9uLiAgSSB0aGluayBw
bGF0Zm9ybSBtc2kgQVBJIGlzIHByZXR0eSBnb29kIEFQSS4gDQpNYW55IHN5c3RlbSBoYXZlIEdJ
QyBJVFMsICBzbyBFUCBmdW5jdGlvbiBkcml2ZXIgY2FuIHVzZSBpdC4gIE91ciB0ZXN0IHBsYXRm
b3JtDQpoYXZlIG5vdCBJVFMgeWV0LCAgc28gd2UgYWRkZWQgYSBzaW1wbGUgTVUtTVNJIGRyaXZl
ciB0byBkbyBpdC4gSSB0aGluayBxdWFsY29tbQ0KcGxhdGZvcm0gY2FuIHVzZSBzaW1pbGFyIG1l
dGhvZC4gIFNvIGFsbCBFUCBmdW5jdGlvbiBkcml2ZXIgY2FuIHVzZSBjb21tb24gbWV0aG9kDQp0
byBnZXQgbm90aWZpY2F0aW9uIGZyb20gUENJIGhvc3QuDQoNCj4gDQo+ID4gQWRkIE1TSSBzdXBw
b3J0IGZvciBwY2ktZXBmLXZudGIuIHBjaS1lcGYtdm50YiBkcml2ZXIgcXVlcnkgaWYgc3lzdGVt
DQo+ID4gaGF2ZSBNU0kgY29udHJvbGxlci4gU2V0dXAgZG9vcmJlbGwgYWRkcmVzcyBhY2NvcmRp
bmcgdG8gc3RydWN0IG1zaV9tc2cuDQo+ID4NCj4gPiBTbyBQQ0llIGhvc3QgY2FuIHdyaXRlIHRo
aXMgZG9vcmJlbGwgYWRkcmVzcyB0byB0cmlnZXIgRVAgc2lkZSdzIGlycS4NCj4gPg0KPiA+IElm
IG5vIE1TSSBjb250cm9sbGVyIGV4aXN0LCBmYWxsIGJhY2sgdG8gc29mdHdhcmUgcG9sbGluZy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvcGNpLWVwZi12bnRiLmMg
fCAxMzQgKysrKysrKysrKysrKysrLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMTIgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvZW5kcG9pbnQvZnVuY3Rpb25zL3BjaS1lcGYtdm50Yi5jDQo+IGIvZHJpdmVycy9wY2kvZW5k
cG9pbnQvZnVuY3Rpb25zL3BjaS1lcGYtdm50Yi5jDQo+ID4gaW5kZXggMTQ2NmRkMTkwNDE3NS4u
YWQ0ZjdlYzhhMzlmYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5j
dGlvbnMvcGNpLWVwZi12bnRiLmMNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5j
dGlvbnMvcGNpLWVwZi12bnRiLmMNCj4gPiBAQCAtNDQsNiArNDQsNyBAQA0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvcGNpLWVwYy5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGNpLWVwZi5oPg0KPiA+
ICAjaW5jbHVkZSA8bGludXgvbnRiLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tc2kuaD4NCj4g
Pg0KPiA+ICBzdGF0aWMgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKmtwY2ludGJfd29ya3F1ZXVl
Ow0KPiA+DQo+ID4gQEAgLTE0Myw2ICsxNDQsOCBAQCBzdHJ1Y3QgZXBmX250YiB7DQo+ID4gICAg
ICAgdm9pZCBfX2lvbWVtICp2cGNpX213X2FkZHJbTUFYX01XXTsNCj4gPg0KPiA+ICAgICAgIHN0
cnVjdCBkZWxheWVkX3dvcmsgY21kX2hhbmRsZXI7DQo+ID4gKw0KPiA+ICsgICAgIGludCBtc2lf
dmlycWJhc2U7DQo+IA0KPiBkYl9iYXNlPw0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICAjZGVmaW5l
IHRvX2VwZl9udGIoZXBmX2dyb3VwKSBjb250YWluZXJfb2YoKGVwZl9ncm91cCksIHN0cnVjdCBl
cGZfbnRiLA0KPiBncm91cCkNCj4gPiBAQCAtMjUzLDcgKzI1Niw3IEBAIHN0YXRpYyB2b2lkIGVw
Zl9udGJfY21kX2hhbmRsZXIoc3RydWN0DQo+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+DQo+ID4g
ICAgICAgbnRiID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBlcGZfbnRiLCBjbWRfaGFuZGxl
ci53b3JrKTsNCj4gPg0KPiA+IC0gICAgIGZvciAoaSA9IDE7IGkgPCBudGItPmRiX2NvdW50OyBp
KyspIHsNCj4gPiArICAgICBmb3IgKGkgPSAxOyBpIDwgbnRiLT5kYl9jb3VudCAmJiAhbnRiLT5l
cGZfZGJfcGh5OyBpKyspIHsNCj4gDQo+IGVwZl9kYl9waHkgaXMgYSB3aWVyZCBuYW1lLiAicGh5
IiB1c3VhbGx5IG1lYW5zIHRoZSBQSFkgY29udHJvbGxlciAoUGh5c2ljYWwNCj4gbGF5ZXIpIGlu
IGtlcm5lbC4gSWYgeW91IGFyZSByZWZlcnJpbmcgdG8gcGh5c2ljYWxsIGFkZHJlc3Mgb2YgdGhl
IGRvb3JiZWxsLA0KPiB0aGVuIHlvdSBjb3VsZCB1c2UgInBoeXMiLg0KPiANCj4gPiAgICAgICAg
ICAgICAgIGlmIChyZWFkbChudGItPmVwZl9kYiArIGkgKiA0KSkgew0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmVhZGwobnRiLT5lcGZfZGIgKyBpICogNCkpDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbnRiLT5kYiB8PSAxIDw8IChpIC0gMSk7DQo+ID4gQEAgLTQ1
NCwxMSArNDU3LDkgQEAgc3RhdGljIGludCBlcGZfbnRiX2NvbmZpZ19zcGFkX2Jhcl9hbGxvYyhz
dHJ1Y3QNCj4gZXBmX250YiAqbnRiKQ0KPiA+ICAgICAgIGN0cmwtPm51bV9td3MgPSBudGItPm51
bV9td3M7DQo+ID4gICAgICAgbnRiLT5zcGFkX3NpemUgPSBzcGFkX3NpemU7DQo+ID4NCj4gPiAt
ICAgICBjdHJsLT5kYl9lbnRyeV9zaXplID0gNDsNCj4gPiAtDQo+ID4gICAgICAgZm9yIChpID0g
MDsgaSA8IG50Yi0+ZGJfY291bnQ7IGkrKykgew0KPiA+ICAgICAgICAgICAgICAgbnRiLT5yZWct
PmRiX2RhdGFbaV0gPSAxICsgaTsNCj4gPiAtICAgICAgICAgICAgIG50Yi0+cmVnLT5kYl9vZmZz
ZXRbaV0gPSAwOw0KPiA+ICsgICAgICAgICAgICAgbnRiLT5yZWctPmRiX29mZnNldFtpXSA9IDQg
KiBpOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+IEBAIC01MDks
NiArNTEwLDI4IEBAIHN0YXRpYyBpbnQgZXBmX250Yl9jb25maWd1cmVfaW50ZXJydXB0KHN0cnVj
dA0KPiBlcGZfbnRiICpudGIpDQo+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+
ICtzdGF0aWMgaW50IGVwZl9udGJfZGJfc2l6ZShzdHJ1Y3QgZXBmX250YiAqbnRiKQ0KPiA+ICt7
DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMgKmVwY19mZWF0dXJlczsN
Cj4gPiArICAgICBzaXplX3Qgc2l6ZSA9IDQgKiBudGItPmRiX2NvdW50Ow0KPiA+ICsgICAgIHUz
MiBhbGlnbjsNCj4gPiArDQo+ID4gKyAgICAgZXBjX2ZlYXR1cmVzID0gcGNpX2VwY19nZXRfZmVh
dHVyZXMobnRiLT5lcGYtPmVwYywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBudGItPmVwZi0+ZnVuY19ubywNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBudGItPmVwZi0+dmZ1bmNfbm8pOw0KPiA+ICsgICAgIGFsaWdu
ID0gZXBjX2ZlYXR1cmVzLT5hbGlnbjsNCj4gPiArDQo+ID4gKyAgICAgaWYgKHNpemUgPCAxMjgp
DQo+ID4gKyAgICAgICAgICAgICBzaXplID0gMTI4Ow0KPiA+ICsNCj4gPiArICAgICBpZiAoYWxp
Z24pDQo+ID4gKyAgICAgICAgICAgICBzaXplID0gQUxJR04oc2l6ZSwgYWxpZ24pOw0KPiA+ICsg
ICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgIHNpemUgPSByb3VuZHVwX3Bvd19vZl90d28oc2l6
ZSk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiBzaXplOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAv
KioNCj4gPiAgICogZXBmX250Yl9kYl9iYXJfaW5pdCgpIC0gQ29uZmlndXJlIERvb3JiZWxsIHdp
bmRvdyBCQVJzDQo+ID4gICAqIEBudGI6IE5UQiBkZXZpY2UgdGhhdCBmYWNpbGl0YXRlcyBjb21t
dW5pY2F0aW9uIGJldHdlZW4gSE9TVCBhbmQNCj4gdkhPU1QNCj4gPiBAQCAtNTIwLDM1ICs1NDMs
MzMgQEAgc3RhdGljIGludCBlcGZfbnRiX2RiX2Jhcl9pbml0KHN0cnVjdCBlcGZfbnRiDQo+ICpu
dGIpDQo+ID4gICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJm50Yi0+ZXBmLT5kZXY7DQo+ID4g
ICAgICAgaW50IHJldDsNCj4gPiAgICAgICBzdHJ1Y3QgcGNpX2VwZl9iYXIgKmVwZl9iYXI7DQo+
ID4gLSAgICAgdm9pZCBfX2lvbWVtICptd19hZGRyOw0KPiA+ICsgICAgIHZvaWQgX19pb21lbSAq
bXdfYWRkciA9IE5VTEw7DQo+ID4gICAgICAgZW51bSBwY2lfYmFybm8gYmFybm87DQo+ID4gLSAg
ICAgc2l6ZV90IHNpemUgPSA0ICogbnRiLT5kYl9jb3VudDsNCj4gPiArICAgICBzaXplX3Qgc2l6
ZTsNCj4gPg0KPiA+ICAgICAgIGVwY19mZWF0dXJlcyA9IHBjaV9lcGNfZ2V0X2ZlYXR1cmVzKG50
Yi0+ZXBmLT5lcGMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbnRiLT5lcGYtPmZ1bmNfbm8sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbnRiLT5lcGYtPnZmdW5jX25vKTsNCj4gPiAgICAgICBhbGlnbiA9IGVwY19m
ZWF0dXJlcy0+YWxpZ247DQo+ID4gLQ0KPiA+IC0gICAgIGlmIChzaXplIDwgMTI4KQ0KPiA+IC0g
ICAgICAgICAgICAgc2l6ZSA9IDEyODsNCj4gPiAtDQo+ID4gLSAgICAgaWYgKGFsaWduKQ0KPiA+
IC0gICAgICAgICAgICAgc2l6ZSA9IEFMSUdOKHNpemUsIGFsaWduKTsNCj4gPiAtICAgICBlbHNl
DQo+ID4gLSAgICAgICAgICAgICBzaXplID0gcm91bmR1cF9wb3dfb2ZfdHdvKHNpemUpOw0KPiA+
ICsgICAgIHNpemUgPSBlcGZfbnRiX2RiX3NpemUobnRiKTsNCj4gPg0KPiA+ICAgICAgIGJhcm5v
ID0gbnRiLT5lcGZfbnRiX2JhcltCQVJfREJdOw0KPiA+ICsgICAgIGVwZl9iYXIgPSAmbnRiLT5l
cGYtPmJhcltiYXJub107DQo+ID4NCj4gPiAtICAgICBtd19hZGRyID0gcGNpX2VwZl9hbGxvY19z
cGFjZShudGItPmVwZiwgc2l6ZSwgYmFybm8sIGFsaWduLCAwKTsNCj4gPiAtICAgICBpZiAoIW13
X2FkZHIpIHsNCj4gPiAtICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFsbG9j
YXRlIE9CIGFkZHJlc3NcbiIpOw0KPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
ID4gKyAgICAgaWYgKCFudGItPmVwZl9kYl9waHkpIHsNCj4gPiArICAgICAgICAgICAgIG13X2Fk
ZHIgPSBwY2lfZXBmX2FsbG9jX3NwYWNlKG50Yi0+ZXBmLCBzaXplLCBiYXJubywgYWxpZ24sIDAp
Ow0KPiA+ICsgICAgICAgICAgICAgaWYgKCFtd19hZGRyKSB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIE9CIGFkZHJlc3NcbiIpOw0K
PiANCj4gRXhwYW5kIE9CLg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+ID4gKyAgICAgICAgICAgICB9DQo+ID4gKyAgICAgfSBlbHNlIHsNCj4gPiArICAg
ICAgICAgICAgIGVwZl9iYXItPnBoeXNfYWRkciA9IG50Yi0+ZXBmX2RiX3BoeTsNCj4gPiArICAg
ICAgICAgICAgIGVwZl9iYXItPmJhcm5vID0gYmFybm87DQo+ID4gKyAgICAgICAgICAgICBlcGZf
YmFyLT5zaXplID0gc2l6ZTsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAgICAgICBudGItPmVwZl9k
YiA9IG13X2FkZHI7DQo+ID4NCj4gPiAtICAgICBlcGZfYmFyID0gJm50Yi0+ZXBmLT5iYXJbYmFy
bm9dOw0KPiA+IC0NCj4gPiAgICAgICByZXQgPSBwY2lfZXBjX3NldF9iYXIobnRiLT5lcGYtPmVw
YywgbnRiLT5lcGYtPmZ1bmNfbm8sIG50Yi0+ZXBmLQ0KPiA+dmZ1bmNfbm8sIGVwZl9iYXIpOw0K
PiA+ICAgICAgIGlmIChyZXQpIHsNCj4gPiAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRG9v
cmJlbGwgQkFSIHNldCBmYWlsZWRcbiIpOw0KPiA+IEBAIC03MDQsNiArNzI1LDc0IEBAIHN0YXRp
YyBpbnQgZXBmX250Yl9pbml0X2VwY19iYXIoc3RydWN0IGVwZl9udGINCj4gKm50YikNCj4gPiAg
ICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIGVwZl9udGJfd3Jp
dGVfbXNpX21zZyhzdHJ1Y3QgbXNpX2Rlc2MgKmRlc2MsIHN0cnVjdCBtc2lfbXNnDQo+ICptc2cp
DQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgZXBmX250YiAqbnRiID0gZGV2X2dldF9kcnZkYXRh
KGRlc2MtPmRldik7DQo+ID4gKyAgICAgc3RydWN0IGVwZl9udGJfY3RybCAqcmVnID0gbnRiLT5y
ZWc7DQo+ID4gKyAgICAgaW50IHNpemUgPSBlcGZfbnRiX2RiX3NpemUobnRiKTsNCj4gPiArICAg
ICB1NjQgYWRkcjsNCj4gPiArDQo+ID4gKyAgICAgYWRkciA9IG1zZy0+YWRkcmVzc19oaTsNCj4g
PiArICAgICBhZGRyIDw8PSAzMjsNCj4gPiArICAgICBhZGRyIHw9IG1zZy0+YWRkcmVzc19sbzsN
Cj4gPiArDQo+ID4gKyAgICAgcmVnLT5kYl9kYXRhW2Rlc2MtPm1zaV9pbmRleF0gPSBtc2ctPmRh
dGE7DQo+ID4gKw0KPiA+ICsgICAgIGlmIChkZXNjLT5tc2lfaW5kZXggPT0gMCkNCj4gPiArICAg
ICAgICAgICAgIG50Yi0+ZXBmX2RiX3BoeSA9IHJvdW5kX2Rvd24oYWRkciwgc2l6ZSk7DQo+ID4g
Kw0KPiA+ICsgICAgIHJlZy0+ZGJfb2Zmc2V0W2Rlc2MtPm1zaV9pbmRleF0gPSBhZGRyIC0gbnRi
LT5lcGZfZGJfcGh5Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3QgZXBm
X250Yl9pbnRlcnJ1cHRfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQ0KPiA+ICt7DQo+ID4g
KyAgICAgc3RydWN0IGVwZl9udGIgKm50YiA9IGRhdGE7DQo+ID4gKyAgICAgaW50IGluZGV4Ow0K
PiA+ICsNCj4gPiArICAgICBpbmRleCA9IGlycSAtIG50Yi0+bXNpX3ZpcnFiYXNlOw0KPiA+ICsg
ICAgIG50Yi0+ZGIgfD0gMSA8PCAoaW5kZXggLSAxKTsNCj4gPiArICAgICBudGJfZGJfZXZlbnQo
Jm50Yi0+bnRiLCBpbmRleCk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiBJUlFfSEFORExFRDsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgZXBmX250Yl9lcGNfbXNpX2luaXQoc3Ry
dWN0IGVwZl9udGIgKm50YikNCj4gPiArew0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9
ICZudGItPmVwZi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCBpcnFfZG9tYWluICpkb21haW47DQo+
ID4gKyAgICAgaW50IHZpcnE7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArICAgICBpbnQgaTsN
Cj4gPiArDQo+ID4gKyAgICAgZG9tYWluID0gZGV2X2dldF9tc2lfZG9tYWluKG50Yi0+ZXBmLT5l
cGMtPmRldi5wYXJlbnQpOw0KPiA+ICsgICAgIGlmICghZG9tYWluKQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuOw0KPiA+ICsNCj4gPiArICAgICBkZXZfc2V0X21zaV9kb21haW4oZGV2LCBkb21h
aW4pOw0KPiA+ICsNCj4gPiArICAgICBpZiAocGxhdGZvcm1fbXNpX2RvbWFpbl9hbGxvY19pcnFz
KCZudGItPmVwZi0+ZGV2LA0KPiA+ICsgICAgICAgICAgICAgbnRiLT5kYl9jb3VudCwNCj4gPiAr
ICAgICAgICAgICAgIGVwZl9udGJfd3JpdGVfbXNpX21zZykpIHsNCj4gPiArICAgICAgICAgICAg
IGRldl9pbmZvKGRldiwgIkNhbid0IGFsbG9jYXRlIE1TSSwgZmFsbCBiYWNrIHRvIHBvbGwgbW9k
ZVxuIik7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4g
PiArICAgICBkZXZfaW5mbyhkZXYsICJ2bnRiIHVzZSBNU0kgYXMgZG9vcmJlbGxcbiIpOw0KPiA+
ICsNCj4gDQo+IFdoeSBhcmUgeW91IHVzaW5nIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBhcyB0
aGUgTVNJIGNvbnRyb2xsZXI/IFdoeSBub3QNCj4ganVzdA0KPiBhIHBsYWluIGludGVycnVwdCBj
b250cm9sbGVyPw0KDQpbRnJhbmsgTGldIHdoYXQncyB5b3VyIG1lYW5zPyAgIEkgdGhpbmsgb25s
eSBNU0kgY29udHJvbGxlciBzdXBwb3J0IHdyaXRlIG1lbW9yeSB0byB0cmlnZ2VyIGlycS4NCg0K
PiANCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgbnRiLT5kYl9jb3VudDsgaSsrKSB7DQo+ID4g
KyAgICAgICAgICAgICB2aXJxID0gbXNpX2dldF92aXJxKGRldiwgaSk7DQo+ID4gKyAgICAgICAg
ICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgdmlycSwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVwZl9udGJfaW50ZXJydXB0X2hhbmRsZXIsIDAsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAibnRiIiwgbnRiKTsNCj4gDQo+ICJudGIiIGFzIGEgSVJR
IG5hbWUgc2VlbXMgcXVpdGUgZ2VuZXJpYy4gWW91IG1pZ2h0IHdhbnQgdG8gcHJlZml4IGl0IHdp
dGgNCj4gZXBmDQo+IG9yIHZudGIuLi4NCj4gDQo+IFRoYW5rcywNCj4gTWFuaQ0KPiANCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgImRldm1fcmVxdWVzdF9pcnEoKSBmYWlsdXJlXG4iKTsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICBpZiAoIWkpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG50Yi0+bXNp
X3ZpcnFiYXNlID0gdmlycTsNCj4gPiArICAgICB9DQo+ID4gK30NCj4gPiArDQo+ID4gIC8qKg0K
PiA+ICAgKiBlcGZfbnRiX2VwY19pbml0KCkgLSBJbml0aWFsaXplIE5UQiBpbnRlcmZhY2UNCj4g
PiAgICogQG50YjogTlRCIGRldmljZSB0aGF0IGZhY2lsaXRhdGVzIGNvbW11bmljYXRpb24gYmV0
d2VlbiBIT1NUIGFuZA0KPiB2SE9TVDINCj4gPiBAQCAtMTI5OSwxNCArMTM4OCwxNSBAQCBzdGF0
aWMgaW50IGVwZl9udGJfYmluZChzdHJ1Y3QgcGNpX2VwZiAqZXBmKQ0KPiA+ICAgICAgICAgICAg
ICAgZ290byBlcnJfYmFyX2FsbG9jOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICsgICAgIGVwZl9z
ZXRfZHJ2ZGF0YShlcGYsIG50Yik7DQo+ID4gKyAgICAgZXBmX250Yl9lcGNfbXNpX2luaXQobnRi
KTsNCj4gPiArDQo+ID4gICAgICAgcmV0ID0gZXBmX250Yl9lcGNfaW5pdChudGIpOw0KPiA+ICAg
ICAgIGlmIChyZXQpIHsNCj4gPiAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRv
IGluaXRpYWxpemUgRVBDXG4iKTsNCj4gPiAgICAgICAgICAgICAgIGdvdG8gZXJyX2Jhcl9hbGxv
YzsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAtICAgICBlcGZfc2V0X2RydmRhdGEoZXBmLCBudGIp
Ow0KPiA+IC0NCj4gPiAgICAgICBwY2lfc3BhY2VbMF0gPSAobnRiLT52bnRiX3BpZCA8PCAxNikg
fCBudGItPnZudGJfdmlkOw0KPiA+ICAgICAgIHBjaV92bnRiX3RhYmxlWzBdLnZlbmRvciA9IG50
Yi0+dm50Yl92aWQ7DQo+ID4gICAgICAgcGNpX3ZudGJfdGFibGVbMF0uZGV2aWNlID0gbnRiLT52
bnRiX3BpZDsNCj4gPiAtLQ0KPiA+IDIuMzUuMQ0KPiA+DQo+IA0KPiAtLQ0KPiDgrq7grqPgrr/g
rrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NDQo=

