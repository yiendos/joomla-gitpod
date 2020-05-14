#!/bin/bash

set -e

export PATH=/home/gitpod/.composer/vendor/bin/:$PATH

joomla plugin:install joomlatools/console-joomlatools:dev-master

echo "* Create a new Joomla site"

joomla site:create joomla.${JOOMLA_VERSION} --disable-ssl --mysql-login=root: --www=/workspace/joomla-gitpod/ --release=${JOOMLA_VERSION}

cp /workspace/joomla-gitpod/.gitpod/composer.json /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/composer.json

#then all you need to do (if required) is composer update --working-dir=/workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}

composer require joomlatools/pages --ignore-platform-reqs --working-dir=/workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}

mkdir /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/joomlatools-pages/pages

cp /workspace/joomla-gitpod/.gitpod/config.php /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/joomlatools-pages/
cp /workspace/joomla-gitpod/.gitpod/ /workspace/joomla-gitpod/joomla.${JOOMLA_VERSION}/joomlatools-pages/pages

apachectl start