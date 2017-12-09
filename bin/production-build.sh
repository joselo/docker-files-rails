#!/bin/sh

echo "Building app for production..."

docker-compose -f docker-compose.production.yml build
docker-compose -f docker-compose.production.yml run --rm app bundle install
docker-compose -f docker-compose.production.yml run --rm app bundle exec rails db:setup

echo "Setup for production completed!"
