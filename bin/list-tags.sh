#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BIN_DIR="${SCRIPT_PATH}"
DOCKERFILE_DIR=$(pwd)
IMAGE_NAME="$(${BIN_DIR}/image-name.sh)"
DOCKER_REPO="docker.io\/boxcutter"
DEFAULT_TAG="${DOCKER_REPO}\/${IMAGE_NAME}"

tags="${DEFAULT_TAG}"
if [[ -f "${DOCKERFILE_DIR}/TAGS" ]]; then
  tags=$(sed "s/#.*//" "${DOCKERFILE_DIR}/TAGS" | sed '/^[[:space:]]*$/d' | sed "s/^/${DEFAULT_TAG}:/ ")
fi
for tag in ${tags}; do
  echo "${tag}"
done
