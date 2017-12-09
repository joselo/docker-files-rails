#!/bin/sh

set -x

# wait for postgresql
until nc -vz $POSTGRESQL_HOST 5432; do
  echo "Postgresql is not ready, sleeping..."
  sleep 1
done
echo "Postgresql is ready, starting Rails."

file_server="/app/tmp/pids/server.pid"

if [ -f $file_server ] ; then
    rm $file_server
fi

bundle exec rails server puma -p $PORT -e $RAILS_ENV -b '0.0.0.0'
