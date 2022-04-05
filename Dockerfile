FROM golang:latest

RUN go version

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
RUN apt-get install -y mosquitto
RUN apt-get install -y mosquitto-clients

# For protobufs, need to add edge repository
RUN apt-get install -y protobuf-compiler
RUN go install github.com/golang/protobuf/protoc-gen-go@latest
RUN go install github.com/golang/mock/mockgen@latest

# Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.45.2
RUN golangci-lint --version