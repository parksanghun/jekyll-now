---
layout: post
title: Java Static
categories: [java]
tags: [java static]
published: true
comments: true
---

### Static
- 공통으로 쓰는 변수를 static 변수라고 한다 -> 한군데서 바꾸면 다른데서 사용할 때 모두 변경된 값으로 보인다
- 클래스 변수(static 변수)는 new해서 인스턴스 만들 때 만들어지는 변수가 아니고, 공통으로 사용되는 것이라서 클래스만들 때 같이 만들어진다고 보면 된다
- 인스턴스를 만들지 않아도 클래스명으로 직접 호출해서 사용할 수 있는 메소드가 클래스 메소드, 즉 static 메소드다
- 정적 메소드는 흔히 팩토리 메서드를 만드는데 사용한다 -> 팩토리 메소드는 클래스의 새로운 인스턴스를 반환하는 정적 메소드다

```java
public static void main(String[] args){
    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();
    NumberFormat percentFormatter = NumberFormat.getPercentInstance();
    double x = 0.1;
    System.out.println(currencyFormatter.format(x));
    System.out.println(percentFormatter.format(x));
}
``` 