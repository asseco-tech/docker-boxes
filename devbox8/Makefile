# PRODUCT_CODE?=${BT_PRODUCT}
# PRODUCT_CODE_LC?=${BT_PRODUCT_LOWER}
# VER_WORDS               := $(subst ., ,$(PRODUCT_VERSION))
# PRODUCT_VERSION_MAJOR   := $(word 1,$(VER_WORDS))


# image attribute
IMAGE_NAME = asseco-tech/devbox
HELM_VERSION = 3.18.0
IMAGE_TAG = ${HELM_VERSION}

# image labels
MAINTAINER = Asseco Poland S.A
GIT_REPOSITORY = https://github.com/asseco-tech/docker-boxes

# remote docker repo
DOCKER_REPO = "docker.io"

all: help

# Default target
help:
	@echo "Commands list: "
	@echo ""
	@echo " build  image build"


build:
	@echo "-- docker build ${IMAGE_NAME}:${IMAGE_TAG}"
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} \
	  --build-arg "HELM_VERSION=${HELM_VERSION}" \
	  --label "org.opencontainers.image.title=${IMAGE_NAME}" \
	  --label "org.opencontainers.image.version=${IMAGE_TAG}" \
	  --label "org.opencontainers.image.source=${GIT_REPOSITORY}" \
	  --label "org.opencontainers.image.vendor=${MAINTAINER}" \
	   .
#--no-cache

test:
	@echo "HELM_VERSION=${HELM_VERSION}"
