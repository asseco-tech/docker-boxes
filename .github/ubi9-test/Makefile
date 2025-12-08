# image attributes
IMAGE_NAME = asseco-tech/ubi9-test
DOCKER_REGISTRY ?= docker.io
RELEASE_VERSION ?= 9.7
BUILD_NUMBER ?= 001
BUILD_DATE = $(shell date --iso-8601=seconds)
IMAGE_LATEST_TAG= ${RELEASE_VERSION}
IMAGE_TAG = ${RELEASE_VERSION}-b${BUILD_NUMBER}
IMAGE_DESC = test ubi9:9.7 by XRay

# image labels
MAINTAINER = Asseco Poland S.A
GIT_REPOSITORY = https://github.com/asseco-tech/docker-boxes

# docker build opts
CACHE ?= ''
CACHE_FLAG = $(if $(CACHE),,--no-cache)


# Default target
all: help


help:
	@echo "Commands list: "
	@echo ""
	@echo " build    image build"
	@echo " push     image push"
	@echo " info     print info"
	@echo ""
	@echo "Available parameters:"
	@echo " CACHE=1        enable cache (default: disabled)"
	@echo " BUILD_NUMBER   build number (unique)"


build:
	@echo "-- docker build ${IMAGE_NAME}:${IMAGE_TAG}"
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} \
	  --label "vendor=${MAINTAINER}" \
	  --label "name=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.description=${IMAGE_DESC}" \
	  --label "org.opencontainers.image.source=${GIT_REPOSITORY}" \
	  --label "org.opencontainers.image.title=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.vendor=${MAINTAINER}" \
	  --label "org.opencontainers.image.version=${IMAGE_TAG}" \
	  --label "org.opencontainers.image.created=${BUILD_DATE}" \
	   $(CACHE_FLAG) .
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_LATEST_TAG}


push:
	@echo "-- docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker rmi ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}
	docker rmi ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}


clean:
	docker rmi ${IMAGE_NAME}:${IMAGE_TAG}
	docker rmi ${IMAGE_NAME}:${IMAGE_LATEST_TAG}


info:
	@echo "IMAGE_NAME=${IMAGE_NAME}"
	@echo "IMAGE_TAG=${IMAGE_TAG}"
	@echo "IMAGE_LATEST_TAG=${IMAGE_LATEST_TAG}"
	@echo "CACHE_FLAG=$(CACHE_FLAG)"
