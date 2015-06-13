FROM sameersbn/ubuntu:14.04.20150613
MAINTAINER sameer@damagehead.com

ENV APT_CACHER_NG_VERSION=0.7.26* \
    APT_CACHER_NG_CACHE_DIR=/var/cache/apt-cacher-ng \
    APT_CACHER_NG_USER=apt-cacher-ng

RUN apt-get update && \
    apt-get install -y apt-cacher-ng=${APT_CACHER_NG_VERSION} \
 && sed 's/# ForeGround: 0/ForeGround: 1/' -i /etc/apt-cacher-ng/acng.conf \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 3142
VOLUME ["${APT_CACHER_NG_CACHE_DIR}"]
ENTRYPOINT ["/entrypoint.sh"]
