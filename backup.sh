#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$#" -ne 2 ]]; then
    echo "Usage: $0 src dest-dir"
else
    rsync --archive --delete --progress --no-links --exclude-from="${DIR}/.rsync-exclude" "$1" "$2"
fi