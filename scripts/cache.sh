#!/bin/bash

set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"
CACHEDIR="$DIR/../cache"

DLFILES=(
  "download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb"
  "github.com/mobz/elasticsearch-head/archive/master.zip"
  "github.com/lukas-vlcek/bigdesk/archive/master.zip"
  "download.elasticsearch.org/elasticsearch/elasticsearch-lang-python/elasticsearch-lang-python-1.2.0.zip"
  )

for DLFILE in ${DLFILES[@]};
  do
    wget -P $CACHEDIR -p -c --no-check-certificate https://$DLFILE
  done;