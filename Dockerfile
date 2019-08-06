FROM travix/base-alpine:3.5

MAINTAINER Travix

# runtime environment variables
ENV COUCHBASE_URL="http://127.0.0.1" \
    COUCHBASE_PORT="8091" \
    COUCHBASE_USERNAME="" \
    COUCHBASE_PASSWORD="" \
    PROMETHEUS_PORT="9119"

COPY ./requirements.txt /requirements.txt

RUN apk --no-cache add \
      curl \
      git \
      python \
      py-pip \
    && pip install -r /requirements.txt \
    && rm -rf /var/cache/apk/*

COPY ./prometheus_couchbase_exporter.py /prometheus_couchbase_exporter.py
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 500 /docker-entrypoint.sh


ENTRYPOINT ["/docker-entrypoint.sh"]

CMD python /prometheus_couchbase_exporter.py -c ${COUCHBASE_URL}:${COUCHBASE_PORT} -p ${PROMETHEUS_PORT}