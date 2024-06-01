#!/bin/bash
VER=v$(date +%y%m%d%H%M)
IMG=ghcr.io/mastrogpt/starter
docker build . -t $IMG:$VER
 