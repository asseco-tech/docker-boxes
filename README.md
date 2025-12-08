# Docker Boxes

![Build Status](https://github.com/asseco-tech/docker-boxes/workflows/Build%20and%20Push%20Docker%20Image/badge.svg)
![License](https://img.shields.io/github/license/asseco-tech/docker-boxes)

Docker images for Kubernetes application development and DevOps workflows.

## 📋 Overview

This repository contains pre-built Docker images optimized for Kubernetes development, CI/CD pipelines, and DevOps tasks. Each image is built on Red Hat UBI8 (Universal Base Image) for enterprise-grade security and reliability.

## 🏗️ Available Images

### K8S DevBox (`asseco-tech/kdevbox8`)

A comprehensive development container with essential Kubernetes and DevOps tools.

**Base Image:** Red Hat UBI8  
**Included Tools:**
- **Helm** - Kubernetes package manager (version determined at build time)
- **Kustomize** - Kubernetes configuration management
- **yq** - YAML processor and query tool
- **jq** - JSON processor and query tool
- **diffutils** - File comparison utilities
- **rsync** - File synchronization tool
- **wget** - Web file downloader
- **bash** - Shell environment
The versions are located within the image environment.

**Use Cases:**
- Helm chart development and build
- CI/CD pipelines
- Configuration processing
- DevOps automation


### K8S KubeBox (`asseco-tech/kubebox8`)

A container focused on Kubernetes deployment and Helm operations.

**Base Image:** Red Hat UBI8  
**Included Tools:**
- **Helm** - Kubernetes package manager (version determined at build time)
- **Kustomize** - Kubernetes configuration management
- **oc** - the OpenShfit cluster manager CLI
- **kubectl** - the Kubernetes cluster manager CLI
- **wget** - Web file downloader
- **bash** - Shell environment
The versions are located within the image environment.

**Use Cases:**
- Kubernetes package management
- Chart repository operations
- Helm chart deployment and management
- Simplified CI/CD for Helm-focused workflows


## 📦 Image Registry

Browse all available images and tags:
**[https://github.com/orgs/asseco-tech/packages?repo_name=docker-boxes](https://github.com/orgs/asseco-tech/packages?repo_name=docker-boxes)**


## 🏷️ Tagging Strategy

Images are tagged using the following format: `{HELM_VERSION}-{BUILD_NUMBER}`

Where:
- `HELM_VERSION` - Version of Helm included in the image
- `BUILD_NUMBER` - Sequential build number (3-digit format)

**Example:** `3.18.6-001`

Tool versions are determined at build time and may vary between tags. Check the specific tag for exact versions.

## 🔄 CI/CD

Images are automatically built and pushed using GitHub Actions on:
- Push to `main` branch
- Pull requests

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-tool`)
3. Make your changes
4. Update documentation if needed
5. Commit your changes (`git commit -m 'Add amazing tool'`)
6. Push to the branch (`git push origin feature/amazing-tool`)
7. Open a Pull Request to dev branch

## 📝 License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## 🏢 Maintainer

**Asseco Poland S.A.**

For questions, issues, or contributions, please use GitHub Issues or contact the development team.

## 🔗 Related Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)
- [Kustomize Documentation](https://kustomize.io/)
- [Red Hat UBI8 Documentation](https://catalog.redhat.com/software/containers/ubi8/ubi/5c359854d70cc534b3a3784e)
