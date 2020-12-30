kafka-connectors
===

Configuring the _connectors_
---

+ Registering a _connector_

```shell
$ curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" \
         localhost:8083/connectors/ -d @my-dir/filename.json
```

+ Updating the configuration of a _connector_

```shell
$ curl -i -X PUT -H "Accept:application/json" -H "Content-Type:application/json" \
         localhost:8083/connectors/${connector-name}/config -d @my-dir/filename.json
```

+ Removing a _connector_

```shell
$ curl -i -X DELETE -H "Accept:application/json" localhost:8083/connectors/${connector-name}
```

+ Listing all registered _connectors_

```shell
$ curl -H "Accept:application/json" localhost:8083/connectors/
```

+ Retrieving details of a registered _connector_

```shell
$ curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/${connector-name}
```

+ Checking _status_ of a registered _connector_

```shell
$ curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/${connector-name}/status
```

+ Retrieving configuration from a registered _connector_

```shell
$ curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/${connector-name}/config
```

Reference: [Kafka Connect REST Interface](https://docs.confluent.io/current/connect/references/restapi.html)
