# Use the Ruby 2.7.4 image from Docker Hub
# as the base image (https://hub.docker.com/_/ruby)
FROM ruby:2.7.4

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential libpq-dev imagemagick curl nano apt-utils

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install Yarn.
RUN npm install -g yarn

RUN gem install bundler -v 2.1.4

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

COPY package.json yarn.lock ./

COPY . ./
