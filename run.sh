#!/bin/bash

IMAGE_NAME=test/comix
OUTPUT_DIR="$(pwd)"/out

docker build . -t "${IMAGE_NAME}" -q
mkdir -p "${OUTPUT_DIR}"

[ -z "${COMIX_AUTH_TOKEN}" ] && {
    echo "ERROR: You must set COMIX_AUTH_TOKEN environment variable"
    exit 1
}

docker run -ti --mount type=bind,source="${OUTPUT_DIR}",target=/app/comix_out\
    -e COMIX_AUTH_TOKEN=${COMIX_AUTH_TOKEN} "${IMAGE_NAME}" "$@"
