#!/bin/bash

#VERSION=$(git describe --tags `git rev-list --tags --max-count=1`)
VERSION="v0.24.0"

docker build --build-arg VERSION="$VERSION" --tag sergeyitsib/headscale:latest --tag sergeyitsib/headscale:"${VERSION:1}" .
