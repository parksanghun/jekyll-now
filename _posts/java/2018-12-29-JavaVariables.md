---
layout: post
title: Java Variable
categories: [java]
tags: [java variable]
published: true
comments: true
---

## 변수의 종류
- 클래스 변수, 인스턴스 변수, 지역 변수 3가지가 있다.
- 그 중 클래스 변수와 인스턴스 변수를 멤버 변수라고 한다.  

1. 클래스 변수
    * 인스턴스 변수에 static을 붙였을 경우(메모리에 딱 한번만 올라감)
    * 클래스가 메모리에 올라올때 생성
    * 결국 변수의 범위가 클래스에 한정됨 따라서, 클래스 변수(개인 정리)
2. 인스턴스 변수
    * 객체가 생성될 때(new를 사용해 메모리를 할당할 때) 생성
    * 변수 생성 시점이 인스턴스의 범위에 해당되므로, 인스턴스 변수(개인 정리)
3. 지역 변수
    * 변수 선언문이 수행될 때 생성
    
```java
public class Test {
    int instanceVariable; 
    static int classVariable; 
    void method() { 
        int localVariable; 
    }
}
```