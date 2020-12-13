# About

新規に開発参入した人がすぐに環境構築できるようにするための ansible 設定です。  
必要最低限のツール類をインストールします。

# Instration

1. 下記コマンドをターミナル上で実行してください。

\*TODO 正式に決まったら URL を変更する

```console
u=https://raw.githubusercontent.com/qwerty2501/working-environment-bootstrap/master/bootstrap.sh&&b=$(mktemp -u)&&((command -v curl&&curl -o $b $u)||(command -v wget&&wget -qO $b $u))&&bash $b
```

# For Maintenance

メンテナンスしやすくするためには

インストールするアプリケーションを追加・編集したい場合は[インストールメンテナンス](./ansible/README.md#インストールアプリケーションの変更)を参照する。
