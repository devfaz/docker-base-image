#!/usr/bin/env bash

TARGET=jc5x/firefly-iii-base-image:latest

ARM32=jc5x/firefly-iii-base-image:latest-arm
ARM64=jc5x/firefly-iii-base-image:latest-arm64
AMD64=jc5x/firefly-iii-base-image:latest-amd64

docker manifest create --amend $TARGET $ARM32 $ARM64 $AMD64
docker manifest annotate $TARGET $ARM32 --arch arm   --os linux
docker manifest annotate $TARGET $ARM64 --arch arm64 --os linux
docker manifest annotate $TARGET $AMD64 --arch amd64 --os linux
docker manifest push $TARGET

# download manifest from docker hub for this version, or create one if it doesn't exist.
# append the current target
# push to repository.