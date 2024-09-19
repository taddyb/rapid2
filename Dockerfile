# *****************************************************************************
# Dockerfile
# *****************************************************************************

# Purpose:
# This file describes the operating system prerequisites for RAPID2, and is
# used by the Docker software.
# Author:
# Cedric H. David, 2024-2024


# *****************************************************************************
# Usage
# *****************************************************************************
# docker build -t chdavid/rapid2:latest -f Dockerfile .


# *****************************************************************************
# Operating System
# *****************************************************************************
FROM debian:12.6-slim


# *****************************************************************************
# Copy files into Docker image (this ignores the files listed in .dockerignore)
# *****************************************************************************
WORKDIR /home/rapid2/
COPY . .


# *****************************************************************************
# Operating System Requirements
# *****************************************************************************
RUN  apt-get update && \
     apt-get install -y --no-install-recommends \
             $(grep -v -E '(^#|^$)' requirements.apt) && \
     rm -rf /var/lib/apt/lists/*


# *****************************************************************************
# Python requirements
# *****************************************************************************
ENV PATH="/venv/bin:$PATH"
RUN python3 -m venv /venv/ && \
    pip3 install --no-cache-dir -r requirements.pip


# *****************************************************************************
# Intended (default) command at execution of image (not used during build)
# *****************************************************************************
CMD  /bin/bash


# *****************************************************************************
# End
# *****************************************************************************
