#!/usr/bin/env bash

# domain to set
[[ -z "$1" ]] && { printf "!!! Domain not specified.\n    Add domain as first parameter.\n"; exit 0; }

# ip linked to the domain
[[ -z "$2" ]] && { printf "!!! Ip not specified.\n    Add Ip as second parameter.\n"; exit 0; }

grep $1 /etc/hosts > /dev/null 2<&1 || { echo $2 $1 >> /etc/hosts; }
