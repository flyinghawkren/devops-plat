FROM cmake:alpine

RUN cd /tmp \
  && wget https://github.com/oktal/pistache/archive/master.zip \
  && unzip master.zip \
  && cd pistache-master \
  && cmake . && make && make install \
  && ln -s /usr/local/lib64/libpistache.so /usr/lib/libpistache.so.0

COPY ./target/demo /
CMD ["/demo"]