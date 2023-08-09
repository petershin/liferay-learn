# サイトの外観を変更する

Liferayにはサイトの外観をカスタマイズする方法がたくさんあります。 サイトのファビコンとテーマは、あなたが変更したいと思うかもしれない最初の要素の2つです。 テーマは、あなたのサイトのデフォルトのルック＆フィールを設定し、ファビコンは、ユーザーのブラウザのタブであなたのサイトを識別するためのアイコンです。

## サイトのファビコンを変更する

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順を実行します。

1. サイトメニュー* (![サイトメニュー](../images/icon-product-menu.png))を開き、*サイトビルダー* &rarr; *ページ* に進みます。

1. アプリケーションバーの*Actions*ボタン(![Action Button](../images/icon-actions.png)) をクリックし、*Configuration*を選択します。

   ![Pagesアプリケーションを開き、アプリケーションバーの[アクションボタン]をクリックし、[設定]を選択します](./changing-your-sites-appearance/images/01.png)

1. Favicon]の下にある[*Change Favicon*]をクリックします。

   [ファビコンの変更ボタンをクリックします](./changing-your-sites-appearance/images/02.png)

1. 画像を選択またはアップロードします。

1. *保存*をクリックします。

あなたのサイトは選択した画像をファビコンに使用します。

## サイトのテーマを変更する

デフォルトでは、LiferayインスタンスはClassicテーマを使用しますが、カスタムテーマをデプロイして使用することができます。

### 新しいテーマのデプロイ

1. [Acme Sample Blue Theme](./liferay-5b2v-theme.war)を含む WAR をダウンロードします：

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/getting-started/changing-your-sites-appearance/liferay-5b2v-theme.war -O
    ```

1. テーマを含むWARをデプロイします。

    <!-- ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq) -->

    ```bash
    docker cp liferay-5b2v-theme.war docker-container:[path-to-deploy-folder]
    ```

これでサンプルテーマがDXPインスタンスにロードされます。 コンソールで以下のメッセージを確認し、テーマが正常にデプロイされたことを確認してください：

```
2020-03-11 17:06:35.601 INFO  [fileinstall-/opt/liferay/osgi/war][BundleStartStopLogger:39] STARTED liferay-5b2v-theme_1.0.0 [1112]
```

### サイトのテーマを変更する

1. ブラウザを開いて `https://localhost:8080` [管理者としてログイン](./introduction-to-the-admin-account.md).

1. *Site Menu* (![Site Menu](../images/icon-product-menu.png)) を開き、 *Site Builder* &rarr; *Pages*にアクセスしてください。

1. アプリケーションバーの*アクション*ボタン（![Action Button](../images/icon-actions.png)）をクリックし、*［Configuration］*を選択します。

   ![Pages "画面を開き、アプリケーションバーの "Actions "ボタンをクリックし、"Configuration "を選択します。](./changing-your-sites-appearance/images/01.png)

1. *Look And Feel* セクションを展開し、 *Change Current Theme*をクリックします：

   ![新しいテーマを選択するには、「現在のテーマを変更」をクリックします。](./changing-your-sites-appearance/images/03.png)

1. サンプルテーマを選択します： *Acme Sample Blue Theme*.

1. *［保存］*をクリックします。

ホームページに移動し、背景色が青になったことを確認する。

![背景色が青になったことを確認する。](./changing-your-sites-appearance/images/04.png)

## 次のステップ

さらに、 [スタイルブック](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) を使ってデザイン要素をさらにカスタマイズしたり、 [マスターページテンプレート](../site-building/creating-pages/defining-headers-and-footers/master-page-templates.md) を使ってコンテンツページのヘッダーやフッターをデザインすることができます。 サイトのルック＆フィールのカスタマイズの完全な概要については、 [Site Appearance](../site-building/site-appearance/site-appearance.md) をご覧ください。

[Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md) には、プロフェッショナルなルックアンドフィールを素早く実現するためのテーマが多数用意されています。

また、 [独自のテーマを作成する方法](../site-building/site-appearance/themes/introduction-to-themes.md)も紹介されています。

<!-- ## Changing Your Site's Logo

Coming soon! -->
