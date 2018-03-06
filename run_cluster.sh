#!/bin/bash

set -ue

# pd's address
pdaddr="127.0.0.1:2379"

# start pd-server
mkdir -p log
mkdir -p data
./bin/pd-server --data-dir=data/pd --log-file=./log/pd.log >/dev/null&

sleep 10s
# start tikv-server
./bin/tikv-server --pd=$pdaddr --store=data/tikv --config=conf/tikv.toml --log-file ./log/tikv.log&
# start tidb-server
./bin/tidb-server --store=tikv --config=conf/tidb.toml --path=$pdaddr --log-file=./log/tidb.log&
