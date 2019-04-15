# Tomcat7をビルドする環境

Tomcat7 に存在する以下の不具合を修正するために独自のビルド環境を整備したもの。

### 修正している不具合
- サーブレット内において、finalize() が実装されているクラスがあり、finalize() の内部で HttpServletOutputStream#close() が呼び出されるような実装になっているとき、再利用された CoyoteOutputStream が意図しないタイミングでリセットされる / エラーとなった接続のバッファの内容が書き出される問題
- coyote.Response の committed 変数が同期化されておらず、意図しない isCommitted() が true で見えてしまう可能性がある問題

## ビルド方法
```
./build.sh
```
によって、dist 以下に 7.0.94-p1 バイナリが生成される。
