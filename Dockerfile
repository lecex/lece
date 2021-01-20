FROM bigrocs/golang-gcc:1.13 as builder
RUN apk --no-cache add git libtool

WORKDIR /go/src/github.com/bigrocs/micro
RUN git clone https://github.com/bigrocs/micro.git /go/src/github.com/bigrocs/micro


ENV GO111MODULE=on CGO_ENABLED=1 GOOS=linux GOARCH=amd64
RUN go build -a -installsuffix cgo -o bin/micro

FROM bigrocs/alpine:ca-data

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY --from=builder /go/src/github.com/bigrocs/user/bin/micro /usr/local/bin/
CMD ["micro"]
EXPOSE 8080