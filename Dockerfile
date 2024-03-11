ARG RUBY_VERSION=3.3.0
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /sinatra

COPY . /sinatra
RUN apt-get update -qq && \
    apt-get install build-essential curl -y --no-install-recommends && \
    gem install bundler:2.5.3 && bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
