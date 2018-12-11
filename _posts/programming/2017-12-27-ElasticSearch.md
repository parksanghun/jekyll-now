---
layout: post
title: Elasticsearch
categories: [programming]
tags: [elasticsearch engine]
published: true
---

## Basic Concepts
### Near Realtime(NRT)
- Elasticsearch is a near real time search platform. What this means is there is a slight latency (normally one second) from the time you index a document until the time it becomes searchable.
      
### Cluster
- A cluster is a collection of one or more nodes (servers) that together holds your entire data and provides federated indexing and search capabilities across all nodes.
- Make sure that you don’t reuse the same cluster names in different environments, otherwise you might end up with nodes joining the wrong cluster. 

### Node
- A node is a single server that is part of your cluster, stores your data, and participates in the cluster’s indexing and search capabilities.
- ust like a cluster, a node is identified by a name which by default is a random Universally Unique IDentifier (UUID) that is assigned to the node at startup. 

### Index
- An index is a collection of documents that have somewhat similar characteristics.

### ~~Type~~
- Deprecated in 6.0.0.

### Document
- A document is a basic unit of information that can be indexed.

### Shards & Replicas
- An index can potentially store a large amount of data that can exceed the hardware limits of a single node. For example, a single index of a billion documents taking up 1TB of disk space may not fit on the disk of a single node or may be too slow to serve search requests from a single node alone.
To solve this problem, Elasticsearch provides the ability to subdivide your index into multiple pieces called shards. When you create an index, you can simply define the number of shards that you want. Each shard is in itself a fully-functional and independent "index" that can be hosted on any node in the cluster.

- Sharding is important for two primary reasons:
  * It allows you to horizontally split/scale your content volume
  * It allows you to distribute and parallelize operations across shards (potentially on multiple nodes) thus increasing performance/throughput

- To summarize, each index can be split into multiple shards. An index can also be replicated zero (meaning no replicas) or more times. Once replicated, each index will have primary shards (the original shards that were replicated from) and replica shards (the copies of the primary shards). The number of shards and replicas can be defined per index at the time the index is created. After the index is created, you may change the number of replicas dynamically anytime but you cannot change the number of shards after-the-fact.
- By default, each index in Elasticsearch is allocated 5 primary shards and 1 replica which means that if you have at least two nodes in your cluster, your index will have 5 primary shards and another 5 replica shards (1 complete replica) for a total of 10 shards per index.

> Each Elasticsearch shard is a Lucene index. There is a maximum number of documents you can have in a single Lucene index. As of LUCENE-5843, the limit is 2,147,483,519 (= Integer.MAX_VALUE - 128) documents. You can monitor shard sizes using the _cat/shards API.

## Create Index
- Default for number_of_shards is 5
- Default for number_of_replicas is 1 (ie one replica for each primary shard)
```
curl -XPUT 'localhost:9200/twitter?pretty' -H 'Content-Type: application/json' -d'
{
    "settings" : {
        "index" : {
            "number_of_shards" : 3, 
            "number_of_replicas" : 2 
        }
    }
}
'
```

- GET /_cat/health?v
- GET /_cat/indices?v
- PUT /customer?pretty : PUT 동사를 사용하여 "customer"라는 이름의 색인을 만듭니다 PUT 동사를 사용하여 "customer"라는 이름의 색인을 만듭니다. 단, 호출의 끝에 `pretty`를 추가하여 JSON 응답이 있다면 pretty-print를 수행하게 합니다.



    

