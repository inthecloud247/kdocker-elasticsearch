#!/bin/bash

set -e

CACHEDIR="/setupfiles/cache"
cd $CACHEDIR

# download files
DLFILES=(
  "download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb"
  "github.com/mobz/elasticsearch-head/archive/master.zip"
  "github.com/lukas-vlcek/bigdesk/archive/master.zip"
  "download.elasticsearch.org/elasticsearch/elasticsearch-lang-python/elasticsearch-lang-python-1.2.0.zip"
  )

for DLFILE in ${DLFILES[@]};
  do
    wget -p -c --no-check-certificate https://$DLFILE
  done;

# install elasticsearch
dpkg -i ${DLFILES[0]}

# create directories
mkdir -p /data/elasticsearch
mkdir -p /log/elasticsearch
chown -R elasticsearch:elasticsearch /data/elasticsearch
chown -R elasticsearch:elasticsearch /log/elasticsearch

# install plugins
# sh /usr/share/elasticsearch/bin/plugin --url file://$CACHEDIR/${DLFILES[1]} --install lukas-vlcek/bigdesk
# sh /usr/share/elasticsearch/bin/plugin --url file://$CACHEDIR/${DLFILES[2]} --install mobz/elasticsearch-head
# sh /usr/share/elasticsearch/bin/plugin --url file://$CACHEDIR/${DLFILES[3]} --install elasticsearch/elasticsearch-lang-python/1.2.0

# cleanup
rm -rf $CACHEDIR