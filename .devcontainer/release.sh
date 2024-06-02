#!/bin/bash
VER=v$(date +%y%m%d%H%M)
URL=$(git remote get-url http)

# Use regular expression to extract the repository path
if [[ $URL =~ (https?://github\.com/|git@github\.com:)([^/]+/[^/]+) ]]; then
    IMG=ghcr.io/"${BASH_REMATCH[2]}"
    docker build . -t $IMG:$VER --push
    sed -i -e "s!\"image\": \".*\"!\"image\": \"$IMG:$VER\"!" devcontainer.json
    git add devcontainer.json
    git commit -m "$VER" -a
    git tag -d $(git tag)
    git tag $VER
    git push origin main --tags
else
    echo "Invalid or unsupported URL format in git remote origin"
fi

 