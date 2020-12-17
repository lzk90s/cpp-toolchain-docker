#!/bin/bash

set -e

if [ ! -d package/brpc ]; then
    sh download.sh
fi

REGISTRY=registry.cn-hangzhou.aliyuncs.com
NAMESPACE=gosun
IMAGE=brpc_opencv_ffmpeg
ARCH=$(uname -m)
TAG=3.0.1

docker build -t $REGISTRY/$NAMESPACE/$IMAGE:$ARCH-$TAG . -f Dockerfile-$ARCH
docker push $REGISTRY/$NAMESPACE/$IMAGE:$ARCH-$TAG

#docker manifest create --amend $REGISTRY/$NAMESPACE/$IMAGE:$TAG $REGISTRY/$NAMESPACE/$IMAGE:aarch64-$TAG $REGISTRY/$NAMESPACE/$IMAGE:x86_64-$TAG
#docker manifest push $REGISTRY/$NAMESPACE/$IMAGE:$TAG
