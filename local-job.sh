#!/usr/bin/env bash

REGISTRY=${REGISTRY:-artifactory-test.dev-pus.asseco.pl/com-image-snapshot}
BUILD_NUMBER=${BUILD_NUMBER:-001}
CACHE=1

IMAGE_DIRS=(
  'ubi8-test'
  'ubi9-test'
  'kdevbox8'
  'kubebox8'
)

for idir in "${IMAGE_DIRS[@]}"; do
  (cd ${idir} \
      && make build BUILD_NUMBER=${BUILD_NUMBER} CACHE=${CACHE} \
      && make push DOCKER_REGISTRY=${REGISTRY} BUILD_NUMBER=${BUILD_NUMBER} \
      && make clean BUILD_NUMBER=${BUILD_NUMBER} )
done
