## Ubuntu Dockerfile

[Docker](https://www.docker.io/) [ElasticSearch](http://http://www.elasticsearch.org/) [Dockerfile](https://www.docker.io/learn/dockerfile/).  Also published to public [Docker Registry](https://index.docker.io/).

### Installation

1. Install [Docker](https://www.docker.io)

1. Download image from public Docker Registry: 

  ```
  docker pull dockerize/elasticsearch
  ```

   or build an image from the Dockerfile: 
   
   ```
   docker build -t dockerize/elasticsearch github.com/dockerize/elasticsearch
   ```

### Usage

```
docker run -p 9200:9200 -p 9300:9300 dockerize/elasticsearch
```
