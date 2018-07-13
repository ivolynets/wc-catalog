FROM golang:1.10.3-alpine3.7

ENV APP_BIN wc-catalog-service
ENV SRC_PATH $GOPATH/src/github.com/ivolynets/$APP_BIN/
ENV BIN_PATH $GOPATH/bin/$APP_BIN

ADD . $SRC_PATH
WORKDIR $SRC_PATH

# build

RUN apk add --no-cache --virtual git; \
    go get -u golang.org/x/lint/golint; \
    golint -set_exit_status; \
    ls **/* | grep .\.go$ | xargs -n 1 go vet; \
    go install; \
    cp $BIN_PATH /usr/bin/

# clean up

WORKDIR /
RUN rm -rf $GOPATH; \
    apk del git go openssl musl-dev gcc; \
    unset SRC_PATH BIN_PATH

# run

EXPOSE 8080/tcp
CMD ["sh", "-c", "$APP_BIN"]
