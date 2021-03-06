FROM alpine:edge

ENV GOPATH /go

RUN apk add --update go git bzr mercurial subversion \
    && go get golang.org/x/tools/go/vcs \
    && go get github.com/tools/godep \
    && go get github.com/alecthomas/gometalinter \
    && go get github.com/client9/misspell/cmd/misspell \
    && /go/bin/gometalinter --install --update \
    && rm -rf /var/cache/apk

COPY templates/ /opt/goreportcard/templates
COPY assets/ /opt/goreportcard/assets
COPY scripts/start-grc.sh /opt/goreportcard/
COPY goreportcard /opt/goreportcard/
WORKDIR /opt/goreportcard
EXPOSE 8000

ENTRYPOINT /opt/goreportcard/start-grc.sh
