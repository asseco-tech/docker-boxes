# Docker Boxes

![Build Status](https://github.com/asseco-tech/docker-boxes/workflows/Build%20and%20Push%20Docker%20Image/badge.svg)
![License](https://img.shields.io/github/license/asseco-tech/docker-boxes)

Docker images for Kubernetes application development and DevOps workflows.

## 📋 Overview

This repository contains pre-built Docker images optimized for Kubernetes development, CI/CD pipelines, and DevOps tasks. Each image is built on Red Hat UBI9 (Universal Base Image) for enterprise-grade security and reliability.

## 🏗️ Available Images

### K8S DevBox (`asseco-tech/kdevbox9`)

A comprehensive development container with essential Kubernetes and DevOps tools.

**Base Image:** Red Hat UBI 9  
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


### K8S KubeBox (`asseco-tech/kubebox9`)

A container focused on Kubernetes deployment and Helm operations.

**Base Image:** Red Hat UBI 9  
**Included Tools:**
- **Helm** - Kubernetes package manager (version determined at build time)
- **helmfile** - Deploy Kubernetes manifests and Helm charts
- **Kustomize** - Kubernetes configuration management
- **kubectl** - the Kubernetes cluster manager CLI
- **git** - git repositories tool
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


### OCP Box (`asseco-tech/ocpbox9`)

A container focused on OpenShift deployment and Helm operations.

**Base Image:** Red Hat UBI 9  
**Included Tools:**
- **oc** - the OpenShift CLI (version determined at build time)
- **kubectl** - the Kubernetes cluster manager CLI, shipped with oc
- **Helm** - Kubernetes package manager
- **helm-diff** - Helm plugin that previews upgrade changes as a diff
- **helmfile** - Deploy Kubernetes manifests and Helm charts
- **Kustomize** - Kubernetes configuration management
- **git** - git repositories tool
- **curl** - HTTP/S transfer data tool
- **bash** - Shell environment
The versions are located within the image environment.

**Use Cases:**
- OpenShift application deployment
- Helm chart deployment and management on OpenShift
- Simplified CI/CD for OpenShift and Helm-focused workflows

🏷️ **Tagging Strategy:**

Images are tagged using the following format: `o{OC_VERSION}-v{RELEASE_VERSION}-b{BUILD_NUMBER}`

Where:
- `OC_VERSION` - Version of oc included in the image
- `RELEASE_VERSION` - Release of an image within the same oc version; 
    a release change means a minor/patch version change for other tools or for the base image.
- `BUILD_NUMBER` - Sequential build number (3-digit format);
    a build change means correcting the metafiles, descriptions, scripts and so on

**Example:** `o4.19.46-v1-b001`

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
- [Red Hat UBI9 Documentation](https://catalog.redhat.com/software/containers/ubi9/ubi/615bcf606feffc5384e8452e)
