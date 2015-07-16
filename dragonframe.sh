#!/bin/bash

RUBY="$(ruby -e 'print RUBY_VERSION')"

export PATH="/usr/local/rvm/gems/ruby-$RUBY/bin:/usr/local/rvm/gems/ruby-$RUBY@global/bin:/usr/local/rvm/rubies/ruby-$RUBY/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/usr/local/rvm/bin"
export MY_RUBY_HOME="/usr/local/rvm/rubies/ruby-$RUBY"
export GEM_HOME="/usr/local/rvm/gems/ruby-$RUBY"
export GEM_PATH="/usr/local/rvm/gems/ruby-$RUBY:/usr/local/rvm/gems/ruby-$RUBY@global"

source "$HOME/.rvm/scripts/rvm"

if [ "$4" == "TEST" ]
then
  ~/Dropbox/popnlock/popnlock.rb $4
fi
