FROM debian:jessie

# References
# https://www.varnish-cache.org/docs/3.0/installation/install.html#configuring-and-compiling
# http://blog.tenya.me/blog/2013/10/25/geoip-with-varnish/

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        curl \
        git \
        libvarnishapi-dev \
        libgeoip-dev \
        libmhash-dev \
        autotools-dev \
        libtool \
        automake \
        make \
        pkg-config \
        python \
        python-docutils \
        dpkg-dev \
        autoconf \
        libncurses5-dev \
        xsltproc \
        groff-base \
        libpcre3-dev \
        r-recommended \
        libjemalloc-dev \
        geoip-database \
        tar

ENV VARNISH_VERSION 4.1.4
ENV VMOD_DIGEST_VERSION 1.0.1
ENV VMOD_MODULES_VERSION 0.9.1
ENV VMOD_GEOIP_VERSION 1.0.1

RUN curl -SLO "https://github.com/varnishcache/varnish-cache/archive/varnish-$VARNISH_VERSION.tar.gz" \
    && mkdir -p /usr/local/varnish-cache \
    && tar -xzvf "varnish-$VARNISH_VERSION.tar.gz" -C /usr/local/varnish-cache --strip-components=1 \
    && cd /usr/local/varnish-cache \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install


RUN curl -SLO "https://github.com/varnish/libvmod-digest/archive/libvmod-digest-$VMOD_DIGEST_VERSION.tar.gz" \
    && mkdir -p /usr/local/libvmod-digest \
    && tar -xzvf "libvmod-digest-$VMOD_DIGEST_VERSION.tar.gz" -C /usr/local/libvmod-digest --strip-components=1 \
    && cd /usr/local/libvmod-digest \
    && ./autogen.sh \
    && ./configure VARNISHSRC=/usr/src/varnish-cache/ \
    && make \
    && make install

RUN curl -SLO "https://github.com/varnish/varnish-modules/archive/varnish-modules-$VMOD_MODULES_VERSION.tar.gz" \
    && mkdir -p /usr/local/varnish-modules \
    && tar -xzvf "varnish-modules-$VMOD_MODULES_VERSION.tar.gz" -C /usr/local/varnish-modules --strip-components=1 \
    && cd /usr/local/varnish-modules \
    && ./bootstrap \
    && ./configure VARNISHSRC=/usr/src/varnish-cache/ \
    && make \
    && make install

RUN mkdir -p /usr/local/libvmod-geoip \
    && git clone https://github.com/asvinours/libvmod-geoip.git /usr/local/libvmod-geoip \
    && cd /usr/local/libvmod-geoip \
    && ./autogen.sh \
    && ./configure VARNISHSRC=/usr/src/varnish-cache/ \
    && make \
    && make install


RUN ldconfig # rebuild the library cache (otherwise varnishlog will cry)
COPY start.sh /start.sh

EXPOSE 80
EXPOSE 6082

CMD ["/start.sh"]


