FROM azul/zulu-openjdk:7
LABEL maintener="saas@moe.dreamarts.co.jp"

# ubuntu に必要なパッケージを追加する
# apache2-dev は nio モジュールのユニットテストで apr が必要
RUN apt-get update && apt-get install -y \
    git wget vim apache2-dev

RUN mkdir -p /dist && \
    mkdir -p /work && \
    cd /work && \
    wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.8.2-bin.tar.gz && \
    tar zxf apache-ant-1.8.2-bin.tar.gz && \
    ln -s apache-ant-1.8.2 apache-ant && \
    mkdir -p /dist

ADD bin/build-tomcat7.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

CMD /usr/local/bin/build-tomcat7.sh
