Couchbase Prometheus exporter
=============================

# Environment variables

In order to configure the Couchbase exporter for use with other than default settings you can pass in the
following environment variables:

| Name                      | Description                                                              | Default value   |
| ------------------------- | ------------------------------------------------------------------------ | --------------- |
| COUCHBASE_URL             | Couchbase host address                                                   | http://127.0.0.1
| COUCHBASE_PORT            | Couchbase port address                                                   | 8091
| COUCHBASE_USERNAME        | Couchbase username                                                       |
| COUCHBASE_PASSWORD        | Couchbase password                                                       |
| PROMETHEUS_PORT           | Prometheus port to listen                                                | 9119


# Getting started

```
docker run -t -i -p 9119:9119 -e COUCHBASE_URL=127.0.0.1 -e COUCHBASE_PORT=8091 travix/prometheus_couchbase_exporter
```
