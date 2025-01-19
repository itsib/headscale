#!/bin/bash

docker run \
  --name headscale \
  --detach \
  --volume $(pwd)/headscale:/etc/headscale/ \
  --publish 0.0.0.0:8080:8080 \
  --publish 0.0.0.0:9090:9090 \
  sergeyitsib/headscale \
  headscale serve
