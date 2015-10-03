FROM xpfriend/jenkins-slave-base:1.1.1
MAINTAINER ototadana@gmail.com

ENV NVM_VERSION v0.27.0
ENV NODEJS_VERSION v4.1.1
ENV BOWER_VERSION 1.5.3
ENV GRUNT_VERSION 0.1.13
ENV YO_VERSION 1.4.8

RUN sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

RUN source ~/.nvm/nvm.sh \
    && nvm install ${NODEJS_VERSION} \
    && nvm alias default ${NODEJS_VERSION} \
    && npm install -g bower@${BOWER_VERSION} grunt-cli@${GRUNT_VERSION} yo@${YO_VERSION}

COPY ./config/. /config/
RUN sudo chown -R jenkins:jenkins /config
RUN chmod +x /config/*

ENV NODE_NAME nodejs
