# image attributes
IMAGE_NAME = asseco-tech/devbox
DOCKER_REGISTRY ?= ghcr.io
HELM_VERSION ?= 3.18.6
BUILD_NUMBER ?= 001
IMAGE_TAG = ${HELM_VERSION}-${BUILD_NUMBER}

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
	@echo ""
	@echo "Available parameters:"
	@echo " CACHE=1        enable cache (default: disabled)"


build:
	@echo "-- docker build ${IMAGE_NAME}:${IMAGE_TAG}"
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} \
	  --build-arg "HELM_VERSION=${HELM_VERSION}" \
	  --label "vendor=${MAINTAINER}" \
	  --label "name=${IMAGE_NAME}" \
	  --label "summary=${IMAGE_NAME}" \
	  --label "version=${IMAGE_TAG}" \
	  --label "org.opencontainers.image.title=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.version=${IMAGE_TAG}" \
	  --label "org.opencontainers.image.source=${GIT_REPOSITORY}" \
	  --label "org.opencontainers.image.vendor=${MAINTAINER}" \
	   $(CACHE_FLAG) .


push:
	@echo "-- docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}


test:
	@echo "HELM_VERSION=${HELM_VERSION}"
	@echo "CACHE_FLAG=$(CACHE_FLAG)"
