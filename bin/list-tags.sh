#!/bin/bash

DOCKERFILE_DIR=$(pwd)
IMAGE_NAME=$(basename $(pwd))
DOCKER_REPO="docker.io\/boxcutter"
DEFAULT_TAG="${DOCKER_REPO}\/${IMAGE_NAME}"

tags="${DEFAULT_TAG}"
if [[ -f "${DOCKERFILE_DIR}/TAGS" ]]; then
  tags=$(sed "s/#.*//" "${DOCKERFILE_DIR}/TAGS" | sed '/^[[:space:]]*$/d' | sed "s/^/${DEFAULT_TAG}:/ ")
fi
for tag in ${tags}; do
  echo "${tag}"
done
