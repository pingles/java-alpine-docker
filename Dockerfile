FROM alpine:3.3
MAINTAINER Paul Ingles <paul@oobaloo.co.uk>

RUN apk add --update curl tar gzip 

RUN curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk
RUN apk add --allow-untrusted /tmp/glibc-2.21-r2.apk

RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u71-b15/server-jre-8u71-linux-x64.tar.gz > /tmp/jre.tar.gz
RUN tar zxvf /tmp/jre.tar.gz -C /usr
RUN rm /tmp/jre.tar.gz
RUN ln -s /usr/jdk1.8.0_71 /usr/jdk
RUN ln -s /usr/jdk/bin/java /usr/bin/java

ENV JAVA_HOME /usr/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

CMD ["/usr/bin/java", "-version"]
