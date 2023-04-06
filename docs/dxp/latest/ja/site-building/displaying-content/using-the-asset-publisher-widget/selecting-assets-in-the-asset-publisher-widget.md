# アセットパブリッシャーウィジェットでのアセットの選択

特定の基準に基づいてアセットを動的に選択するようにアセットパブリッシャーウィジェットを構成するか、手動で表示するアセットを正確に指定することができます。 また、[コレクション](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)のアセットを表示することもできます。

```{note}
Liferay 7.2以下では、コレクションは [コンテンツセット](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2) と呼ばれています。
```

**アセットパブリッシャー** ウィジェットで公開するアセットを選択するには、

1. アセットパブリッシャーウィジェットの右上隅にある **アクション** メニュー（![Click on the Options button at the top-right corner of the widget for configuration.](../../../images/icon-options.png)）をクリックします。

    ![アクションメニューをクリックして、アセットパブリッシャーの構成オプションにアクセスします。](./selecting-assets-in-the-asset-publisher-widget/images/01.png)

1. ［**Configuration**］ を選択して、設定ダイアログを表示します。

    ［データ選択方法］で、アセットをフィルタリングする方法を選択します。 これらのオプションの説明については、 [データ選択方法オプション](#asset-selection-options) を参照してください。

    ![構成ウィンドウには、［Setup］タブの下にさまざまなデータ選択方法オプションがあります。](selecting-assets-in-the-asset-publisher-widget/images/02.png)

1. オプションとして、 [Dynamic](#dynamic) と [Manual](#manual) Asset selection options が選択されている場合、 **Create collection from this configuration** をクリックして、新しいコレクションを作成することができます。 これにより、設定が新しい [Collection](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)として保存されます。

1. アセットを選択してウィジェットを構成したら、 ［**Save**］ をクリックします。

## データ選択方法オプション

さまざまなオプションを使用して、［アセットパブリッシャー］ダイアログの［データ選択方法］セクションでアセットを選択できます。

- [コレクション](#collection-and-collection-provider)
- [動的](#dynamic)
- [手動](#manual)

### コレクション

このオプションを選択すると、以前に保存したコレクションまたはコレクションプロバイダーから選択することができます。 コレクションの詳細については、[コレクションとコレクションページについて](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)をお読みください。

 1. コレクションの選択］で、［**選択**］ をクリックします。
 1. **コレクション** または **コレクション プロバイダ** タブのいずれかを選択します。
 1. 終了したコレクションまたはコレクションプロバイダーの中から1つを選択します。
 1. ［**Save**］ をクリックします。

 ![［選択］をクリックして、保存済みのコレクションから選択します。](selecting-assets-in-the-asset-publisher-widget/images/04.png)

```{note}
開発者は、コレクションプロバイダを使用して、より高度な基準で特定のコレクションを作成することができます。 詳しくは、開発者向けドキュメント [Info Framework](https://help.liferay.com/hc/ja/articles/360029067251-Introduction-to-The-Info-Framework) の [情報リストプロバイダの作成](https://help.liferay.com/hc/ja/articles/360029067271-Creating-an-Information-List-Provider) に関する情報をご覧ください。
```

### 動的

［動的］データ選択方法を使用すると、さまざまな基準に基づいて、アセットパブリッシャーウィジェットにアセットを自動的に含めることができます。

  1. ［Source］セクションで、 ［**Asset Type**］ ドロップダウンメニューを使用してアセットを選択します。 特定のアセットタイプを選択するか、 ［**Select More Than One**］ を選択するとさまざまなタイプから選択できます。
  1. ［Scope］セクションで、個々のサイトのアセットを表示するか他のサイトのアセットを表示するかを選択します。
  1. ［Filter］セクションで、アセットパブリッシャーウィジェットのアセットの **ルール** を定義します。 [カテゴリ](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)、 [タグ](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags) 、またはキーワードに基づいてルールを定義できます。
  1. ［**Custom User Attribute**］ を定義している場合は、それを含めます。
  1. ［Ordering］セクションで、アセットパブリッシャーウィジェットでのアセットの表示順序を選択します。

 ![ソース、スコープ、フィルター、カスタムユーザー属性、順序付けなど、動的アセットコレクションのオプションを定義します。](selecting-assets-in-the-asset-publisher-widget/images/05.png)

### 手動

ここでは、パラメーターを設定し、特定のアセットを手動でフィルタリングできます。

 1. ［Scope］セクションで、個々のサイトのアセットを表示するか他のサイトのアセットを表示するかを選択します。
 1. ［アセットエントリー］セクションで、 ［**選択**］ ボタンを使用して特定のタイプのアセットをフィルタリングします。
 1. 選択するアセットのタイプについて、含めるアセットにチェックを入れます。
 1. ［**追加**］ をクリックします。

 ![これは、基本Webコンテンツをフィルタリングして手動でアイテムを選択する例です](selecting-assets-in-the-asset-publisher-widget/images/03.png)

 ```{note}
 選択に基づいて、新しいコレクションが作成されます。
 ```

## 関連情報

- [アセットパブリッシャーウィジェットを使用したアセットの表示](./displaying-assets-using-the-asset-publisher-widget.md)
- [アセットパブリッシャー表示設定の構成](./configuring-asset-publisher-display-settings.md)
- [コレクションとコレクションページについて](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
