Return-Path: <ntb+bounces-947-lists+linux-ntb=lfdr.de@lists.linux.dev>
X-Original-To: lists+linux-ntb@lfdr.de
Delivered-To: lists+linux-ntb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C79AF158
	for <lists+linux-ntb@lfdr.de>; Thu, 24 Oct 2024 21:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589BD1C2276B
	for <lists+linux-ntb@lfdr.de>; Thu, 24 Oct 2024 19:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A8B218315;
	Thu, 24 Oct 2024 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6Q+mA5l"
X-Original-To: ntb@lists.linux.dev
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62D2170C2;
	Thu, 24 Oct 2024 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729796900; cv=none; b=cTxALWMXLtAuCUwo6dkKBTEXR324HARJCqS0L/qbS3yPY3Y4HNHU9+zVJSaRH68hQRC4ehZqvtZLeUf0PHDwu68L4TCkFmwDsrHjAT+WSHjPBrSKeVauD4M9O4Emk1MRvjrbwXUgGpU6ricJsv8r0psJCa/KkZP9aDWV4JGoquU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729796900; c=relaxed/simple;
	bh=6rLVkYT85aPE762YWX/Qza6i4TLO/D+UE9Oy6vAHa5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdomRbNtUYK/yiHZVsmSYt+4bpAuC6VaInsIR1TGRZMu5gz9htxZzC7l+gd8+Wx00q23aN6I/kqK3wzxl10vwf6ortnWBCrWce2+QxqD+AtBFXA2a7FLJw3rj9ysmvL174P1nQoguvksoLX882hTMZDw1p6B2JA/Xwyj5u3WSXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6Q+mA5l; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso20472501fa.1;
        Thu, 24 Oct 2024 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729796896; x=1730401696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rLVkYT85aPE762YWX/Qza6i4TLO/D+UE9Oy6vAHa5Y=;
        b=Q6Q+mA5lf7WBJuUlCJLARAkzz+6GLiaOWy8Guj4cdaJaSOSEIqCtESQotF5jmB7jn6
         uPq163tZAUiXE4jbVDe8as2ZVXu6ROAkNoXeoqWE4aCGiJwrYU9xhpi2ZgzvroOzPDG7
         OVzqWZ6EEvkBUYj/ULawhwVILp3KpicN1yWp1bwwDdCZ4SHNLzmeNDtzjy5uRg9SMPEz
         HIrtb92f8iEsbgPY7LWY/qwc+AnPYgCad8NpuqQYq0C4Hokjfk0q2EsQ7kQSKtaR1xpV
         gueyrIN6QhYvLx80fZ28KiLPuONZ0jVI1va3ncR4LQ5/LRFD2MsGAuthC2W9OSeIouTt
         iQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729796896; x=1730401696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rLVkYT85aPE762YWX/Qza6i4TLO/D+UE9Oy6vAHa5Y=;
        b=ZP5nXwy4nqByP44Kpjh7I3IfU8SKT26pEy0MgU7BmXmeDFDcjyRf5XOUKON4Y60/JT
         uI5qbQYpp+AVP6QR0MKwtjUoUnHIEYvnPQ9585RDRdWnqEWsUCZs7TmwFZzy9mh8xSSx
         JiKXAW9SFDChjhan508UgnKrv38theRE6Bxfx5byT6cNMDemo9VER2AuNzJHFbuj/swm
         aGGR0q9I43QUj/nfh6z3SnxUVJwn0CASr/dqyiu8bx07BVcZ7+ih4pBUp1z/WEW3+5hW
         zE0EYc3zCZIdoAb6WIR0ps0KMlgJf03zEX4dJTrjJAFlNiKyGBtcLuL3DbuehexrE1NW
         ZJNg==
X-Forwarded-Encrypted: i=1; AJvYcCWC2KlXjT28cp4a5tXydBve3cdliOA5RrRSPTgJVBNPPyBQBfBKoWQjgAGNhWmCzMTRIdxqPQdLkg==@lists.linux.dev, AJvYcCWUsJ0dm5+CVp+kIZvSttzFfNKLZH5ISX5vNgX+PtoGpNlSNuKaVe3D+X1BpA3pLSpzbR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOtnIUUIWp7qSQbDLPQa8HoR+4DmqGyuYKSgqvlOhIN2fIyG1N
	UQnTgEUfdYIIzig4lJV6U/LCncZC7yeHMsVTKhAsrH52He7tJxsU
X-Google-Smtp-Source: AGHT+IHZ4mZANVCLlLlCkeso+D62SLs9JJJPTEJAxC7y7llB/MjOtpAC/Bvd9WI4S3pGVoQ5GZzLJQ==
X-Received: by 2002:a05:651c:2222:b0:2f7:5a41:b0b with SMTP id 38308e7fff4ca-2fc9d34a353mr53905951fa.26.1729796895582;
        Thu, 24 Oct 2024 12:08:15 -0700 (PDT)
Received: from localhost.localdomain ([176.106.245.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad4b75bsm14747971fa.23.2024.10.24.12.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:08:15 -0700 (PDT)
From: Russian Troll Factory No23842130191005615298197021176028071661393765023998612818175484311252912213179134437986189991480920612188433236525528315786385 <vladimirputin693389@gmail.com>
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru
Subject: Magisk patch for android nox devices
Date: Thu, 24 Oct 2024 22:08:11 +0300
Message-ID: <20241024190811.14552-1-vladimirputin693389@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntb@lists.linux.dev
List-Id: <ntb.lists.linux.dev>
List-Subscribe: <mailto:ntb+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntb+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi, the linux mailing list.
You have asked me for your opinion. I present my opinion to you:
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK




