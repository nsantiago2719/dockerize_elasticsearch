#
# Ubuntu Dockerfile
#
# https://github.com/dockerize/elasticsearch
#

# pull base image
FROM dockerize/sbt

MAINTAINER Dockerize "http://dockerize.github.io"

# install ElasticSearch
ENV VERSION 1.2.0
ENV FILE elasticsearch-${VERSION}.tar.gz
RUN wget -O $FILE https://download.elasticsearch.org/elasticsearch/elasticsearch/$FILE
RUN tar -xzf $FILE -C /usr/share
RUN ln -sf /usr/share/elasticsearch-$VERSION /usr/share/elasticsearch
 
# install plugins
RUN /usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
RUN /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.1.1
RUN /usr/share/elasticsearch/bin/plugin -install river-csv -url https://github.com/AgileWorksOrg/elasticsearch-river-csv/releases/download/2.0.1/elasticsearch-river-csv-2.0.1.zip

# expose ports
EXPOSE 9200 9300

# start
CMD /usr/share/elasticsearch/bin/elasticsearch
