#!/bin/bash

USER_ADMIN_NAME=${USER_ADMIN_NAME:-"snwfdhmp"}
USER_ADMIN_SHELL=${USER_ADMIN_SHELL:-"/bin/bash"}
USER_ADMIN_COPY_ROOT_SSH_AUTHORIZED_KEYS=${USER_ADMIN_COPY_ROOT_SSH_AUTHORIZED_KEYS:-1}
useradd -m -s $USER_ADMIN_SHELL -G sudo $USER_ADMIN_NAME

if [ "$USER_ADMIN_COPY_ROOT_SSH_AUTHORIZED_KEYS" -eq 1 ] && [ -f /root/.ssh/authorized_keys ]; then
    mkdir -p /home/$USER_ADMIN_NAME/.ssh
    cp /root/.ssh/authorized_keys /home/$USER_ADMIN_NAME/.ssh
fi