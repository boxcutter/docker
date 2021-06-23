#!/bin/bash

set -eux

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BIN_DIR="${SCRIPT_PATH}"
BASE_DIR=$(pwd)
DOCKERFILE_DIR="${BASE_DIR}"
IMAGE_NAME="$(${BIN_DIR}/image-name.sh)"
DOCKER_REPO="docker.io/boxcutter"
DEFAULT_TAG="${DOCKER_REPO}/${IMAGE_NAME}"

docker image build -t "${DEFAULT_TAG}" .
