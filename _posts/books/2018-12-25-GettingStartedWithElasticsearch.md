---
layout: post
title: GettingStartedWithElasticsearch
categories: [books]
tags: [book pragamtic]
published: true
comments: true
---
# Elasticsearch(시작하세요! 엘라스틱서치) 

> 시작하세요! 엘라스틱서치를 읽고 정리를 해보자!!

#### 서문
정보의 홍수 속에서 필요로하는 정확한 데이터를 검색하여 찾는 기술은 무엇보다 중요해졌다.
데이터를 검색하는 데 있어 전 세계적으로 가장 널리 사용되고 있는 기술 중 하나가 바로 아파치 루씬(Apache Lucene)이다.
루씬 라이브러리를 실무에서 사용하기 위해 솔루션이 개발되고 있는데 가장 최근에 개발돼 선풍적인 인기를 끌고 있는 솔루션이 바로 엘라스틱서치다.

#### 엘라스틱서치 사용 사례
- 위키피디아(Wikipedia)는 엘라스틱서치를 이용해 전문검색(Full Text Search)을 수행하고 실시간 타이핑 검색, 추천 검색어 기능 등에 활용 중이다.
- 더 가디안(The Guadian)지는 방문객의 로그 분석을 통한 소셜 데이터를 생성해 실시간 응대와 기사에 대한 반응 분석 등에 엘라스틱서치를 사용하고 있다.
- 스택오버플로우(StackOverflow)에서는 검색 내용과 결과를 통합해 유사한 질문과 해답을 연결하는 데 엘라스틱서치를 사용 중이다.
- 깃허브(Github)에서는 1,300억 줄이 넘는 소스 코드를 검색하는 데 엘라스틱서치를 사용 중이다.
- 골드만 삭스(Goldman Sachs)에서는 매일 5TB가 넘는 데이터를 저장하고 있으며, 엘라스틱서치를 이용해 이 데이터를 주식 시장의 변동을 분석하는 데 사용한다.

#### 데이터 처리
##### PUT
``` 
PUT books/book/1
{
  "title" : "Elasticsearch Guide",
  "author" : "Park",
  "date" : "2018-12-25",
  "pages" : 250
}
```

##### GET
```
GET books/book/1
# 메타 정보를 제외한 데이터값만 조회
GET books/book/1/_source
```

##### DELETE
```
DELETE books/book/1
```

##### UPDATE
- 업데이트는 _update API의 두 개의 매개 변수인 doc와 script를 이용해서 데이터를 제어할 수 있다.
- doc 매개 변수는 도규먼트에 새로운 필드를 추가하거나 기존 필드 값을 변경하는 데 사용한다.
- script 매개 변수는 좀 더 복잡한 프로그래밍 기법을 사용해서 입력된 내용에 따라 필드의 값을 변경하는 등의 처리에 사용한다.
```
# doc 
POST books/book/1/_update
{
  "doc" : {
    "category" : "ICT"
  }
}
# script 
POST books/book/1/_update
{
  "script": "ctx._source.pages += 50"
}
# script 
POST books/book/1/_update
{
  "script": "ctx._source.author.add(\"Lee\")"
}
```

#### 검색
> - took : 검색 소요된 시간으로 밀리 초(1/1000초) 단위로 출력된다.
> - curl 명령 조회시 공백의 경우 url 인코딩 형식(%20)으로 입력해야함.
> - 조건 명령어를 지정하지 않고 공백으로 질의어를 나누면 기본값인 OR로 인식한다.

##### 멀티 테넌시(multi tenancy)
- 여러 인덱스를 동시에 검색하는 기능
- 사용 방법은 검색할 인덱스를 쉼표(,)로 구분해서 입력
```
$ curl 'localhost:9200/books, magazines/_search?q=time&pretty'
```