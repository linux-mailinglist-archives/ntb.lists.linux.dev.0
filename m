Return-Path: <ntb+bounces-15-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50644D5423
	for <lists+linux-ntb@lfdr.de>; Thu, 10 Mar 2022 23:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0E14C3E0F2A
	for <lists+linux-ntb@lfdr.de>; Thu, 10 Mar 2022 22:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36EF5CA9;
	Thu, 10 Mar 2022 22:07:24 +0000 (UTC)
X-Original-To: ntb@lists.linux.dev
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7F5A38
	for <ntb@lists.linux.dev>; Thu, 10 Mar 2022 22:07:23 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b15so4663903edn.4
        for <ntb@lists.linux.dev>; Thu, 10 Mar 2022 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fvPFEiPU5UyRC1KvHgTbAeXANF7Wd/3XWoxoO/Ay+ws=;
        b=TkvBCjiCd7qbRbDPY/8mmm89e4c5sf4zvZcVm5kYAC9963GbaHk8zybBiAGplD0Ouv
         ann1piuZBEMhtwQRx7N7iOdtooa1FNtv5w0niqbAE+T9lckvrMF133edKpgqVwuONoMx
         AoaIfAHjDJrF/LqyH9TGstWgekIXg7eb5rpYXCPqhseCHxo7CfoRqDZcLS/VvkV5o95d
         5yIfqBZSCGgAi1BcjYCfFZouxmlJTqYvqBILu/SElNiPx/zn0mNgcAFKi4YMbp9gaBEk
         6lBubihpVgBG/erDGJgWwtHAvZTpao9OTl2hr90a5f0aDK781LYWYC/q+BDcbIZ/SSHe
         G0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fvPFEiPU5UyRC1KvHgTbAeXANF7Wd/3XWoxoO/Ay+ws=;
        b=hRvnyZl/a/3mwgBZVpYrw8eOIZw4Cljw6jSQG8iz+G0ledrghc0sL4LgTpUw9XW7a0
         1ezeQ/fLCjQiY8+1V2iQRtdkv5zEhj+SZ4I8pC3ycn5XYPliGl23raGL1xcdLlSAuaD0
         pxufMqlPf9tvtiSRI3to66Z58WmyzIAqAkie+gEorOO0/GdBGxsSAFwKgfZyhoBudADX
         xXl614oQ+CwLWSNYadvmC8c0ucTXEdLehcuWFpQL9vf+0DFGP5oTGPB1JWTFZIGwEpPo
         RxxWK2S54rAcklB3e2997PwYYMaGNSPYDKfTNKsP6SlP6oUe+VlVykGRnWkd+OzIMMgE
         kUXA==
X-Gm-Message-State: AOAM5321Pvs+1kc+DGQm3iGK9owd6K6k4tL/rqHeGPNbIkT77lhtcEsh
	G6MymLncTZJS9rPVNQ1mQcbY2uU7EM5nVgWp4Y0=
X-Google-Smtp-Source: ABdhPJyNXgXuYALQhB/UTXrFz51matLU5nxjRHmEITg9fOGOAhlQTUIeapTKYI27JtTu+tvflvkU3mDR+BGDqad9GRA=
X-Received: by 2002:a05:6402:1e89:b0:416:a641:9fe with SMTP id
 f9-20020a0564021e8900b00416a64109femr6334748edf.312.1646950041456; Thu, 10
 Mar 2022 14:07:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220222162355.32369-1-Frank.Li@nxp.com> <CAHrpEqTFP7SUgoTFq5Dn2-rOrAL_DCX97nRww7o_xnDJ+zDmtw@mail.gmail.com>
In-Reply-To: <CAHrpEqTFP7SUgoTFq5Dn2-rOrAL_DCX97nRww7o_xnDJ+zDmtw@mail.gmail.com>
From: Zhi Li <lznuaa@gmail.com>
Date: Thu, 10 Mar 2022 16:07:10 -0600
Message-ID: <CAHrpEqTTuJhK5-kB7Q2SLt3uTvcef+ehDUA8v_f1-Zna1UN+CQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] NTB function for PCIe RC to EP connection
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, kishon@ti.com, lorenzo.pieralisi@arm.com, 
	kw@linux.com, Jingoo Han <jingoohan1@gmail.com>, gustavo.pimentel@synopsys.com, 
	hongxing.zhu@nxp.com, Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
	Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, linux-pci@vger.kernel.org, 
	ntb@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMTAsIDIwMjIgYXQgNDowMSBQTSBaaGkgTGkgPGx6bnVhYUBnbWFpbC5jb20+
