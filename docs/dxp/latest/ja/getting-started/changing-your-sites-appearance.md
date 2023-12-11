# サイトの外観を変更する

Liferayにはサイトの外観をカスタマイズする方法がたくさんあります。 サイトのファビコンとテーマは、あなたが変更したいと思うかもしれない最初の要素の2つです。 テーマは、あなたのサイトのデフォルトのルック＆フィールを設定し、ファビコンは、ユーザーのブラウザのタブであなたのサイトを識別するためのアイコンです。

## サイトのファビコンを変更する

新しいLiferay インスタンスを起動し、以下を実行します。

```bash
docker run -it -m 8g -p 8080:8080 liferay/portal:latest
```

http://localhost:8080 から Liferay にサインインします。 電子メールアドレス`test@liferay.com`とパスワード`test`を使用する。 プロンプトが表示されたら、パスワードを `learn` に変更する。

次に、以下の手順に従います。

1. *サイトメニュー* (![サイトメニュー](../images/icon-product-menu.png))を開き、_サイトビルダー_ &rarr; _ページ_ に移動します。

1. アプリケーションバーの_Actions_ (![アクションボタン](../images/icon-actions.png))をクリックし、_Configuration_を選択します。

   ![Open the Pages application, click Actions in the Application Bar, and select Configuration.](./changing-your-sites-appearance/images/01.png)

1. ファビコン]で、_ファビコンを選択_（[ファビコンを選択ボタン](../images/icon-switch.png)）をクリックします。

   ![Click the Select Favicon button.](./changing-your-sites-appearance/images/02.png)

1. 画像を選択またはアップロードします。

1. ［_保存_］をクリックします。

サイトでは、選択した画像がお気に入りのアイコンとして使用されます。

## サイトのテーマを変更する

デフォルトでは、LiferayインスタンスはClassicテーマを使用しますが、カスタムテーマをデプロイして使用することもできます。

### 新しいテーマをデプロイする

1. Acme Sample Blue Theme WARファイルをダウンロードし、解凍する：

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/getting-started/changing-your-sites-appearance/resources/liferay-5b2v.zip -O
   ```

   ```bash
   unzip liferay-5b2v.zip
   ```

1. .warファイルが置かれているフォルダに移動し、デプロイする：

   ```bash
   docker cp liferay-5b2v-theme.war [docker-container-id]:[path-to-deploy-folder]
   ```

```{note}
`[docker-container-id]`を置き換えるには、`docker ps`でliferay/portal:latestのIDを検索する。 `[path-to-deploy-folder]` は `opt/liferay/deploy` です。
```

これでサンプルテーマがDXPインスタンスにロードされます。 コンソールで以下のメッセージを確認し、テーマが正常にデプロイされたことを確認してください：

```
2020-03-11 17:06:35.601 INFO  [fileinstall-/opt/liferay/osgi/war][BundleStartStopLogger:39] STARTED liferay-5b2v-theme_1.0.0 [1112]
```

### サイトのテーマを変更する

1. ブラウザで`https://localhost:8080`を開き、 [管理者としてログインする](./introduction-to-the-admin-account.md) 。

1. *サイトメニュー* (![サイトメニュー](../images/icon-product-menu.png))を開き、_サイトビルダー_ &rarr; _ページ_ に移動します。

1. アプリケーションバーの_Actions_ (![アクションボタン](../images/icon-actions.png))をクリックし、_Configuration_を選択します。

   ![Open the Pages screen, click Actions in the Application Bar, and select Configuration.](./changing-your-sites-appearance/images/01.png)

1. テーマ]の下にある[現在のテーマを変更*]をクリックします：

   ![Click Change Current Theme to select a new theme.](./changing-your-sites-appearance/images/03.png)

1. サンプルテーマを選択してください：_Acme Sample Blue Theme_を選択してください。

1. ［_保存_］をクリックします。

ホームページに移動し、背景色が青になったことを確認する。

![Confirm the background color is now blue.](./changing-your-sites-appearance/images/04.png)

## 次のステップ

さらに、 [スタイルブック](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) を使ってデザイン要素をさらにカスタマイズしたり、 [マスターページテンプレート](../site-building/creating-pages/defining-headers-and-footers/master-page-templates.md) を使ってコンテンツページのヘッダーやフッターをデザインすることができます。 サイトのルック＆フィールのカスタマイズの完全な概要については、 [Site Appearance](../site-building/site-appearance/site-appearance.md) をご覧ください。

[Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md) には、プロフェッショナルなルックアンドフィールを素早く実現するためのテーマが多数用意されています。

また、 [独自のテーマを作成する方法](../site-building/site-appearance/themes/introduction-to-themes.md) も紹介されています。

<!-- ## Changing Your Site's Logo

Coming soon! -->
