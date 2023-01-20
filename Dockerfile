FROM debian:bullseye-slim

LABEL maintainer="Adam Wolski <kontakt@adamwolski.com>" \
    version="0.1" \
    description="GIMPS Prime95 docker image."

# https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV PRIME_USER=wolas
ENV WORK_PREFERENCE=0
ENV HOSTNAME=hostname

VOLUME /opt/prime95

RUN apt-get update && apt-get install --no-install-recommends -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/scripts && mkdir -p /opt/mprime && curl -sSL "$(curl -s https://www.mersenne.org/download/ | grep -Po -m 1 'href=\"\K[0-9a-z:/._-]+?linux64.+?(?=\")')" | tar -C /opt/mprime -xvz --keep-newer-files

COPY ./start.sh /opt/scripts/start.sh
RUN chmod +x /opt/scripts/start.sh

WORKDIR /opt/mprime

ENTRYPOINT ["/opt/scripts/start.sh"]