#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "isbjorn/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "isbjorn/meteord:node-${NODE_VERSION}-base" isbjorn/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "isbjorn/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "isbjorn/meteord:node-${NODE_VERSION}-onbuild" isbjorn/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "isbjorn/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "isbjorn/meteord:node-${NODE_VERSION}-devbuild" isbjorn/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "isbjorn/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "isbjorn/meteord:node-${NODE_VERSION}-binbuild" isbjorn/meteord:binbuild
