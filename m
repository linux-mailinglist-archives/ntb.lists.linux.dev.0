Return-Path: <ntb+bounces-858-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D249AC6D2
	for <lists+linux-ntb@lfdr.de>; Wed, 23 Oct 2024 11:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118D31C210A3
	for <lists+linux-ntb@lfdr.de>; Wed, 23 Oct 2024 09:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40477189F42;
	Wed, 23 Oct 2024 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="R40Q7z4T"
X-Original-To: ntb@lists.linux.dev
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1BD19AA46;
	Wed, 23 Oct 2024 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676363; cv=none; b=k5Ohu5OMFk/HslVpZkNKipWJmXm+puelq/EGFq5be4JD26p5Y7Pt5P5EIO2dpwkFYreOpaYUbRw6Aies70GRzD0InJBTUNIr6k7t1Ld+/ZNJaqJInBCkBzUUCHgfFWP6tpQ6fEmu0Kfz/kedV+2nwTn4fAvkA/0CadRQRf6oaec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676363; c=relaxed/simple;
	bh=QF/jaXhx5/NNBI1uZEY/Y3g3zYWwoUvRzmIALicrljo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpipSD9w/qp8Tzi6aKraoGSGtM1F2BLUIxJzeAX7JU2f+2GkZv3BmULp+ERUnrdDloYSKSThxYbfl8fEHPoZPwWE4jWaY/7O1M5BKFWOevXpe5868azh8pgoKKD7Z5jPt0gXjQ0yVwpulG8kzyUB21mdemMwg9jJ9OUf8VOCLDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=R40Q7z4T; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729676311;
	bh=QF/jaXhx5/NNBI1uZEY/Y3g3zYWwoUvRzmIALicrljo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=R40Q7z4TMR6QysGPZMc4BsJPggQ2G7NA6xxgCc8xYKIrVGdIekOK+YyxzZJV44Qb6
	 6wE3J6JlTjNnqlCSerK98GXlzf2nti+I0xOZk0QgmWxSzBbzLQgajKugioJ1lQFOYz
	 XNjXcolt2BULS2oYGQDMxfmvuQiwnX82qRGJFq08=
X-QQ-mid: bizesmtp77t1729676302tfw4pc5r
X-QQ-Originating-IP: j4Uoxci2RtnVTGsTNP/gQfdQgd0owTwx3inBP/hx8jA=
Received: from [10.20.53.22] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Oct 2024 17:38:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17180917475525741311
Message-ID: <1E6A0B26DC871B50+d97424c4-29ab-4bb2-b1df-8f04f8b865ca@uniontech.com>
Date: Wed, 23 Oct 2024 17:38:17 +0800
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
To: Mingcong Bai <jeffbai@aosc.io>
Cc: gregkh@linuxfoundation.org, patches@lists.linux.dev, nikita@trvn.ru,
 ink@jurassic.park.msu.ru, shc_work@mail.ru, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, fancer.lancer@gmail.com,
 linux-hwmon@vger.kernel.org, dmaengine@vger.kernel.org, xeb@mail.ru,
 netdev@vger.kernel.org, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 serjk@netup.ru, aospan@netup.ru, linux-media@vger.kernel.org,
 ddrokosov@sberdevices.ru, linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com, mchehab+huawei@kernel.org,
 xiangxia.m.yue@gmail.com
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <444fa53bdfdee75522a1af41655a99b0@aosc.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r97sG9xHlL94zbsyZpdQWneg"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NkyHzehpHY4/MtweqoV+FSa9wHPlnlGG2HwrhAk4idCWBt/lTZc9mlHz
	ZQL4U8YNgilbs3Ua9RtAhDCA8onFh+UUsEoQMTtwpWOsw7SptXQHf2eV+8/XLXnzLrniJt0
	lUOiwf8HXZjU8tEWjgGHJIVWGTYKIUS9Pva8NXxYN/49FBK5FKDPkJTw7G6I9E7UpFAE18K
	d9ahYeDp48YQpGrvLAOxQTeGnCZcemrMcX7yvGy2buYriQHzprHLuiIkok9nHdo1ZhVj9gC
	fuFnHgUZDWUz7aJrU/D55u3CYwQE9CCqS535FOMzOiw0RHEP1fl/pKRLCYtyiuKBxxcLfCj
	CJ01XNLS0eNoxw3orCnT0A8fq76b2Ni+uelJzs2KiAXJxalgIWyl3qkI75Us9UMsRLJHsu7
	KVT8yU3Q2nwi89FPyQFviR5c14Q5Z/VTmsrWd+Af8rVP3TFK+sA7XRsFpdJqrnoXr6I7+7o
	coRrKLFU+sKXAmmUA+iiA1YvEAQ7ZE92w5HiVD5c8OOq+pQnlJc67XNesD/6D1HbaJZoBJA
	n9sUNkazVmXTxMbEZIC2FPOdRsxybKCif7CW6k+VNiSL2M5uSdrMbqVHoBmj+Sxla4IwMA/
	QfVTgecpIZEzKzecqaPi2rgqRm3oSYQ9NADAFMJq3ilE7IpA9qfM21xmkt1Dh5ynf4R9rgG
	ZPE7OQMvTHws7D1vW9LDNE6stEKtDt9fTGxxqnpN4J9CNVaUv/t68hrafXaRK+zGESECF0T
	pbRnqNixuXF0I0N/rpqlIVP+Wi8uRcziXlYMkLQnXx5H1pNHRW/udBgQ+KTThqn8yjt5Ffy
	CRVpFoDXXRcjb2RRgvcbohDyP8j83HantQGbdLMgB76+MCNqUbeVfFhBkDWwotz+O93rdv7
	bA2pSCtCoJAIRIHDfbeiNBVRWWRUkKjZ7wb4tEzLH6fjAJkvXW9a5iEyKPbaJYCh4DWV4SJ
	bch7xtT5ECGvW7YG6x5sdkDJPPk3qhH1nLo7q+wvdw8gOBHYaK4t9kNmQmaajs74IqVJUTx
	8urP4pcA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r97sG9xHlL94zbsyZpdQWneg
