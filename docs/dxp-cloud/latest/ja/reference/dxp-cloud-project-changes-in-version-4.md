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
* [既知の制限](#known-limitations)

## Dockerイメージ定義の変更

DXP Cloudのバージョン4.xのサービス用Dockerイメージは、プロジェクトの `gradle.properties` ファイルに定義されなくなりました。 各サービスの `LCP.json` ファイルに定義されるようになりました。

DXP Cloud Stackバージョン4にアップグレードすると、すべてのサービスのDockerイメージバージョンが `3.xx` から `4.xx`に変更されます。 これらのイメージの変更は、DXP Cloudプロジェクトの構造と機能の方法に対する組織の変更に加えて行われます。

## プロジェクト組織の変更

リポジトリの最大の変更点は、各サービスのファイル（ `LCP.json` ファイルを含む）がリポジトリのルートのフォルダ（例： `liferay/` または `webserver/`）に移動したことです。 これらのサービスは、再配置されたサービスフォルダに移動し、 [CLI ツール](./command-line-tool.md)を使用して個別に配置することができます。 `lcp` フォルダーが削除され、これらのサービスのパスに含まれなくなりました。 これらのフォルダ自体は、 [Liferayワークスペース構造](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay-workspace/what-is-liferay-workspace.html)に類似するように再編成されています。

リポジトリのルートにあった他のいくつかのファイル（ `gradle.properties`、 `build.gradle`、 `settings.gradle`を含む）も、 `liferay` サービスに移動されました。

## Liferayサービスの変更

`liferay` サービスフォルダは、 [Liferay Workspace](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay-workspace/what-is-liferay-workspace.html)の機能構造に従っていることに注意してください。

`liferay` サービス内のすべての設定は、プロジェクトの DXP Cloud 環境に対応する環境固有の `configs` ディレクトリに所属するようになりました。 さらに、 `ライセンス` フォルダーが削除されました。 代わりに、 `デプロイ` フォルダーにライセンスを追加してください。

次の表は、 `liferay` サービス設定の新しい設定をまとめたものです。

| **ファイル**                   | **3.xでの場所**                    | **4.xでの場所**                         |
|:-------------------------- |:------------------------------ |:----------------------------------- |
| デプロイするファイル                 | lcp/liferay/deploy/{ENV}/です。   | liferay/configs/{ENV}/deploy/       |
| OSGi設定ファイル（.cfgまたは.config） | lcp/liferay/config/{ENV}/です。   | liferay/configs/{ENV}/osgi/configs/ |
| その他の設定オーバーライド              | lcp/liferay/config/{ENV}/です。   | liferay/configs/{ENV}/.             |
| カスタムシェルスクリプト               | lcp/liferay/script/{ENV}/です。   | liferay/configs/{ENV}/scripts/。     |
| ホットフィックスとパッチツール            | lcp/liferay/hotfix/{ENV}/.     | liferay/configs/{ENV}/patching/。    |
| ライセンス                      | lcp/liferay/license/{ENV}/ です。 | lcp/configs/{ENV}/deploy/。          |

```{note}
configs/{ENV}/` ディレクトリ内のファイルは、DXP Cloud の Liferay コンテナ内の `LIFERAY_HOME` ディレクトリにオーバーライドとしてコピーされます。
```

ホットフィックスを直接リポジトリにコミットするのではなく、Liferayサービスのデプロイ時に自動的に追加される新しいCIサービス環境変数が用意されています。 詳細については、 [Installing Hotfixes with an Environment Variable](#installing-hotfixes-with-an-environment-variable) を参照してください。

### カスタムスクリプトの実行

`liferay/configs/{ENV}/scripts/` に置かれたスクリプトは、ルートユーザーとしてではなく `liferay` ユーザーとして実行されるようになりました。 スクリプトをルートとして実行する必要がある場合は、代わりにスクリプトを `Jenkinsfile` に追加する必要があります。

## 検索サービスの変更

`search` サービス内のすべての設定は、環境固有の `configs` ディレクトリに属します。 `search` サービス設定の新しい設定については、次の表を参照してください：

| **ファイル**                      | **3.xでの場所**                    | **4.xでの場所**                                   |
|:----------------------------- |:------------------------------ |:--------------------------------------------- |
| Elasticsearch の設定             | lcp / search / config /{ENV}/  | search/configs/{ENV}/config/ [サーチ/コンフィグ/コンフィグ |
| カスタムシェルスクリプト                  | lcp/search/script/{ENV}/です。    | search/configs/{ENV}/scripts/。                |
| Elasticsearchライセンス（.json）ファイル | lcp / search / license /{ENV}/ | search/configs/{ENV}/license/.                |

```{note}
search/configs/{ENV}/` のファイルは、DXP Cloud の Search コンテナ内の `usr/shared/elasticsearch/` にオーバーライドとしてコピーされます。 例えば、`search/configs/{ENV}/config/` にある `elasticsearch.yml` などの設定は `usr/shared/elasticsearch/config/` にコピーされて、既存のデフォルトを上書きしてしまいます。
```

### Elasticsearchプラグイン

Elasticsearchプラグインを `search` サービスにインストールできるようになりました。 インストールされているElasticsearchプラグインを表示するには、 `search` サービス内のシェルを使用して、次のコマンドを実行します：

```bash
bin/elasticsearch-pluginリスト
```

イメージがデフォルトでインストールするプラグイン以外のElasticsearchプラグインを追加でインストールする場合は、 `search` サービスの `LCP_SERVICE_SEARCH_ES_PLUGINS` 環境変数を、インストールするプラグイン名のカンマ区切りリストに設定できます。 これらは、サービスのデプロイ中にインストールされます。

## CIサービスの変更

デフォルトのパイプラインが定義されたため、デフォルトの `Jenkinsfile` はリポジトリで不要になりました。 任意の `Jenkinsfile` は、リポジトリのルートではなく `ci` フォルダに定義されるようになりました。

複数の `Jenkinsfile` 拡張ポイントが `ci` フォルダ内で利用できるようになり、ビルド作成のさまざまな段階で手順を定義できるようになりました。 詳しくは、 [デフォルトのJenkinsfileの拡張](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) をご覧ください。

### 環境変数を使用したホットフィックスのインストール

大規模なホットフィックスをGitリポジトリに直接コミットする代わりに、CIのビルドプロセスを通じてホットフィックスをインストールできるように新しい環境変数が追加されました。 カンマで区切られたHotfixのリスト（ `.zip` extensions omitted) を `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 環境変数（DXP Cloud コンソールで `Environment Variables` タブを通して、または </code> で、"LCP "と "LIFERAY "の間にある {ENV} 環境変数に追加します。または、 `ci` サービスの `LCP.JSON <code> で設定します。json` ファイルに記述することで、CIサービスがビルドプロセス中に自動的に適用することができます。

次の例では、 `LCP.json` ファイルを使用してホットフィックスを定義しています：

```
"env":{
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON":"liferay-hotfix-10-7210,liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV":"liferay-hotfix-15-7210,liferay-hotfix-33-7210",
}.
```

## ウェブサーバーサービスの変更

`webserver` サービス内のすべての設定は、環境固有の `configs` ディレクトリに属します。 さらに、静的コンテンツ用の `deploy` フォルダーが削除されました。 代わりに、カスタムコンテンツを `パブリック` フォルダーに追加します。

`webserver` サービス設定の新しい設定については、次の表を参照してください：

| **ファイル**  | **3.xでの場所**                      | **4.xでの場所**                      |
|:--------- |:-------------------------------- |:-------------------------------- |
| ウェブサーバー設定 | lcp / webserver / config /{ENV}/ | ウェブサーバ/コンフィグ/{ENV}/conf.d/       |
| カスタムスクリプト | lcp/webserver/script/{ENV}/です。   | webserver/configs/{ENV}/scripts/ |
| 静的コンテンツ   | lcp/webserver/deploy/{ENV}/です。   | webserver/configs/{ENV}/public/  |

```{note}
webserver/configs/{ENV}/` のファイルは、DXP Cloud の Web サーバコンテナ内の `/etc/nginx/` にオーバーライドとしてコピーされます。 webserver/configs/{ENV}/public/` にあるファイルは、オーバーライドとして `var/www/html/` にコピーされます。
```

### Webサーバー設定の上書き

`ウェブサーバ` サービスのルートロケーションをカスタマイズするには、 `liferay.conf` ファイルを `webserver/configs/{ENV}/conf.d/`に追記してください。 これにより、 `webserver` サービスイメージのコンテナで利用可能なデフォルトの `liferay.conf` が上書きされます。 ルートの場所をカスタマイズするときに、DXP Cloud Consoleのシェルにアクセスして、デフォルトとして `liferay.conf` ファイルを参照として表示します。

```{warning}
このファイルが特にデフォルトの `liferay.conf` を上書きするように、`liferay.conf` 以外のファイル名でルートの場所をカスタマイズしないようにしてください。 そうでない場合は、両方のファイルがコンテナ内に一緒に存在していて、2つのルート位置が見つかってエラーになることがあります。

