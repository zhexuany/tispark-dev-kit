pkill -9 pd-server
pkill -9 tidb-server
pkill -9 tikv-server
if [ -f ./log/*.log.* ]; then
  rm ./log/*.log.*
fi
