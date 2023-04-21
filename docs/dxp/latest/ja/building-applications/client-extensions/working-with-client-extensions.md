# クライアントエクステンションの操作

{bdg-secondary}`7.4+`

クライアントエクステンションを使えば、OSGiモジュールをデプロイすることなく、Liferayを拡張することができます。 従来のモジュール開発と同様に、クライアントエクステンションは [Liferay Workspace](../tooling/liferay-workspace.md) に存在します。 を学ぶことから始めましょう。

- クライアントエクステンションの開発を始めるために必要なツールは？
- クライアントの拡張子を設定ファイルに定義する方法
- クライアントエクステンションを導入する方法

## 必要なツールや設定

クライアント拡張機能の開発を開始するために、以下のものを入手します：

1. Java 8またはJDK 11。

    ```{note}
    対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) をご確認ください。 推奨されるJVMの設定については、 [JVM設定](../../installation-and-upgrades/references/jvm-configuration.html) を参照してください。
    ```

1. Liferayのワークスペースです。 クライアント拡張プロジェクトのサンプルを含むワークスペースをダウンロードするには、次のように実行します。

    ```bash
    curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
    ```

    クライアント拡張プロジェクト( `client-extensions/` ディレクトリ内）を自分のワークスペースにコピーするか、サンプルワークスペー スを直接使用することができます。

1. Liferay Experience Cloud(LXC)をご利用の場合は、 [コマンドラインツール](https://learn.liferay.com/liferay-cloud/latest/ja/reference/command-line-tool.html) ...が必要です。

## クライアントエクステンションを設定する

クライアント拡張は、これらのプロパティを含む `client-extension.yaml` ファイルで定義されます：

`name`: Liferay UI に表示される名前を入力します。 UIで設定できない場合は、ネームバリューは使用しません。

`type`: クライアント拡張のタイプを設定します(例： `globalCSS`）。 このタイプは、デプロイされたときにLiferayがクライアント拡張をどのように扱うかを決定します。

`dxp.lxc.liferay.com.virtualInstanceId`：デプロイ先の仮想インスタンスのIDを入力します。

各クライアント拡張プロジェクトは、ワークスペースの `client-extensions/` フォルダーの中のフォルダーに住んでいます。 このプロジェクトには、1つまたは複数のクライアント拡張機能を定義した `client-extension.yaml` ファイルが含まれます。 例えば、 [ `iframe-2` プロジェクトの `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) では、3つの `iframe` クライアント拡張を定義しています： `Baseball`, `Football`, and `Hockey`.

### 追加ソースファイル

クライアントエクステンションのソースファイルは、デフォルトでプロジェクトの `src/` フォルダにあります。 `client-extensions.yaml` ファイルの `assemble` ブロックを使用して、ビルドされたアーカイブに含める追加ファイルを指定できます：

```yaml
assemble:
   - from: assets
     include: "**/*"
     into: static
```

アセンブルブロックはこのような性質を持っています：

`from`: クライアント拡張プロジェクトに、追加リソースを格納するフォルダを設定します。 クライアントエクステンションをビルドすると、これらのリソースは `.zip` ファイルに含まれます。 `assemble` ブロックの中で、 `from` 定義を複数使用することができ、それぞれに `into` プロパティが含まれています。

`include`を使用します： 単一ファイルまたはグロブ構文を入力し、`from`ディレクトリにある目的のファイルを検索します。

`into` を指定します： ビルドされた `.zip` ファイルのどこに追加リソースを含めるかを指定します。例えば、多くのフロントエンドクライアント拡張(JavaScriptやCSSクライアント拡張など）のソースファイルは、Liferayがあなたのサイトの静的リソースとして提供できるように、`static`ディレクトリにある必要があります。

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
   lcp deploy --extension <extension-zip-file>
   ```

   プロンプトが表示されたら、プロジェクトと展開環境を選択します。 コマンドが完了すると、ZIPファイルはLXCプロジェクトにアップロードされます。

### セルフホスティングのLiferayインスタンスにデプロイする

Liferayのインストールをオンプレミスでホストしている場合、ワークスペース・バンドルZIPを使用してクライアント拡張機能を展開します。  クライアント拡張機能をビルドしてデプロイするには、ワークスペースの `client-extensions/` フォルダから次のコマンドを実行します：

```bash
../gradlew clean distBundleZip
```

手動でZIPファイルを展開する必要がある場合は、以下のように実行します。

```bash
../gradlew clean build
```

次に、各プロジェクトの `dist/` フォルダから、サーバーの `[Liferay Home]/osgi/client-extensions/` フォルダにアーカイブをコピーします。

## 追加情報

* [フロントエンドクライアント拡張機能](./front-end-client-extensions.md)
* [JavaScriptクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSSクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
