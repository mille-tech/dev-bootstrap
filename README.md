# About

新規に開発参入した人がすぐに環境構築できるようにするための ansible 設定です。  
必要最低限のツール類をインストールします。

# Instration

1. 下記コマンドをターミナル上で実行してください。

```console
bootstrap_url="https://raw.githubusercontent.com/qwerty2501/working-environment-bootstrap/master/bootstrap.sh" && (command -v curl 2>&1 && curl $bootstrap_url | bash) || (command -v wget 2>&1 && wget -q -O - $bootstrap_url | bash)
```
