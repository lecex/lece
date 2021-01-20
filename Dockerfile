FROM golang:1.13-alpine as builder
RUN apk --no-cache add make git gcc libtool musl-dev

WORKDIR /go/src/github.com/bigrocs/micro
RUN git clone https://github.com/bigrocs/micro.git /go/src/github.com/bigrocs/micro

RUN make build

FROM bigrocs/alpine:ca-data

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY --from=builder /go/src/github.com/bigrocs/micro/micro /usr/local/bin/
CMD ["micro api --handler=rpc --namespace=go.micro.api --address=:8080 --enable_cors=true"]
EXPOSE 8080