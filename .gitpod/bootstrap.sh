#!/bin/bash

set -e

export PATH=/home/gitpod/.composer/vendor/bin/:$PATH

joomla plugin:install joomlatools/console-joomlatools:dev-master

echo "* Create a new Joomla site"

joomla site:create joomla --disable-ssl --mysql-login=root:

apachectl start

#ln -s /var/www/joomla /wokspace/joomla-gitpod/joomla

echo "* Launch preview pane"
gp preview $(gp url 8080)