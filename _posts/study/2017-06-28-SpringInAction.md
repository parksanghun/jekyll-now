---
layout: post
title: Spring In Action
categories: [programming]
tags: [spring, java, book]
published: true
---

```
주요 내용정리
```
### 자바 개발 간소화를 지원하기 위해 스프링은 네 가지 주요 전략을 사용한다.
* POJO를 이용한 가볍고(lightweight) 비침투적(non-invasive)인 개발
* DI와 인터페이스 지향(interface orientation)을 통한 느슨한 결합도(loose coupling)
* 애스펙트와 공통 규약을 통한 선언적(declarative) 프로그래밍
* 애스펙트와 템플릿(template)을 통한 반복적인 코드 제거

> 비침투적 개발이란, 바탕이 되는 기술을 사용하는 클래스, 인터페이스, API 등을 코드에 직접 나타내지 않는 방법이다. 복잡함을 분리할 수 있다.

### 종속객체 주입(DI, Dependency Injection)
종속객체 주입은 객체가 스스로 종속객체를 획득하는 것과는 반대로 객체에 종속객체가 부여되는 것을 의미한다.
![DI](../../images/spring-in-action/di.png)
애플리케이션 컴포넌트 간의 관계를 정하는 것을 **와이어링(wiring)**이라고 한다.
