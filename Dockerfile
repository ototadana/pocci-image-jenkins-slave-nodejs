FROM xpfriend/workspace-base:2.5.0
MAINTAINER ototadana@gmail.com

ENV NVM_VERSION v0.31.0
ENV NODEJS_VERSION v4.4.2
ENV BOWER_VERSION 1.7.9
ENV GRUNT_VERSION 1.2.0
ENV GULP_VERSION 3.9.1
ENV YO_VERSION 1.7.0

RUN sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

RUN source ~/.nvm/nvm.sh \
    && nvm install ${NODEJS_VERSION} \
    && nvm alias default ${NODEJS_VERSION} \
    && npm install -g bower@${BOWER_VERSION} grunt-cli@${GRUNT_VERSION} gulp@${GULP_VERSION} yo@${YO_VERSION}
RUN sudo ln -s ~/.nvm/nvm.sh /etc/profile.d/nvm.sh

COPY ./config/. /config/
RUN sudo chown -R owner:owner /config
RUN chmod +x /config/*
