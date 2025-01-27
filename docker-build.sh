#!/bin/bash

VERSION=$(git describe --tags `git rev-list --tags --max-count=1`)

docker build --build-arg VERSION="$VERSION" --tag sergeyitsib/headscale:latest --tag sergeyitsib/headscale:"${VERSION:1}" .
