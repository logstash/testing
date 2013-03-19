#!/bin/sh

version=0.20.5
url="https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${version}.tar.gz"
file=`basename "$url"`

if [ ! -f "$file" ] ; then
  wget -O "$file" "$url"
fi

if [ ! -d "elasticsearch-${version}" ] ; then
  tar -zxf "$file"
fi

cd elasticsearch-${version}
exec sh bin/elasticsearch -f

