#!/bin/bash

# set -eux
set -eu
set -o pipefail

BASE_DIR=$(pwd)
BIN_DIR="${BASE_DIR}/../../bin"
IMAGE_NAME=$(basename "$(pwd)")
DOCKER_REPO="docker.io/boxcutter"
SOURCE_IMAGE="${DOCKER_REPO}/${IMAGE_NAME}"

tags="$(${BIN_DIR}/list-tags.sh)"
while read -r tag; do
  echo "Tagging ${tag}"
  docker image tag "${SOURCE_IMAGE}" "${tag}"
done <<< "${tags}"
