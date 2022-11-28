Return-Path: <ntb+bounces-419-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD363B1F7
	for <lists+linux-ntb@lfdr.de>; Mon, 28 Nov 2022 20:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70361C2092A
	for <lists+linux-ntb@lfdr.de>; Mon, 28 Nov 2022 19:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F6FA47C;
	Mon, 28 Nov 2022 19:14:50 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90BA461;
	Mon, 28 Nov 2022 19:14:47 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669662885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ta/RP6h3ZaWg5mNsQCu1kt13zKaS/JYROoUqA2qAiTU=;
	b=Vl9C2JahBuLSdvMRNKyUTr91l5opM88ITEm9IkubxFvDIGqjetPyVT+aGQ+Ve6qKEuuNWq
	76Iyb/3zQgfZ12CO6YLqtQwVwMF56qgD9nKb5om3PJ6mFt6y5IXzK7vLRtpBUWV4nAdS8h
	lhTCdCzwZLwwup85O9oFoeWZkhYMCdv6IJbd5KEySHkl/5TIOxwq6rOtfx6gTZGja32jIk
	WSqCZz7CwA/+aiM2XkzQ0oNQUS2jF+EFsmNBhIMkK1L8W+cDv/X13XHn/oBKF0WbE5XSX/
	I3wx0ZHyYmu3JXzMsFi9YlkalmrFa0Ao+NFhrlJi7u344Aq/rOAbRPqkZHJm/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669662885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ta/RP6h3ZaWg5mNsQCu1kt13zKaS/JYROoUqA2qAiTU=;
	b=9n/njDfLUHnCyW6DyCkGsB/rBwd5AOWoeBbGHeJyK8QgA8UUnHfWnWoCYSkNxAO/TQFKoj
	6BlWMn/Eu0RzbqCA==
To: Frank Li <Frank.Li@nxp.com>, lpieralisi@kernel.org
Cc: Frank.Li@nxp.com, aisheng.dong@nxp.com, bhelgaas@google.com,
 devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
 jdmason@kudzu.us, kernel@pengutronix.de, kishon@ti.com,
 krzysztof.kozlowski+dt@linaro.org, kw@linux.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lorenzo.pieralisi@arm.com, lznuaa@gmail.com,
 manivannan.sadhasivam@linaro.org, maz@kernel.org, ntb@lists.linux.dev,
 peng.fan@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org
Subject: Re: [PATCH v13 2/2] PCI: endpoint: pci-epf-vntb: using platform MSI
 as doorbell
In-Reply-To: <20221124055036.1630573-3-Frank.Li@nxp.com>
References: <20221124055036.1630573-1-Frank.Li@nxp.com>
 <20221124055036.1630573-3-Frank.Li@nxp.com>
