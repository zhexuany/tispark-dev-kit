#!/bin/bash

set -ue

# pd's address
pdaddr="127.0.0.1:2379"

# start pd-server
mkdir -p log
./bin/pd-server --data-dir=pd --log-file=./log/pd.log >/dev/null &

sleep 10s
# start tikv-server
./bin/tikv-server --pd=$pdaddr --store=tikv -C ./etc/config-template.toml --log-file ./log/tikv.log&
# start tidb-server
./bin/tidb-server --store=tikv --path=$pdaddr --log-file=./log/tidb.log&
