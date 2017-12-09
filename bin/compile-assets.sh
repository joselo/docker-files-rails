echo "Compiling Javascripts..."

docker-compose run --rm app bash -c "RAILS_ENV=production npm rebuild node-sass; bundle exec rails webpacker:compile"

echo "Done!"
