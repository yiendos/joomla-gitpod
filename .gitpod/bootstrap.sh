#!/bin/bash

set -e

export PATH=/home/gitpod/.composer/vendor/bin/:$PATH

joomla plugin:install joomlatools/console-joomlatools:dev-master

echo "* Create a new Joomla site"

joomla site:create joomla.${JOOMLA_VERSION} --disable-ssl --mysql-login=root: --www=/workspace/joomla-gitpod/ --release=${JOOMLA_VERSION}

echo "* copy user composer requirements"

cp /workspace/joomla-gitpod/.gitpod/composer.json /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/composer.json

#then all you need to do (if required) is composer update --working-dir=/workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}

echo "* install pages"

composer require joomlatools/pages --ignore-platform-reqs --working-dir=/workspace/joomla-gitpod/joomla.${JOOMLA_VERSION} /dev/null 2>&1

echo "* create pages area"

mkdir -p /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/joomlatools-pages/pages
cp /workspace/joomla-gitpod/.gitpod/config.php /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/joomlatools-pages/config.php
cp /workspace/joomla-gitpod/.gitpod/index.html.php /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/joomlatools-pages/pages/hello.html.php

echo " * can I get rewind"
apachectl start