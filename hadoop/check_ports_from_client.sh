#!/bin/bash

#EXAMPLE
#HIVE="10.12.0.10 10.12.2.10" NAMENODES="10.12.0.10 10.12.2.10" DATANODES="10.12.0.11 10.12.0.12 10.12.2.11 10.12.2.12 10.12.4.11 10.12.4.12" ZOOKEEPER="10.12.0.10 10.12.2.10 10.12.4.10" YARN_MASTER="10.12.0.10 10.12.2.10" ./check_ports_from_client.sh

# requires nmap. I don't want to have fun with telnet :)
PORT_SCANNER="nmap"
CHECK_TCP="${PORT_SCANNER} -Pn"
function usage() {
  echo "nmap is needed."
  echo 'At least one of $HIVE, $NAMENODES, $ZOOKEEPER, $DATANODES $YARN_MASTER is needed'
}
function scan() {
  if [ -n "$3" ]; then
    echo "######################################################"
    echo "checking $1"
    echo "######################################################"
    ${CHECK_TCP} -p $2 $3
  fi
}

command -v ${PORT_SCANNER} &> /dev/null
if [ $? -eq 1 ]; then
  usage
  exit 1
fi

if [ -z "HIVE" ] && [ -z "$NAMENODES" ] && [ -z "$ZOOKEEPER" ] && [ -z "$DATANODES" ]&& [ -z "YARN_MASTER" ]; then
  usage
  exit 1
fi

# Fun part
# taken from https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/administration/content/hdfs-ports.html


scan "HIVE" 9083,10000 "${HIVE}"
scan "NAMENODES" 50070,8020 "${NAMENODES}"
scan "DATANODES" 50075 "${DATANODES}"
scan "ZOOKEEPER" 2181 "${ZOOKEEPER}"
scan "YARN" 8050,8025,8088,8090 "${YARN_MASTER}"

