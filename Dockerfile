FROM golang:1.6

RUN go get golang.org/x/tools/go/vcs \
    && go get github.com/tools/godep \
    && go get github.com/alecthomas/gometalinter \
    && gometalinter --install --update \
    && go get github.com/client9/misspell/cmd/misspell

COPY . $GOPATH/src/github.com/gojp/goreportcard
WORKDIR $GOPATH/src/github.com/gojp/goreportcard

EXPOSE 8080

CMD ["make", "start"]
