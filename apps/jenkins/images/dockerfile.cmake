FROM alpine:3.10

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update \
  && apk upgrade \
  && apk --update add \
        gcc \
        g++ \
        build-base \
        autoconf \
        automake \
        cmake \
        bash \
        libstdc++ \
        cppcheck \
  && rm -rf /var/cache/apk/*