IMAGE_NAME=test/comix
OUTPUT_DIR="$(pwd)"/out

docker build . -t "${IMAGE_NAME}"
mkdir -p "${OUTPUT_DIR}"
docker run -ti --mount type=bind,source="${OUTPUT_DIR}",target=/app/comix_out "${IMAGE_NAME}" "$@"
