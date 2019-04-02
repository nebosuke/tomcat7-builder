#/bin/bash

export JAVA_HOME=/usr/lib/jvm/zulu-7-amd64
export ANT_HOME=/work/apache-ant
export PATH=$PATH:${ANT_HOME}/bin

mkdir -p /work &&
cd /work &&
rm -rf tomcat &&
git clone -b 7.0.x --depth 1 https://github.com/nebosuke/tomcat.git &&
cd tomcat &&
ant deploy &&
cd /work/tomcat/output/build &&
tar zcvf /dist/apache-tomcat-7.0.93-fix.tar.gz .
