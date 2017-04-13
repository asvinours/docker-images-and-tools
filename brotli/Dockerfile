FROM debian:jessie

LABEL maintainer="Fabrice Baumann"

# Get repository and install wget and vim
RUN apt-get update && apt-get install --no-install-recommends -y \
        ca-certificates \
        curl \
        libcurl4-openssl-dev \
        wget \
        git \
        cmake \
        g++ \
        make

WORKDIR /opt/brotli/

RUN git clone https://github.com/google/brotli.git . && \
      mkdir out && \
      cd out && \
      ../configure-cmake && \
      make && \
      make test && \
      make install

WORKDIR /var/www

