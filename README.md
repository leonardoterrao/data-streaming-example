Data streaming example
===

Streaming data from PostgreSQL to MongoDB using [Debezium](https://debezium.io/documentation/reference/1.3/connectors/postgresql.html) and [Kafka Connectors](https://docs.confluent.io/platform/current/connect/index.html)

Configuring the environment
---

* Starting the whole environment 
```console
$ docker network create streaming_environment \ docker-compose up -d
```

* Access your PostgresSQL database started with docker-compose and check the scripts [here](scripts.sql) 

* Register the Kafka Connectors according to the [kafka-connect/README.md](kafka-connect/README.md) file.

* Do any change inside the table_a and table_b inside PostgresSQL database and check the MongoDB databse.

** It's Pendenting to do the upsert work to aggregate table_a and table_b in the same document in MongoDB.


What's inside _compose_?
---

- `kafka`, Apache Kafka (Debezium) version `1.3`;
- `kafka-connect`, Apache Kafka Connect (Debezium) version `1.3`;
- `kafka-zookeeper`, Zookeeper (Debezium) version `1.3`;
- `kafka-cmak`, CMAK Kafka WebUI version `latest`;
- `kafka-kowl`, kowl Kafka WebUI version `master`;
- `kafka-connect-ui`, kafka-connect-ui version `0.9.7`;
- `mongo`, MongoDB version `4.2.8`;
- `postgres`, PostgreSQL version `9.6` with Debezium version `1.3`;

Ports Exposed to _host_
---

- `kafka`:
  - internal container port `9092` able to access locally in `9092`, or as `kafka.ports.tcp` if using `docker app`;

- `kafka-connect`:
  - internal container port `8083` able to access locally in `8083`, or as `kafka.connect.ports.http` if using `docker app`;

- `kafka-zookeeper`:
  - internal container port `2181` able to access locally in `2181`, or as `kafka.zookeeper.ports.tcp.client` if using `docker app`;
  - internal container port `2888` able to access locally in `2888`, or as `kafka.zookeeper.ports.tcp.leader` if using `docker app`;
  - internal container port `3888` able to access locally in `3888`, or as `kafka.zookeeper.ports.tcp.follower` if using `docker app`;

- [`kafka-cmak`](https://github.com/yahoo/CMAK):
  - internal container port `9000` able to access locally in `9000`, or as `kafka.cmak.ports.http` if using `docker app`;

- [`kafka-kowl`](https://github.com/cloudhut/kowl):
  - internal container port `8080` able to access locally in `8100`, or as `kafka.kowl.ports.http` if using `docker app`;

- [`kafka-connect-ui`](https://github.com/lensesio/kafka-connect-ui):
  - internal container port `8000` able to access locally in `8003`, or as `kafka.connect.ui.ports.http` if using `docker app`;

- `mongo`:
  - internal container port `27017` able to access locally in `27017`, or as `mongo.ports.tcp` if using `docker app`;

- `postgres`:
  - internal container port `5432` able to access locally in `5432`, or as `postgres.ports.tcp` if using `docker app`;

- `postgres-debezium`:
  - internal container port `5432` able to access locally in `6543`, or as `postgres.debezium.ports.tcp` if using `docker app`;
