#!/bin/bash

#startup zookeeper
KAFKA_HOME=/opt/bitnami/kafka
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &

#startup kafka server
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties