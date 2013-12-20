FROM inthecloud247/kdocker-openjdk7
MAINTAINER inthecloud247 "inthecloud247@gmail.com"

ENV LAST_UPDATED 2013-12-20

# copy downloaded files
ADD setupfiles/ /setupfiles/

# setup script
RUN /bin/bash -e /setupfiles/scripts/setup.sh

# copy configuration files
ADD confs/supervisor/conf.d/elasticsearch.conf /etc/supervisor/conf.d/elasticsearch.conf

# Old CMD's
#CMD ["/usr/share/elasticsearch/bin/elasticsearch", "-f", "-D", "es.path.logs=/logs", "-D", "es.path.data=/data", "-D", "es.network.publish_host=127.0.0.1", "-D", "es.cluster.name=search-localhost" ]

#CMD ["/usr/share/elasticsearch/bin/elasticsearch", "-f", "-D", "es.path.logs=/log", "-D", "es.path.data=/data", "-D", "es.default.node.name=es1"]

EXPOSE 9200
EXPOSE 9300

CMD ["/usr/bin/supervisord", "--nodaemon"]

