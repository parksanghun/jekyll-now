---
layout: post
title: Java Interface
categories: [java]
tags: [java interface]
published: true
comments: true
---

### 추상클래스
- 메소드를 정의하지 않고 메소드 이름만 정해두고, 실제 메소드의 정의는 나중에 상속받는 자식클래스에서 정의하도록 한 클래스
- 정의하지 않은 메소드가 하나라도 있으면 추상클래스이다.
- 사용 목적 : 형태만 만들고 상속해서 자식클래스에서 구체화하려고 부모나 조상클래스로 만들어 두는 것

### 인터페이스 (UNTIL JAVA 7)
- 모든 메서드는 public abstract 이어야 하며, 이를 생략할 수 있다.
- 모든 멤버변수는 public static final 이어야 하며, 이를 생략할 수 있다.
- 추상클래스보다 더 단순화된 형태
- 상수와 메소드 이름으로만 구성되어있다
- 인터페이스는 어떤 기능에 대한 추상이며, 실제 구현은 그 인터페이스를 구현하는 클래스에게 맡긴다.
```java
   public interface DBLogging{
      String MONGO_DB_NAME = "ABC_Mongo_Datastore";
      String NEO4J_DB_NAME = "ABC_Neo4J_Datastore";
      String CASSANDRA_DB_NAME = "ABC_Cassandra_Datastore";

      void logInfo(String message);
      void logWarn(String message);
      void logError(String message);
      void logFatal(String message);
   }
```

### 인터페이스의 변화 (SINCE JAVA 8)
- ***인터페이스가 어떤 상태(인스턴스 변수)나 구현된 메서드를 갖는 것이 불가능했다. 하지만 Java 8부터 인터페이스가 조금 더 유연하게 바뀌었다***
- Java 8에서는 인터페이스에 기본 구현을 정의할 수 있게되었다. -> 같은 내용의 메소드를 추가 또는 작성해야하는 경우 유용
- Java 8 이전에는 여러 인터페이스가 같은 메서드를 갖더라도 어차피 구현은 클래스에서만 제공했기 때문에 문제가 되지 않았다. 
  하지만 Java 8에서 인터페이스들이 각각 동일한 메서드의 기본 구현을 제공하고, 
  클래스에서 충돌이 발생하는 메서드를 명시적으로 오버라이드 하지 않으면 컴파일러가 어떤 기본 메서드를 사용해야할 지 선택할 수 없기 때문에 문제가 발생한다.  
```java
   public interface DBLogging{
      String MONGO_DB_NAME = "ABC_Mongo_Datastore";
      String NEO4J_DB_NAME = "ABC_Neo4J_Datastore";
      String CASSANDRA_DB_NAME = "ABC_Cassandra_Datastore";

      // abstract method example
      void logInfo(String message);

      // default method example
      default void logWarn(String message){
         // Step 1: Connect to DataStore
         // Step 2: Log Warn Message
         // Step 3: Close the DataStore connection
      }
      default void logError(String message){
         // Step 1: Connect to DataStore
         // Step 2: Log Error Message
         // Step 3: Close the DataStore connection
      }
      default void logFatal(String message){
         // Step 1: Connect to DataStore
         // Step 2: Log Fatal Message
         // Step 3: Close the DataStore connection  
      }
      // static method example
      static boolean isNull(String str) {
	System.out.println("Interface Null Check");
	return str == null ? true : "".equals(str) ? true : false;
      }
      // Any other abstract, default, static methods
   }
```


### 인터페이스의 변화 (SINCE JAVA 9)
- JAVA 9 부터는 인터페이스에서 private으로 메소드 선언이 가능하다.
```java
public interface DBLogging {
	String MONGO_DB_NAME = "ABC_Mongo_Datastore";
	String NEO4J_DB_NAME = "ABC_Neo4J_Datastore";
	String CASSANDRA_DB_NAME = "ABC_Cassandra_Datastore";

	default void logInfo(String message) {
		log(message, "INFO");
	}

	default void logWarn(String message) {
		log(message, "WARN");
	}

	default void logError(String message) {
		log(message, "ERROR");
	}

	default void logFatal(String message) {
		log(message, "FATAL");
	}

	private void log(String message, String msgPrefix) {
		// Step 1: Connect to DataStore
		// Step 2: Log Message with Prefix and styles etc.
		// Step 3: Close the DataStore connection
	}
	// Any other abstract, static, default methods
}

```

[Java 9 Private methods in Interfaces](https://www.journaldev.com/12850/java-9-private-methods-interfaces)
