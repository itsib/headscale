#!/bin/bash

VERSION=$(git describe --tags --abbrev=0)

docker build --build-arg VERSION="$VERSION" --tag sergeyitsib/headscale:latest --tag sergeyitsib/headscale:"$VERSION" .
