# クライアント拡張との連携

{bdg-secondary}`liferay DXP 7.4 (self-hosted)`   {bdg-secondary}`Liferay Experience Cloud (SaaS)`   {bdg-unsupported}`Liferay Cloud：セルフマネージド`

クライアントエクステンションを使えば、OSGiモジュールをデプロイせずにLiferayを拡張できます。 従来のモジュール開発と同様に、クライアント拡張は [Liferay Workspace](../tooling/liferay-workspace.md) に置かれます。 学ぶことから始めよう

* クライアント・エクステンションの開発に必要なツール
* 設定ファイルでクライアントの拡張子を定義する方法
* クライアント・エクステンションの導入方法

## 必要なツールと設定

クライアント拡張機能を開発するための3つの前提条件をインストールします：

1. Java 8またはJDK 11。

    ```{note}
    サポートされているJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVM設定については、 [JVM設定](../../installation-and-upgrades/reference/jvm-configuration.md) を参照のこと。
    ```

1. Liferayのワークスペース。 クライアント拡張プロジェクトのサンプルがあるワークスペースをダウンロードするには、以下を実行します。

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content?r=liferay-public-releases&g=com.liferay.workspace&a=com.liferay.sample.workspace&v=LATEST&p=zip
   ```

   クライアント拡張プロジェクト（`client-extensions/`ディレクトリ）を自分のワークスペースにコピーするか、サンプルのワークスペースを直接使用することができます。

1. Liferay Experience Cloud (LXC) を使用している場合は、 [コマンドラインツール](https://learn.liferay.com/ja/w/liferay-cloud/reference/command-line-tool) が必要です。

## 顧客拡張プロジェクト

クライアント・エクステンションの開発は、「ワークスペース＋プロジェクト」モデルに従う。 [Liferay ワークスペース](../tooling/liferay-workspace.md) 内で、`[workspace-root]/client-extensions`配下にクライアント拡張プロジェクトを実装します。 プロジェクトの`client-extension.yaml`ファイルはクライアント拡張を定義し、ビルドプロセスはプロジェクトごとに1セットの出力を生成する。 ビルドされたクライアント拡張プロジェクトはLiferay Universal File Format Archive (LUFFA)と呼ばれる配置可能な`*.zip`アーカイブです。

## プロジェクト内のクライアント拡張機能のグループ化

1つのプロジェクトにグループ化されたクライアント・エクステンションは、ビルド時に1つの配備可能なユニットを構成する。 クライアントのエクステンションをグループ化することは理にかなっている（たとえば、関連するタスクに取り組むときに効率を上げるためなど）。

1つのプロジェクト内のすべてのクライアント拡張機能は、そのプロジェクト固有のワークロードを表すDockerコンテナに関連付けられているため、特定の種類のクライアント拡張機能のみがグループ化に対応しています。 例えば、 [マイクロサービスクライアントエクステンション](./microservice-client-extensions.md) は、コンフィギュレーションクライアントエクステンションとだけグループ化することができます。マイクロサービスは Liferay の外部で実行されるワークロードを表すからです。

クライアントエクステンションをグループ化するには、以下の方法があります：

* 同じタイプのクライアント拡張（例：複数のバッチクライアント拡張）
* バッチクライアント拡張機能による構成クライアント拡張機能
* フロントエンドクライアント拡張機能によるクライアント拡張機能の構成
* マイクロサービスクライアント拡張機能による構成クライアント拡張機能

互換性のないクライアント・エクステンションのグループ（例：フロントエンドとマイクロサービス）を持つプロジェクトのビルドがエラーで失敗する。

## クライアント拡張機能の設定

クライアント拡張は、これらのプロパティを持つ `client-extension.yaml` ファイルで定義される：

`name`：Liferay UI に表示される名前を入力します。 UIで設定できない場合、`name`の値は使用されない。

`type`：クライアント拡張のタイプを設定する (例 `themeCSS`)。 このタイプは、Liferayがクライアント拡張をデプロイしたときにどのように扱うかを決定します。

`dxp.lxc.liferay.com.virtualInstanceId`：デプロイ先の仮想インスタンス ID を入力します。

各クライアント拡張プロジェクトはワークスペースの `client-extensions/` フォルダの中に独自のフォルダを持ちます。 クライアント拡張プロジェクトには、1つまたは複数のクライアント拡張を定義した `client-extension.yaml` ファイルが含まれます。 例えば、 [`iframe-2` プロジェクトの `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) では、3つの `iframe` クライアント拡張が定義されています：`Baseball`、`Football`、`Hockey` である。

### クライアント拡張機能の組み立て

クライアント・エクステンションをビルドすると、ファイルは自動的に作成され、 [LUFFA](./packaging-client-extensions.md) にパッケージされます。 `client-extension.yaml`ファイルに `assemble` ブロックを定義して、ビルドファイルまたはプロジェクトファイルからインクルードするファイルを設定します。

