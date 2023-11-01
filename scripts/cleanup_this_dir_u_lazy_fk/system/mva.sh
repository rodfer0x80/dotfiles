#!/usr/bin/env bash

# rename all files in $PWD
# arg1: old string slice
# arg2: new string slice

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
        set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
        echo 'Usage: ./mva.sh <old> <new>'
            exit
fi

CDIR="$(dirname "$0")"
WORKDIR="$CDIR"
cd $WORKDIR
main() {
    for file in *$1;
    do
        mv "$file" "${file/$1/$2}"
    done
}

main "$@"

