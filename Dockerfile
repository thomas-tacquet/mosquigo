ROM golang:latest

ENV http_proxy=http://172.17.0.1:6865
ENV https_proxy=http://172.17.0.1:6865

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
RUN apt-get install -y mosquitto

RUN go get -u golang.org/x/lint/golint

VOLUME ["`pwd`/sive-agc/"]

