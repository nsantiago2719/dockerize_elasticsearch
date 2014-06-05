#
# ElasticSearch Dockerfile
#
# https://github.com/dockerize/elasticsearch
#

# Pull base image
FROM dockerize/java:1.7

MAINTAINER Dockerize "http://dockerize.github.io"

# Install ElasticSearch
ENV VERSION 1.2.1
ENV FILE elasticsearch-$VERSION.tar.gz

RUN wget -O /tmp/$FILE https://download.elasticsearch.org/elasticsearch/elasticsearch/$FILE
RUN tar -xzf /tmp/$FILE -C /tmp
RUN mv /tmp/elasticsearch-$VERSION /elasticsearch
 
# Install plugins
RUN /elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
RUN /elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.1.1
RUN /elasticsearch/bin/plugin -install river-csv -url https://github.com/AgileWorksOrg/elasticsearch-river-csv/releases/download/2.0.1/elasticsearch-river-csv-2.0.1.zip

# Mountable directory
VOLUME ["data"]

# Working directory
WORKDIR /data

# Expose ports (9200: HTTP, 9300: Transport)
EXPOSE 9200 9300

# RUN
CMD ["/elasticsearch/bin/elasticsearch"]
