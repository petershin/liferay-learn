# バージョン4におけるDXP Cloudプロジェクトの変更

DXP Cloud スタックのバージョン 3.x と 4.x の間には、サービスに対して Docker イメージのバージョンを定義する場所、リポジトリの構造、および `Jenkinsfiles` の使用方法など、いくつかの変更が加えられています。

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

DXP Cloudのバージョン4.xのサービス用Dockerイメージは、プロジェクトの `gradle.properties` ファイルに定義されなくなりました。 各サービスの `LCP.json` ファイルに定義されるようになりました。

DXP Cloud Stackバージョン4にアップグレードすると、すべてのサービスのDockerイメージバージョンが `3.xx` から `4.xx`に変更されます。 これらのイメージの変更は、DXP Cloudプロジェクトの構造と機能の方法に対する組織の変更に加えて行われます。

## プロジェクト組織の変更

リポジトリの最大の変更点は、各サービスのファイル（ `LCP.json` ファイルを含む）がリポジトリのルートにあるフォルダ（例： `liferay/` や `webserver/`）に移動されたことです。 これらのサービスは、再配置されたサービスフォルダーに移動し、 [CLI ツール](./command-line-tool.md)を使用して、個別にデプロイすることができます。 `lcp` フォルダーが削除され、これらのサービスのパスに含まれなくなりました。 これらのフォルダ自体は、 [Liferayワークスペースの構造](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay-workspace/what-is-liferay-workspace.html)に似せて再編成されています。

リポジトリのルートにあった他のいくつかのファイル（ `gradle.properties`、 `build.gradle`、 `settings.gradle`を含む）も、 `liferay` サービスに移動されました。

## Liferayサービスの変更

`liferay` サービスフォルダは [Liferay Workspace](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay-workspace/what-is-liferay-workspace.html)の機能構造に従っています。

`liferay` サービス内のすべての構成は、プロジェクトの DXP Cloud 環境に対応する環境固有の `configs` ディレクトリに属するようになりました。 さらに、 `ライセンス` フォルダーが削除されました。 代わりに、 `デプロイ` フォルダーにライセンスを追加してください。

次の表は、 `liferay` サービス設定の新しい設定をまとめたものです。

| **ファイル**                   | **3.xでの場所**                | **4.xでの場所**                         |
|:-------------------------- |:-------------------------- |:----------------------------------- |
| デプロイするファイル                 | lcp/liferay/deploy/{ENV}/。 | liferay/configs/{ENV}/deploy/       |
| OSGi設定ファイル（.cfgまたは.config） | lcp/liferay/config/{ENV}/。 | liferay/configs/{ENV}/osgi/configs/ |
| その他の設定オーバーライド              | lcp/liferay/config/{ENV}/。 | liferay/configs/{ENV}/              |
| カスタムシェルスクリプト               | lcp/liferay/script/{ENV}/  | liferay/configs/{ENV}/scripts/      |
| ホットフィックスとパッチツール            | lcp/liferay/hotfix/{ENV}/  | liferay/configs/{ENV}/patching/     |
| ライセンス                      | lcp/liferay/license/{ENV}/ | lcp/configs/{ENV}/deploy/           |

```{note}
configs/{ENV}/` ディレクトリ内のファイルは、DXP Cloud の Liferay コンテナ内の `LIFERAY_HOME` ディレクトリにオーバーライドとしてコピーされます。
```

ホットフィックスを直接リポジトリにコミットするのではなく、Liferayサービスのデプロイ時に自動的に追加される新しいCIサービス環境変数が用意されています。 詳細については、 [Installing Hotfixes with an Environment Variable](#installing-hotfixes-with-an-environment-variable) を参照してください。

### カスタムスクリプトの実行

`liferay/configs/{ENV}/scripts/` に置かれたスクリプトは root ユーザーとしてではなく、 `liferay` のユーザーとして実行されるようになりました。 スクリプトをルートとして実行する必要がある場合は、代わりにスクリプトを `Jenkinsfile` に追加する必要があります。

## 検索サービスの変更

`search` サービス内のすべての設定は、環境固有の `configs` ディレクトリに属します。 `search` サービス設定の新しい設定については、次の表を参照してください：

| **ファイル**                      | **3.xでの場所**                   | **4.xでの場所**                   |
|:----------------------------- |:----------------------------- |:----------------------------- |
| Elasticsearch の設定             | lcp/search/config/{ENV}/ です。  | search/configs/{ENV}/config/  |
| カスタムシェルスクリプト                  | lcp/search/script/{ENV}/      | search/configs/{ENV}/scripts/ |
| Elasticsearchライセンス（.json）ファイル | lcp/search/license/{ENV}/ です。 | search/configs/{ENV}/license/ |

```{note}
search/configs/{ENV}/` にあるファイルは、DXP Cloud の Search コンテナ内の `usr/shared/elasticsearch/` にオーバーライドとしてコピーされます。 例えば、`search/configs/{ENV}/config/` にある `elasticsearch.yml` などの設定は `usr/shared/elasticsearch/config/` にコピーされ、既存のデフォルトをオーバーライドします。
```

### Elasticsearchプラグイン

Elasticsearchプラグインを `search` サービスにインストールできるようになりました。 インストールされているElasticsearchプラグインを表示するには、 `search` サービス内のシェルを使用して、次のコマンドを実行します：

```bash
bin/elasticsearch-pluginリスト
```

イメージがデフォルトでインストールするプラグイン以外のElasticsearchプラグインを追加でインストールする場合は、 `search` サービスの `LCP_SERVICE_SEARCH_ES_PLUGINS` 環境変数を、インストールするプラグイン名のカンマ区切りリストに設定できます。 これらは、サービスのデプロイ中にインストールされます。

