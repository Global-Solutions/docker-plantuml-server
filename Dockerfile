FROM tomcat:9.0.0-jre8-alpine

MAINTAINER Global-solutions

RUN rm -r /usr/local/tomcat/webapps/* && \
    apk --update add --no-cache --virtual .deps ca-certificates wget openssl&& \
    update-ca-certificates && \
    apk add --no-cache graphviz && \
    wget http://sourceforge.net/projects/plantuml/files/plantuml.war/download -O /usr/local/tomcat/webapps/ROOT.war && \
    apk del .deps