IHdyb3RlOg0KPg0KPiBPbiBUdWUsIEZlYiAyMiwgMjAyMiBhdCAxMDoyNCBBTSBGcmFuayBMaSA8
RnJhbmsuTGlAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIGltcGxlbWVudCBOVEIgZnVu
Y3Rpb24gZm9yIFBDSWUgRVAgdG8gUkMgY29ubmVjdGlvbnMuDQo+ID4gVGhlIGV4aXN0ZWQgbnRi
IGVwZiBuZWVkIHR3byBQQ0kgRVBzIGFuZCB0d28gUENJIEhvc3QuDQo+ID4NCj4gPiBUaGlzIGp1
c3QgbmVlZCBFUCB0byBSQyBjb25uZWN0aW9ucy4NCj4gPg0KPiA+ICAgICDilIzilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilJAgICAgICAgICDilIzilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJANCj4gPiAgICAg4pSCICAg
ICAgICAgICAg4pSCICAgICAgICAg4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIOKUgg0KPiA+ICAgICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lKQgICAgICAgICDilIIgICAgICAgICAgICAgICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSkDQo+ID4gICAgIOKUgiBOVEIgICAgICAgIOKUgiAg
ICAgICAgIOKUgiAgICAgICAgICAgICAgICAgICAgICDilIIgTlRCICAgICAgICAgIOKUgg0KPiA+
ICAgICDilIIgTmV0RGV2ICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICAgICAgICAg
4pSCIE5ldERldiAgICAgICDilIINCj4gPiAgICAg4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSkICAgICAgICAg4pSCICAgICAgICAgICAgICAgICAgICAgIOKUnOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpA0KPiA+ICAgICDilIIgTlRC
ICAgICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICAgICAgICAg4pSCIE5UQiAgICAg
ICAgICDilIINCj4gPiAgICAg4pSCIFRyYW5zZmVyICAg4pSCICAgICAgICAg4pSCICAgICAgICAg
ICAgICAgICAgICAgIOKUgiBUcmFuc2ZlciAgICAg4pSCDQo+ID4gICAgIOKUnOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpCAgICAgICAgIOKUgiAgICAgICAgICAgICAgICAg
ICAgICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQNCj4g
PiAgICAg4pSCICAgICAgICAgICAg4pSCICAgICAgICAg4pSCICAgICAgICAgICAgICAgICAgICAg
IOKUgiAgICAgICAgICAgICAg4pSCDQo+ID4gICAgIOKUgiAgUENJIE5UQiAgIOKUgiAgICAgICAg
IOKUgiAgICAgICAgICAgICAgICAgICAgICDilIIgICAgICAgICAgICAgIOKUgg0KPiA+ICAgICDi
lIIgICAgRVBGICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICAgICAgICAg4pSCICAg
ICAgICAgICAgICDilIINCj4gPiAgICAg4pSCICAgRHJpdmVyICAg4pSCICAgICAgICAg4pSCICAg
ICAgICAgICAgICAgICAgICAgIOKUgiBQQ0kgVmlydHVhbCAg4pSCDQo+ID4gICAgIOKUgiAgICAg
ICAgICAgIOKUgiAgICAgICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUkCAgICAgIOKUgiBOVEIgRHJpdmVyICAg4pSCDQo+ID4gICAgIOKUgiAgICAg
ICAgICAgIOKUgiAgICAgICAgIOKUgiBQQ0kgRVAgTlRCICAgIOKUguKXhOKUgOKUgOKUgOKUgOKW
uuKUgiAgICAgICAgICAgICAg4pSCDQo+ID4gICAgIOKUgiAgICAgICAgICAgIOKUgiAgICAgICAg
IOKUgiAgRk4gRHJpdmVyICAgIOKUgiAgICAgIOKUgiAgICAgICAgICAgICAg4pSCDQo+ID4gICAg
IOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpCAgICAgICAgIOKUnOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpCAgICAgIOKUnOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpA0KPiA+ICAgICDilIIg
ICAgICAgICAgICDilIIgICAgICAgICDilIIgICAgICAgICAgICAgICDilIIgICAgICDilIIgICAg
ICAgICAgICAgIOKUgg0KPiA+ICAgICDilIIgIFBDSSBCVVMgICDilIIg4peE4pSA4pSA4pSA4pSA
4pSA4pa6IOKUgiAgUENJIEVQIEJVUyAgIOKUgiAgICAgIOKUgiAgVmlydHVhbCBQQ0kg4pSCDQo+
ID4gICAgIOKUgiAgICAgICAgICAgIOKUgiAgUENJICAgIOKUgiAgICAgICAgICAgICAgIOKUgiAg
ICAgIOKUgiAgICAgQlVTICAgICAg4pSCDQo+ID4gICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUmCAgICAgICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiA+ICAgICAgICAgUENJIFJDICAgICAg
ICAgICAgICAgICAgICAgICAgUENJIEVQDQo+ID4NCj4gPg0KPiA+DQo+ID4gRnJhbmsgTGkgKDQp
Og0KPiA+ICAgUENJOiBkZXNpZ253YXJlLWVwOiBBbGxvdyBwY2lfZXBjX3NldF9iYXIoKSB1cGRh
dGUgaW5ib3VuZCBtYXAgYWRkcmVzcw0KPiA+ICAgTlRCOiBlcGY6IEFsbG93IG1vcmUgZmxleGli
aWxpdHkgaW4gdGhlIG1lbW9yeSBCQVIgbWFwIG1ldGhvZA0KPiA+ICAgUENJOiBlbmRwb2ludDog
U3VwcG9ydCBOVEIgdHJhbnNmZXIgYmV0d2VlbiBSQyBhbmQgRVANCj4gPiAgIERvY3VtZW50YXRp
b246IFBDSTogQWRkIHNwZWNpZmljYXRpb24gZm9yIHRoZSBQQ0kgdk5UQiBmdW5jdGlvbiBkZXZp
Y2UNCj4gPg0KPg0KDQpVcGRhdGUgbnRiIG1haWwgbGlzdA0KDQo+DQo+ID4gIERvY3VtZW50YXRp
b24vUENJL2VuZHBvaW50L2luZGV4LnJzdCAgICAgICAgICB8ICAgIDIgKw0KPiA+ICAuLi4vUENJ
L2VuZHBvaW50L3BjaS12bnRiLWZ1bmN0aW9uLnJzdCAgICAgICAgfCAgMTI2ICsrDQo+ID4gIERv
Y3VtZW50YXRpb24vUENJL2VuZHBvaW50L3BjaS12bnRiLWhvd3RvLnJzdCB8ICAxNjcgKysNCj4g
PiAgZHJpdmVycy9udGIvaHcvZXBmL250Yl9od19lcGYuYyAgICAgICAgICAgICAgIHwgICA0OCAr
LQ0KPiA+ICAuLi4vcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jICAgfCAg
IDEwICstDQo+ID4gIGRyaXZlcnMvcGNpL2VuZHBvaW50L2Z1bmN0aW9ucy9LY29uZmlnICAgICAg
ICB8ICAgMTEgKw0KPiA+ICBkcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvTWFrZWZpbGUg
ICAgICAgfCAgICAxICsNCj4gPiAgZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL3BjaS1l
cGYtdm50Yi5jIHwgMTQyNCArKysrKysrKysrKysrKysrKw0KPiA+ICA4IGZpbGVzIGNoYW5nZWQs
IDE3NzUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL1BDSS9lbmRwb2ludC9wY2ktdm50Yi1mdW5jdGlvbi5yc3QNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vUENJL2VuZHBvaW50L3BjaS12bnRi
LWhvd3RvLnJzdA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wY2kvZW5kcG9pbnQv
ZnVuY3Rpb25zL3BjaS1lcGYtdm50Yi5jDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjQuMC5yYzENCj4g
Pg0K

