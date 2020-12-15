# About

新規に開発参入した人がすぐに環境構築できるようにするための ansible 設定です。  
必要最低限のツール類をインストールします。

# Instration

1. 下記コマンドをコピーしてターミナル上で実行してください。
   途中対話形式で質問されるので Y か n を入力してください。

\*TODO 正式に決まったら URL を変更する

```console
u=https://raw.githubusercontent.com/qwerty2501/working-environment-bootstrap/master/bootstrap.sh&& \
b=$(mktemp -u)&&((command -v curl&&curl -o $b $u)||(command -v wget&&wget -qO $b $u))&& \
bash $b
```

2. スクリプト実行中に Google Account は発行されていますか?に Yes で答えた場合は何度か Google 認証が呼び出されるのでログインして許可してください

# Docker について

開発環境を Docker で構築したい人のために Dockerfile を用意した。社の共有 Docker リポジトリを作ってそこにイメージを作っても良いかも？

## DooD するための設定

Docker 内部で Docker を実行したい場合は以下の設定を行う

```console
chmod 666 /var/run/user/{userId}/docker.sock
```

その後この Docker コンテナを実行する際に以下のコマンドで行うこと

```console
docker run -v /var/run/user/{userId}/docker.sock:/var/run/user/{docker内部のuserId}/docker.sock -it {Image名} bash -l
```

# メンテナンス

メンテナンスしやすくするためには

インストールするアプリケーションを追加・編集したい場合は[インストールメンテナンス](./ansible/README.md#インストールアプリケーションの変更)を参照する。

## メンテナンスの方針

このリポジトリではインストールするツールは最低限のものとする。  
開発で必要なツール類は [asdf](https://github.com/asdf-vm/asdf) で管理するようにし、プロジェクト個別で必要なツールについては別途 script と ansible と(必要ならば)Dockerfile をプロジェクトのリポジトリで管理するようにしたほうが良いかも?
