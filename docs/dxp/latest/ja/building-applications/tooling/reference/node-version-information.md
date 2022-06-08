# ノードのバージョン情報

Liferay DXPは、多くの異なるフロントエンドコンポーネントに[Node](https://nodejs.org/en/)(と [NPM](https://www.npmjs.com/)) を使用します。 具体的には、[Liferayテーマジェネレーター](../../../site-building/site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme.md)とLiferayの[JavaScript アプリケーションツール](../../developing-a-javascript-application.md)は、ビルドとデプロイに NPM コマンドを使用する必要があります。

これらの依存関係は、NodeとNPMの特定のバージョンを使用するように設計されています。 [Nodeバージョン互換性マトリックス](#version-compatibility-matrix)を確認し、テーマやJavaScriptアプリケーションを開発する際に正しいバージョンがインストールされていることを確認してください。

## Nodeのバージョンを更新する

もし、Liferayのインストールに古いバージョンやサポートされていないバージョンのNodeがインストールされている場合、正しく動作させるために更新する必要があります。 以下の手順で、Nodeを特定のメジャーバージョンにアップデートします。

1. 既存のNodeのインストールを削除します。

    ```bash
    sudo apt-get remove node npm
    ```

1. リポジトリを更新してください。

    ```bash
    sudo apt-get update
    ```

1. Nodeの希望する*メジャーバージョン*を取得します。 [バージョン互換性マトリックス](#version-compatibility-matrix)で、お使いのLiferay DXPのバージョンに必要なNodeのメジャーバージョンを確認してください。

    ```bash
    curl -sL deb.nodesource.com/setup_##.x | sudo -E bash -
    ```

    例えば、Liferayバージョン7.4を使用している場合、バージョンNodeのバージョン`16.x`の場合は以下を実行します。

    ```bash
    curl -sL deb.nodesource.com/setup_16.x | sudo -E bash -
    ````

1. Install Node and NPM with a single command.

    ```bash
    sudo apt-get install -y nodejs
    ````

1. Verify that you have the expected versions of Node and NPM.

    ```bash
    node --version
    ```

    ```bash
    npm --version
    ```

これで、Liferayのインストールに対応したNodeとNPMのバージョンが用意されているはずです（サポートされている最新のマイナーバージョンに更新されています）。 ただし、NPMのバージョンが期待されるバージョンと一致しない場合は、このコマンドで特定のバージョンのNPMをインストールすることができます。

```bash
npm install -g npm@x.x.x
```

## モジュールのノードバージョンの指定

もしあなたのモジュールが特定のバージョンのNodeを必要とするなら、モジュールの`build.gradle`ファイルで設定することが可能です。 例えば、あなたのモジュールがNodeのバージョン`10.15.3`とNPMのバージョン `6.4.1`を必要とするなら、`build.gradle`ファイルにこのコードを追加してください。

```
node {
    nodeVersion = "10.15.3"
    npmVersion = "6.4.1"
}
```

## バージョン互換性マトリックス

| **Liferayバージョン** | **サポートされるノードのバージョン** | **サポートされているNPMのバージョン** |
|:----------------:|:--------------------:|:----------------------:|
|       7.0        |        6.6.0         |         6.4.1          |
|       7.1        |        8.15.0        |         6.4.1          |
|       7.2        |       10.15.3        |         6.4.1          |
|       7.3        |       10.15.3        |         6.4.1          |
|       7.4        |       16.13.0        |         8.1.0          |
