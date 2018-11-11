#!/bin/bash

# Deploy only release branch
if [[ "$TRAVIS_BRANCH" != "release" ]]; then
    exit 0
fi

# Deploy only push events
if [[ "$TRAVIS_EVENT_TYPE" != "push" ]]; then
    exit 0
fi

# Prepare semantic release on Linux
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    bash scripts/semantic-release.sh
fi

# Wait on OSX build for Linux build to finish
# I swear there is literally no better way
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    sleep 1200
fi

# Publish artifacts
bash scripts/publish-dist.sh