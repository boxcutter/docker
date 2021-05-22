#!/bin/bash

BASE_DIR=$(pwd)
BIN_DIR="${BASE_DIR}/../../bin"
DOCKERFILE_DIR="${BASE_DIR}"

if [[ -z ${DOCKER_USERNAME} ]] || [[ -z ${DOCKER_PASSWORD} ]]; then
  echo "DOCKER_USERNAME and DOCKER_PASSWORD must be set in order to push"
  exit 1
fi

echo "${DOCKER_PASSWORD}" | docker login -u ${DOCKER_USERNAME} --password-stdin

tags="$(${BIN_DIR}/list-tags.sh)"
while read -r tag; do
  docker push ${tag} | tee -a "${DOCKERFILE_DIR}/docker_image_BUILD.log"
done <<< "${tags}"
