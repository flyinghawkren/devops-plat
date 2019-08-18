FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update \
  && apk upgrade \
  && apk --update add \
        gcc \
        g++ \
        build-base \
        cmake \
        bash \
        libstdc++ \
        cppcheck \
  && rm -rf /var/cache/apk/*