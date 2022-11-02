# デプロイメント環境の構築

あなたのコードを共有する準備が整うときが来るのです。 そのためには、環境を構築する必要があります。 企業の世界では、通常3つの環境があります。

* 開発者：コードを迅速に修正および再デプロイできる、早期テスト用の環境。 デベロッパーやパワーユーザーはここでテストする。
* ユーザー受け入れテスト（UAT）：本番環境の構成をより厳密に反映する環境。 アプリケーションがほぼ完成したら、通常、より多くのユーザーをここでテストするように招待します。
* 本番環境：本番環境のサイトが存在する環境。 デプロイメントは厳密に制御され、他の2つの環境でテストされたコードのみがデプロイされます。

Liferay Workspaceを使用すると、コンテナーベースであろうと従来型であろうと、デプロイ環境を簡単に生成できます。 構成を提供し、Gradleタスクを実行すると、配布可能なDockerコンテナまたはサーバーアーカイブを生成して、インストールすることができます。 ワークスペースには、アクションが発生するオプションの`configs`フォルダが含まれています。

[Blade CLI](../blade-cli/generating-projects-with-blade-cli.md)を使用してワークスペースを作成した場合、`configs`フォルダは既に存在しています。 ワークスペースを[手動で](./creating-a-liferay-workspace.md)作成した場合は、ワークスペースディレクトリに次のフォルダ構造を作成します。

   ```
   ├── common
   │   └── portal-setup-wizard.properties
   ├── dev
   │   └── portal-ext.properties
   ├── docker
   ├── local
   ├── prod
   └── uat
       └── portal-ext.properties
   ```

まだファイルには何も入れないでください。

## デプロイメント環境の仕組み

`configs`フォルダは、特定のシナリオを定義します。

`common`：すべての環境に適用される構成が含まれています。

`dev`：開発環境の構成が含まれています。

`docker`：Docker構成が含まれています。

`local`：ワークスペースが存在するローカル環境の構成が含まれます。

`prod`：本番環境の構成が含まれています。

`uat`：ユーザー受け入れテスト環境の構成が含まれています。

構成ファイルを特定のフォルダに配置すると、その環境の構成が定義されます。 `common` と `docker`の場合、他のすべての設定はそれらを上書きします。 これは、環境がオーバーライドするための基本設定を提供できるようにするためです。 これで、いくつかの環境を構築する準備が整いました。

## デプロイメント環境の構築

ご使用の環境で次のシナリオを想定します。

- 開発者環境は開発者プロパティを使用する必要があります
- ローカル環境はローカルデータベースを指します
- 開発者およびUAT環境は、独自のデータベースを指します
- すべての環境はセットアップウィザードをスキップします

そのシナリオを構成する方法は次のとおりです。

1. `common`フォルダで、次のプロパティを`portal-setup-wizard.properties`に追加します

   ```properties
   setup.wizard.enabled=false
   ```
1. `local`フォルダで、`portal-ext.properties`にローカルデータベースを構成します。

   ```properties
   #
   # MySQL
   #
   jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
   jdbc.default.url=jdbc:mysql://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   jdbc.default.username=root
   jdbc.default.password=password
   ```

1. `dev`フォルダで、開発者プロパティを有効にし、`portal-ext.properties`の開発サーバーでデータベースを構成します。

   ```properties
   include-and-override=portal-developer.properties

   #
   # MySQL
   #
   jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
   jdbc.default.url=jdbc:mysql://devel.server/lportaldev?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   jdbc.default.username=root
   jdbc.default.password=password
   ```

1. `uat`フォルダで、`portal-ext.properties`のUAT環境でデータベースを構成します。

   ```properties
   #
   # MySQL
   #
   jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
   jdbc.default.url=jdbc:mysql://uat.server/lportaluat?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   jdbc.default.username=root
   jdbc.default.password=password
   ```

これで、環境を生成して配布する準備が整いました。

## デプロイメント環境の生成

これで、Dockerコンテナやバンドルを生成して、ローカルで実行したり、サーバーに配布したりすることができます。

### Dockerコンテナの生成

Dockerコンテナを生成すると、すべての環境に対する設定が含まれています。 どの環境を使用するかは、 `liferay.workspace.environment` 変数で選択します。

デプロイ環境の設定からDockerコンテナを生成するには、次のコマンドを使用します。

```bash
./gradlew buildDockerImage
```

Dockerコンテナがビルドされたら、このコマンドで上記のdev設定を使ってコンテナを起動します。

```bash
./gradlew startDockerContainer -Pliferay.workspace.environment=dev
```

コンフィギュレーションはLiferayコンテナの中で生成され、変数が使用するコンフィギュレーションを決定します。

![すべての設定は、Dockerコンテナ内で生成されます。](./creating-deployment-environments/images/01.png)

### バンドルの生成

これは、`initBundle`または`distBundle` Gradleタスクのいずれかを使用して実行されます。

1. 最初に環境をテストする必要があります。 ローカルでビルドするには、`initBundle`コマンドを使用します。 たとえば、`dev`環境を構築するには、次のように実行します。

   ```bash
   ./gradlew initBundle -Pliferay.workspace.environment=dev
   ```
   これにより、ワークスペース内のすべてのプロジェクトがコンパイルされ、`bundles`フォルダ内のランタイムにデプロイされます。 また、指定した構成も提供されます（この例では、`dev`環境の構成）。 `bundles`フォルダ内の`portal-ext.properties`ファイルを調べると、`dev`構成に提供したものと一致していることがわかります。

1. 環境が整いテストが良好な場合は、すべてのアプリケーションと構成を含む配布可能なバンドルを構築できます。 次のコマンドを実行します。

   ```bash
   ./gradlew distBundleTar -Pliferay.workspace.environment=dev
   ```

   これにより、gzip圧縮された`tar`ファイルが`build`フォルダにビルドされます。 このアーカイブを取得して、他のLiferayバンドルと同じように開発サーバーにインストールできます。ただし、このバンドルは希望どおりに完全に構成されており、すべてのアプリケーションが既にインストールされている点が異なります。

```{note}
.zipアーカイブが必要な場合は、`distBundleZip`コマンドを使用できます。
```

上記の手順に従って、各環境をテストおよび構築します。

また、すべての環境を一度に構築することも可能です。 これには2つのステップしかありません。

1. Workspace の `gradle.properties` ファイルの `liferay.workspace.bundle.dist.include.metadata` のプロパティを `true` に設定します。

   ```properties
   liferay.workspace.bundle.dist.include.metadata=true
   ```

2. ターゲットを呼び出して、すべてのバンドルをビルドします。 すべてのバンドルを gzip された tar ファイルにビルドするには、次のようにします。

   ```bash
   ./gradlew distBundleTarAll
   ```

   すべてのバンドルファイルを .zip ファイルにビルドするには

   ```bash
   ./gradlew distBundleZipAll
   ```

