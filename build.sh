#!/bin/bash
docker build -t tomcat7-builder .
docker run -it -v `pwd`/dist:/dist --rm tomcat7-builder

