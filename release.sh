#!/bin/bash

rm -rf output
mkdir -p output

TARBALLS="
  distribution
"
for i in $TARBALLS; do
    cp $i/target/*.tar.gz output/
done;

cd output
for i in `ls *.tar.gz`; do
    tar zxf $i

    origin_name=${i%.tar.gz}
    mv ${origin_name} ycsb
    rm $i
done;
cd ..