#!/bin/bash

#docker run \
#  --name headscale \
#  --detach \
#  --volume $(pwd)/headscale:/etc/headscale/ \
#  --publish 0.0.0.0:8080:8080 \
#  --publish 0.0.0.0:9090:9090 \
#  sergeyitsib/headscale

docker run \
  --rm \
  --volume $(pwd)/headscale:/etc/headscale/ \
  --publish 0.0.0.0:8080:8080 \
  --publish 0.0.0.0:9090:9090 \
  sergeyitsib/headscale /bin/bash -c "/go/bin/headscale version"

# echo $1 && ls -Al $1
