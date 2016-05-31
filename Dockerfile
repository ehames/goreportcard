FROM alpine:edge

ENV GOPATH /go

RUN apk add --update git go \
    && go get golang.org/x/tools/go/vcs \
    && go get github.com/tools/godep \
    && go get github.com/alecthomas/gometalinter \
    && /go/bin/gometalinter --install --update \
    && go get github.com/client9/misspell/cmd/misspell \
    && rm -rf /var/cache/apk

COPY templates/ /opt/goreportcard/templates
COPY scripts/start-grc.sh /opt/goreportcard/
COPY goreportcard /opt/goreportcard/
WORKDIR /opt/goreportcard
EXPOSE 8000

ENTRYPOINT /opt/goreportcard/start-grc.sh
