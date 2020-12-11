#!/bin/sh -e

if [ "$(ls -A /etc/stunnel/conf.d)" ] && [ -n "${USE_TLS+set}" ]; then
  stunnel /etc/stunnel/stunnel.conf
fi

exec gosu app "$@"
