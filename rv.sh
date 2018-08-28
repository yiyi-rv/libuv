#!/bin/bash

json_out=`pwd`/errors.json
report_out=`pwd`/report
rm -rf $json_out
rm -rf $report_out

apt install -y automake libtool
sh autogen.sh
./configure CC=kcc LD=kcc CFLAGS="-fissue-report=$json_out"
make
make check
rv-html-report $json_out -o $report_out
