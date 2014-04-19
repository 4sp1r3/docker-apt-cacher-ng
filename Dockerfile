FROM sameersbn/ubuntu:12.04.20140418
MAINTAINER sameer@damagehead.com

RUN apt-get update && \
		apt-get install -y apt-cacher-ng && \
		apt-get clean # 20140418

ADD assets/ /app/
RUN chmod 755 /app/init /app/setup/install
RUN /app/setup/install

ADD authorized_keys /root/.ssh/

EXPOSE 3142

VOLUME ["/var/cache/apt-cacher-ng"]

ENTRYPOINT ["/app/init"]
CMD ["app:start"]
