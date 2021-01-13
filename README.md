# About

新規に開発参入した人がすぐに環境構築できるようにするための ansible 設定です。  
必要最低限のツール類をインストールします。

# Requirements

- wget または curl
- unzip

# Instration

1. 下記コマンドをコピーしてターミナル上で実行してください。
   途中対話形式で質問されるので Y か n を入力してください。

\*TODO 正式に決まったら URL を変更する

```console
u=https://raw.githubusercontent.com/mille-tech/dev-bootstrap/main/bootstrap.sh&& \
b=$(mktemp -u)&&((command -v curl&&curl -o $b $u)||(command -v wget&&wget -qO $b $u))&& \
bash $b
```

2. スクリプト実行中に Google Account は発行されていますか?に Yes で答えた場合は何度か Google 認証が呼び出されるのでログインして許可してください

# Install される主なアプリケーション一覧

- google-cloud-sdk
- asdf
- terraform
- git
- docker
- podman
- buildah
- pre-commit
- cloud_sql_proxy

## 注意

ツールが競合するため、以下のことは行わないようにしてください

- pyenv,goenv などの env 系のツール類のインストール
- .bash_profile の作成(作成した設定が読み込まれないため)

# Docker について

開発環境を Docker で構築したい人のために Dockerfile を用意した。社の共有 Docker リポジトリを作ってそこにイメージを作っても良いかも？

## DooD するための設定

この Docker コンテナを実行する際に以下のコマンドで行うこと

```console
docker run -v /var/run/docker.sock:/var/run/docker.sock -it {Image名} bash -l
```

# メンテナンス

メンテナンスしやすくするためには

インストールするアプリケーションを追加・編集したい場合は[インストールメンテナンス](./ansible/README.md#インストールアプリケーションの変更)を参照する。

## メンテナンスの方針

このリポジトリではインストールするツールは最低限のものとする。  
開発で必要なツール類は [asdf](https://github.com/asdf-vm/asdf) で管理するようにし、プロジェクト個別で必要なツールについては別途 script と ansible と(必要ならば)Dockerfile をプロジェクトのリポジトリで管理するようにしたほうが良いかも?
