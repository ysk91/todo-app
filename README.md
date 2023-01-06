## 動作環境

+ 検証環境として docker環境を用意しています。
+ レポジトリをcloneした後は、docker環境にて起動させてください。
+ 下記コマンドを実行すると3000番ポートでRailsサーバーが起動します。
```
$ docker-compose build
$ docker-compose up -d
```

### セットアップ情報
コンテナに入った後、yarnインストールを行ってください。
```
$ docker-compose exec web bash
```

yarnインストール
```
yarn install
```
