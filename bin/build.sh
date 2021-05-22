#!/bin/bash

set -eux

BASE_DIR=$(pwd)
DOCKERFILE_DIR="${BASE_DIR}"
IMAGE_NAME=$(basename "$(pwd)")
DOCKER_REPO="docker.io/boxcutter"
DEFAULT_TAG="${DOCKER_REPO}/${IMAGE_NAME}"

docker image build -t "${DEFAULT_TAG}" .
