#!/bin/sh
service_name=$1
zookeeper=$2

for newtopic in ${service_name} ${service_name}-events ${service_name}-clock ${service_name}-orchestration orchestration-global; do
  kafka-topics.sh --create --zookeeper ${zookeeper} --replication-factor ${topic_replication_factor-2} --partitions 1 --topic ${newtopic} || true
done
