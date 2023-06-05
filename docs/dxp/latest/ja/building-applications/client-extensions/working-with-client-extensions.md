# クライアントエクステンションの操作

{bdg-secondary}`7.4+`

クライアントエクステンションを使えば、OSGiモジュールをデプロイすることなく、Liferayを拡張することができます。 従来のモジュール開発と同様に、クライアントエクステンションは [Liferay Workspace](../tooling/liferay-workspace.md) に存在します。 を学ぶことから始めましょう。

- クライアントエクステンションの開発を開始するために必要なツール
- クライアントの拡張子を設定ファイルに定義する方法
- クライアントエクステンションを導入する方法

## 必要なツールや設定

クライアント・エクステンションを開発するための3つの前提条件をインストールします：

1. Java 8またはJDK 11。

    ```{note}
    対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) をご確認ください。 推奨されるJVMの設定については、 [JVM設定](../../installation-and-upgrades/references/jvm-configuration.html) を参照してください。
    ```

1. Liferayのワークスペースです。 クライアント拡張プロジェクトのサンプルを含むワークスペースをダウンロードするには、次のように実行します。

    ```bash
    curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
    ```

    クライアント拡張プロジェクト（ `client-extensions/` ディレクトリ内）を自分のワークスペースにコピーするか、サンプルワークスペースを直接使用することができます。

1. Liferay Experience Cloud（LXC）を使用している場合は、 [`lcp` CLI ツール](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool) ...が必要です。

## クライアントエクステンションプロジェクト

クライアントエクステンションの開発は、 **ワークスペース＋プロジェクト** のモデルで行われます。 [Liferay ワークスペース](../tooling/liferay-workspace.md)内で、 `[workspace-root]/client-extensions`の下にクライアントエクステンションプロジェクトを実装します。 プロジェクトの `client-extension.yaml` ファイルは、そのクライアント拡張機能を定義し、ビルドプロセスの結果、各プロジェクトの単一の出力セットが得られます。 ビルドされたクライアント拡張プロジェクトは、Liferay Universal File Format Archive (LUFFA) と呼ばれるデプロイ可能な `*.zip` アーカイブになります。

## プロジェクトでクライアント拡張機能をグループ化する

1つのプロジェクトにまとめられたクライアントエクステンションは、ビルドすると配備可能な1つのユニットとなります。 クライアントエクステンションをグループ化することは、理にかなっていますが（例えば、関連するタスクに取り組むべきときに効率を上げるため）、制約があります。

1つのプロジェクトに含まれるすべてのクライアント拡張機能は、そのプロジェクトに特有のワークロードを表すDockerコンテナに関連付けられるため、特定の種類のクライアント拡張機能のみがグループ化に適合します。 例えば、 [マイクロサービスクライアント拡張](./microservice-client-extensions.md) は、マイクロサービスがLiferayの外で実行されるワークロードを表すため、構成クライアント拡張とのみグループ化することができます。

クライアントエクステンションは、このような方法でグループ化することができます：

* 同じ種類のクライアント拡張機能（例：複数のバッチクライアント拡張機能）
* バッチクライアントエクステンションによるコンフィグレーションクライアントエクステンション
* フロントエンドクライアントエクステンションによるコンフィグレーションクライアントエクステンション
* マイクロサービスクライアントエクステンションによる構成クライアントエクステンション

互換性のないクライアント拡張のグループ化（例：フロントエンドとマイクロサービス）を伴うプロジェクトのビルドは、エラーで失敗します。

## クライアントエクステンションを設定する

クライアント拡張機能は、 `client-extension.yaml` ファイルで定義され、これらのプロパティを持ちます：

`name`: Liferay UI に表示される名前を入力します。 UIで設定できない場合は、 `名` 値は使用しません。

`type`: クライアント拡張のタイプを設定します（例： `themeCSS`）。 このタイプは、Liferayがクライアントエクステンションをデプロイする際に、どのように扱うかを決定します。

`dxp.lxc.liferay.com.virtualInstanceId`：デプロイ先の仮想インスタンスIDを入力します。

