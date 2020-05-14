FROM golang:latest

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
RUN apt-get install -y mosquitto
RUN apt-get install -y mosquitto-clients

RUN go get -u golang.org/x/lint/golint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.27.0
RUN golangci-lint --version

RUN go list -f {{.Target}} golang.org/x/lint/golint

RUN GOLINTPATH=$(go list -f {{.Target}} golang.org/x/lint/golint)
RUN set GOLINTER=$GOLINTPATH

VOLUME ["`pwd`/sive-agc/"]