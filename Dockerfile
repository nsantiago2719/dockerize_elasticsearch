#
# Ubuntu Dockerfile
#
# https://github.com/dockerize/elasticsearch
#

# pull base image
FROM dockerize/sbt:latest

MAINTAINER Dockerize "http://dockerize.github.io"

ENV VERSION 1.2.0
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${VERSION}.deb
RUN dpkg -i elasticsearch-${VERSION}.deb 

EXPOSE 9200 9300

# WORKDIR /opt/elasticsearch 
