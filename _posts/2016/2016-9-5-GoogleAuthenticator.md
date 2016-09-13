---
layout: post
title: How To Implement TOTP (Using Google Authenticator in the Java Language)
categories: [google]
tags: [google authenticator, totp, hotp, sha-1, sha]
published: true
---

## [Google Authenticator](https://en.wikipedia.org/wiki/Google_Authenticator)
Google Authenticator is an application that implements two-step verification services using the Time-based One-time Password Algorithm (TOTP) and HMAC-based One-time Password Algorithm (HOTP), for authenticating users of mobile applications by Google. The service implements algorithms specified in RFC 6238 and RFC 4226

구글 인증기 어플리케이션은 모바일 어플리케이션을 이용한 사용자 인증을 위해 TOTP와 HOTP 2단계 검증 서비스로 구현되어 있으며 이는 RFC 6238과 RFC 4226 두개의 알고리즘 명세를 기반으로 합니다. 

>### Technical description

The service provider generates an 80-bit secret key for each user (whereas RFC 4226 §4 requires 128 bits and recommends 160 bits).[36] This is provided as a 16, 26 or 32 character base32 string or as a QR code. The client creates an HMAC-SHA1 using this secret key. The message that is HMAC-ed can be:

- the number of 30 second periods having elapsed since the Unix epoch (TOTP); or
- the counter that is incremented with each new code (HOTP).

A portion of the HMAC is extracted and converted to a 6 digit code.

> 기술적 설명

1) 서비스 제공자는 80비트의 비밀키를 각 사용자별로 생성합니다.(반면 RFC 4226 명세는 128비트와 160비트를 권장합니다)
이것은 16, 26 또는 32자리의 base32로 인코딩된 문자열 또는 QR code로 제공됩니다.

2) 클라이언트는 HMAC-SHA1 알고리즘을 이용하여 비밀키를 생성합니다.

이 비밀키는 

- 30초 제한을 가진 숫자(TOTP) 또는
- 카운터에 의해 증가된 새로운 코드(HOTP)

가 될 수 있습니다 

HMAC의 일부는 6자리의 숫자 코드로 추출 그리고 변환됩니다.

## [TOTP(Time-based One-time Password Algorithm)](https://en.wikipedia.org/wiki/Time-based_One-time_Password_Algorithm)
Time-based One-time Password Algorithm (TOTP) is an algorithm that computes a one-time password from a shared secret key and the current time. It has been adopted as Internet Engineering Task Force standard RFC 6238,[1] is the cornerstone of Initiative For Open Authentication (OATH), and is used in a number of two-factor authentication systems.

TOTP is an example of a hash-based message authentication code (HMAC). It combines a secret key with the current timestamp using a cryptographic hash function to generate a one-time password. The timestamp typically increases in 30-second intervals, so passwords generated close together in time from the same secret key will be equal.



## [HOTP(HMAC-based One-time Password Algorithm)](https://en.wikipedia.org/wiki/HMAC-based_One-time_Password_Algorithm)
HOTP is an HMAC-based one-time password (OTP) algorithm. It is a cornerstone of Initiative For Open Authentication (OATH).

>### Definition

- K be a secret key
- C be a counter
- HMAC(K,C) = SHA1(K ⊕ 0x5c5c… ∥ SHA1(K ⊕ 0x3636… ∥ C)) with ⊕ as XOR, ∥ as concatenation, for more details see HMAC (C is the message)
- Truncate be a function that selects 4 bytes from the result of the HMAC in a defined manner

Then HOTP(K,C) is mathematically defined by

HOTP(K,C) = Truncate(HMAC(K,C)) & 0x7FFFFFFF
The mask 0x7FFFFFFF sets the result's most significant bit to zero. This avoids problems if the result is interpreted as a signed number as some processors do.[1]

For HOTP to be useful for an individual to input to a system, the result must be converted into a HOTP value, a 6–8 digits number that is implementation dependent.

HOTP-Value = HOTP(K,C) mod 10d, where d is the desired number of digits

## [SHA-1(Secure Hash Algorithm 1)](https://en.wikipedia.org/wiki/SHA-1)
In cryptography, SHA-1 (Secure Hash Algorithm 1) is a cryptographic hash function designed by the United States National Security Agency and is a U.S. Federal Information Processing Standard published by the United States NIST.[2] SHA-1 produces a 160-bit (20-byte) hash value known as a message digest. A SHA-1 hash value is typically rendered as a hexadecimal number, 40 digits long.

SHA-1 is no longer considered secure against well-funded opponents. In 2005, cryptanalysts found attacks on SHA-1 suggesting that the algorithm might not be secure enough for ongoing use,[3] and since 2010 many organizations have recommended its replacement by SHA-2 or SHA-3.[4][5][6] Microsoft,[7] Google[8] and Mozilla[9][10][11] have all announced that their respective browsers will stop accepting SHA-1 SSL certificates by 2017.

>### [SHA Korean Wiki](https://ko.wikipedia.org/wiki/SHA)

SHA(Secure Hash Algorithm, 안전한 해시 알고리즘) 함수들은 서로 관련된 암호학적 해시 함수들의 모음이다. 이들 함수는 미국 국가안보국(NSA)이 1993년에 처음으로 설계했으며 미국 국가 표준으로 지정되었다. SHA 함수군에 속하는 최초의 함수는 공식적으로 SHA라고 불리지만, 나중에 설계된 함수들과 구별하기 위하여 SHA-0이라고도 불린다. 2년 후 SHA-0의 변형인 SHA-1이 발표되었으며, 그 후에 4종류의 변형, 즉 SHA-224, SHA-256, SHA-384, SHA-512가 더 발표되었다. 이들을 통칭해서 SHA-2라고 하기도 한다.

SHA-1은 SHA 함수들 중 가장 많이 쓰이며, TLS, SSL, PGP, SSH, IPSec 등 많은 보안 프로토콜과 프로그램에서 사용되고 있다. SHA-1은 이전에 널리 사용되던 MD5를 대신해서 쓰이기도 한다. 혹자는 좀 더 중요한 기술에는 SHA-256이나 그 이상의 알고리즘을 사용할 것을 권장한다.

SHA-0과 SHA-1에 대한 공격은 이미 발견되었다. SHA-2에 대한 공격은 아직 발견되지 않았으나, 전문가들은 SHA-2 함수들이 SHA-1과 비슷한 방법을 사용하기 때문에 공격이 발견될 가능성이 있다고 지적한다. 미국 표준 기술 연구소(NIST)는 SHA-3로 불리는 새로운 암호화 해시 알고리즘에 대한 후보를 공모하였다.

## Source References
- [Generate Secret Key And Test](https://github.com/wstrange/GoogleAuth)

```java
    @Test
    public void createAndAuthenticate()
    {
        final GoogleAuthenticator ga = new GoogleAuthenticator();
        final GoogleAuthenticatorKey key = ga.createCredentials();

        System.out.println("Secret Key = " + key.getKey());
        System.out.println("TOTP = " + ga.getTotpPassword(key.getKey()));

        assertTrue(ga.authorize(key.getKey(), ga.getTotpPassword(key.getKey())));
    }
```

- [Generate TOTP And Test](https://github.com/aerogear/aerogear-otp-java) 

```java
    @Test
    public void testOtpAfter31seconds() throws Exception {
        when(clock.getCurrentInterval()).thenReturn(addElapsedTime(0) - 1);
        String otp = totp.now();
        when(clock.getCurrentInterval()).thenReturn(addElapsedTime(31));
        assertFalse("OTP should be invalid", totp.verify(otp));
    }
```
