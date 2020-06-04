#!/bin/bash

OPENSSH_CLIENT_USER=${OPENSSH_CLIENT_USER:-"root"}

pwd="$(dirname $0)"
mkdir -p ~/.ssh
ssh-keygen -o -a 200 -t ed25519 -f ~/.ssh/id-ed25519 -C "$(whoami)@$(hostname).snwfdhmp.com" -q -N ""
cat "$pwd/ssh_config" > ~/.ssh/config