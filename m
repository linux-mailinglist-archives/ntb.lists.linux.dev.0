Return-Path: <ntb+bounces-19-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB9C4F1A1C
	for <lists+linux-ntb@lfdr.de>; Mon,  4 Apr 2022 22:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 052C21C0709
	for <lists+linux-ntb@lfdr.de>; Mon,  4 Apr 2022 20:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E279320A;
	Mon,  4 Apr 2022 20:12:33 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B23200
	for <ntb@lists.linux.dev>; Mon,  4 Apr 2022 20:12:31 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id k2so5246747edj.9
        for <ntb@lists.linux.dev>; Mon, 04 Apr 2022 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V+yE8jLxkve1ycY7ollAQEd3VziDOT8vd+4R3TOSpbg=;
        b=OLs6xoYA4azTSgRSrq4v7blms3aQdtUaHcxyMyL8tmK6seAHgH8KKjSYDUZUweA11F
         ZA1QxmoF/tEf8Jy1at/dA/oOS10vMVrxA3edlTR3T1pLyr+wnsQuGMauvVlXS+BKdJUw
         FGV5UYKfrhJNxB8iGZPrKAvDV2rZDJvSbobcR1QP5H4QuYmTv+YhAO30Lhv1+AayCOlh
         f5GTRppYjyGQy4TkSQ7QaDPMllmESU3tlx0vViHt5BvWKHFmrnlWfW42CyngvmPlrnvr
         Vacea4chpWcnd1MCnGcr2hh+YUljWyC3tJJ5LV5+ZtthsEZDU+Uy1jCX3Wqkz3RoLADS
         DL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V+yE8jLxkve1ycY7ollAQEd3VziDOT8vd+4R3TOSpbg=;
        b=ApzHLai1awFQbNaRJPeV93OcXh8SSAPS4/KOsk6kVst0ye4f3jmi/gQXRExNo/9bga
         Ca4MTQpedjnuAvlLpSnQHcPncRnc9Nsge97851ySHDIwP6s4KmxlexsfcXPRRB2hMmJ9
         sXzZnriG4XquqXz7P2lUrrF9Iri2HxQp4KO90r0fp0T5+GXEI+29Vy39Y8BngQYonWNb
         GH/vIAva31S/7lK9zzz2BYC1T1Ij5tbXtUE1JicXoQ6yuoxWOgoE1If9PJsrKZEgr/bw
         ifncRfcy8vgufjtb8u2rIs0ixYa5UTwaWcfCq0SuX/V3EekvT3K2CRM1+ghr0e6oawFk
         c7cQ==
X-Gm-Message-State: AOAM5329bHbnXlQKv804HBErULfiSMPwJaQOUxj9PcDYk91m9nA/XS+0
	xKjg33ONfa+HpVAa2dQwIOtW3FyXndASFaaMTSc=
X-Google-Smtp-Source: ABdhPJwLQSsjwV/yCGkvtGLrACwf698x+5JCN+kImLYfiA604auGyL0FSg+vaHZ7Ltq+ZN7NkoF6+LDmludfA0kPOHI=
X-Received: by 2002:aa7:de93:0:b0:418:d700:662a with SMTP id
 j19-20020aa7de93000000b00418d700662amr1939013edv.107.1649103149333; Mon, 04
 Apr 2022 13:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220222162355.32369-1-Frank.Li@nxp.com> <CAHrpEqTFP7SUgoTFq5Dn2-rOrAL_DCX97nRww7o_xnDJ+zDmtw@mail.gmail.com>
 <CAHrpEqTTuJhK5-kB7Q2SLt3uTvcef+ehDUA8v_f1-Zna1UN+CQ@mail.gmail.com>
In-Reply-To: <CAHrpEqTTuJhK5-kB7Q2SLt3uTvcef+ehDUA8v_f1-Zna1UN+CQ@mail.gmail.com>
From: Zhi Li <lznuaa@gmail.com>
Date: Mon, 4 Apr 2022 15:12:17 -0500
Message-ID: <CAHrpEqRBEp=201oc4qv7YT68u+KH5EaaG=Ln_Y5ypmKagWM6Qg@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] NTB function for PCIe RC to EP connection
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, kishon@ti.com, lorenzo.pieralisi@arm.com, 
	kw@linux.com, Jingoo Han <jingoohan1@gmail.com>, gustavo.pimentel@synopsys.com, 
	hongxing.zhu@nxp.com, Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
	Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, linux-pci@vger.kernel.org, 
	ntb@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMTAsIDIwMjIgYXQgNDowNyBQTSBaaGkgTGkgPGx6bnVhYUBnbWFpbC5jb20+
