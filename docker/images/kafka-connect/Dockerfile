FROM debezium/connect:1.3

ARG MONGODB_CONNECTOR_VERSION=1.3.0
ARG MONGODB_CONNECTOR_MD5=60f24a9ec98a00b4475b89727b608fc7

ENV MAVEN_DEP_DESTINATION=$KAFKA_HOME/connect/debezium-connector-mongodb

RUN cd $KAFKA_HOME/connect/debezium-connector-mongodb && \
      docker-maven-download central org/mongodb/kafka mongo-kafka-connect "$MONGODB_CONNECTOR_VERSION" "$MONGODB_CONNECTOR_MD5"

ENV MAVEN_DEP_DESTINATION=$KAFKA_HOME/libs
