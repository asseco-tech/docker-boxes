# image attributes
IMAGE_NAME = asseco-tech/kdevbox8
DOCKER_REGISTRY ?= ghcr.io
HELM_VERSION ?= 3.18.6
RELEASE_VERSION ?= 2
BUILD_NUMBER ?= 001
BUILD_DATE = $(shell date --iso-8601=seconds)
IMAGE_LATEST_TAG = h${HELM_VERSION}-v${RELEASE_VERSION}
IMAGE_TAG = h${HELM_VERSION}-v${RELEASE_VERSION}-b${BUILD_NUMBER}

# docker build opts
CACHE ?= ''
CACHE_FLAG = $(if $(CACHE),,--no-cache)


# Default target
all: help


help:
	@echo "Commands list: "
	@echo ""
	@echo " build    image build"
	@echo " clean    clean local builded images"
	@echo " push     image push to registry"
	@echo " pull     image pull from registry"
	@echo " info     print image parameters"
	@echo " inspect  print image objects info"
	@echo ""
	@echo "Available parameters:"
	@echo " CACHE=1        enable cache (default: disabled)"
	@echo " BUILD_NUMBER   build number (unique)"
	@echo " HELM_VERSION   helm version"


build:
	@echo "-- docker build ${IMAGE_NAME}:${IMAGE_TAG}"
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} \
	  --build-arg "HELM_VERSION=${HELM_VERSION}" \
	  --label "name=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.title=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.version=${IMAGE_TAG}" \
	  --label "org.opencontainers.image.created=${BUILD_DATE}" \
	   $(CACHE_FLAG) .
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_LATEST_TAG}


clean:
	@docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || echo
	@docker rmi ${IMAGE_NAME}:${IMAGE_LATEST_TAG} || echo


push:
	@echo "-- docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker rmi ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}
	docker rmi ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}


pull:
	@echo "pull ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}"
	@docker pull ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_LATEST_TAG}


info:
	@echo "IMAGE_NAME: ${IMAGE_NAME}"
	@echo "IMAGE_TAG: ${IMAGE_TAG}"
	@echo "IMAGE_LATEST_TAG: ${IMAGE_LATEST_TAG}"
	@echo "HELM_VERSION: ${HELM_VERSION}"
	@echo "CACHE_FLAG: $(CACHE_FLAG)"
	@echo
	@echo "LOCAL REPO IMAGES: "
	@docker images | grep ${IMAGE_NAME} | awk '{print $$1":"$$2}'


inspect:
	docker inspect ${IMAGE_NAME}:${IMAGE_LATEST_TAG}
