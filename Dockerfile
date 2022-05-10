FROM heroku/heroku:20-build

ENV DEBIAN_FRONTEND noninteractive

ADD src/jemalloc-5.3.0.tar.bz2 /tmp
RUN \
  cd /tmp/jemalloc-* && \
  ./configure --prefix=/app/vendor/jemalloc && \
  make install_bin install_include install_lib_shared install_lib_static && \
  cd /app/vendor/jemalloc && \
  tar zcf /tmp/jemalloc-heroku.tar.gz .
