FROM golang:latest

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
RUN apt-get install -y mosquitto
RUN apt-get install -y mosquitto-clients

# For protobufs, need to add edge repository
RUN sed -i '/edge/s/^#//' /etc/apk/repositories
RUN apt-get install -y protoc
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get github.com/golang/mock/gomock
RUN go install github.com/golang/mock/mockgen
RUN go get golang.org/x/tools/go/packages

# Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.31.0
RUN golangci-lint --version

VOLUME ["`pwd`/sive-agc/"]