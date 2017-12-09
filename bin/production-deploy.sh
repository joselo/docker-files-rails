#!/bin/sh

# Run Bubdle
docker-compose -f docker-compose.production.yml exec app bundle install --retry 5

# Run Migrations
docker-compose -f docker-compose.production.yml exec app bundle exec rails db:migrate

# Restar app server
docker-compose -f docker-compose.production.yml exec app bundle exec rails restart