## CIサービスの変更

デフォルトのパイプラインが定義されたため、デフォルトの `Jenkinsfile` はリポジトリで不要になりました。 任意の `Jenkinsfile` は、リポジトリのルートではなく `ci` フォルダに定義されるようになりました。

複数の `Jenkinsfile` 拡張ポイントが `ci` フォルダ内で利用できるようになり、ビルド作成のさまざまな段階で手順を定義できるようになりました。 詳しくは、 [デフォルトのJenkinsfileを拡張する](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) をご覧ください。

### 環境変数を使用したホットフィックスのインストール

大規模なHotfixをGitリポジトリに直接コミットする代わりに、CIビルドプロセスを通じてHotfixをインストールできる新しい環境変数が追加されました。 ビルドプロセス中にCIサービスが自動的に適用するために、ホットフィックスの名前（ `.zip` 拡張子は省略）を `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 環境変数（DXP Cloud コンソールの `Environment Variables` タブ、または `ci` サービスの `LCP.json` に追加してください）に追加します。

次の例では、 `LCP.json` ファイルを使用してホットフィックスを定義しています：

```
"env":{
    "lcp_ci_liferay_dxp_hotfixes_common":"liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV":"liferay-hotfix-33-7210",
}.
```

## ウェブサーバーサービスの変更

`webserver` サービス内のすべての設定は、環境固有の `configs` ディレクトリに属します。 さらに、静的コンテンツ用の `deploy` フォルダーが削除されました。 代わりに、カスタムコンテンツを `パブリック` フォルダーに追加します。

`webserver` サービス設定の新しい設定については、次の表を参照してください：

| **ファイル**  | **3.xでの場所**                  | **4.xでの場所**                      |
|:--------- |:---------------------------- |:-------------------------------- |
| ウェブサーバー設定 | lcp/webserver/config/{ENV}/。 | webserver/configs/{ENV}/conf.d/  |
| カスタムスクリプト | lcp/webserver/script/{ENV}/。 | webserver/configs/{ENV}/scripts/ |
| 静的コンテンツ   | lcp/webserver/deploy/{ENV}/。 | webserver/configs/{ENV}/public/  |

```{note}
webserver/configs/{ENV}/` にあるファイルは、DXP Cloud の Web サーバコンテナ内の `/etc/nginx/` にオーバーライドとしてコピーされます。 wbserver/configs/{ENV}/public/` にあるファイルは、オーバーライドとして `var/www/html/` にコピーされます。
```

### Webサーバー設定の上書き

`liferay.conf` ファイルを `webserver/configs/{ENV}/conf.d/`に追加することにより、 `webserver` サービスのルート位置をカスタマイズすることができま す。 これにより、 `webserver` サービスイメージのコンテナで利用可能なデフォルトの `liferay.conf` が上書きされます。 ルートの場所をカスタマイズするときに、DXP Cloud Consoleのシェルにアクセスして、デフォルトとして `liferay.conf` ファイルを参照として表示します。

```{warning}
このファイルが特にデフォルトの `liferay.conf` を上書きするように、`liferay.conf` 以外のファイル名でルートの場所をカスタマイズしないようにしてください。 そうでない場合は、両方のファイルがコンテナ内に一緒に存在していて、2つのルート位置が見つかってエラーになることがあります。

他のファイル名は、代わりにウェブサーバの追加の場所を定義するために使用されます。
```

また、 `webserver/configs/{ENV}/`に `nginx.conf` ファイルを追加することで、デフォルトの NGINX 設定を上書きすることもできます。 これを使用して、Webサーバーの動作をさらに定義できます。 詳細は、 [公式のNGINXドキュメント](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/) を参照してください。

### パブリックディレクトリの設定

カスタム静的コンテンツを追加したい場合は、これらのファイルを `webserver/configs/{ENV}/public/`に配置します。 DXP Cloudはこのパブリックフォルダを探し、その中のすべてのファイルを `/var/www/html`にコピーします。

パブリックフォルダーを設定するには、 `conf.d` フォルダー内に場所を追加する必要があります。 例えば、 `.html` ファイル（ `index.html`など）を新しい `webserver/configs/{ENV}/public/static` フォルダに追加する場合、 `.conf` 設定ファイルを `webserver/configs/{ENV}/conf.d` へ追加し、以下の内容を記述してください。

```apacheconf
location /static/ {
  root /var/www/html;
}.
```

## バックアップサービスの変更

`バックアップ` サービス内のすべての設定は、環境固有の `コンフィグ` ディレクトリに属するようになりました。 これは主にカスタムSQLスクリプトに関係しています：

| **ファイル**     | **3.xでの場所**               | **4.xでの場所**                   |
|:------------ |:------------------------- |:----------------------------- |
| カスタムSQLスクリプト | lcp/backup/script/{ENV}/。 | backup/configs/{ENV}/scripts/ |

`バックアップ` サービスに展開されたすべての `.sql` スクリプトは、バックアップ・リストア処理の完了後に自動的に実行され、リストア先の環境は、自身の `バックアップ` サービスからスクリプトを実行します。 また、大きな `.sql` ファイルや、複数の `.sql` ファイルを `.tgz`, `.gz`, `.zip` 形式で圧縮して、このディレクトリに配置することもできます。

## 既知の制限事項

新しいスタックには、ローカル環境を立ち上げるためのdocker-composeファイルが含まれていません。 このため、ローカルテストにはDXPバンドルが必要です。

ローカル環境で変更事項をテストしてから、DXP Cloudに移行することができます。 [DXPクラウドへの移行](../migrating-to-dxp-cloud.md) をご参照ください。

## 追加情報

* [DXPクラウドスタックのアップグレード](./upgrading-your-dxp-cloud-stack.md)