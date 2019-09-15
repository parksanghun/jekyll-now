---
layout: post
title: Difference between Java SE/EE/ME?
categories: [java]
tags: [java ee se]
published: true
comments: true
---

### Difference between Java SE/EE/ME?

> 원티드 이력서를 작성하다가 자바 개발 언어가 Core, EE, SE로 나뉘어 있어 명확히 하고자 정리

#### Search
[oracle doc](https://docs.oracle.com/en/java/)

[wiki Java_Platform,_Enterprise_Edition](https://en.wikipedia.org/wiki/Java_Platform,_Enterprise_Edition)

[just-what-is-java-ee-really](https://stackoverflow.com/questions/15774924/just-what-is-java-ee-really)

#### Java Platform, Standard Edition (Java SE)
Java SE lets you develop and deploy Java applications on desktops and servers. Java SE and component technologies offer the rich user interface, performance, versatility, portability, and security that today's applications require.

#### Java Embedded
Java ME Embedded is designed for resource-constrained devices like wireless modules for M2M, industrial control, smart-grid infrastructure, environmental sensors and tracking, and more.

#### Java Platform, Enterprise Edition (Java EE)
Java EE provides an API and runtime environment for developing and running large, multi-tiered, reliable, and secure enterprise applications that are portable and scalable and that integrate easily with legacy applications and data.

#### Wiki
Java Enterprise Edition (Java EE), formerly Java 2 Platform, Enterprise Edition (J2EE), currently Jakarta EE, is a set of specifications, extending Java SE 8 with specifications for enterprise features such as distributed computing and web services. Java EE applications are run on reference runtimes, that can be microservices or application servers, which handle transactions, security, scalability, concurrency and management of the components it is deploying.

Java EE is defined by its specification. The specification defines APIs (application programming interface) and their interactions. As with other Java Community Process specifications, providers must meet certain conformance requirements in order to declare their products as Java EE compliant.

Examples of contexts in which Java EE referencing runtimes are used are: e-commerce, accounting, banking information systems.

### Jakarta EE Architecture Diagram
[image from jakarta ee site](https://jakarta.ee/specifications/platform/8/platform-spec-8.html#architecture)
![jakartaEEArchitectureDiagram](/images/jakartaEEArchitectureDiagram.png)

#### Conclusion
> 정의만 놓고 보면 EE의 기능을 JDK설치시 대부분 가능하기 때문에 혼동이 오는데 이분법적으로 EE만 사용하다는 개념보다는 JAVA SE의 기능을 보다 확장시킨 것이 EE이며 그것에 대한 상세 명세들을 제공한다라고 생각하면 될 듯...