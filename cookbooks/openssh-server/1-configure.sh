#!/bin/bash

OPENSSH_SERVER_PORT=${OPENSSH_SERVER_PORT:-22}

pwd="$(dirname $0)"
cat "$pwd/sshd_config.template" | sed "s/__PORT__/$OPENSSH_SERVER_PORT/g" > /etc/ssh/sshd_config

systemctl enable ssh
systemctl start ssh
systemctl reload ssh