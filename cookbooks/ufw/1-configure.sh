#!/bin/bash

UFW_ALLOW_PORTS_IN=${UFW_ALLOW_PORTS_IN:-"22"}
UFW_ALLOW_PORTS_OUT=${UFW_ALLOW_PORTS_OUT:-"80 443 53 67 123 22"}

for port in $UFW_ALLOW_PORTS_IN; do
    ufw allow in $port
done

for port in $UFW_ALLOW_PORTS_OUT; do
    ufw allow out $port
done

ufw enable