---
layout: post
title: Java Wrapper Class & Autoboxing
categories: [java]
tags: [java stream]
published: true
comments: true
---

#### 입출력과 데이터 Stream 개념
- 다양한 장비들과 통신을 하는 것을 입출력이라고 하고, java에서는 java.io 패키지에 이런 것과 관련된 클래스를 만들어 두었다
- java에서 만들어둔 java.io.InputStream은 읽어들이는 빨대, java.io.OutputStream은 내보내는 빨대


#### 문자 인코딩
- 인코딩(encoding)이라는 용어는 사람이 이해하는 문자 1글자를 컴퓨터에서 어떻게 표현하는 약속한 방식
- 한 글자를 어떻게 표현해야 "효율적"으로 표현될 수 있는가에 따른 고민의 결과

#### 입출력 속도 향상 : 버퍼의 사용
- 한 byte씩 읽거나 한 문자(char)씩 읽는 것은 컴퓨터 입장에서 보면 속도 측면에서 느리게 된다.

#### Unicode vs UTF-8
- The development of Unicode was aimed at creating a new standard for mapping the characters in a great majority of languages that are being used today, along with other characters that are not that essential but might be necessary for creating the text. UTF-8 is only one of the many ways that you can encode the files because there are many ways you can encode the characters inside a file into Unicode.
- Read more: Difference Between Unicode and UTF-8 | Difference Between | Unicode vs UTF-8 http://www.differencebetween.net/technology/difference-between-unicode-and-utf-8/#ixzz5clWLlsnk

#### NIO VS IO
- NIO allows you to manage multiple channels (network connections or files) using only a single (or few) threads, but the cost is that parsing the data might be somewhat more complicated than when reading data from a blocking stream.
- If you need to manage thousands of open connections simultanously, which each only send a little data, for instance a chat server, implementing the server in NIO is probably an advantage. Similarly, if you need to keep a lot of open connections to other computers, e.g. in a P2P network, using a single thread to manage all of your outbound connections might be an advantage. This one thread, multiple connections design is illustrated in this diagram:


#### 출처
> - [java-nio-vs-io](https://dzone.com/articles/java-nio-vs-io)
> - [IO 와 NIO](http://joochang.tistory.com/78)
> - [IO 와 NIO](https://stackoverflow.com/questions/38698182/close-java-8-stream)
