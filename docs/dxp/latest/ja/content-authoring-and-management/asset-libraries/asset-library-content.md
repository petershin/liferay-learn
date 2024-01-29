# アセットライブラリコンテンツ

{bdg-secondary}`liferay DXP/Portal 7.3+`.

アセットライブラリは、コンテンツコラボレーションを合理化し、データ重複のリスクを軽減しながら、Liferayサイト間でコンテンツを共有するための便利な方法を提供します。 アセットライブラリのコンテンツを追加、表示、および管理するには、最初にライブラリのメニューページに移動します。

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、アプリケーション(_Applications_)タブをクリックし、アセットライブラリ(**Asset Libraries**)をクリックします。

1. 目的のアセット・ライブラリの **名前** をクリックします。

ここから、ライブラリのアクティブなアプリケーションにアクセスして、コンテンツを作成および管理できます。 また、ステージングを有効にしたり、カスタムワークフローを実装したり、タグとカテゴリを使用してコンテンツを分類したり、コレクションを作成したりすることもできます。 <!--TASK: document Collections and Workflow for Asset Libraries-->

![Click on the desired Asset Library's name to access its menu page.](./asset-library-content/images/01.png)

## コンテンツの作成

アセットライブラリにコンテンツを作成するには、最初にライブラリのメニューページに移動し、目的のアプリケーションをクリックします。 ここから、コンテンツを作成することは、サイトでコンテンツを作成することと基本的に同じです。 唯一の違いは、そのスコープとデフォルトのテーマ設定です。

[コンテンツのオーサリングと管理](../../content-authoring-and-management.html) 各タイプのコンテンツの作成に関する詳細については、記事を参照してください。

```{note}
ライブラリのメニューページには、アクティブなアプリケーションのみが表示されます。 アプリケーションをアクティブまたは非アクティブにするには、 [アセットライブラリの設定](./creating-and-managing-asset-libraries.md#configuring-asset-libraries) を参照してください。
```

## サイトでコンテンツを使用する

アセットライブラリにコンテンツを追加すると、 [に接続された Sites](./creating-and-managing-asset-libraries.md#sites) からアクセスし、表示ページテンプレート、フラグメント、ウィジェットなどを使用してコンテンツを表示できます。

```{note}
Liferay 7.4 U21+とGA21+では、アイテムセレクタを使ってアセットライブラリ内のウェブコンテンツ、ドキュメントとメディア、ブログをブラウズできます。
```

サイト内でアイテムセレクターを使用すると、接続済みアセットライブラリのコンテンツを閲覧できます。 これを行うには、アイテムセレクタウィンドウを開き、パンくずを使用して **サイトとライブラリ** に移動します。

![Use the breadcrumb to navigate to Sites and Libraries](./asset-library-content/images/02.png)

ここから **Asset Library** タブをクリックし、接続されているAsset Libraryを選択することができます。 選択すると、そのコンテンツを閲覧し、目的のアセットを選択できます。

![Click to the Asset Library tab and select a connected library.](./asset-library-content/images/03.png)

また、アイテム選択ウィンドウをフィルタリングして、 **Everywhere** のコンテンツを含めることもできます。 サイトと利用可能なアセットライブラリの両方のコンテンツが表示されます。

![Filter content in the Item Selector to include content from Everywhere.](./asset-library-content/images/04.png)

［Asset Publisher］ウィジェットを使用してコンテンツを公開する場合は、特定のアセットライブラリのコンテンツを含めるように範囲を設定する必要があります。 次に、使用するコンテンツを選択します。

![Set the Asset Publisher's scope to include content from a specific Asset Library.](./asset-library-content/images/05.png)

サイトでのコンテンツ使用に関する詳細は、 [コンテンツの表示](../../site-building/displaying_content.html) ドキュメントを参照してください。

```{note}
サイトとは異なり、表示ページテンプレートはアセットライブラリで定義できません。 代わりに、アセットライブラリのコンテンツは、各コンテンツタイプに対する各サイトのデフォルト表示ページテンプレートを使用して、表示されます。
```

## コンテンツのステージング

Asset Librariesは、 [Local Live](../../site-building/publishing-tools/staging/configuring-local-live-staging.md) と [Remote Live](../../site-building/publishing-tools/staging/configuring-remote-live-staging.md) Stagingの両方をサポートしています。 これにより、Webコンテンツまたはドキュメントとメディアアプリケーションでアセットを追加、削除、および編集するための作業環境が提供され、変更を本番環境に反映させることができます。 ステージコンテンツオプションは、アセットライブラリで有効になっているアプリケーションに限定されます。 有効にすると、ライブラリをステージングが有効なサイトに接続できます。

詳しくは [Using Staging with Asset Libraries](../../site-building/publishing-tools/staging/using-staging-in-asset-libraries.md) を参照してください。

## コンテンツの分類

タグおよびカテゴリーアプリケーションは、すべてのアセットライブラリで有効になっています。 これらにアクセスするには、ライブラリーのメニューページに移動し、カテゴリー分類の下にある **タグ** または **カテゴリー** をクリックします。 アセットライブラリで作成されたタグは、そのライブラリにスコープされ、そのコンテキストでのみ表示および適用できます。 ただし、アセットライブラリで定義されたボキャブラリとカテゴリーは、すべての接続済みサイトですぐに利用できます。

```{note}
アセットライブラリで作成された場合、接続されたサイトでボキャブラリとカテゴリーを編集または削除することはできません。 それらは、それらが作成されたアセットライブラリでのみ変更できます。 
```

これらのアプリケーションの使い方の詳細については、 [タグとカテゴリー](../tags_and_categories.html) ドキュメントを参照してください。

## コンテンツのエクスポートとインポート

アセットライブラリのコンテンツをLARファイルとしてエクスポートおよびインポートできます。 ライブラリの新しいエクスポート/インポート処理を開始するには、そのライブラリのダッシュボードに移動し、ページの下部にある **エクスポート** または **インポート** をクリックします。 次に、 **追加** ボタン(![追加ボタン](../../images/icon-add.png))をクリックして、新しいプロセスを開始する。

ライブラリコンテンツのエクスポートとインポートのプロセスは、サイトアセットのプロセスと同じです。 また、アプリケーション・バーの **Actions** ボタン(![Actions button](../../images/icon-actions.png) )をクリックし、 **Export Templates** を選択することで、カスタム・エクスポート・テンプレートを作成して使用することもできます。 詳しくは、 [サイトページとコンテンツのエクスポート/インポート](../../site-building/sites/exporting-importing-site-pages-and-content.md) を参照してください。

## コンテンツの削除

アセットライブラリは、 [ごみ箱](../recycle-bin/configuring-the-recycle-bin.md) アプリケーションをサポートしています。 有効にすると、ライブラリから削除されたコンテンツはすべて、ゴミ箱に一時的に保存されます。 デフォルトでは、リサイクルされたコンテンツは43200分（つまり30日間）保持されますが、この期間は各アセットライブラリの設定で調整できます。 割り当てられた時間を超えてゴミ箱に入っているリサイクルコンテンツは、インスタンスから自動的に削除されます。

または、アセットの **アクション** ボタン (![アクションボタン](../../images/icon-actions.png) ) を使って、リサイクルされたコンテンツを手動で削除したり、アセットライブラリに復元することもできます。

![Manually delete recycled content or restore it to your Asset Library.](./asset-library-content/images/06.png)

詳細は [ごみ箱の概要](../recycle-bin/recycle-bin-overview.md) を参照。

## 関連トピック

* [資産ライブラリの概要](./asset-libraries-overview.md)
* [資産ライブラリの作成と管理](./creating-and-managing-asset-libraries.md)
