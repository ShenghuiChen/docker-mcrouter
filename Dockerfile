```
FROM ubuntu:18.04 
MAINTAINER 66951913@qq.com

RUN apt-get update && \
  apt-get install -y sudo wget gnupg2 tzdata vim && \
  apt-get clean all

RUN wget -O - https://facebook.github.io/mcrouter/debrepo/bionic/PUBLIC.KEY | sudo apt-key add
RUN echo "deb https://facebook.github.io/mcrouter/debrepo/bionic bionic contrib" >> /etc/apt/sources.list

RUN apt-get update && \
  apt-get install -y mcrouter && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo "Asia/Shanghai" > /etc/timezone
```