IHdyb3RlOg0KPg0KPiBPbiBUaHUsIE1hciAxMCwgMjAyMiBhdCA0OjAxIFBNIFpoaSBMaSA8bHpu
dWFhQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUsIEZlYiAyMiwgMjAyMiBhdCAx
MDoyNCBBTSBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4g
VGhpcyBpbXBsZW1lbnQgTlRCIGZ1bmN0aW9uIGZvciBQQ0llIEVQIHRvIFJDIGNvbm5lY3Rpb25z
Lg0KPiA+ID4gVGhlIGV4aXN0ZWQgbnRiIGVwZiBuZWVkIHR3byBQQ0kgRVBzIGFuZCB0d28gUENJ
IEhvc3QuDQo+ID4gPg0KPiA+ID4gVGhpcyBqdXN0IG5lZWQgRVAgdG8gUkMgY29ubmVjdGlvbnMu
DQo+ID4gPg0KPiA+ID4gICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUkCAgICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUkA0KPiA+ID4gICAgIOKUgiAgICAgICAgICAgIOKUgiAgICAgICAgIOKU
giAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDilIINCj4gPiA+ICAgICDilJzi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQgICAgICAgICDilIIgICAgICAg
ICAgICAgICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSkDQo+ID4gPiAgICAg4pSCIE5UQiAgICAgICAg4pSCICAgICAgICAg4pSCICAgICAgICAg
ICAgICAgICAgICAgIOKUgiBOVEIgICAgICAgICAg4pSCDQo+ID4gPiAgICAg4pSCIE5ldERldiAg
ICAg4pSCICAgICAgICAg4pSCICAgICAgICAgICAgICAgICAgICAgIOKUgiBOZXREZXYgICAgICAg
4pSCDQo+ID4gPiAgICAg4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSk
ICAgICAgICAg4pSCICAgICAgICAgICAgICAgICAgICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpA0KPiA+ID4gICAgIOKUgiBOVEIgICAgICAgIOKUgiAg
ICAgICAgIOKUgiAgICAgICAgICAgICAgICAgICAgICDilIIgTlRCICAgICAgICAgIOKUgg0KPiA+
ID4gICAgIOKUgiBUcmFuc2ZlciAgIOKUgiAgICAgICAgIOKUgiAgICAgICAgICAgICAgICAgICAg
ICDilIIgVHJhbnNmZXIgICAgIOKUgg0KPiA+ID4gICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUpCAgICAgICAgIOKUgiAgICAgICAgICAgICAgICAgICAgICDilJzi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQNCj4gPiA+ICAgICDi
lIIgICAgICAgICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICAgICAgICAg4pSCICAg
ICAgICAgICAgICDilIINCj4gPiA+ICAgICDilIIgIFBDSSBOVEIgICDilIIgICAgICAgICDilIIg
ICAgICAgICAgICAgICAgICAgICAg4pSCICAgICAgICAgICAgICDilIINCj4gPiA+ICAgICDilIIg
ICAgRVBGICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICAgICAgICAg4pSCICAgICAg
ICAgICAgICDilIINCj4gPiA+ICAgICDilIIgICBEcml2ZXIgICDilIIgICAgICAgICDilIIgICAg
ICAgICAgICAgICAgICAgICAg4pSCIFBDSSBWaXJ0dWFsICDilIINCj4gPiA+ICAgICDilIIgICAg
ICAgICAgICDilIIgICAgICAgICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilJAgICAgICDilIIgTlRCIERyaXZlciAgIOKUgg0KPiA+ID4gICAgIOKUgiAg
ICAgICAgICAgIOKUgiAgICAgICAgIOKUgiBQQ0kgRVAgTlRCICAgIOKUguKXhOKUgOKUgOKUgOKU
gOKWuuKUgiAgICAgICAgICAgICAg4pSCDQo+ID4gPiAgICAg4pSCICAgICAgICAgICAg4pSCICAg
ICAgICAg4pSCICBGTiBEcml2ZXIgICAg4pSCICAgICAg4pSCICAgICAgICAgICAgICDilIINCj4g
PiA+ICAgICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQgICAgICAg
ICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQgICAg
ICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQNCj4gPiA+
ICAgICDilIIgICAgICAgICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICDilIIgICAg
ICDilIIgICAgICAgICAgICAgIOKUgg0KPiA+ID4gICAgIOKUgiAgUENJIEJVUyAgIOKUgiDil4Ti
lIDilIDilIDilIDilIDilrog4pSCICBQQ0kgRVAgQlVTICAg4pSCICAgICAg4pSCICBWaXJ0dWFs
IFBDSSDilIINCj4gPiA+ICAgICDilIIgICAgICAgICAgICDilIIgIFBDSSAgICDilIIgICAgICAg
ICAgICAgICDilIIgICAgICDilIIgICAgIEJVUyAgICAgIOKUgg0KPiA+ID4gICAgIOKUlOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgICAgICAgIOKUlOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKU
tOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiA+ID4gICAg
ICAgICBQQ0kgUkMgICAgICAgICAgICAgICAgICAgICAgICBQQ0kgRVANCj4gPiA+DQo+ID4gPg0K
PiA+ID4NCj4gPiA+IEZyYW5rIExpICg0KToNCj4gPiA+ICAgUENJOiBkZXNpZ253YXJlLWVwOiBB
bGxvdyBwY2lfZXBjX3NldF9iYXIoKSB1cGRhdGUgaW5ib3VuZCBtYXAgYWRkcmVzcw0KPiA+ID4g
ICBOVEI6IGVwZjogQWxsb3cgbW9yZSBmbGV4aWJpbGl0eSBpbiB0aGUgbWVtb3J5IEJBUiBtYXAg
bWV0aG9kDQo+ID4gPiAgIFBDSTogZW5kcG9pbnQ6IFN1cHBvcnQgTlRCIHRyYW5zZmVyIGJldHdl
ZW4gUkMgYW5kIEVQDQo+ID4gPiAgIERvY3VtZW50YXRpb246IFBDSTogQWRkIHNwZWNpZmljYXRp
b24gZm9yIHRoZSBQQ0kgdk5UQiBmdW5jdGlvbiBkZXZpY2UNCj4gPiA+DQo+ID4NCj4NCj4gVXBk
YXRlIG50YiBtYWlsIGxpc3QNCg0KRnJpZW5kbHkgcGluZyENCg0KRnJhbmsgTGkNCg0KPg0KPiA+
DQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9QQ0kvZW5kcG9pbnQvaW5kZXgucnN0ICAgICAgICAgIHwg
ICAgMiArDQo+ID4gPiAgLi4uL1BDSS9lbmRwb2ludC9wY2ktdm50Yi1mdW5jdGlvbi5yc3QgICAg
ICAgIHwgIDEyNiArKw0KPiA+ID4gIERvY3VtZW50YXRpb24vUENJL2VuZHBvaW50L3BjaS12bnRi
LWhvd3RvLnJzdCB8ICAxNjcgKysNCj4gPiA+ICBkcml2ZXJzL250Yi9ody9lcGYvbnRiX2h3X2Vw
Zi5jICAgICAgICAgICAgICAgfCAgIDQ4ICstDQo+ID4gPiAgLi4uL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWRlc2lnbndhcmUtZXAuYyAgIHwgICAxMCArLQ0KPiA+ID4gIGRyaXZlcnMvcGNpL2Vu
ZHBvaW50L2Z1bmN0aW9ucy9LY29uZmlnICAgICAgICB8ICAgMTEgKw0KPiA+ID4gIGRyaXZlcnMv
cGNpL2VuZHBvaW50L2Z1bmN0aW9ucy9NYWtlZmlsZSAgICAgICB8ICAgIDEgKw0KPiA+ID4gIGRy
aXZlcnMvcGNpL2VuZHBvaW50L2Z1bmN0aW9ucy9wY2ktZXBmLXZudGIuYyB8IDE0MjQgKysrKysr
KysrKysrKysrKysNCj4gPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDE3NzUgaW5zZXJ0aW9ucygrKSwg
MTQgZGVsZXRpb25zKC0pDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
UENJL2VuZHBvaW50L3BjaS12bnRiLWZ1bmN0aW9uLnJzdA0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL1BDSS9lbmRwb2ludC9wY2ktdm50Yi1ob3d0by5yc3QNCj4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL3BjaS1l
cGYtdm50Yi5jDQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IDIuMjQuMC5yYzENCj4gPiA+DQo=

