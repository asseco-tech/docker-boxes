# Language
All documentation and code must be in English.

# Base image
Recommended base image: `docker.io/redhat/ubi9:9.8`

# File operations
File operations within a project:
- Use the `move` command or `git mv` to move files between directories, to ensure the file is moved when you commit
- After creating a new file, add it to the Git stage using the command: `git add`

# Local build
Local image build at WSL. 
Uses the `Ubuntu-22.04` distribution if available; otherwise, the default distribution.
