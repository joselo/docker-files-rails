FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev ruby-dev zlib1g-dev liblzma-dev libxml2-dev netcat-openbsd curl apt-transport-https vim && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash && \
    apt-get install -yq nodejs && \
    npm install -g npm && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get -y install yarn && \
    mkdir /app && \
    mkdir /bundle

WORKDIR /app

ADD . /app
