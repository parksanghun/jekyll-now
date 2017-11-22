---
layout: post
title: JetBrainsNight
categories: [tools]
tags: [intellij, jetbrains]
published: true
comments: true
---
```
jetbrains toolbox
color scheme 
search everywhere -> sharp
recent file command E
autoscroll -> 
ctrl alt l -> doesnt use shortcut in intellj
parameter hint
alt + /
shift ctl enter -> semicolon
@Language
inject language
code folding
nyan cat -> progress bar plugin
shift ctrl J -> join string
shift ctrl alt t
type migration
analyze dataflow to field id
analyze dataflow from field id
duplicates project
editor > inspections
inspection -> type intellij version id 2017.3
quick fix -> plugins
search template
alt enter -> show messges
```
### Debugging
```
new class level watch
click debugging point and setting silent and so on
trace xxxx java9
jvm memory debugger
```
```
rest client
http file can test 
plugins -> metricsreloaded, advanced java folding

```  

## Continuous Workflow
```
hub -> single sign on 
youtrack(issue tracker) -> ide -> vcs -> upsource , teamcity
teamcity investigation -> build error 
remote run

```
## Kotlin
```
delegation
inline function
<reified T>
annonymous function
typealias -> can be useful -> deprecated
asSequence
dsl kotlin
sealed -> adt
Nothing
coroutine guide
```

### 레진코믹스
```
자바코드를 코틀린으로 점진적 수정을 하고 있다. 
기존 자바소스 변경 -> ?
새로운 소스 코틀린 -> OK
람다식
validationCheck require check
Higher order function
Extension -> 룰 정의 필요, naming을 명확하게, 너무 많이 사용하는 것은 주의해야, 패키지로 분리
안드로이드 findById 지옥에서 탈출가능
Lazy Evaluation -> lateInit - DI, mutable property
by lazy -> 빈번하게 사용하는 경우 유용 caching 처리(안드로이드의 경우 라이프사이클 이해 후 사용해야함)
JoinToString
Collection Api -> RX를 사용해 iterable을 사용할 필요없음
가독성, 생산성이 높다.
apply -> 생성과 동시에 연속적인 작업을 할 경우
with() {}
null safe 코틀린의 장점
?.let
.run
Functional Programming
github.com/funfunStudy/study/wiki
kapt -> annotation 충돌 -> build clean 후 재빌드
Toy Project & Study
퍼포먼스를 내기까지 2-3M 정도 소요된다고 생각한다.
Data -> UI -> Business Logic
KtLint
tech.lezhin.com
```