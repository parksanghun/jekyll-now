---
layout: post
title: How To Implement TOTP (Using Google Authenticator in the Java Language)
categories: [google]
tags: [google authenticator, totp, hotp, sha-1, sha]
published: true
comments: true
---

```
Source -> via links
출처 -> 파란색 글씨인 링크를 클릭하면 됩니다.
```

## [Google Authenticator](https://en.wikipedia.org/wiki/Google_Authenticator)
Google Authenticator is an application that implements two-step verification services using the Time-based One-time Password Algorithm (TOTP) and HMAC-based One-time Password Algorithm (HOTP), for authenticating users of mobile applications by Google. The service implements algorithms specified in RFC 6238 and RFC 4226

구글 인증기 어플리케이션은 모바일 어플리케이션을 이용한 사용자 인증을 위해 TOTP와 HOTP 2단계 검증 서비스로 구현되어 있으며 이는 [RFC 6238](https://tools.ietf.org/html/rfc6238)과 [RFC 4226](https://tools.ietf.org/html/rfc4226) 두개의 알고리즘 명세를 기반으로 합니다. 

>### Technical description

The service provider generates an 80-bit secret key for each user (whereas RFC 4226 §4 requires 128 bits and recommends 160 bits).[36] This is provided as a 16, 26 or 32 character base32 string or as a QR code. The client creates an HMAC-SHA1 using this secret key. The message that is HMAC-ed can be:

- the number of 30 second periods having elapsed since the Unix epoch (TOTP); or
- the counter that is incremented with each new code (HOTP).

A portion of the HMAC is extracted and converted to a 6 digit code.

> 기술적 설명  
개인적으로 번역한 내용으로 오역이 있을 수 있습니다.

1) 서비스 제공자는 80비트의 비밀키를 각 사용자별로 생성합니다.(반면 RFC 4226 명세는 128비트를 요구하며 160비트를 권장합니다)
이것은 16, 26 또는 32자리의 base32로 인코딩된 문자열 또는 QR code로 제공됩니다.

2) 클라이언트는 이 비밀키를 사용하여 HMAC-SHA1을 생성합니다.

이 HMAC는 

- 30초 제한을 가진 숫자(TOTP) 또는
- 카운터에 의해 증가된 새로운 코드(HOTP)

가 될 수 있습니다 

HMAC의 일부는 6자리의 숫자 코드로 추출 그리고 변환됩니다.

## [TOTP(Time-based One-time Password Algorithm)](https://en.wikipedia.org/wiki/Time-based_One-time_Password_Algorithm)
Time-based One-time Password Algorithm (TOTP) is an algorithm that computes a one-time password from a shared secret key and the current time. It has been adopted as Internet Engineering Task Force standard RFC 6238,[1] is the cornerstone of Initiative For Open Authentication (OATH), and is used in a number of two-factor authentication systems.

TOTP is an example of a hash-based message authentication code (HMAC). It combines a secret key with the current timestamp using a cryptographic hash function to generate a one-time password. The timestamp typically increases in 30-second intervals, so passwords generated close together in time from the same secret key will be equal.

> 개인적으로 번역한 내용으로 오역이 있을 수 있습니다.

시간 기반 일회성 비밀번호 알고리즘은 공유된 비밀키와 현재 시간을 바탕으로 일회성 비밀번호를 산출합니다. 이는 표준 인증 방식인 OAUTH를 계획하기 위한 초기 기반 작업과 2단계 인증의 다양한 용도로 사용되고 있는 국제인터넷표준화기구(IETF)의 표준 RFC 6238로 부터 채용되어진 것입니다. 

