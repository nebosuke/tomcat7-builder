#!/bin/bash

if [ "x$BRANCH" = "x" ]; then
    export BRANCH=7.0.103-p1
fi
if [ "x$VERSION" = "x" ]; then
    export VERSION=7.0.103
fi

docker build -t tomcat7-builder .
docker run -e BRANCH=$BRANCH -e VERSION=$VERSION -it -v `pwd`/dist:/dist --rm tomcat7-builder

