FROM inthecloud247/kdocker-openjdk7
MAINTAINER inthecloud247 "inthecloud247@gmail.com"

# copy downloaded files
ADD setupfiles/ /setupfiles/

# setup script
RUN /bin/bash -e /setupfiles/scripts/setup.sh

# copy configuration files
# ADD confs/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
ADD confs/supervisor/conf.d/elasticsearch.conf /etc/supervisor/conf.d/elasticsearch.conf

EXPOSE 9200
EXPOSE 9300

# ADD scripts/run.sh /run.sh
#CMD ["/bin/bash", "-e", "/run.sh"]

#CMD ["/usr/share/elasticsearch/bin/elasticsearch", "-f", "-D", "es.path.logs=/logs", "-D", "es.path.data=/data", "-D", "es.network.publish_host=127.0.0.1", "-D", "es.cluster.name=search-localhost" ]

CMD ["/usr/bin/supervisord", "--nodaemon"]

#ENTRYPOINT ["/usr/share/elasticsearch/bin/elasticsearch"]

#CMD ["-h"]

#CMD ["/usr/share/elasticsearch/bin/elasticsearch", "-f", "-D", "es.path.logs=/log", "-D", "es.path.data=/data", "-D", "es.default.node.name=es1"]