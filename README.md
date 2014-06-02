## ElasticSearch Dockerfile

[ElasticSearch](http://http://www.elasticsearch.org/) [Dockerfile](https://www.docker.io/learn/dockerfile/).  Also published to public [Docker Registry](https://index.docker.io/).

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
docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data dockerize/elasticsearch
```

#### Attach persistent/shared directories

1. Create a mountable data directory <data-dir> on the host.

1. Create ElasticSearch config file at <data-dir>/elasticsearch.yml.

```
path:
 logs: /data/log 
 data: /data/data
```

1. Start a container by mounting data directory and specifying the custom configuration file:

```
docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data dockerfile/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
```

After few seconds, open [http://localhost:9200] to see the result.
