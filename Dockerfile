FROM ruby:2.5-slim
MAINTAINER dan@paz.am
ENV REFRESHED_AT 2018-01-19

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    ruby-dev \
    libgdbm-dev \
    libncurses5-dev \
    libffi-dev \
    libyaml-dev \
    libreadline-dev \
    sqlite3 \
    libsqlite3-dev \
    curl \
    libpq-dev \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Setup app location
RUN mkdir -p /app
WORKDIR /app

# Install gems
ADD mini_record.gemspec /app/mini_record.gemspec
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD lib/ /app/lib
RUN bundle install --jobs 4
