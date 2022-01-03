#part 1
FROM golang:alpine as builder

WORKDIR /go/src/app

ADD hello.go .

RUN go mod init && \
	go build hello.go


#part 2 
FROM scratch

COPY --from=builder /go/src/app/hello /go/bin/hello

ENTRYPOINT ["/go/bin/hello"]