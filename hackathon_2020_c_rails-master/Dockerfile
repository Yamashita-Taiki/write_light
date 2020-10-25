FROM ruby:2.6.5

WORKDIR /app

ARG BUNDLE_PATH
ENV BUNDLE_PATH ${BUNDLE_PATH}

ENV LC_ALL ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LANG ja_JP.UTF-8

RUN apt-get update -qq
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn install

COPY . .
