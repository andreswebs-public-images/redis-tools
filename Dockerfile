FROM ubuntu:20.04

RUN \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
  redis-tools stunnel gosu && \
  apt-get clean && \
  rm -rvf /var/lib/apt/lists/*

RUN \
  addgroup \
    --gid 65333 app && \
  adduser \
    --gid 65333 \
    --uid 65333 \
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
