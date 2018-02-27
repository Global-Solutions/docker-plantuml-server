FROM tomcat:9.0.5-jre8-alpine

MAINTAINER Global-solutions
ENV VER=v1.2018.1

RUN rm -r /usr/local/tomcat/webapps/* && \
    apk --update add --no-cache --virtual .deps git maven openjdk8 && \
    apk add --no-cache graphviz && \
    mkdir /tmp/work -p && PWD=$(pwd) && cd /tmp/work && \
    git clone -b ${VER} https://github.com/plantuml/plantuml-server.git && \
    cd plantuml-server && mvn package && \
    mv target/plantuml.war /usr/local/tomcat/webapps && \
    cd $PWD && rm /tmp/work -rf && \
    apk del .deps && \
    rm /root/.m2 -rf
