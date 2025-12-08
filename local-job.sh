#!/usr/bin/env bash

REGISTRY=artifactory-test.dev-pus.asseco.pl/com-image-snapshot
BUILD_NUMBER=001

(cd kubebox8 \
    && make build BUILD_NUMBER=${BUILD_NUMBER} \
    && make push DOCKER_REGISTRY=${REGISTRY} BUILD_NUMBER=${BUILD_NUMBER} )

(cd kubebox8 \
    && make build BUILD_NUMBER=${BUILD_NUMBER} \
    && make push DOCKER_REGISTRY=${REGISTRY} BUILD_NUMBER=${BUILD_NUMBER} )
