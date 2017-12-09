#!/bin/bash
echo "Reseting local environment..."

docker-compose stop
docker-compose run --rm app bash -c "bundle exec rails db:drop db:create db:migrate db:seed"

echo "Reset local environment completed."
