#!/bin/bash

ASSETS_HOME="public/assets"
if [ -d "$SCRIPT_HOME" ]
then
	rm -rf $SCRIPT_HOME    
fi
bundle exec rake assets:precompile RAILS_ENV=development
bundle exec rake assets:precompile RAILS_ENV=production
