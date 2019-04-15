#!/bin/bash

if [ "x$BRANCH" = "x" ]; then
    export BRANCH=7.0.94-p1
fi
if [ "x$VERSION" = "x" ]; then
    export VERSION=7.0.94
fi

docker build -t tomcat7-builder .
docker run -e BRANCH=$BRANCH -e VERSINO=$VERSION -it -v `pwd`/dist:/dist --rm tomcat7-builder

