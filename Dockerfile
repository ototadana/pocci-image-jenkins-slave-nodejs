FROM xpfriend/workspace-base:2.1.1
MAINTAINER ototadana@gmail.com

ENV NVM_VERSION v0.29.0
ENV NODEJS_VERSION v4.2.6
ENV BOWER_VERSION 1.7.7
ENV GRUNT_VERSION 0.1.13
ENV GULP_VERSION 3.9.0
ENV YO_VERSION 1.6.0

RUN sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

RUN source ~/.nvm/nvm.sh \
    && nvm install ${NODEJS_VERSION} \
    && nvm alias default ${NODEJS_VERSION} \
    && npm install -g bower@${BOWER_VERSION} grunt-cli@${GRUNT_VERSION} gulp@${GULP_VERSION} yo@${YO_VERSION}
RUN sudo ln -s ~/.nvm/nvm.sh /etc/profile.d/nvm.sh

COPY ./config/. /config/
RUN sudo chown -R owner:owner /config
RUN chmod +x /config/*