`assembleClientExtension`Gradle タスクは、クライアント拡張プロジェクト内で`gradle build`または`gradle deploy`を実行するときに実行されます。 実行中、プロジェクトの`assemble`ブロックで指定されたファイルはプロジェクト内の`build/liferay-client-extension-build/` フォルダに配置されます。 このフォルダにあるものはすべて、LUFFAを作成するために使用されます（例：`dist/my-client-extension-project.zip`）。

```{note}
クライアント拡張プロジェクトに `build` スクリプトが定義された `package.json` ファイルが含まれている場合、プロジェクトのビルド時にスクリプトが自動的に実行されます。 ビルドのこの部分はファイルがコピーされる*前に行われるので、`assemble`ブロックでタスクの出力場所を指定できます。
```

`assemble` ブロックは YAML 配列で、インクルードするファイルを複数指定できます。 各指示はこのパターンに従っている：

```yaml
- from: [some folder in your project]
  include: [single file or glob match]
  into: [output location in archive]
```

`assemble`配列は以下のプロパティを持つ：

* `from`：クライアント拡張アーカイブにファイルをコピーする元のフォルダを指定します。

* `include`：fromディレクトリからインクルードする単一のファイルまたはファイルのサブセットにマッチするグロブを指定する。 定義されていない場合、すべてのファイルが再帰的にインクルードされる（`**/*`と同等）。

  必要であれば、複数の `include` パターンの配列を使うことができる：

  ```yaml
  assemble:
      - from: build
        include:
          - "vite/js/*.js"
          - "vite/css/*.css"
        into: static
  ```

* `into`：結果のLUFFAのどこにマッチするリソースをコピーするかを指定する。

  フロントエンドクライアント拡張用の静的リソースは `static/` ディレクトリにコピーする必要があります。 Liferayはこれらを静的リソースとしてセルフホストインスタンスで、またはLXCのコンテナから提供します。

  バッチクライアント拡張用のJSONリソースは `batch/` ディレクトリにコピーする必要がある。

* `fromTask`です：`from`の代わりに、アセンブルステップの前に実行するプロジェクト内のGradleタスクを指定することができます。

  例えば、Spring Boot を使った `microservice` クライアント拡張プロジェクトでは、Gradle タスク `bootJar` がアプリケーションとその依存関係を含む `.jar` ファイルを作成する。 この場合、`fromTask` プロパティを使用して、プロジェクトの `bootJar` Gradle タスクの実行をトリガーし、タスクの出力（ビルドされた `.jar` ファイル）を LUFFA のルートに含めます：

  ```yaml
  assemble:
      - fromTask: bootJar
  ```

  プロジェクトの `build.gradle` ファイルに [Gradle exec task](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.Exec.html) を定義することで、ビルドの一部として `fromTask` を使って他のコマンドを実行することができます（他のプログラミング言語で書かれたコードのビルドなど）。

### アセンブル`ブロックの例

`assemble`ブロックには複数の`from` アイテムを含めることができます：

```yaml
assemble:
    - from: build/folder/aaa
      include: "css/*.css"
      into: folder/aaa
    - from: build/folder/bbb
      include: "css/*.css"
      into: folder/bbb
```

のように、ビルドされていないプロジェクトのリソースを含めることもできます。

```yaml
assemble:
    - from: assets
      into: static
```

この例では、`[project-root]/somewhere/else`にあるすべての`*.ico`ファイルをLUFFAの`static`フォルダに置きます。

```yaml
assemble:
    - from: somewhere/else
      include: "*.ico"
      into: static
```

LUFFAの作成、構造、内容の詳細については、 [クライアント拡張機能のパッケージ化](./packaging-client-extensions.md) を参照してください。

## Liferayインスタンスにデプロイする

クライアントの拡張機能は、配備可能な `.zip` アーカイブに組み込まれている。 各クライアント拡張機能のアーカイブには、クライアント拡張機能の設定を含むJSONファイルが含まれています。

`.zip`ファイルをLiferayのインストールに適した場所に配置し、クライアント拡張機能をデプロイします。 正確なコマンドは、Liferayインスタンスがどのようにホストされているかによって異なります。

### LXCへのデプロイ

```{warning}
この方法では、自己管理インスタンス（LXC-SM）にクライアント拡張機能をデプロイできません。
```

LXC用のクライアント拡張機能をデプロイする、

1. ワークスペースの `client-extensions/` フォルダーに移動し、以下を実行する。

   ```bash
   ../gradlew clean build
   ```

   コンパイルされた `.zip` ファイルは各プロジェクトの `dist/` フォルダに作成される。 プロジェクトを1つずつビルドするには、プロジェクトのフォルダからコマンドを実行する。

1. このコマンドを実行して、各クライアント拡張機能を選択した環境にデプロイします：

   ```bash
   lcp deploy --extension [extension-zip-file]
   ```

   プロンプトが表示されたら、プロジェクトと配置環境を選択します。 コマンドが完了すると、zipファイルがLXCプロジェクトにアップロードされる。

