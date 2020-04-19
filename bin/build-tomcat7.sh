#/bin/bash

export JAVA_HOME=/usr/lib/jvm/zulu-7-amd64
export ANT_HOME=/work/apache-ant
export PATH=$PATH:${ANT_HOME}/bin

if [ "x$BRANCH" = "x" ]; then
    export BRANCH=7.0.103-p5
fi
if [ "x$VERSION" = "x" ]; then
    export VERSION=7.0.103
fi

ORIGINAL_BINARY="http://ftp.jaist.ac.jp/pub/apache/tomcat/tomcat-7/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz"

mkdir -p /work &&
cd /work &&
rm -rf apache-tomcat-${VERSION} &&
rm -f apache-tomcat-${VERSION}.tar.gz &&
wget $ORIGINAL_BINARY &&
tar zxvf apache-tomcat-${VERSION}.tar.gz  &&
rm -rf tomcat &&
git clone -b $BRANCH --depth 1 https://github.com/nebosuke/tomcat.git &&
cd tomcat &&
git log &&
ant deploy &&
cd .. &&
cp -a tomcat/output/build/lib/*.jar apache-tomcat-${VERSION}/lib &&
mv apache-tomcat-${VERSION} apache-tomcat-${BRANCH} &&
tar zcvf /dist/apache-tomcat-${BRANCH}.tar.gz apache-tomcat-${BRANCH}
