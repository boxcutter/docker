#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BIN_DIR="${SCRIPT_PATH}"
BASE_DIR=$(pwd)
DOCKERFILE_DIR="${BASE_DIR}"

if [[ -z ${DOCKER_USERNAME} ]] || [[ -z ${DOCKER_PASSWORD} ]]; then
  echo "DOCKER_USERNAME and DOCKER_PASSWORD must be set in order to push"
  exit 1
fi

echo "${DOCKER_PASSWORD}" | docker login -u ${DOCKER_USERNAME} --password-stdin

tags="$(${BIN_DIR}/list-tags.sh)"
while read -r tag; do
  echo "==> Deploying ${tag}"
  docker push ${tag} | tee -a "${DOCKERFILE_DIR}/docker_image_BUILD.log"
done <<< "${tags}"
