FROM ubuntu:trusty

MAINTAINER Alex Peters <ap@optiopay.com>

# Install Kafka
RUN apt-get update && apt-get install -y openjdk-6-jdk wget
ENV KAFKA_VERSION=0.8.2.1
ENV SCALA_VERSION=2.11
ENV KAFKA_ARTIFACT_VERSION=$SCALA_VERSION-$KAFKA_VERSION


RUN wget -q http://apache.mirrors.spacedump.net/kafka/$KAFKA_VERSION/kafka_$KAFKA_ARTIFACT_VERSION.tgz -O /tmp/kafka_$KAFKA_ARTIFACT_VERSION.tgz && \
    tar xfz /tmp/kafka_$KAFKA_ARTIFACT_VERSION.tgz -C /opt && \
    rm /tmp/kafka_$KAFKA_ARTIFACT_VERSION.tgz

ENV PATH="/opt/kafka_$KAFKA_ARTIFACT_VERSION/bin:$PATH"


COPY scripts /opt/scripts

ENV topic_replication_factor=2

WORKDIR /opt/scripts