Content-Type: multipart/mixed; boundary="------------JzXTUjOcl4RCqRode5kxglom";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Mingcong Bai <jeffbai@aosc.io>
Cc: gregkh@linuxfoundation.org, patches@lists.linux.dev, nikita@trvn.ru,
 ink@jurassic.park.msu.ru, shc_work@mail.ru, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, fancer.lancer@gmail.com,
 linux-hwmon@vger.kernel.org, dmaengine@vger.kernel.org, xeb@mail.ru,
 netdev@vger.kernel.org, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 serjk@netup.ru, aospan@netup.ru, linux-media@vger.kernel.org,
 ddrokosov@sberdevices.ru, linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com, mchehab+huawei@kernel.org,
 xiangxia.m.yue@gmail.com
Message-ID: <d97424c4-29ab-4bb2-b1df-8f04f8b865ca@uniontech.com>
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
In-Reply-To: <444fa53bdfdee75522a1af41655a99b0@aosc.io>

--------------JzXTUjOcl4RCqRode5kxglom
Content-Type: multipart/mixed; boundary="------------scTKQpIAgv93yoqxUNnHojEI"

--------------scTKQpIAgv93yoqxUNnHojEI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGFoYSwgSSByZWNlaXZlZCBhIHNpbWlsYXIgb2ZmLWxpc3QgcmVwbHkuDQoNCkkgZGVlcGx5
IHN5bXBhdGhpemUgd2l0aCBHcmVnLWtoJ3Mgc2l0dWF0aW9uIGFuZCBoaXMgdW5zcG9rZW4g
DQpkaWZmaWN1bHRpZXMsIGFsdGhvdWdoIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIE1B
SU5UQUlORVJTIGZpbGUsIGFzIA0KcGFydCBvZiB0aGUga2VybmVsIGNvZGUsIHNob3VsZCBi
ZSBvZmYtbGltaXRzIHRvIG5vbi1tYWludGFpbmVyIA0KZGV2ZWxvcGVycywgZXNwZWNpYWxs
eSB3aGVuIHRoaXMgY2xlYXJseSBpc24ndCBqdXN0IGFib3V0ICdtb2RpZnlpbmcgdGhlIA0K
TUFJTlRBSU5FUlMgZmlsZS4nDQoNCklmIGFueSBMaW51eCBkZXZlbG9wZXIgdGFjaXRseSBh
cHByb3ZlcyBvZiB0aGlzLCB0aGV5J3JlIGVzc2VudGlhbGx5IA0KZ2l2aW5nIGEgZ3JlZW4g
bGlnaHQgdG8gc29tZSBzaGFkeSBwb2xpdGljYWwgYWN0b3JzIGZyb20gYSBjZXJ0YWluIA0K
Y291bnRyeSB0byBjb2VyY2UgcGVvcGxlIGludG8gYmV0cmF5aW5nIGl0J3MgY29uc3RpdHV0
aW9uLg0KDQpUaGF0J3MgYWJzdXJkLiBBZ2FpbiwgbXkgaGVhcnQgZ29lcyBvdXQgdG8gYWxs
IChpbmNsdWRpbmcgR3JlZy1raCkgdGhhdCANCmFmZmVjdGVkIGJ5IHRoaXMuDQoNCkkgbWVh
biBubyBvZmZlbnNlIHRvIGFueW9uZSwgYnV0IHRoaXMgYWN0aW9uIHdpbGwgY29tcGxldGVs
eSBkZXN0cm95IHRoZSANCnRydXN0IHRoYXQgZGV2ZWxvcGVycyB3b3JsZHdpZGUgaGF2ZSBp
biB0aGUgTGludXgga2VybmVsIHByb2plY3QgYW5kIHRoZSANCmVudGlyZSBMaW51eCBGb3Vu
ZGF0aW9uLCBhbmQgdGhlIHBvbGl0aWNpYW5zIGZvcmNpbmcgeW91IHRvIGRvIHRoaXMgDQpj
bGVhcmx5IGRvbid0IGNhcmUgYWJvdXQgdGhhdC4NCg0KVG8gYXZvaWQgYmVjb21pbmcgcGF3
bnMgaW4gYSBwb2xpdGljYWwgZ2FtZSBhbmQgdG8gcHJldmVudCBhbGllbmF0aW5nIA0KYWxs
IHRoZSBkZXZlbG9wZXJzIHdobyBoYXZlIGNvbnRyaWJ1dGVkIHRvIHRoZSBMaW51eCBrZXJu
ZWwsIEkgc2luY2VyZWx5IA0Kc3VnZ2VzdCB0aGF0IHlvdSBtYWludGFpbmVycyByZXZlcnQg
dGhpcyBjb21taXQgYW5kIHByb21pc2Ugbm90IHRvIGRvIA0Kc29tZXRoaW5nIGxpa2UgdGhp
cyBhZ2Fpbi4NCg0KQW5kIEkgdXJnZSBldmVyeW9uZSB3aG8gYWdyZWVzIHRoYXQgdGhpcyBp
cyB1bnJlYXNvbmFibGUgdG8gcmVwbHkgdG8gDQoiW1BBVENIXSBSZXZlcnQgIk1BSU5UQUlO
RVJTOiBSZW1vdmUgc29tZSBlbnRyaWVzIGR1ZSB0byB2YXJpb3VzIA0KY29tcGxpYW5jZSBy
ZXF1aXJlbWVudHMuIiB3aXRoIHRoZWlyIG93biAiUmV2aWV3ZWQtYnkiLg0KDQpSZW1lbWJl
cjogV2hhdCBzZXRzIGh1bWFucyBhcGFydCBmcm9tIGFuaW1hbHMgaXMgb3VyIHVuZHlpbmcg
c3Bpcml0IG9mIA0KcmVzaXN0YW5jZS4gV2UgY2Fubm90IGJlIGRvbWVzdGljYXRlZCBvciB0
YW1lZCBieSBvdGhlcnMuDQoNCkZpbmFsbHksIEknZCBsaWtlIHRvIHNoYXJlIGEgcXVvdGUg
ZnJvbSBOb3JzZSBteXRob2xvZ3k6IE9ubHkgd2FycmlvcnMgDQp3aG8gZGllIGluIGJhdHRs
ZSBhcmUgd29ydGh5IG9mIGVudGVyaW5nIFZhbGhhbGxhLg0KDQotLSANCldhbmdZdWxpDQo=

--------------scTKQpIAgv93yoqxUNnHojEI
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------scTKQpIAgv93yoqxUNnHojEI--

--------------JzXTUjOcl4RCqRode5kxglom--

--------------r97sG9xHlL94zbsyZpdQWneg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZxjECQUDAAAAAAAKCRDF2h8wRvQL7kjt
APwI7fd1226UgOd7cRVAf8ZOTwbN8jQ1fJQ8MgqEad3U9wD9EIMXUDfMpotDS9T8MXgx3FH68pyV
elWfHTzpUpxMGw4=
=Mkes
-----END PGP SIGNATURE-----

--------------r97sG9xHlL94zbsyZpdQWneg--

