# 環境の設定とテーマの作成

テーマの作成は、テーマ開発の最初のステップです。 自分のテーマができたら、それを Liferay DXP インスタンスにデプロイして、 [様々なサイトのカスタマイズに使うことができます](../../introduction-to-themes.md#developing-themes) .

## Liferayテーマジェネレーターを使用する

テーマは、Liferayテーマジェネレーターを使用して作成します。 Liferay DXP 7.3は、テーマジェネレーターのバージョン10.xxを使用しています。

```{note}
古いバージョンのLiferayテーマジェネレーターを使用して、古いバージョンのLiferay DXPのテーマを生成できます。 DXP 7.0または7.1のテーマを作成するには、テーマジェネレーターのバージョン8.xxをインストールしてください。
```

### インストール

```{note}
Liferayテーマジェネレータを使用してテーマを開発するには、ノードとNPMの両方が必要です。 [Node compatibility matrix](../../../../../building-applications/tooling/reference/node-version-information.md) をチェックして、あなたのLiferayのバージョンに合ったバージョンがインストールされていることを確認してください。
```

まだインストールしていない場合は、次のコマンドを使用してLiferayテーマジェネレーターをインストールします。

```bash
npm install -g generator-liferay-theme@10.x.x
```

このコマンドでYeomanとgulpの依存関係をインストールします。

```bash
npm install -g yo gulp
```

### Liferayテーマジェネレーターを実行する

次の手順でLiferayテーマジェネレーターを実行します。

1. Yeomanを使用してLiferayテーマジェネレーターを実行します。

    ```bash
    yo liferay-theme
    ```

    ```{important}
    このコマンドにベースとなるテーマ名を追加することで、新しいテーマのベースとして使用することができます。 例えば、`yo liferay-theme:classic` を実行すると、新しいテーマは DXP の Classic テーマをベースにしたものになります。
    ```
    <!-- Add link to an explanation of choosing (and changing) the base theme when available.-->

1. プロンプトでテーマの名前を入力します。 デフォルトの"My Liferay Theme"を使用するには、Enterキーを押します。

    ```
    ? What would you like to call your theme? (My Liferay Theme)
    ```

1. プロンプトでテーマのIDを入力します。 テーマが生成されるとき、このIDによってテーマがビルドされるフォルダの名前が決定されます。 Enterキーを押して、名前に基づいたデフォルトIDを使用することもできます。

    ```
    ? What id would you like to give to your theme? (my-liferay-theme)
    ```

1. 矢印キーを使用して、プロンプトでテーマを作成するLiferay DXPのバージョンを選択します。 7.2または7.3のテーマは、Liferayテーマジェネレーターのバージョン10.xxを使用して生成できます。

    ```
    ? Which version of Liferay is this theme for? (Use arrow keys)
    ❯ 7.3 
      7.2
    ```

1. プロンプトで、テーマに使用できるフォントとしてFont Awesomeを追加するかどうかを答えます。

1. テーマが生成されたら、矢印キーを使って、ローカルアプリサーバー、Dockerコンテナ、その他のURLでデプロイするという、テーマに適したデプロイメントタイプを選択して、プロセスを完了します。

    ```
    ? Select your deployment strategy (Use arrow keys)
    ❯ Local App Server 
      Docker Container 
      Other
    ```

1. 使用しているデプロイメントのタイプに応じて、プロンプトでアプリサーバーの場所を指定します。

    アプリサーバーのディレクトリ、Dockerコンテナ名、またはホストURLを指定して、アプリサーバーを見つけることができます。

テーマが生成され、選択したIDにちなんで名付けられたフォルダ内に配置されます。 これで、テーマのベースフォルダから`gulp deploy`を実行することで、テーマをビルドしてDXPインスタンスにデプロイできます。

### Dart SASSの無効化

テーマジェネレータで作成したテーマに対して `gulp build` または `gulp deploy` を実行すると、以下のようなエラーが発生する場合があります。

```
Error: compound selectors may no longer be extended.
```

このエラーは、テーマジェネレーターが [Dart SASS](https://sass-lang.com/dart-sass) を Liferay 7.3+ の時点で使用しているが、一部の環境ではまだ非推奨の [LibSass](https://sass-lang.com/blog/libsass-is-deprecated) で使用されている機能に依存しているために発生します。

このエラーを回避するには、テーマでDart SASSを無効にします。 これらの `dartSass` と `node-sass` のプロパティを、テーマの `package.json` に追加します（既存のプロパティを削除しないこと）。

```json
"liferaytheme": {
    "sassOptions": {
        "dartSass": false
    },
    "devDependencies": {
        "node-sass": "7.0.1"
    }
}
```

`npm install` を実行し、LibSass をインストールします。 次にgulpでビルドすると、Dart SASSによるエラーは消えます。

<!-- Add Using Blade to Create a Theme section, with a link to Theme Templates documentation when available-->

## 追加情報

* [サイトの外観を変更する](../../../../../getting-started/changing-your-sites-appearance.md)
