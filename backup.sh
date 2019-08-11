#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$#" -ne 2 ]]; then
    echo "Usage: $0 src dest-dir"
else
    sudo rsync --archive --progress --exclude-from="${DIR}/.rsync-exclude" "$1" "$2"
fi
