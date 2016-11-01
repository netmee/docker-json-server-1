FROM node:latest
MAINTAINER Christian Lück <christian@lueck.tv>

ENV HOME /data
WORKDIR /data

EXPOSE 3000
ADD run.sh /run.sh

RUN set -ex;                                \
    chmod +x /run.sh;                       \
    chmod a+w /data;                        \   
    npm install -g json-server;
RUN set -xe;                                \
    groupadd -g 1001 jsonserver;            \
    useradd -u 1001 -g 1001 -m jsonserver;  \
    chown -R jsonserver:jsonserver /data

USER 1001
ENTRYPOINT ["bash", "/run.sh"]
CMD []
