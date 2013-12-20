FROM inthecloud247/kdocker-openjdk7
MAINTAINER inthecloud247 "inthecloud247@gmail.com"

ENV LAST_UPDATED 2013-12-20

# copy downloaded files
ADD setupfiles/ /setupfiles/

# setup script
RUN /bin/bash -e /setupfiles/scripts/setup.sh

# copy configuration files
ADD confs/supervisor/conf.d/elasticsearch.conf /etc/supervisor/conf.d/elasticsearch.conf

EXPOSE 9200
EXPOSE 9300

CMD ["/usr/bin/supervisord", "--nodaemon"]

