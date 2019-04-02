# Tomcat7をビルドする環境

Tomcat7.0は、coyote.Response オブジェクトの再利用の際に同期化が行われていないため、稀にリクエストの処理が開始された直後では、coyote.Response#isCommitted() が true を返しているように見えてしまう問題がある。

これが起きると、HttpServletRequest#getSession() など内部で Set-Cookie をレスポンスヘッダに追加する処理などが IllegalStateException で失敗してしまう。

https://github.com/nebosuke/tomcat/tree/7.0.x にこれを修正したソースツリーを作成した。

このイメージは、上記のソースツリーからTomcat7のバイナリをビルドするためのものである。

## コンテナのビルド方法
```
docker build -t tomcat7-builder .
```

## Tomcat7のビルド
```
docker run -it -v `pwd`/dist:/dist --rm tomcat7-builder
```
