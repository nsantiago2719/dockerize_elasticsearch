#
# ElasticSearch Dockerfile
#
# https://github.com/dockerize/elasticsearch
#

# Pull base image
FROM java:8

# Install ElasticSearch
ENV VERSION 5.6.2
ENV FILE elasticsearch-$VERSION.tar.gz

RUN wget -O /tmp/$FILE https://artifacts.elastic.co/downloads/elasticsearch/$FILE
RUN tar -xzf /tmp/$FILE -C /tmp
RUN mv /tmp/elasticsearch-$VERSION /elasticsearch

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
USER root
RUN useradd elasticsearch
RUN chown -R elasticsearch:elasticsearch /elasticsearch
#RUN sysctl -w vm.max_map_count=262144
USER elasticsearch
#RUN chown elasticsearch:elasticsearch /elasticsearch/config/elasticsearch.yml

# Install plugins
#RUN /elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
#RUN /elasticsearch/bin/plugin -install mobz/elasticsearch-head
#RUN /elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/master
#RUN /elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.1.1

# Mountable directory
VOLUME ["/data"]

# Working directory
WORKDIR /data

# Expose ports (9200: HTTP, 9300: Transport)
EXPOSE 9200 9300

# RUN
CMD ["/elasticsearch/bin/elasticsearch"]
