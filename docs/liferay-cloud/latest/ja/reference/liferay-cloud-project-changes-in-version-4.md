# Liferay Cloud プロジェクト バージョン 4 での変更点

Liferay Cloud スタックのバージョン 3.x と 4.x の間には、サービスに対して Docker イメージのバージョンが定義される場所、リポジトリの構造、そして `Jenkinsfiles` の使用方法など、いくつかの変更が加えられています。

**内容：**

* [Dockerイメージ定義の変更](#changes-to-docker-image-definitions)
* [プロジェクト組織の変更](#project-organization-changes)
* [Liferayサービスの変更](#liferay-service-changes)
* [検索サービスの変更](#search-service-changes)
* [CIサービスの変更](#ci-service-changes)
* [ウェブサーバーサービスの変更](#webserver-service-changes)
* [バックアップサービスの変更](#backup-service-changes)
* [既知の制限事項](#known-limitations)

## Dockerイメージ定義の変更

Liferay Cloud のバージョン 4.x のサービスの Docker イメージは、プロジェクトの `gradle.properties` ファイルで定義されなくなりました。 各サービスの `LCP.json` ファイルに定義されるようになりました。

Liferay Cloud Stack バージョン 4 にアップグレードすると、各サービスの Docker イメージのバージョンが `3.x.x` から `4.x.x`に変更されます。 これらのイメージの変更に加え、Liferay Cloudプロジェクトの構成と機能に関する組織的な変更も行われています。

## プロジェクト組織の変更

リポジトリの最大の変更点は、各サービスのファイル（ `LCP.json` ファイルを含む）がリポジトリのルートにあるフォルダ（例： `liferay/` や `webserver/`）に移動されたことです。 これらのサービスは、再配置されたサービスフォルダに移動し、 [CLI ツール](./command-line-tool.md)を使用して、個別に展開することができます。 `lcp` フォルダーが削除され、これらのサービスのパスに含まれなくなりました。 これらのフォルダ自体は、 [Liferay Workspaceの概要](https://learn.liferay.com/ja/w/dxp/building-applications/tooling/liferay-workspace/what-is-liferay-workspace) に似せて再編成されています。

リポジトリのルートにあった他のいくつかのファイル（ `gradle.properties`、 `build.gradle`、 `settings.gradle`を含む）も、 `liferay` サービスに移動されました。

## Liferayサービスの変更

`liferay` サービスフォルダは [Liferay Workspaceの概要](https://learn.liferay.com/ja/w/dxp/building-applications/tooling/liferay-workspace/what-is-liferay-workspace) の機能構造に従っています。

`liferay` サービス内のすべての設定は、プロジェクトの Liferay Cloud 環境に対応する環境固有の `configs` ディレクトリに所属するようになりました。 さらに、 `ライセンス` フォルダーが削除されました。 代わりに、 `デプロイ` フォルダーにライセンスを追加してください。

次の表は、 `liferay` サービス設定の新しい設定をまとめたものです。

| **ファイル** | **3.xでの場所** | **4.xでの場所** |
|:-------------------------- |:-------------------------- |:----------------------------------- |
| デプロイするファイル                 | lcp/liferay/deploy/{ENV}/ | liferay/configs/{ENV}/deploy/       |
| OSGi設定ファイル（.cfgまたは.config） | lcp/liferay/config/{ENV}/ | liferay/configs/{ENV}/osgi/configs/ |
| その他の設定オーバーライド              | lcp/liferay/config/{ENV}/ | liferay/configs/{ENV}/              |
| カスタムシェルスクリプト               | lcp/liferay/script/{ENV}/  | liferay/configs/{ENV}/scripts/      |
| ホットフィックスとパッチツール            | lcp/liferay/hotfix/{ENV}/  | liferay/configs/{ENV}/patching/     |
| ライセンス                      | lcp/liferay/license/{ENV}/ | lcp/configs/{ENV}/deploy/           |

```{note}
configs/{ENV}/` ディレクトリ内のファイルは、Liferay Cloud の Liferay コンテナ内の `LIFERAY_HOME` ディレクトリにオーバーライドとしてコピーされます。
```

ホットフィックスを直接リポジトリにコミットするのではなく、Liferayサービスのデプロイ時に自動的に追加される新しいCIサービス環境変数が用意されています。 詳細については、 [Installing Hotfixes with an Environment Variable](#installing-hotfixes-with-an-environment-variable) を参照してください。

### カスタムスクリプトの実行

`liferay/configs/{ENV}/scripts/` に置かれたスクリプトは root ユーザーとしてではなく、 `liferay` のユーザーとして実行されるようになりました。 スクリプトをルートとして実行する必要がある場合は、代わりにスクリプトを `Jenkinsfile` に追加する必要があります。

## 検索サービスの変更

`search` サービス内のすべての設定は、環境固有の `configs` ディレクトリに属します。 `search` サービス設定の新しい設定については、次の表を参照してください：

| **ファイル** | **3.xでの場所** | **4.xでの場所** |
|:----------------------------- |:----------------------------- |:----------------------------- |
| Elasticsearch の設定             | lcp/search/config/{ENV}/      | search/configs/{ENV}/config/  |
| カスタムシェルスクリプト                  | lcp/search/script/{ENV}/      | search/configs/{ENV}/scripts/ |
| Elasticsearchライセンス（.json）ファイル | lcp/search/license/{ENV}/      | search/configs/{ENV}/license/ |

```{note}
`search/configs/{ENV}/` にあるファイルは、Liferay Cloud の Search コンテナの `usr/shared/elasticsearch/` にオーバーライドとしてコピーされます。 例えば、`search/configs/{ENV}/config/` にある `elasticsearch.yml` などの設定は `usr/shared/elasticsearch/config/` にコピーされ、既存のデフォルトをオーバーライドします。
```

### Elasticsearchプラグイン

Elasticsearchプラグインを `search` サービスにインストールできるようになりました。 インストールされているElasticsearchプラグインを表示するには、 `search` サービス内のシェルを使用して、次のコマンドを実行します：

```bash
bin/elasticsearch-plugin list
```

イメージがデフォルトでインストールするプラグイン以外のElasticsearchプラグインを追加でインストールする場合は、 `search` サービスの `LCP_SERVICE_SEARCH_ES_PLUGINS` 環境変数を、インストールするプラグイン名のカンマ区切りリストに設定できます。 これらは、サービスのデプロイ中にインストールされます。

## CIサービスの変更

デフォルトのパイプラインが定義されたため、デフォルトの `Jenkinsfile` はリポジトリで不要になりました。 任意の `Jenkinsfile` は、リポジトリのルートではなく `ci` フォルダに定義されるようになりました。

複数の `Jenkinsfile` 拡張ポイントが `ci` フォルダ内で利用できるようになり、ビルド作成のさまざまな段階で手順を定義できるようになりました。 詳しくは、 [デフォルトのJenkinsfileを拡張する](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) をご覧ください。

### 環境変数を使用したホットフィックスのインストール

大規模なHotfixをGitリポジトリに直接コミットする代わりに、CIビルドプロセスを通じてHotfixをインストールできる新しい環境変数が追加されました。 `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 環境変数（Liferay Cloud コンソールの `Environment Variables` タブ、または `ci` サービスの `LCP.json` ファイル）にホットフィックスの名前（ `.zip` 拡張子は省略）を追加すると、CI サービスはビルド プロセス中に自動的に適用されるようになります。

次の例では、 `LCP.json` ファイルを使用してホットフィックスを定義しています：

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-33-7210",
}
```

## ウェブサーバーサービスの変更

`webserver` サービス内のすべての設定は、環境固有の `configs` ディレクトリに属します。 さらに、静的コンテンツ用の `deploy` フォルダーが削除されました。 代わりに、カスタムコンテンツを `パブリック` フォルダーに追加します。

`webserver` サービス設定の新しい設定については、次の表を参照してください：

| **ファイル** | **3.xでの場所** | **4.xでの場所** |
|:--------- |:---------------------------- |:-------------------------------- |
| ウェブサーバー設定 | lcp/webserver/config/{ENV}/ | webserver/configs/{ENV}/conf.d/  |
| カスタムスクリプト | lcp/webserver/script/{ENV}/ | webserver/configs/{ENV}/scripts/ |
| 静的コンテンツ   | lcp/webserver/deploy/{ENV}/ | webserver/configs/{ENV}/public/  |

```{note}
`webserver/configs/{ENV}/` にあるファイルは、Liferay Cloud の Web サーバコンテナ内の `/etc/nginx/` にオーバーライドとしてコピーされます。 `wbserver/configs/{ENV}/public/` にあるファイルは、オーバーライドとして `var/www/html/` にコピーされます。
```

### Webサーバー設定の上書き

`liferay.conf` ファイルを `webserver/configs/{ENV}/conf.d/`に追加することにより、 `webserver` サービスのルート位置をカスタマイズすることができま す。 これにより、 `webserver` サービスイメージのコンテナで利用可能なデフォルトの `liferay.conf` が上書きされます。 Liferay Cloud Console のシェルにアクセスすると、ルートロケーションをカスタマイズする際の参考として、デフォルトの `liferay.conf` ファイルを確認することができます。

```{warning}
このファイルが特にデフォルトの `liferay.conf` を上書きするように、`liferay.conf` 以外のファイル名でルートの場所をカスタマイズしないようにしてください。 そうでない場合は、両方のファイルがコンテナ内に一緒に存在していて、2つのルート位置が見つかってエラーになることがあります。

他のファイル名は、代わりにウェブサーバの追加の場所を定義するために使用されます。
```

また、 `webserver/configs/{ENV}/`に `nginx.conf` ファイルを追加することで、デフォルトの NGINX 設定を上書きすることもできます。 これを使用して、Webサーバーの動作をさらに定義できます。 詳細は、 [公式のNGINXドキュメント](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/) を参照してください。

### パブリックディレクトリの設定

カスタム静的コンテンツを追加したい場合は、これらのファイルを `webserver/configs/{ENV}/public/`に配置します。 Liferay Cloud はこの public フォルダを探し、その中のすべてのファイルを `/var/www/html にコピーします`.

パブリックフォルダーを設定するには、 `conf.d` フォルダー内に場所を追加する必要があります。 例えば、 `.html` ファイル（ `index.html`など）を新しい `webserver/configs/{ENV}/public/static` フォルダに追加する場合、 `.conf` 設定ファイルを `webserver/configs/{ENV}/conf.d` へ追加し、以下の内容を記述してください。

```apacheconf
location /static/ {
  root /var/www/html;
}
```

## バックアップサービスの変更

`バックアップ` サービス内のすべての設定は、環境固有の `コンフィグ` ディレクトリに属するようになりました。 これは主にカスタムSQLスクリプトに関係しています：

| **ファイル** | **3.xでの場所** | **4.xでの場所** |
|:------------ |:------------------------ |:----------------------------- |
| カスタムSQLスクリプト | lcp/backup/script/{ENV}/ | backup/configs/{ENV}/scripts/ |

`バックアップ` サービスに展開されたすべての `.sql` スクリプトは、バックアップ・リストア処理の完了後に自動的に実行され、リストア先の環境は、自身の `バックアップ` サービスからスクリプトを実行します。 また、大きな `.sql` ファイルや、複数の `.sql` ファイルを `.tgz`, `.gz`, `.zip` 形式で圧縮して、このディレクトリに配置することもできます。

## 既知の制限事項

新しいスタックには、ローカル環境を立ち上げるためのdocker-composeファイルが含まれていません。 このため、ローカルテストにはDXPバンドルが必要です。

ローカル環境で変更をテストし、その後Liferay Cloudに移行することができます。 詳しくは [Liferay Cloud](../migrating-to-liferay-cloud.md) への移行をご覧ください。

## 関連トピック

* [Liferayクラウドスタックのアップグレード](./upgrading-your-liferay-cloud-stack.md)