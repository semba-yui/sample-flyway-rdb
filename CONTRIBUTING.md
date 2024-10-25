# 開発ガイドライン

## ディレクトリ構成

```text
.
├── .github # GitHub
│   └── workflows # GitHub Actions
│       └ publish.yaml
├── .gitignore # Git 無視ファイル
├── docker # Docker 関連
│   ├── flyway # Flyway
│   │   ├── conf # Flyway 設定
│   │   │   └ flyway.conf # Flyway 設定ファイル
│   │   └── sql # Flyway SQL
│   │        ├ VYYYYMM_NNN__ddl_SUMMARY.sql # Flyway DDL
│   │        └ VYYYYMM_NNN__dml_SUMMARY.sql # Flyway DML
│   └── compose.yaml
├── docs # ドキュメント
├── CONTRIBUTING.md # 開発ガイドライン
├── LICENSE # ライセンス
└── README.md # README
```

## マイグレーションファイルの命名規則

- `VYYYYMM_NNN__ddl_SUMMARY.sql` : DDL
- `VYYYYMM_NNN__dml_SUMMARY.sql` : DML

- YYYYMM : 年月を西暦で指定する。
- NNN : 同一年月に複数のSQLを適用したい場合に指定する順序番号。

## Commit メッセージの書式

```text
<type>(<scope>): <subject>
```

- type: このコミットの目的を表すキーワード
- scope: このコミットの影響範囲を表すキーワード
- subject: このコミットの内容を表すキーワード

### type

| type     | 意味                  |
|:---------|:--------------------|
| feat     | 新機能                 |
| fix      | バグ修正                |
| docs     | ドキュメントのみ変更          |
| style    | コードの意味に影響を与えない変更    |
| refactor | バグ修正や機能追加を行わないコード変更 |
| perf     | パフォーマンスを向上させるコード変更  |
| test     | テストコードの追加           |
| chore    | ビルドプロセスやツールの変更      |

### scope

- プロジェクト内の変更範囲を指定する。
- なるべく狭い範囲を指定する。
- プロジェクト全体に影響がある場合は指定しない。
- 例: README, CONTRIBUTING, docker, flyway, etc.

### subject

- 変更内容の要約を記述する。

## ブランチ運用

GitHub Flow に準拠する。
