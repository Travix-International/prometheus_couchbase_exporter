#!/bin/sh

set -e

echo "Waiting for couchbase to be available at ${COUCHBASE_URL}:${COUCHBASE_PORT}..."
while [[ $(curl -s -o /dev/null -w "%{http_code}\n" ${COUCHBASE_URL}:${COUCHBASE_PORT}/pools -u ${COUCHBASE_USERNAME}:${COUCHBASE_PASSWORD}) -ne 200  ]];
do
  echo "Waiting for couchbase to be available at ${COUCHBASE_URL}:${COUCHBASE_PORT}..."
  sleep 10
done
sleep 10
exec "$@"