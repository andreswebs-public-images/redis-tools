FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y \
  redis-tools stunnel gosu && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG PUID=1000
ARG PGID=1000

RUN \
  addgroup \
    --gid "${PGID}" app && \
  adduser \
    --gid "${PGID}" \
    --uid "${PUID}" \
    --gecos "" \
    --disabled-password \
    --shell /bin/bash \
    --home /app \
    app

RUN \
  mkdir -p /etc/stunnel/conf.d

COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN \
  echo trap exit TERM > /etc/profile.d/trapterm.sh && \
  echo 'export PS1="\e[1m\e[31m[\$HOST_IP] \e[34m\u@\h\e[35m \w\e[0m\n$ "' >> /app/.bashrc

ENV  \
  HOST_IP="0.0.0.0" \
  PS1="\e[1m\e[31m[\$HOST_IP] \e[34m\u@\h\e[35m \w\e[0m\n$ "

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["sleep", "infinity"]
