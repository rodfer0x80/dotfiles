#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
        set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
        echo 'Usage: ./script.sh arg-one arg-two'
            exit
fi

CDIR="$(dirname "$0")"
WORKDIR="$CDIR"
cd $WORKDIR
main() {
    echo "Hell World"
}

main "$@"

