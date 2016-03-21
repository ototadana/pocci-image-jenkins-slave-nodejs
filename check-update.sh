#!/bin/bash

check_version() {
    CURRENT=`grep "ENV $2" Dockerfile |cut -d" " -f3`
    if [ $1 != ${CURRENT} ]; then
        echo "$2: ${CURRENT} --> $1"
    fi
}

check_npm_version() {
    LATEST=`curl -s https://registry.npmjs.com/$1/latest | sed -E 's/^.+,"version":"([^"]+).+/\1/'`
    check_version ${LATEST} $2
}

check_nodejs_version() {
    LATEST=`curl -s https://nodejs.org/dist/latest-v4.x/SHASUMS256.txt |grep "\.pkg" |sed -E 's/.+node-(.+).pkg/\1/'`
    check_version ${LATEST} $1
}

check_github_version() {
    LATEST=`curl -s https://api.github.com/repos/$1/releases/latest |grep tag_name |sed -E 's/.+"tag_name": *"(.+[^"])".*/\1/'`
    check_version ${LATEST} $2
}

cd `dirname $0`

check_github_version creationix/nvm NVM_VERSION

check_nodejs_version NODEJS_VERSION

check_npm_version bower BOWER_VERSION
check_npm_version grunt-cli GRUNT_VERSION
check_npm_version gulp GULP_VERSION
check_npm_version yo YO_VERSION
