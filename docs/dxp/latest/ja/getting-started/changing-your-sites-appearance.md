# サイトの外観を変更する

Liferayには、サイトの外観をカスタマイズする方法がたくさんあります。 サイトのファビコンとテーマは、最初に変更した方がよい要素です。 テーマはサイトのデフォルトのルック＆フィールを設定し、ファビコンはユーザーのブラウザーのタブでサイトを識別するためのアイコンです。

## サイトのファビコンを変更する

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順を実行します。

1. **サイトメニュー**(![Site Menu](../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ページ** に移動します。

1. アプリケーションバーにある **アクション** ボタン(![Action Button](../images/icon-actions.png))をクリックし、 **設定** を選択します。

   ![Pagesアプリケーションを開き、アプリケーションバーのアクションボタンをクリックし、設定を選択します。](./changing-your-sites-appearance/images/01.png)

1. ［お気に入りアイコン］で **お気に入りアイコンの変更** をクリックします。

   ![お気に入りアイコンの変更をクリックします。](./changing-your-sites-appearance/images/02.png)

1. 画像を選択またはアップロードします。

1. ［**保存**］をクリックします。

サイトでは、選択した画像がお気に入りのアイコンとして使用されます。

## サイトのテーマを変更する

デフォルトでは、Liferayインスタンスは標準テーマを使用しますが、カスタムテーマをデプロイして使用することもできます。

### 新しいテーマをデプロイする. [Acme Sample Blue Theme](./liferay-5b2v-theme.war) を含むWARをダウンロードします。

    ``bash
    curl https://learn.liferay.com/dxp/latest/en/getting-started/changing-your-sites-appearance/liferay-5b2v-theme.war -O
    ```

1. テーマを含むWARをデプロイします。


    <!-- ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq) -->

    ```bash
    docker cp liferay-5b2v-theme.war docker-container:[path-to-deploy-folder]
    ```

これにより、サンプルのテーマがDXPインスタンスにロードされます。 コンソールで以下のメッセージを確認することで、テーマが正常にデプロイされたことを確認することができます。

```
2020-03-11 17:06:35.601 INFO  [fileinstall-/opt/liferay/osgi/war][BundleStartStopLogger:39] STARTED liferay-5b2v-theme_1.0.0 [1112]
```

### サイトのテーマを変更する

1. ブラウザーを開き、 `https://localhost:8080` と [管理者としてログイン](./introduction-to-the-admin-account.md).

1. *サイトメニュー* (![Site Menu](../images/icon-product-menu.png)) を開き、 *サイトビルダー* &rarr; *ページ*に進みます。

1. アプリケーションバーの*アクション*ボタン（![Action Button](../images/icon-actions.png)）をクリックし、*［Configuration］*を選択します。

   ![ページ画面を開き、アプリケーションバーの［アクション］ボタンをクリックし、［設定］を選択します。](./changing-your-sites-appearance/images/01.png)

1. *Look And Feel* セクションを展開し、 *Change Current Theme*をクリックします。

   ![現在のテーマを変更する］をクリックして、新しいテーマを選択します。](./changing-your-sites-appearance/images/03.png)

1. サンプルテーマを選択します。 *Acme Sample Blue Theme*.

1. *[保存]* をクリックします。

トップページに移動して、背景色が青になったことを確認します。

![背景色が青になったことを確認する。](./changing-your-sites-appearance/images/04.png)

## 次のステップ

さらに、 [スタイルブック](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) を使ってデザイン要素をさらにカスタマイズしたり、 [マスターページテンプレート](../site-building/creating-pages/defining-headers-and-footers/master-page-templates.md) を使ってコンテンツページのヘッダーとフッターをデザインすることができます。 サイトの外観のカスタマイズの概要については、 [Site Appearance](../site-building/site-appearance/site-appearance.md) を参照してください。

[Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md) には、プロフェッショナルなルックアンドフィールを素早く実現するためのテーマが多数用意されています。

また、 [独自のテーマを作成する方法](../site-building/site-appearance/themes/introduction-to-themes.md)も紹介されています。


<!-- ## Changing Your Site's Logo

Coming soon! -->
