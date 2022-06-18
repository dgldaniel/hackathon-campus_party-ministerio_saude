#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install

yarn install --check-files

bundle exec rails s -p 3000 -b '0.0.0.0'