他のファイル名は、代わりにウェブサーバの追加の場所を定義するために使用されます。
```

また、 `webserver/configs/{ENV}/`に `nginx.conf` ファイルを追加することで、デフォルトの NGINX 設定を上書きすることもできます。 これを使用して、Webサーバーの動作をさらに定義できます。 詳細は、 [公式のNGINXドキュメント](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/) を参照してください。

### パブリックディレクトリの設定

カスタム静的コンテンツを追加したい場合は、これらのファイルを `webserver/configs/{ENV}/public/`に配置します。 DXP Cloudはこのパブリックフォルダを探し、その中のすべてのファイルを `/var/www/html`にコピーします。

パブリックフォルダーを設定するには、 `conf.d` フォルダー内に場所を追加する必要があります。 例えば、 `.html` ファイル ( `index.html`など) を新しい `webserver/configs/{ENV}/public/static` フォルダに、固有の `.conf /> 設定ファイルを追加するには、 <code> .conf` 設定ファイルを `webserver/configs/{ENV}/conf.d` に、以下の内容で追加してください。

```apacheconf
location /static/ {
  root /var/www/html;
}.
```

## バックアップサービスの変更

`バックアップ` サービス内のすべての設定は、環境固有の `コンフィグ` ディレクトリに属するようになりました。 これは主にカスタムSQLスクリプトに関係しています：

| **ファイル**     | **3.xでの場所**                   | **4.xでの場所**                    |
|:------------ |:----------------------------- |:------------------------------ |
| カスタムSQLスクリプト | lcp / backup / script /{ENV}/ | backup/configs/{ENV}/scripts/。 |

`.sql` サービスに展開されたすべての `backup` スクリプトはバックアップリストア処理の完了後に自動的に実行され、リストア先の環境は自身の `backup` サービスからそのスクリプトを実行することになります。 また、大きな `.sql` ファイルや、複数の `.sql` ファイルを `.gz <code>.gz /> .gz に圧縮することができる。tgz`, `.gz`, または ` .zip` 形式で、このディレクトリに置いてください。

## 既知の制限事項

新しいスタックには、ローカル環境を立ち上げるためのdocker-composeファイルが含まれていません。 このため、ローカルテストにはDXPバンドルが必要です。

ローカル環境で変更事項をテストしてから、DXP Cloudに移行することができます。 詳細は、 [DXP Cloudへの移行](../migrating-to-dxp-cloud.md) を参照してください。

## 追加情報

* [DXPクラウドスタックのアップグレード](./upgrading-your-dxp-cloud-stack.md)