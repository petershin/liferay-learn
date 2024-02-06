# データベースサービス(MySQL)

MySQLデータベース・サービスは、アプリケーションのセットアップ、運用、スケーリングを簡素化する分散型リレーショナル・データベースです。 お客様のアプリケーション環境内のプライベートサービスです。 通信できるのは、お客様の他のサービスのみで、一般のインターネットには接続できません。 Liferay Cloud のデータベースでは、テーブル名とカラム名の大文字と小文字が区別されます。

![データベースサービスは、Liferay Cloud で利用可能ないくつかのサービスの一つです。](./database-service/images/01.png)

詳細は、 [データベースのサービス制限](../../reference/platform-limitations.md#database-service) のセクションを参照してください。

## 環境変数

これらの環境変数を設定することで、データベースサービスの設定を行うことができます。 `LCP_MASTER_USER_NAME`、 `LCP_MASTER_USER_PASSWORD`、 `LCP_DBNAME`を設定する場合、データベースサービスに依存する他のサービス（例：バックアップやLiferayサービス）に同じ値を使用することを確認します。

これらの変数は、最初のデプロイメントの前に設定しておく必要があります。 新しい値でビルドを生成した場合、その後のデプロイに失敗します。 開発時には、サービスを削除し、これらの変数の新しい値で `LCP.json` ファイルを更新することができますが、これは本番環境では実行できません。

| 名前                         | デフォルト値                     | 説明         |
|:-------------------------- |:-------------------------- |:---------- |
| `LCP_DBNAME`               | `運動体`                      | データベース名です。 |
| `lcp_master_user_name`     | `dxpcloud`                 | マスターユーザー名。 |
| `lcp_master_user_password` | `lcp_project_master_token` | マスターパスワード。 |

### データベースメンテナンスウィンドウの変数

Liferayクラウド環境のデータベースサービスは、定期メンテナンスのため、通常2分程度のダウンタイムが発生することがあります。 ダウンタイムの影響を減らすために、このメンテナンスを実行する日時を設定できます。 デフォルトでは、特定の日時は決められていません。

| 名前                        | 許容値                | 説明                                  |
|:------------------------- |:------------------ |:----------------------------------- |
| `LCP_GCP_MW_DAY`          | `1` から `7`         | 希望する曜日（月（1）〜日（7）、UTC時間）。            |
| `lcp_gcp_mw_hour`         | `0` から `23`        | 希望する時間帯（UTC時間）。                     |
| `lcp_gcp_mw_update_track` | `CANARY`, `STABLE` | `canary` を設定して、他の環境より最大で1週間早く更新します。 |

### Google Cloud MySQL フラグ

MySQLのフラグを環境変数として渡すことができます。 利用可能なフラグは、 [Google Cloud documentation](https://cloud.google.com/sql/docs/mysql/flags) に記載されています。 Liferay Cloud で動作させるには、各フラグの先頭に `LCP_GCP_DATABASE_FLAG_` を付加する必要があります。 以下は、開発環境でのデバッグに役立つ一般的なフラグですが、本番環境ではパフォーマンスに大きな影響を与えるため、使用しないでください。

```{warning}
Googleのドキュメントに記載されているように、一部のデータベースフラグ設定はインスタンスの可用性または安定性に影響を与える可能性があります。 これらのフラグを使用する際は、Googleの [運用ガイドライン](https://cloud.google.com/sql/docs/mysql/operational-guidelines) に従って、十分に注意してください。
```

| 名前                                     | 許容値     | デフォルト値 |
|:-------------------------------------- |:------- |:------ |
| `lcp_gcp_database_flag_general_log`    | `オン、オフ` | `オフ`   |
| `lcp_gcp_database_flag_slow_query_log` | `オン、オフ` | `オフ`   |

## 関連情報

* [データベースのユーザー名の変更](./changing-your-database-username.md)
* [データベースパスワードの変更](./changing-your-database-password.md)
* [データベースサービスの制限事項](../../reference/platform-limitations.md#database-service)
* [MySQLクライアントの使用](../../customizing-liferay-dxp-in-the-cloud/using-the-mysql-client.md)
