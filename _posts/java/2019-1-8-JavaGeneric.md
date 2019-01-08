---
layout: post
title: Java Generic
categories: [java]
tags: [java generic]
published: true
comments: true
---
### Lesson: Generics 
In any nontrivial software project, bugs are simply a fact of life. Careful planning, programming, and testing can help reduce their pervasiveness, but somehow, somewhere, they'll always find a way to creep into your code. This becomes especially apparent as new features are introduced and your code base grows in size and complexity.

Fortunately, some bugs are easier to detect than others. Compile-time bugs, for example, can be detected early on; you can use the compiler's error messages to figure out what the problem is and fix it, right then and there. Runtime bugs, however, can be much more problematic; they don't always surface immediately, and when they do, it may be at a point in the program that is far removed from the actual cause of the problem.

Generics add stability to your code by making more of your bugs detectable at compile time.


Generics was added in Java 5 to provide compile-time type checking and removing risk of ClassCastException that was common while working with collection classes. The whole collection framework was re-written to use generics for type-safety. Let’s see how generics help us using collection classes safely.

### Why Use Generics?

Code that uses generics has many benefits over non-generic code:

- Stronger type checks at compile time.

    A Java compiler applies strong type checking to generic code and issues errors if the code violates type safety. Fixing compile-time errors is easier than fixing runtime errors, which can be difficult to find.

- Elimination of casts.

    The following code snippet without generics requires casting:
```java
    List list = new ArrayList();
    list.add("hello");
    String s = (String) list.get(0);
```
    
- When re-written to use generics, the code does not require casting:
```java
    List<String> list = new ArrayList<String>();
    list.add("hello");
    String s = list.get(0);   // no cast
```
- Enabling programmers to implement generic algorithms.
By using generics, programmers can implement generic algorithms that work on collections of different types, can be customized, and are type safe and easier to read.

### The most commonly used type parameter names are:
```
E - Element (used extensively by the Java Collections Framework)
K - Key
N - Number
T - Type
V - Value
S,U,V etc. - 2nd, 3rd, 4th types
``` 

### What is the difference between '?', 'E', and 'T' for Java generics?
there's no difference between the first two - they're just using different names for the type parameter (E or T).

The third isn't a valid declaration - ? is used as a wildcard which is used when providing a type argument, e.g. List<?> foo = ... means that foo refers to a list of some type, but we don't know what.

- The Diamond

    In Java SE 7 and later, you can replace the type arguments required to invoke the constructor of a generic class with an empty set of type arguments (<>) as long as the compiler can determine, or infer, the type arguments from the context. This pair of angle brackets, <>, is informally called the diamond. For example, you can create an instance of Box<Integer> with the following statement:
```java
Box<Integer> integerBox = new Box<>();
```

- Multiple Bounds

    The preceding example illustrates the use of a type parameter with a single bound, but a type parameter can have multiple bounds:

```java
<T extends B1 & B2 & B3>
```
A type variable with multiple bounds is a subtype of all the types listed in the bound. If one of the bounds is a class, it must be specified first. For example:

```java
Class A { /* ... */ }
interface B { /* ... */ }
interface C { /* ... */ }

class D <T extends A & B & C> { /* ... */ }
If bound A is not specified first, you get a compile-time error:

class D <T extends B & A & C> { /* ... */ }  // compile-time error
```
