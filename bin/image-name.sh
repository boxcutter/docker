#!/bin/bash

DOCKERFILE_DIR=$(pwd)
IMAGE_NAME=$(basename $(pwd))

if [[ -f "${DOCKERFILE_DIR}/IMAGE_NAME" ]]; then
  IMAGE_NAME=$(head -n 1 "${DOCKERFILE_DIR}/IMAGE_NAME")
fi
echo ${IMAGE_NAME}
