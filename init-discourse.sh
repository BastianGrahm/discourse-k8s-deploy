#!/bin/bash

set -e

cd /src/plugins
git pull git@github.com:disraptor/disraptor.git

USER=discourse
RUBY_GLOBAL_METHOD_CACHE_SIZE=131072
LD_PRELOAD=/usr/lib/libjemalloc.so
RAILS_ENV=${RAILS_ENV:=development}

cd /src && 
bundle install 
bundle exec rake db:migrate