Date: Mon, 28 Nov 2022 20:14:44 +0100
Message-ID: <87wn7evql7.ffs@tglx>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCBOb3YgMjQgMjAyMiBhdCAwMDo1MCwgRnJhbmsgTGkgd3JvdGU6DQo+IOKUjOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgIOKUjOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgIOKUjOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiDilIIgICAgICAgICAgICDilIIg
ICDilIIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUgiAgIOKUgiAgICAgICAg
ICAgICAgICDilIINCj4g4pSCICAgICAgICAgICAg4pSCICAg4pSCIFBDSSBFbmRwb2ludCAgICAg
ICAgICAgICAgICAgICAgICDilIIgICDilIIgUENJIEhvc3QgICAgICAg4pSCDQo+IOKUgiAgICAg
ICAgICAgIOKUgiAgIOKUgiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCICAg
4pSCICAgICAgICAgICAgICAgIOKUgg0KPiDilIIgICAgICAgICAgICDilILil4TilIDilIDilKQg
MS5wbGF0Zm9ybV9tc2lfZG9tYWluX2FsbG9jX2lycXMoKeKUgiAgIOKUgiAgICAgICAgICAgICAg
ICDilIINCj4g4pSCICAgICAgICAgICAg4pSCICAg4pSCICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICDilIIgICDilIIgICAgICAgICAgICAgICAg4pSCDQo+IOKUgiBNU0kgICAgICAg
IOKUnOKUgOKUgOKWuuKUgiAyLndyaXRlX21zaV9tc2coKSAgICAgICAgICAgICAgICAg4pSc4pSA
4pSA4pa64pSc4pSAQkFSPG4+ICAgICAgICAg4pSCDQo+IOKUgiBDb250cm9sbGVyIOKUgiAgIOKU
giAgIHVwZGF0ZSBkb29yYmVsbCByZWdpc3RlciBhZGRyZXNz4pSCICAg4pSCICAgICAgICAgICAg
ICAgIOKUgg0KPiDilIIgICAgICAgICAgICDilIIgICDilIIgICBmb3IgQkFSICAgICAgICAgICAg
ICAgICAgICAgICAgIOKUgiAgIOKUgiAgICAgICAgICAgICAgICDilIINCj4g4pSCICAgICAgICAg
ICAg4pSCICAg4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDilIIgICDilIIg
My4gV3JpdGUgQkFSPG4+4pSCDQo+IOKUgiAgICAgICAgICAgIOKUguKXhOKUgOKUgOKUvOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKU
pCAgICAgICAgICAgICAgICDilIINCj4g4pSCICAgICAgICAgICAg4pSCICAg4pSCICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICDilIIgICDilIIgICAgICAgICAgICAgICAg4pSCDQo+
IOKUgiAgICAgICAgICAgIOKUnOKUgOKUgOKWuuKUgiA0LklycSBIYW5kbGUgICAgICAgICAgICAg
ICAgICAgICAg4pSCICAg4pSCICAgICAgICAgICAgICAgIOKUgg0KPiDilIIgICAgICAgICAgICDi
lIIgICDilIIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUgiAgIOKUgiAgICAg
ICAgICAgICAgICDilIINCj4g4pSCICAgICAgICAgICAg4pSCICAg4pSCICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICDilIIgICDilIIgICAgICAgICAgICAgICAg4pSCDQo+IOKUlOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgIOKUlOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgIOKUlOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPg0KPiBVc2luZyBwbGF0Zm9y
bSBNU0kgaW50ZXJydXB0IGNvbnRyb2xsZXIgYXMgZW5kcG9pbnQoRVApJ3MgZG9vcmJlbGwuDQoN
CkNhbiB5b3UgcGxlYXNlIGV4cGxhaW4gd2hhdCB0aGUgTVNJIGNvbnRyb2xsZXIgaXMgaW4gdGhp
cyBwaWN0dXJlPyBNU0kNCmNvbnRyb2xsZXIgaXMgbm90IGEgdGVybSB3aGljaCBpcyBjb21tb24g
aW4gdGhlIGludGVycnVwdCBoYW5kbGluZw0KbGFuZHNjYXBlIGRlc3BpdGUgdGhlIGZhY3QgdGhh
dCBpdCdzIHByZXR0eSB3aWRlIHNwcmVhZCBpbiBkZXZpY2UgdHJlZQ0KYmluZGluZ3MgcHJlc3Vt
YWJseSB0aHJvdWdoIGludGVuc2l2ZSBjb3B5ICYgcGFzdGEgY2FyZ28gY3VsdC4NCg0KPiBCYXNp
YyB3b3JraW5nIGZvbGxvdyBhcw0KPiAxLiBFUCBmdW5jdGlvbiBkcml2ZXIgY2FsbCBwbGF0Zm9y
bV9tc2lfZG9tYWluX2FsbG9jX2lycXMoKSBhbGxvYyBhDQo+IE1TSSBpcnEgZnJvbSBNU0kgY29u
dHJvbGxlciB3aXRoIGNhbGwgYmFjayBmdW5jdGlvbiB3cml0ZV9tc2lfbXNnKCk7DQo+IDIuIHdy
aXRlX21zZ19tc2cgd2lsbCBjb25maWcgQkFSIGFuZCBtYXAgdG8gYWRkcmVzcyBkZWZpbmVkIGlu
IG1zaV9tc2c7DQo+IDMuIEhvc3Qgc2lkZSB0cmlnZ2VyIGFuIElSUSBhdCBFbmRwb2ludCBieSB3
cml0ZSB0byBCQVIgcmVnaW9uLg0KDQpZb3UncmUgZXhwbGFpbmluZyB3aGF0IHRoZSBjb2RlIGRv
ZXMsIGJ1dCBmYWlsIHRvIGV4cGxhaW4gdGhlIHVuZGVybHlpbmcNCm1lY2hhbmlzbXMuDQoNClBs
YXRmb3JtIE1TSSBpcyBkZWZpbml0ZWx5IHRoZSB3cm9uZyBtZWNoYW5pc20gaGVyZS4gV2h5Pw0K
DQpUaGlzIGlzIGFib3V0IGEgUENJZSBlbmRwb2ludCwgd2hpY2ggaXMgdXN1YWxseSBoYW5kbGVk
IGJ5IGEgUENJL01TSQ0KaW50ZXJydXB0IGRvbWFpbi4gT2J2aW91c2x5IHRoaXMgdXNhZ2UgZG9l
cyBub3QgZml0IGludG8gdGhlIHdheSBob3cgdGhlDQoiZ2xvYmFsIiBQQ0kvTVNJIGRvbWFpbnMg
d29yay4NCg0KVGhlcmUgaXMgdXBjb21pbmcgd29yayBhbmQgYXQgbGVhc3QgdGhlIGdlbmVyaWMg
cGFydHMgc2hvdWxkIHNob3cgdXAgaW4NCjYuMiB3aGljaCBhZGRyZXNzZXMgZXhhY3RseSB0aGUg
cHJvYmxlbSB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZToNCg0KICAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjIxMTI0MjI1MzMxLjQ2NDQ4MDQ0M0BsaW51dHJvbml4LmRlDQogICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjExMjQyMzA1MDUuMDczNDE4Njc3QGxpbnV0cm9u
aXguZGUNCg0KcGx1cyB0aGUgcHJvdmUgdGhhdCB0aGUgcGxhdGZvcm0gTVNJIG1lc3MgY2FuIGJl
IHJlcGxhY2VkIGJ5IHRoaXM6DQoNCiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIy
MTEyMTEzNTY1My4yMDg2MTEyMzNAbGludXRyb25peC5kZQ0KDQpOVEIgaW4gaXQncyBjdXJyZW50
IGZvcm0gc2hvdWxkIG5ldmVyIGhhdmUgaGFwcGVuZWQsIGJ1dCB0aGF0J3Mgd2F0ZXINCmRvd24g
dGhlIGJyaWRnZS4NCg0KV2hhdCB5b3UgcmVhbGx5IHdhbnQgaXM6DQoNCiAgMSkgQ29udmVydCB5
b3VyIHBsYXRmb3JtIHRvIHRoZSBuZXcgTVNJIHBhcmVudCBtb2RlbA0KDQogIDIpIFV0aWxpemUg
UENJL0lNUyB3aGljaCBpcyBnaXZpbmcgeW91IGV4YWN0bHkgd2hhdCB5b3UgbmVlZCB3aXRoDQog
ICAgIHByb3BlciBQQ0kgc2VtYW50aWNzDQoNClRoYW5rcywNCg0KICAgICAgICB0Z2x4DQo=

