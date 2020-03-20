#!/usr/bin/env bash
set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd "${DIR}"

if [[ "$#" -ne 2 ]]; then
    echo "Usage: $0 src dest-dir"
else
    sudo rsync --archive --progress --delete --delete-excluded --exclude-from=.rsyncexclude "$1" "$2"
fi

popd
