#!/bin/bash

set -e

export PATH=/home/gitpod/.composer/vendor/bin/:$PATH

joomla plugin:install joomlatools/console-joomlatools:dev-master

echo "* Create a new Joomla site"

joomla site:create joomla.${JOOMLA_VERSION} --disable-ssl --mysql-login=root: --www=/workspace/joomla-gitpod/ --release=${JOOMLA_VERSION}

apachectl start