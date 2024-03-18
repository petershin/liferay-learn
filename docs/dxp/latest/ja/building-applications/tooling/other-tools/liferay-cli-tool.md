# Liferay CLI ツール

Liferay CLIツールは、LiferayのRESTおよびGraphQLサービスとインターフェイスで接続するために、 [Angular](https://angular.io/) 、 JavaScript、 [React](https://reactjs.org/) 、共有されるバンドル、または [Vue.js](https://vuejs.org/) プロジェクトを簡単に作成できるようにします。 `liferay`コマンドを使用すると、プロジェクトの生成、ビルド、デプロイを行うことができます。

```{note}
Liferay CLIツールは、Liferay DXP 7.4+用のJavaScriptアプリケーションプロジェクトを作成するために使用されていた古いYeomanジェネレータに代わるものです。 古いバージョンではどちらの方法でも使用できますが、7.4以降ではYeomanジェネレーターの代わりにCLIツールを使用する必要があります。
```

## CLIツールのインストール

次のコマンドを実行すると、CLIツールがローカルシステムにインストールされます。

```bash
npm install -g @liferay/cli
```

```{note}
CLI ツールをグローバルにインストールしたくない場合は、 `npx` を使用することで、インストールせずにツールのコマンドを実行することもできます。 例えば、`npx @liferay/cli new [project-name]` を実行することで、 [新しいプロジェクトを生成する](#generating-a-project) ことができます。
```

## プロジェクトの生成

`liferay new` コマンドを使用して、新しい [Client Extension](../../client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) または Liferay Platform プロジェクトを作成します：

1. ターミナルを開き、プロジェクトを作成したい場所に移動します。 次のコマンドを実行します。

    ```bash
    liferay new [project-name]
    ```

1. プロンプトで新規プロジェクトの名前を入力します。 この名前がIDとして使用されます。

1. リモートアプリケーションプロジェクトを作成するか、Liferay プラットフォームプロジェクトを作成するかを選択します。

   ![矢印キーを使って、リモートアプリケーションまたは Liferay プラットフォームプロジェクトを選択し、Enter キーを押します。](./liferay-cli-tool/images/01.png)

   ```{note}
   [クライアント拡張機能](../../client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) はリモートサーバーでホストされ、Liferay DXPインスタンスがアクセスしてアプリケーションとして使用できるようにします。 Liferayプラットフォームのプロジェクトは、Liferay DXP／Portalにデプロイ可能です。
   ```

1. プロンプトで、新規プロジェクトについて、人間が読み取り可能な説明を入力します。 デフォルト値は、「New Project」です。

1. プロジェクトのターゲットプラットフォームを選択します。 選択したターゲットプラットフォームによって、プロジェクトのデフォルトの依存関係と、プロジェクトのビルドに使用するルール(例えば、プロジェクトがターゲットプラットフォームの利用可能なすべてのJavaScript APIにアクセスする必要があるかどうか）が決定されます。

   バージョン 7.1以降では、Liferay PortalまたはLiferay DXPのターゲットプラットフォームを選択することができます。 また、「Liferay Portal CE (not sharing platform's packages)」を選択すると、プロジェクトの `package.json` ファイルに `@lifray/portal-agnostic` ターゲットを定義することができます。 この場合、プロジェクトにはLiferay Portalにバンドルされている追加のパッケージは含まれず、必要な依存関係はビルドツールとバンドルツールだけです。

   ```{note}
   リモートアプリケーションプロジェクトを選択した場合、バージョン7.4+しか選択できません。  `not sharing platform's packages`オプションではなく、特定のバージョンを選択した場合、プロジェクトはLiferayプラットフォームからReactパッケージを取得します。 このオプションは、プロジェクトのサイズと手動依存を減らしますが、プロジェクトがそのバージョンにバンドルされているパッケージを使用するように制限されます。
   ```

1. プロンプトに表示されるオプションから、作成するプロジェクトの種類を選択します。

    ![矢印キーを使い、Enterキーを押して、作成するプロジェクトの種類を選択します。](./liferay-cli-tool/images/02.png)

    ```{note}
    リモートアプリケーションプロジェクトの作成を選択した場合、Reactタイプのみ選択可能です。
    ```

1. **Liferayプラットフォームプロジェクトを作成することを選択した場合、** ウィジェットのカテゴリーを選択します。 カテゴリーは、ページ編集時にウィジェットのリストでどのようにソートされるかを決定します。 デフォルト値は `category.sample` (「Sample」ウィジェットカテゴリ用)ですが、任意のカスタム値に変更することが可能です。

    **リモートアプリケーションプロジェクトを作成する場合、** カスタム要素のHTMLタグ名を選択します。 名前には少なくとも1つのハイフン(`-`)を含み、文字で始める必要があります。 次に、shadow DOMを使用してレンダリングするかどうかのプロンプト(`y`または`n`）に答えます。

CLIツールは、選択した名前で、新しいフォルダーにプロジェクトを作成します。

## プロジェクトの構築

次のコマンドで、CLIツールで作成したプロジェクトをビルドします。

```bash
liferay build
```

これでプロジェクトがビルドされ、出来上がったJARファイルがプロジェクトの`dist/`ディレクトリに置かれます。 そして、そのJARを任意のLiferayインスタンスにデプロイすることができます。

```{note}
また、CLIツールで作成したプロジェクト内で、`liferay build` のエイリアスとして`npm run build`を実行することができます。
```

## プロジェクトのデプロイ

このコマンドを使用して、プロジェクトの `dist/` ディレクトリに保存されている JAR ファイルをローカルの Liferay インストールにデプロイします ( [`liferay build`](#building-a-project) を実行した後)。

```bash
liferay deploy
```

このタスクを初めて実行すると、デプロイできるようにLiferayのインストールディレクトリを要求して、その回答をプロジェクトのフォルダにある `.liferay.json` ファイルに格納します。 このファイルで設定したディレクトリを変更することで、デプロイ先を変更します。

## プロジェクトのビルドファイルの消去

古い成果物がビルドの妨げになる場合、`clean`コマンドを使って、 [`build`](#building-a-project) と [`deploy`](#deploying-a-project) コマンドで作成された `build/` と `dist/` を削除します。

プロジェクトのディレクトリからこのコマンドを実行すると、これらのフォルダが削除されます。

```bash
liferay clean
```

## Yeomanジェネレータで作成したプロジェクトのアップグレード

CLIツールのコマンドを実行するには、プロジェクトが正しく構成されている必要があります。 古いYeomanジェネレータ( `yo liferay-js` コマンドを使用）で作成されたプロジェクトは、まず新しいアーキテクチャにアップグレードする必要があります。

```{warning}
`upgrade-project`コマンドは、Yeomanジェネレータが作成したプロジェクトの一部のみをアップグレードします。 その他、プロジェクトに行った変更・カスタマイゼーションはそのまま残ります。 アップグレードを試みる前にプロジェクトをバックアップし、アップグレードが自分の変更と競合する場合に備えて、手動で変更する準備をしておいてください。
```

このコマンドを実行すると、Yeoman ジェネレーターで作成した React、Angular、または Vue.js プロジェクトが Liferay CLI ツールで動作するようアップグレードされます。

```bash
liferay upgrade-project
```

## 他のツールで作成したプロジェクトを適用する

また、他のツールで作成したプロジェクトをLiferay CLIツールでデプロイできるように適応させることも可能です。 これらのツールで作成したプロジェクトを適応することができます。

* [**React**](https://reactjs.org/) ： [create-react-app](https://reactjs.org/) プロジェクトジェネレータ

* [**Angular**](https://angular.io/) ： [Angular CLI](https://cli.angular.io/) プロジェクトジェネレータ

* [**Vue.js**](https://vuejs.org/) ： [Vue CLI](https://cli.vuejs.org/) プロジェクトジェネレータ

これらの他のジェネレータで作成されたプロジェクトを適応させるには、プロジェクトのディレクトリからこのコマンドを実行します。

```bash
liferay adapt
```

CLIツールは、プロジェクトの依存関係から検出されたフレームワークに基づいて、プロジェクトを適応させます。 プロジェクトの `package.json` ファイルから、これらの特定の依存関係 ( `dependency` または `devDependency`としてリストアップされています) を探します。

* **React用** : `react-scripts`

* **Angular用** : `@angular/cli`

* **Vue.js用** : `@vue/cli-service`
