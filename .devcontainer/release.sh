#!/bin/bash
VER=v$(date +%y%m%d%H%M)
IMG=ghcr.io/sciabarracom/starter
docker build . -t $IMG:$VER --push
sed -i -e "s!\"image\": \".*\"!\"image\": \"$IMG:$VER\"!" devcontainer.json
 