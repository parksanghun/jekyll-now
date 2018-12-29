---
layout: post
title: Basic Java
categories: [books]
tags: [book java]
published: true
comments: true
---

접근제어 지시자
```    
public(전체공개) > protected(상속 or 패키지내부) > default(패키지 내부) > private(클래스 내부)
```

멤버변수는 override 되지 않는다, 단지 hiding 될 뿐.
- Hiding Fields
  
> Within a class, a field that has the same name as a field in the superclass hides the superclass's field, even if their types are different. Within the subclass, the field in the superclass cannot be referenced by its simple name. Instead, the field must be accessed through super, which is covered in the next section. Generally speaking, we don't recommend hiding fields as it makes code difficult to read.

```java
public class Car {
    public String owner = "철수";
}

public class PremiumCar extends Car {
    public String owner = "영희";
}

public static void main(String[] args) {
    Car pCar = new PremiumCar();
    System.out.println(pCar.owner); // 철수
}
```

업 캐스팅
- 파생 타입의 객체 참조를 베이스 타입으로 처리하는 것
- 전체 집합에서 부분 집합으로 타입을 바꾸는 셈이므로 파생 클래스에서 추가로 가지고 있는 메소드를 호출할 수 없게 된다.
단, 오버라이딩된 메소드는 파생 클래스의 것이 호출된다.

Exception 실행시 우선순위

```java
public class ExceptionTest {
    public static void main(String[] args) {
        try {
            throw new NumberFormatException("123");
        } catch (NumberFormatException e) {
            System.out.println("NumberFormatException");
        } catch (Exception e) {
            System.out.println("Exception");
        }
    }
}

결과 : NumberFormatException
```
- JVM 에서는 첫번째 Catch 블록에서 부터 호출된 예외를 처리한 Catch 블럭을 찾아 내려오기 때문이다. 
만약 가능한 예외 블록이 있다면, 비교를 멈추고 catch 블록에 정의된 예외처리 코드들을 실행하게 된다.

