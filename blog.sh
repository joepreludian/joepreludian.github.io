#!/bin/bash

JEKYLL_VERSION=3.8

COMMANDS="$@"

echo "Personal Blog Util - Docker Wrapper"

if [ "$COMMANDS" = "" ]; then
  echo -e "Basic Instructions\n"
  echo "$0 jekyll build -> Builds the project and stores it on _site"
  echo "$0 bundle update -> Update all dependencies and bail out"
  echo "$0 jekyll serve -> Serve your site contents compiled in order to validate before sending"

  exit 0
fi

echo -e "\nRunning the Jekyll container..."
set -xe

docker run --rm \
  --volume="$PWD:/srv/jekyll" -p 4000:4000 \
  -it jekyll/builder:$JEKYLL_VERSION $COMMANDS
