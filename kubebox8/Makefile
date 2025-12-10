# image attributes
IMAGE_NAME = asseco-tech/kubebox8
DOCKER_REGISTRY ?= ghcr.io
KUBE_VERSION ?= 1.32.1
RELEASE_VERSION ?= 1
BUILD_NUMBER ?= 001
BUILD_DATE = $(shell date --iso-8601=seconds)
IMAGE_LATEST_TAG= k${KUBE_VERSION}-v${RELEASE_VERSION}
IMAGE_TAG = k${KUBE_VERSION}-v${RELEASE_VERSION}-b${BUILD_NUMBER}

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
	@echo " info     print some parameters"
	@echo " inspect  print image objects info"
	@echo ""
	@echo "Available parameters:"
	@echo " CACHE=1        enable cache (default: disabled)"
	@echo " BUILD_NUMBER   build number (unique)"
	@echo " KUBE_VERSION   kubectl version"


build:
	@echo "-- docker build ${IMAGE_NAME}:${IMAGE_TAG}"
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} \
	  --build-arg "KUBE_VERSION=${KUBE_VERSION}" \
	  --label "name=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.title=${IMAGE_NAME}" \
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
	@echo "IMAGE_NAME: ${IMAGE_NAME}"
	@echo "IMAGE_TAG: ${IMAGE_TAG}"
	@echo "IMAGE_LATEST_TAG: ${IMAGE_LATEST_TAG}"
	@echo "HELM_VERSION: ${HELM_VERSION}"
	@echo "CACHE_FLAG: $(CACHE_FLAG)"
	@echo "image_path: ${IMAGE_NAME}:${IMAGE_LATEST_TAG}"


inspect:
	docker inspect ${IMAGE_NAME}:${IMAGE_LATEST_TAG}
