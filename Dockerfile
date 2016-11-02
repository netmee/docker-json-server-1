FROM node:latest

ENV HOME /data
WORKDIR /data

EXPOSE 3000
ADD https://raw.githubusercontent.com/netmee/docker-openshift-json-server/master/run.sh /run.sh
ADD http://jsonplaceholder.typicode.com/db /data/db.json

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