各クライアントエクステンションプロジェクトは、ワークスペースの `client-extensions/` フォルダの中に独自のフォルダを持ちます。 クライアント拡張プロジェクトには、1つまたは複数のクライアント拡張を定義する1つの `client-extension.yaml` ファイルが含まれます。 例えば、 [ `iframe-2` プロジェクトの `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) では、3つの `iframe` クライアント拡張を定義しています： `Baseball`, `Football`, and `Hockey`.

### クライアントエクステンションを組み立てる

クライアントエクステンションをビルドすると、ファイルが自動的に作成され、出来上がった [LUFFA](./packaging-client-extensions.md)にパッケージされます。 `client-extension.yaml` ファイルに `assemble` ブロックを定義して、ビルドファイルやプロジェクトファイルからインクルードするファイルを設定します。

`assembleClientExtension` Gradleタスクは、クライアント拡張プロジェクト内で `gradle build` または `gradle deploy` を実行すると実行されます。 実行中、プロジェクトの `assemble` ブロックで指定されたファイルは、プロジェクト内の `build/liferay-client-extension-build/` フォルダに配置されます。 このフォルダにあるものはすべてLUFFAの作成に使われます（例： `dist/my-client-extension-project.zip`）。

`assemble` ブロックは YAML 配列で、インクルードするファイルの指示を複数含めることができます。 各指示はこのパターンで行われます：

```yaml
- from: [some folder in your project]
  include: [single file or glob match]
  into: [output location in archive]
```

`assemble` の配列は、このような性質を持っています：

* `from`: クライアント拡張アーカイブにファイルをコピーする元となるフォルダを指定します。

* `include`: フロムディレクトリからインクルードする単一ファイルまたはファイルのサブセットにマッチするグロブを指定する。 定義されていない場合、すべてのファイルが再帰的にインクルードされます（ `**/*`と同等です）。

   必要に応じて、複数の `include` パターンを配列して使用することができます：

   ```yaml
   assemble:
       - from: build
         include:
           - "vite/js/*.js"
           - "vite/css/*.css"
         into: static
   ```

* `into`: 出来上がったLUFFAのどこにマッチしたリソースをコピーするかを指定します。

   フロントエンド・クライアント・エクステンション用の静的リソースは、 `static/` ディレクトリにコピーしてください。 Liferayはこれらをセルフホストインスタンスの静的リソースとして、またはLXCのコンテナから提供します。

   バッチクライアント拡張のJSONリソースは、 `batch/` ディレクトリにコピーしてください。

* `fromTask`: `from`の代わりに、プロジェクト内のGradleタスクを指定して、組み立てステップの前に実行させることができます。

   例えば、Spring Bootを使用した `マイクロサービス` クライアント拡張プロジェクトでは、Gradleタスク `bootJar` が、アプリケーションとその依存関係をすべて含む `.jar` ファイルを作成します。 この場合、 `fromTask` というプロパティを使用して、プロジェクトの `bootJar` Gradle タスクの実行をトリガーし、タスクの出力（つまり、ビルドされた `.jar` ファイル）を結果の LUFFA のルートに含めます：

   ```yaml
   assemble:
       - fromTask: bootJar
   ```

### 例 `アセンブル` ブロック

`assemble` ブロックの中に、 `from` の項目を複数含めることができます：

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

この例では、 `[project-root]/somewhere/else` の `*.ico` ファイルを LUFFA の `static` フォルダに配置します。

```yaml
assemble:
    - from: somewhere/else
      include: "*.ico"
      into: static
```

LUFFAの作成、構造、内容の詳細については、 [パッケージング クライアント拡張機能](./packaging-client-extensions.md)を参照してください。

## Liferayインスタンスにデプロイする

クライアント拡張機能は、展開可能な `.zip` アーカイブに組み込まれています。 各クライアントエクステンションのアーカイブには、クライアントエクステンションの設定が記載されたJSONファイルが含まれています。

`.zip` ファイルを Liferay のインストール先の正しい場所に配置し、クライアント拡張機能を展開します。 Liferayインスタンスがどのようにホストされているかによって、使用する正確なコマンドは異なります。

### LXCにデプロイする

LXC用のクライアントエクステンションを配備する、

1. ワークスペースの `client-extensions/` フォルダーに移動し、以下を実行します。

   ```bash
   ../gradlew clean build
   ```

   コンパイルされた `.zip` ファイルは、各プロジェクトの `dist/` フォルダーに作成されます。 1つのプロジェクトを同時にビルドする場合は、プロジェクトのフォルダーからコマンドを実行します。

1. このコマンドを実行すると、各クライアントエクステンションが選択した環境に配備されます：

   ```bash
   lcp deploy --extension [extension-zip-file]
   ```

   プロンプトが表示されたら、プロジェクトと展開環境を選択します。 コマンドが完了すると、ZIPファイルはLXCプロジェクトにアップロードされます。

### セルフホスティングのLiferayインスタンスにデプロイする

Liferayのインストールをセルフホストする場合は、ワークスペース・バンドルZIPを使用してクライアント・エクステンションをデプロイしてください。 クライアント拡張機能をビルドしてデプロイするには、ワークスペースの `client-extensions/` フォルダから次のコマンドを実行します：

```bash
../gradlew clean distBundleZip
```

手動でZIPファイルを展開する必要がある場合は、以下のように実行します。

```bash
../gradlew clean build
```

次に、各プロジェクトの `dist/` フォルダから、サーバーの `[Liferay Home]/osgi/client-extensions/` フォルダにアーカイブをコピーします。

## 関連トピック

* [バッチクライアント拡張機能](./batch-client-extensions.md)
* [コンフィギュレーション・クライアント拡張機能](./configuration-client-extensions.md)
* [フロントエンドクライアント拡張機能](./front-end-client-extensions.md)
* [マイクロサービスクライアント拡張機能](./microservice-client-extensions.md)
* [クライアント拡張機能のパッケージ化](./packaging-client-extensions.md)

## チュートリアル

* [JavaScriptクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSSクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
