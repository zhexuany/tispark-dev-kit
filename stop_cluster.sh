pkill -9 pd-server
pkill -9 tidb-server
pkill -9 tikv-server
if [ -f ./log/*.log.* ]; then
  rm -f ./log/*.log.*
  rm -rf tikv
  rm -rf pd
fi
