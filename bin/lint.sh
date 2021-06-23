#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BIN_DIR="${SCRIPT_PATH}"
BASE_DIR=$(pwd)
HADOLINT_DOCKER_IMAGE=boxcutter/hadolint-amd64

lints_to_ignore=$(sed "s/#.*//" "${BIN_DIR}/hadolint-ignore" | sed '/^[[:space:]]*$/d' | sed 's/^/--ignore / ' | tr '\n' ' ')
docker container run --rm -i ${HADOLINT_DOCKER_IMAGE} hadolint ${lints_to_ignore} - < "Dockerfile"
