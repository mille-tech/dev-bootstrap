# About

ここには setup に必要な ansible の設定ファイルとそれを呼び出す shell script が配置されている

- [setup.yaml](./setup.yaml) setup.sh から呼び出される ansible ファイル。ここから instal.yaml と config.yaml が呼び出される。
- [install.yaml](./install.yaml) setup.yaml から呼び出される install に関する処理がまとまっている ansible 設定ファイル。
- [config.yaml](./config.yaml) setup.yaml から呼び出される設定関連の操作。install.yaml が呼び出された後に呼び出されるが、ユーザー環境の設定を変更するため config.yaml の実行は任意である。

# install.yaml と config.yaml の使い分けについて

install.yaml は環境にアプリケーションをインストールすることを目的とする。一部アプリケーションについてはオプションでユーザ環境の設定(.bashrc など)を config.yaml で変更するが、これは勝手にやってしまうとユーザ環境の破壊になってしまう可能性があるため処理を分けて設定を変更するのはユーザが任意に選べるようにしている

# インストールアプリケーションの変更

パッケージ管理システムで管理されているアプリケーションについては[setting 関連のファイル](./vars/install/setting/)に配置されている yaml ファイルを編集する。  
編集の仕方については各 yaml ファイルを参照すること。google cloud sdk のように独自のインストール方法である場合は適宜[ansible/tasks/install/](./tasks/install/)に新たなディレクトリを作成しその配下に ansible タスクファイルを作成する。
