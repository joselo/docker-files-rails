#!/bin/bash

echo "Starting setup development environment..."

docker-compose build
docker-compose run --rm app bash -c "bundle install; bundle exec yarn install; bundle exec rails db:setup"

echo "Setup development environment completed."
