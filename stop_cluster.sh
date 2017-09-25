pkill -9 pd-server
pkill -9 tidb-server
pkill -9 tikv-server
log='$(echo $(ls ./log/*.log.*))'
if [ -z log ]; then
  rm *.log.*
fi
