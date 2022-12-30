# ワークフローの有効化

DXPインスタンス全体または特定のサイトのみで、アセットタイプのワークフロープロセスを有効化できます。 ワークフロープロセスが **Wikiページ** などの特定のアセットタイプのインスタンス全体で有効化されると、 **Wikiページ** が作成されたサイトに関係なく、公開するために送信されたすべての **Wikiページ** はレビュープロセスを通過する必要があります。

```{warning}
Liferay 7.3 では、ワークフローは [パブリケーション](../../../site-building/publishing-tools/publications.md) と共に使用することはできません。
```

個々のサイトでワークフローの有効・無効を設定することができます。 デフォルトでは、ワークフローはサイトで無効になっています。

## DXPインスタンス全体でワークフローを有効化する

1. **プロダクトメニュー**（![Product Menu](../../../images/icon-product-menu.png)）を開き、 ［**Control Panel**］ をクリックします。
1. ［**Workflow**］ 、 ［**Process Builder**］ の順にクリックします。
1. ［**設定**］ タブをクリックします。

    ![インスタンス全体の設定は［Configurations］タブにあります](./activating-workflow/images/02.png)

1. ワークフロープロセスを実行するアセットタイプ（**ナレッジベースの記事** など）の横にある ［**Edit**］ をクリックします。

    ![ナレッジベースの記事のインスタンス全体でワークフローを有効化する](./activating-workflow/images/03.png)

1. このアセットタイプに必要なワークフローを選択します（［**Single Approver**］ は追加設定なしで使用できます）。
1. ［**保存**］ をクリックします。
1. ワークフローを必要とする他のすべてのアセットタイプについて繰り返します。

## サイトでのワークフローの有効化

ワークフロープロセスがサイトで有効になっている場合、同じインスタンス上の他のサイトは無効のままになります。 サイトごとに各アセットタイプのワークフロープロセスを有効にするには：

1. **プロダクトメニュー**（![Product Menu](../../../images/icon-product-menu.png)）を開き、 ［**サイト管理**］ メニューのコンパスアイコン（![Compass](../../../images/icon-compass.png)）をクリックします。
1. フォームを作成するサイトを選択します（例： **Community Site**）。
1. ［**サイト管理**］ メニューで&rarr; ［**設定**］ &rarr; ［**ワークフロー**］ をクリックします。
1. ワークフロープロセスを実行するアセットタイプの横にある ［**Edit**］ をクリックします。
1. このアセットタイプに必要なワークフローを選択します。

    ![コミュニティサイトでブログエントリを有効化する](./activating-workflow/images/01.png)

1. ［**Save**］ をクリックします。
1. ワークフローを必要とする他のすべてのアセットタイプについて繰り返します。

有効にすると、選択したアセットタイプは、このサイトで公開する前に必ずレビュープロセスが必要になります。 特定のアセットタイプに対して以前にワークフローを有効にしたことがある場合、それらの設定がここに反映されます。

```{tip}
インスタンス全体で有効になっている場合でも、サイト上のアセットタイプのワークフローはいつでも無効にできます。
```

## 特定のアプリケーションのワークフローを有効にする

それぞれのアプリケーションでワークフローが有効になっているアセットタイプがいくつかあります。

### Webコンテンツフォルダー

**Webコンテンツフォルダー** のワークフローを有効化するには：

1. サイトの **サイト管理** メニューに移動します。
1. ［**Content & Data**］ &rarr; ［**Web Content**］ をクリックします。
1. （![Actions](../../../images/icon-actions.png)）をクリックし、目的のフォルダの横にある ［**Edit**］ をクリックします。

    ![フォルダの編集画面からWebコンテンツフォルダーのワークフローを有効化する。](./activating-workflow/images/04.png)

1. ［**Structure Restrictions and Workflow**］ メニューを展開します。
1. ［**Default Workflow for This Folder (Lunar Resort Holiday Getaway Content**)］ のラジオボタンをクリックします。

    ![Webコンテンツフォルダーのワークフローを選択。](./activating-workflow/images/05.png)

1. ワークフローの定義を選択します（例： **唯一の承認者**）。
1. ［**Save**］ ボタンをクリックします。