TOTP는 해시 기반 메시지 인증 코드(HMAC)의 한 예입니다. 이것은 하나의 비밀 키와 현재 [timestamp](http://terms.naver.com/entry.nhn?docId=1597328&cid=50376&categoryId=50376)를 결합하여 해시 기반 암호화 방식으로 생성된 일회성 비밀번호입니다. 
timestamp는 일반적으로 30초 주기로 증가하며, 비밀키가 동일하다면 기존에 생성되어진 비밀번호들은 생성과 동시에 사용할 수 없게 됩니다.


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

한글 설명 생략(추후 or 아직은 안할 생각 왜냐면 이해하기 어렵다... 16진수 0x7FFFFFFF은 int형 최대수란거...)

## [Hash-based message authentication code](https://en.wikipedia.org/wiki/Hash-based_message_authentication_code)
In cryptography, a keyed-hash message authentication code (HMAC) is a specific type of message authentication code (MAC) involving a cryptographic hash function (hence the 'H') in combination with a secret cryptographic key. As with any MAC, it may be used to simultaneously verify both the data integrity and the authentication of a message. Any cryptographic hash function, such as MD5 or SHA-1, may be used in the calculation of an HMAC; the resulting MAC algorithm is termed HMAC-MD5 or HMAC-SHA1 accordingly. The cryptographic strength of the HMAC depends upon the cryptographic strength of the underlying hash function, the size of its hash output, and on the size and quality of the key.

An iterative hash function breaks up a message into blocks of a fixed size and iterates over them with a compression function. For example, MD5 and SHA-1 operate on 512-bit blocks. The size of the output of HMAC is the same as that of the underlying hash function (128 or 160 bits in the case of MD5 or SHA-1, respectively), although it can be truncated if desired.

The definition and analysis of the HMAC construction was first published in 1996 by Mihir Bellare, Ran Canetti, and Hugo Krawczyk,[1] who also wrote RFC 2104. This paper also defined a variant called NMAC that is rarely, if ever, used. FIPS PUB 198 generalizes and standardizes the use of HMACs. HMAC-SHA1 and HMAC-MD5 are used within the IPsec and TLS protocols.

> [HMAC-SHA1](https://msdn.microsoft.com/ko-kr/library/system.security.cryptography.hmacsha1(v=vs.110).aspx)  
*참고로 이 내용은 위 영어 문단을 해석한 내용이 아님.*

HMAC-SHA1은 SHA1 해시 함수를 사용하여 구현되고 HMAC(해시 기반 메시지 인증 코드)로 사용되는 키 지정 해시 알고리즘입니다. HMAC 프로세스는 비밀 키를 메시지 데이터와 혼합하여 그 결과를 해시 함수로 해시한 다음 해시 값을 다시 비밀 키와 혼합한 후 해시 함수를 한 번 더 적용합니다. 출력 해시의 길이는 160비트입니다.

HMAC는 송신자와 수신자가 비밀 키를 공유할 경우 보안되지 않은 채널을 통해 보낸 메시지가 훼손되었는지 여부를 확인하는 데 사용할 수 있습니다. 송신자는 원래 데이터의 해시 값을 계산하여 원래 데이터와 해시 값을 모두 단일 메시지로 보냅니다. 수신자는 받은 메시지에 대해 해시 값을 다시 계산하고 계산된 HMAC가 전송된 HMAC와 일치하는지 확인합니다.

메시지를 변경하거나 올바른 해시 값을 다시 만들기 위해서는 비밀 키를 알아야 하므로 데이터나 해시 값을 변경하면 불일치 상태가 발생합니다. 그러므로 원래 해시 값과 계산된 해시 값이 일치할 경우 메시지가 인증됩니다.

## [SHA-1(Secure Hash Algorithm 1)](https://en.wikipedia.org/wiki/SHA-1)
In cryptography, SHA-1 (Secure Hash Algorithm 1) is a cryptographic hash function designed by the United States National Security Agency and is a U.S. Federal Information Processing Standard published by the United States NIST.[2] SHA-1 produces a 160-bit (20-byte) hash value known as a message digest. A SHA-1 hash value is typically rendered as a hexadecimal number, 40 digits long.

SHA-1 is no longer considered secure against well-funded opponents. In 2005, cryptanalysts found attacks on SHA-1 suggesting that the algorithm might not be secure enough for ongoing use,[3] and since 2010 many organizations have recommended its replacement by SHA-2 or SHA-3.[4][5][6] Microsoft,[7] Google[8] and Mozilla[9][10][11] have all announced that their respective browsers will stop accepting SHA-1 SSL certificates by 2017.

> [SHA Korean Wiki](https://ko.wikipedia.org/wiki/SHA)  
*참고로 이 내용도 위 영어 문단을 해석한 내용이 아님.*

최초의 알고리즘은 1993년에 미국 표준 기술 연구소(NIST)에 의해 안전한 해시 표준(Secure Hash Standard, FIPS PUB 180)으로 출판되었으며, 다른 함수들과 구별하려 보통 SHA-0이라고 부른다. 얼마 안 있어 NSA는 이 표준을 폐기했고, 1995년에 개정된 알고리즘(FIPS PUB 180-1)을 새로 출판했으며 이를 SHA-1이라고 부른다. SHA-1은 SHA-0의 압축 함수에 비트 회전 연산을 하나 추가한 것으로, NSA에 따르면 이는 원래 알고리즘에서 암호학적 보안을 감소시키는 문제점을 고친 것이라고 하지만 실제로 어떤 문제점이 있었는지는 공개하지 않았다. 일반적으로 SHA-1은 SHA-0보다 암호학적 공격이 힘든 것으로 알려져 있으며, 따라서 NSA의 주장은 어느 정도 설득력이 있다. SHA-0과 SHA-1은 최대 264비트의 메시지로부터 160비트의 해시값을 만들어 내며, 로널드 라이베스트가 MD4 및 MD5 해시 함수에서 사용했던 것과 비슷한 방법에 기초한다.

NIST는 나중에 해시값의 길이가 더 긴 네 개의 변형을 발표했으며, 이들을 통칭하여 SHA-2라 부른다. SHA-256, SHA-384, SHA-512는 2001년에 초안으로 처음으로 발표되었으며, 2002년에 SHA-1과 함께 정식 표준(FIPS PUB 180-2)으로 지정되었다. 2004년 2월에 삼중 DES의 키 길이에 맞춰 해시값 길이를 조정한 SHA-224가 표준에 추가되었다. SHA-256과 SHA-512는 각각 32비트 및 64비트 워드를 사용하는 해시 함수이며, 몇몇 상수들이 다르긴 하지만 그 구조는 라운드의 수를 빼고는 완전히 같다. SHA-224와 SHA-384는 서로 다른 초기값을 가지고 계산한 SHA-256과 SHA-512 해시값을 최종 해시값 길이에 맞춰 잘라낸 것이다.

## [Hash](https://en.wikipedia.org/wiki/Cryptographic_hash_function)  
A cryptographic hash function is a mathematical algorithm that maps data of arbitrary size to a bit string of a fixed size (a hash function) which is designed to also be one-way function, that is, a function which is infeasible to invert. The only way to recreate the input data from an ideal cryptographic hash function's output is to try a large number of possible inputs to see if they produce a match. Bruce Schneier has called one-way hash functions "the workhorses of modern cryptography".[1] The input data is often called the message, and the output (the hash value or hash) is often called the message digest or simply the digest.

> [해시 함수](http://terms.naver.com/entry.nhn?docId=2765595&cid=50307&categoryId=50307)  
*참고로 이 내용도 위 영어 문단을 해석한 내용이 아님.*

해시 함수(혹은 Hash로 표기)는 임의의 길이의 입력 메세지를 고정된 길이의 출력값으로 압축시키는 함수이다. 데이타의 무결성 검증, 메세지 인증에 사용한다. 해시 함수는 일방향성과 충돌 회피성이라는 2가지 성질을 만족해야 한다. 먼저, 일방향성은 주어진 해시 값 h에 대해서 H(x)=h를 만족하는 값을 찾는 것이 계산적으로 불가능한 것을 말한다. 다음, 강한 충돌 회피성이란 주어진 x에 대해 H(x)=H(y)를 만족하는 임의의 입력 메세지 y(x)x)를 찾는 것이 계산적으로 불가능함을 뜻한다.

## Source References
- [google-authenticator-github](https://github.com/google/google-authenticator.git) - c  
- [Generate Secret Key And Test](https://github.com/wstrange/GoogleAuth) - java

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

- [Generate TOTP And Test](https://github.com/aerogear/aerogear-otp-java)  - java

```java
    @Test
    public void testOtpAfter31seconds() throws Exception {
        when(clock.getCurrentInterval()).thenReturn(addElapsedTime(0) - 1);
        String otp = totp.now();
        when(clock.getCurrentInterval()).thenReturn(addElapsedTime(31));
        assertFalse("OTP should be invalid", totp.verify(otp));
    }
```