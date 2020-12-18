FROM ubuntu:20.04

RUN \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
  redis-tools stunnel gosu && \
  apt-get clean && \
  rm -rvf /var/lib/apt/lists/*

ARG PUID=1000
ARG PGID=1000

RUN \
  addgroup \
    --gid "${PGID}" app && \
  adduser \
    --gid "${PGID}" \
    --uid "${PUID}" \
    --shell /bin/bash \
    --home /app \
    app

RUN \
  mkdir -p /etc/stunnel/conf.d

COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["sleep", "infinity"]