### ドキュメントとメディアフォルダー

ワークフローは、 **ルート** フォルダー内の **ドキュメントとメディア** アプリケーション全体または個々のフォルダーに対して有効にできます。

**ドキュメントとメディアフォルダ** のワークフローを有効化するには：

1. サイトの **サイト管理** メニューに移動します。
1. ［**Content & Data**］ &rarr; ［**Documents and Media**］ の順にクリックします。
1. （![Actions](../../../images/icon-actions.png)）をクリックし、目的のフォルダの横にある ［**Edit**］ をクリックします。

    ![DMフォルダのワークフローを選択。](./activating-workflow/images/06.png)

1. ［**Document Type Restrictions and Workflow**］ メニューを展開します。
1. ［**Default Workflow for This Folder (DM Folder 1**)］ のラジオボタンをクリックします。

    ![DMフォルダのワークフローを選択。](./activating-workflow/images/07.png)

1. ワークフロー定義を選択します（例： **Single Approver**）。
1. ［**保存**］ ボタンをクリックします。

### 動的データリスト

**DDLフォーム** のワークフローを有効化するには：

1. サイトの **サイト管理** メニューに移動します。
1. ［**コンテンツ & データ**］ &rarr; ［**動的データリスト**］ の順にクリックします。
1. （![Add](../../../images/icon-add.png)）をクリックして新規フォームを追加します。
1. DDLフォームの名前を入力します。
1. ［**Select**］ をクリックして、このフォームに関連付けられているデータ定義を選択します。
1. ［Data Definition］を選択します（**Contacts**）。
1. ［**Workflow**］ で、目的のワークフロー（**Single Approver**）を選択します。

    ![個々の動的データリストごとにワークフローを有効化します。](./activating-workflow/images/08.png)

1. ［**Save**］ をクリックします。

この特定のDDLフォームが送信プロセスを通過するようになりました。

### フォーム

個々のフォームのエントリごとにワークフローを有効化するには

1. サイトの **サイト管理** メニューに移動します。
1. ［**コンテンツ & データ**］ &rarr; ［**Form**］ をクリックします。
1. **フォームビルダー** ビューで（新しいフォームの場合も既存のフォームの場合も同様）、 **オプション**(![Options](../../../images/icon-actions.png))、 ［**Settings**］ の順にクリックします。

    ![フォームの設定に移動](./activating-workflow/images/09.png)

1. ［**Select a workflow**］ で、目的のワークフロー（**Single Approver**）を選択します。

    ![フォームの設定ウィンドウから各フォームのエントリでワークフローを有効にします。](./activating-workflow/images/10.png)

1. ［**Done**］ をクリックして、ダイアログウィンドウを閉じます。

情報を送信する前に、フォームの承認が必要になりました。


<!-- Leaving this commented out until Staging materials are pushed up.
## Page Variations

In a [staged environment](https://help.liferay.com/hc/en-us/articles/360029041851-Staging-Content), you can activate workflow for _Page Variations_.

As a prerequisite, [Staging](https://help.liferay.com/hc/articles/360029041811-Enabling-Staging) **and** [Page Versioning](https://help.liferay.com/hc/articles/360028721532-Enabling-Page-Versioning-and-Staged-Content) have been enabled.

When a Page Variation or Site Page Variation is created, its creator must click _Submit for Publication_ at the top of the page, and the variation must be approved in the workflow before it can be published to the live Site.

To enable a workflow for Page Variations:

1. Navigate to the _Site Administration_ menu for your site.
1. Verify that the Staging has been enabled for this site.

    ![Verify that the site is now staged.](./activating-workflow/images/11.png)

1. Click _Configuration_ &rarr; _Workflow_.
1. Select the workflow desired for _Page Revision_.

    ![Verify that the site is now staged.](./activating-workflow/images/12.png)

1. Click _Save_.

Page revisions now have to go through the workflow process.

![With workflow enabled on Page Revisions, the Site administrator must submit their page variation for publication before it can go live.](./activating-workflow/images/13.png)
-->

## 次のステップ

* [アセットの確認](./reviewing-assets.md)
