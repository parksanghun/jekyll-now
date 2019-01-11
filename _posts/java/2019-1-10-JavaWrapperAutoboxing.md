---
layout: post
title: Java Wrapper Class & Autoboxing
categories: [java]
tags: [java autoboxing wrapper class]
published: true
comments: true
---

#### Wrapper 클래스란?
- 원래 자료형에다가 랩을 씌운 클래스라고 하여 Wrapper 클래스인 것이다

| 기본형 타입    | wrapper class |
|-------------|---------------|
| byte        | Byte          |
| short       | Short         |
| int         | Integer       |
| long        | Long          |
| float       | Float         |
| double      | Double        |
| char        | Charater      |
| boolean     | Boolean       |
| void        | Void          |


| a | b | c |
|---|---|---|
| 1 | 2 | 3 |
| 4 | 5 | 6 |
| 7 | 8 | 9 |


| <center>type | <center>바이트 수 | <center>범위 | <center>설명 |
| :------- | :------- | :------- | :------- |
| **숫자 형식** | 
| INT() | 4 | 약 -21억 ~ +21억 | 정수형 |
| BIGINT() | 8 | 약-900경 ~ +900경 | 정수형 |
| FLOAT | 4 | 소수점 아래 7자리까지 표현 | 부동소수점 (12.1242) |
| DOUBLE | 8 | 소수점 아래 15자리까지 표현 | 부동소수점 |
| **문자 형식** | 
| CHAR(n) | ? | 최대 255글자 | 고정길이 문자형. n은 글자수. CHAR=CHAR(1). |
| VARCHAR(n) | ? | 최대 65535글자 | 가변길이 문자형. Variable Character. 용량 절약에 유리 |
| BINARY(n) | 1~255 | | 고정길이 이진 데이터 값 |
| VARBINARY(n) | 1~255 | | 가변길이 이진 데이터 값 |
| TINYTEXT | | | 최대 255글자 | 
| TEXT | | 최대 65535글자| 글 본문 |
| **날짜 형식** |
| DATE | 3 | | YYYY-MM-DD |
| DATETIME | 8 | | YYYY-MM-DD HH:MM:SS |
| TIME | 3 | | HH:MM:SS |
| TIMESTAMP | 4 | | 이후로 지난 시간 | 


### 참고
> - [자바 메모리 구조](http://hoonmaro.tistory.com/19)
> - [java datatype](https://againsee.com/2018/06/15/java-datatype/)

