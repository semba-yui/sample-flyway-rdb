# sample-flyway-rdb

## 概要

Flyway を利用した RDB のマイグレーションサンプルリポジトリです。

## 技術スタック

- Flyway
- PostgreSQL (PostGIS)
- Docker

## 利用方法

### ローカル DB の起動 & マイグレーション

```shell
docker compose -f ./docker/compose.yaml up
```

## ローカル DB 接続情報

- ホスト: `localhost`
- ポート: `5432`
- ユーザー: `postgres`
- パスワード: `postgres`
- データベース: `postgres`
- スキーマ: `schema1`

デフォルトの `public` スキーマは PostgreSQL の制約上書き込みができないため、`schema1` スキーマを利用しています。  
参考: https://dev.classmethod.jp/articles/postgresql-15-revoke-create-on-public-schema/

## 参考

### マイグレーションとは

マイグレーションとは、データベースのスキーマやデータを変更することです。

Flyway のようなマイグレーション管理ツールを使うことで、
データベースの変更履歴を管理し、複数人での開発や運用を行う際に便利です。

### Flyway とは

Flyway は、データベースのマイグレーションを行うためのツールです。

- [Flyway](https://flywaydb.org/)
- [Flyway Documentation](https://flywaydb.org/documentation/)
