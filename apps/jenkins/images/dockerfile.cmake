FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk --update add \
        gcc \
        g++ \
        build-base \
        cmake \
        bash \
        libstdc++ \
        cppcheck \
    rm -rf /var/cache/apk/*