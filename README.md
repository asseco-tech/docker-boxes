# Docker Boxes

![Build Status](https://github.com/asseco-tech/docker-boxes/workflows/Build%20and%20Push%20Docker%20Image/badge.svg)
![License](https://img.shields.io/github/license/asseco-tech/docker-boxes)

Docker images for Kubernetes application development and DevOps workflows.

## 📋 Overview

This repository contains pre-built Docker images optimized for Kubernetes development, CI/CD pipelines, and DevOps tasks. Each image is built on Red Hat UBI8 (Universal Base Image) for enterprise-grade security and reliability.

## 🏗️ Available Images

### K8S DevBox (`asseco-tech/kdevbox8`)

A comprehensive development container with essential Kubernetes and DevOps tools.

**Base Image:** Red Hat UBI 8  
**Included Tools:**
- **Helm** - Kubernetes package manager (version determined at build time)
- **Kustomize** - Kubernetes configuration management
- **yq** - YAML processor and query tool
- **jq** - JSON processor and query tool
- **diffutils** - File comparison utilities
- **gettext** - Text file processing utilities
- **rsync** - File synchronization tool
- **curl** - HTTP/S transfer data tool
- **bash** - Shell environment
The versions are located within the image environment.

**Use Cases:**
- Helm chart development and build
- CI/CD pipelines
- Configuration processing
- DevOps automation

🏷️ **Tagging Strategy:**

Images are tagged using the following format: `h{HELM_VERSION}-v{RELEASE_VERSION}-b{BUILD_NUMBER}`

Where:
- `HELM_VERSION` - Version of Helm included in the image
- `RELEASE_VERSION` - Release of an image within the same Helm version; 
    a release change means a minor/patch version change for other tools or change for the base image.
- `BUILD_NUMBER` - Sequential build number (3-digit format);
    a build change means correcting the metafiles, descriptions, scripts and so on

**Example:** `h3.18.6-v1-b001`

Tool versions are determined at build time and may vary between tags. Check the specific tag for exact versions.


### K8S KubeBox (`asseco-tech/kubebox8`)

A container focused on Kubernetes deployment and Helm operations.

**Base Image:** Red Hat UBI 8  
**Included Tools:**
- **Helm** - Kubernetes package manager (version determined at build time)
- **helmfile** - Deploy Kubernetes manifests and Helm charts
- **Kustomize** - Kubernetes configuration management
- **oc** - the OpenShfit cluster manager CLI
- **kubectl** - the Kubernetes cluster manager CLI
- **curl** - HTTP/S transfer data tool
- **bash** - Shell environment
The versions are located within the image environment.

**Use Cases:**
- Kubernetes package management
- Chart repository operations
- Helm chart deployment and management
- Simplified CI/CD for Helm-focused workflows

🏷️ **Tagging Strategy:**

Images are tagged using the following format: `k{KUBE_VERSION}-v{RELEASE_VERSION}-b{BUILD_NUMBER}`

Where:
- `KUBE_VERSION` - Version of kubectl included in the image
- `RELEASE_VERSION` - Release of an image within the same kubectl version; 
    a release change means a minor/patch version change for other tools or for the base image.
- `BUILD_NUMBER` - Sequential build number (3-digit format);
    a build change means correcting the metafiles, descriptions, scripts and so on

**Example:** `k1.32.1-v1-b001`

Tool versions are determined at build time and may vary between tags. Check the specific tag for exact versions.


### 📦 Image Registry

Browse all available images and tags: 
**[ghcr.io registry](https://github.com/orgs/asseco-tech/packages?repo_name=docker-boxes)**


## 🤝 Contributing

Please contact the development team.

### 🔄 CI/CD

Images are built and pushed using GitHub Actions on:
- Manual trigger on `master` branch 
- Manual trigger on `hotfix/*` branch 

Images are automatically built (without push) using GitHub Actions on:
- Push to `master` branch
- Push to `hotfix/*` branch 
- Push to `dev` branch
- Push to `feature/*` branch


## 🏢 Maintainer

**Asseco Poland S.A.**

For questions, issues, or contributions, please use GitHub Issues or contact the development team.

## 📝 License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## 🔗 Related Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)
- [Kustomize Documentation](https://kustomize.io/)
- [Red Hat UBI8 Documentation](https://catalog.redhat.com/software/containers/ubi8/ubi/5c359854d70cc534b3a3784e)
