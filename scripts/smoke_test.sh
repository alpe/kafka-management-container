#!/bin/sh
zookeeper=$1
kafka-console-consumer.sh --zookeeper ${zookeeper} --from-beginning --topic orchestration-global --max-messages=1 --consumer.config=$(dirname $0)/smoke_test_consumer.conf> /dev/null