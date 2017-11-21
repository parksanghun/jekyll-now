---
layout: post
title: Clean Code
categories: [study]
tags: [clean code]
published: true
---

### 장인 정신을 익히는 과정 두 단계
* 장인에게 필요한 원칙, 패턴, 기법, 경험이라는 지식을 습득해야 한다.
* 열심히 일하고 연습해 지식을 몸과 마음으로 체득해야 한다.

### 설계 원칙
* SRP(Single Responsibility Principle)
* OCP(Open Closed Principle)
* DIP(Dependency Inversion Principle)

### 의미 있는 이름
* 의도를 분명히 밝혀라

``` java
int elapsedTimeInDays;
int daysSinceCreation;
int daysSinceModification;
int fileAgeInDays;
```

```java
public List<Cell> getFlaggedCells() {
    List<Cell> flaggedCells = new ArrayList<Cell>();
    for (Cell cell : gameBoard)
        if (cell.isFlagged())
            flaggedCells.add(cell);
    return flaggedCells;
}
```
### 발음하기 쉬운 이름을 사용하라
```java
class Customer {
    private Date generationTimestamp;
    private Date modificationTimestamp;
    private final String recordId = "102";
}
```
### 검색하기 쉬운 이름을 사용하라
```java
int realDaysPerIdealDay = 4;
const int WORK_DAYS_PER_WEEK = 5;
int sum = 0;
for (int j=0; j < NUMBER_OF_TASKS; j++) {
    int realTaskDays = taskEstimate[j] * realDaysPerIdealDay;
    int realTaskWeeks = (realTaskDays / WORK_DAYS_PER_WEEK);
    sum += realTaskWeeks;
}
```