### セルフホストLiferayインスタンスへのデプロイ

Liferayのインストールをセルフホストしている場合は、ワークスペースのバンドルZIPを使用してクライアント拡張機能をデプロイしてください。 クライアント拡張機能をビルドしてデプロイするには、ワークスペースの `client-extensions/` フォルダからこのコマンドを実行します：

```bash
../gradlew clean distBundleZip
```

zipファイルを手動でデプロイする必要がある場合は、以下を実行してください。

```bash
../gradlew clean build
```

次に、各プロジェクトの `dist/` フォルダにあるアーカイブをサーバーの `[Liferay Home]/osgi/client-extensions/` フォルダにコピーします。

## 状況に応じた情報

クライアント拡張はポータブルです。ドメイン名、ネットワークアドレス、Liferayのドメインなど、環境固有の詳細をハードコードすべきではありません。 クライアント・エクステンションは、実行時にコンテキストに関する情報を見つけることができる。

各クライアント拡張ワークロードには、重要な文脈依存メタデータを含む **ルート** のセットが自動的に提供される。 このルートベースのアプローチにより、アプリケーションロジックは、どこで呼び出されたかに関係なく、一様にコンテキストに敏感な情報を取得することができる。 クライアントのエクステンション・プロジェクトをそこに向けるだけでいい。

### ルート

**ルート** は、キーと値のペアのセットを含むディレクトリ構造である。 ファイル名がキーで、ファイルの内容が値となる。 ディレクトリ構造は無視され、ディレクトリパスは環境変数の値となる。 [Kubernetes configMaps](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#add-configmap-data-to-a-volume) と同じパターンです。

使用する環境変数は、2種類のルートのいずれかを指すことができる：

1. `liferay_routes_dxp`：デプロイされた **Liferay 仮想インスタンス** のコンテキスト依存のメタデータを持つルートのディレクトリパス。

   以下は `LIFERAY_ROUTES_DXP` ルートの例です：

   ```properties
   .
   # A newline-separated list of every domain belonging to the DXP virtual instance
   ├── com.liferay.lxc.dxp.domains
   # The primary domain ("Virtual Host" field) of the DXP virtual instance
   ├── com.liferay.lxc.dxp.main.domain
   # The protocol with which to communicate with DXP virtual instance (http or https)
   └── com.liferay.lxc.dxp.server.protocol
   ```

1. `liferay_routes_client_extension`：**クライアント拡張プロジェクト**自身のコンテキスト依存のメタデータを含むルートへのディレクトリパス。

   例については [OAuth Headless Server Client Extensions](configuration-client-extensions.md#oauth-headless-server-client-extensions) および [OAuth User Agent Client Extensions](configuration-client-extensions.md#oauth-user-agent-client-extensions) を参照してください。

### Liferayエクスペリエンスクラウドのルートへのポインティング

Liferay Experience Cloud のコンテナでは、これらの環境変数が自動的に設定されます。 ルートは、環境変数が定義するパスでコンテナに自動的にマウントされる。

### セルフ・ホスト環境におけるルートへのポインティング

Liferay Workspace の `Exec`、`JavaExec`、`NodeExec` Gradle タスクを使用する場合、これらの環境変数には自動的にデフォルト値が設定されます。 これらのデフォルト値を使用する：

| **環境変数                          |** デフォルト値**                                                      |
| :-------------------------------- | :-------------------------------------------------------------- |
| `LIFERAY_ROUTES_DXP`              | `[Liferay Home]/routes/default/dxp`                             |
| `LIFERAY_ROUTES_CLIENT_EXTENSION` | `[Liferay Home]/routes/default/[Client extension project name]` |

環境変数は Liferay のワークスペースにある `liferay.workspace.home.dir` プロパティを Liferay のホームディレクトリに、`default` をデフォルトの Liferay 仮想インスタンスに使用します。 default`の代わりに特定の仮想インスタンスIDを指定して、これらの環境変数を定義する。

```{note}
Liferayワークスペースのバージョンが9.0.2より前の場合は、同じ形式に従って自分で環境変数を定義する必要があります。
```

これら2つの環境変数は、クライアント拡張プロセスがメタデータにアクセスするために呼び出される際に提供されなければならない。

## 関連トピック

* [バッチクライアント拡張](./batch-client-extensions.md) 
* [設定 クライアント拡張](./configuration-client-extensions.md)
* [フロントエンド・クライアント拡張](./frontend-client-extensions.md)
* [マイクロサービス・クライアント拡張](./microservice-client-extensions.md)
* [クライアント拡張機能のパッケージ化](./packaging-client-extensions.md)

## チュートリアル

* [JavaScriptクライアント拡張機能の使用](./frontend-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSSクライアント拡張機能を使う](./frontend-client-extensions/tutorials/using-a-css-client-extension.md)
