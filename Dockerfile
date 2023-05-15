FROM debian:stretch-slim

LABEL org.opencontainers.image.source https://github.com/Lorenzo0111/docker-smtp

# Install exim4
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
RUN set -ex; \
    apt-get update; \
    apt-get install -y exim4-daemon-light; \
    apt-get clean

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
EXPOSE 25/tcp
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "exim", "-bdf", "-v", "-q30m" ]
