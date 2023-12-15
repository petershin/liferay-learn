# Creating Collections

```{note}
この情報はLiferay DXP 7.3以降に適用されます。 以前の Liferay DXP バージョンについては、 [Liferay DXP 7.2](#liferay-dxp-7-2) を参照してください。
```

**手動** または **動的** コレクションを作成できます。 コレクションの種類については、 [コレクションとコレクションページについて](./about-collections-and-collection-pages.md) を参照してください。

## 手動コレクションの作成

1. **サイト管理** &rarr; **サイト・ビルダー** &rarr; **コレクション** にアクセスしてください。

1. **新規** ボタン（[Add]（../../../images/icon-add.png））をクリックし、 **マニュアルコレクション** を選択します。

1. マニュアルコレクションの **タイトル** を追加し、 **保存** をクリックします。

1. **アイテムタイプ** ドロップダウンメニューで、コレクションに含めるアイテムタイプを選択します。
   * 項目のタイプを1つだけ含める場合

     1. **単品タイプ** でタイプを選択します。
     1. オプションとして、 **Item Type** にサブタイプが含まれている場合は、 **Item Subtype** ドロップダウンメニューでサブタイプを選択します。
     3. ［**保存**］をクリックします。

     ![Configure the content Type and Subtype for the Manual Collection](./creating-collections/images/01.png)

   * 項目のタイプを複数含める場合

     1. 複数のアイテムタイプ(Multiple Item Types)]で\[複数選択(Select More Than One)]を選択します。
     1. デュアルリストボックスで、コレクションに含める項目のタイプを追加または削除します。

     ![Select the different item Types for the Manual Collection](./creating-collections/images/02.png)

1. ［**保存**］をクリックします。

1. **コレクション アイテム** の横にある **選択** をクリックし、アイテム タイプの 1 つを選択します。

   ![Select the items you want to include in the Manual Collection](./creating-collections/images/03.png)

1. 選択ダイアログで、含める項目にチェックを入れます。

1. **追加** をクリックする。

1. 手動コレクションに複数の項目のタイプが含まれている場合は、他のタイプについて手順6〜8を繰り返します。

なお、ドキュメントとメディアフォルダおよびWebコンテンツフォルダをコレクションに追加できます。

```{note}
ドキュメントとメディア、およびWebコンテンツフォルダーはコレクションに追加できますが、フォルダがコレクションページまたはアセットパブリッシャーウィジェットで公開されている場合、コンテンツは表示されません。 これらのアセットがコレクションに追加された場合でも、個別に表示することしかできません。 これは既知の制限であり、将来のリリースで修正される予定です。
```

## 動的コレクションの作成

1. **サイト管理** &rarr; **サイト・ビルダー** &rarr; **コレクション** にアクセスしてください。

1. **新規** ボタン（ [Add](../../../images/icon-add.png) ）をクリックし、 **ダイナミックコレクション** を選択します。

1. マニュアルコレクションの **タイトル** を追加し、 **保存** をクリックします。

1. **アイテムタイプ** ドロップダウンメニューで、コレクションに含めるアイテムタイプを選択します。
   * 項目のタイプを1つだけ含める場合,

     1. **単品タイプ** でタイプを選択します。
     1. オプションとして、 **Item Type** にサブタイプが含まれている場合は、 **Item Subtype** ドロップダウンメニューでサブタイプを選択します。
     1. 特定のフィールドで **Item Subtype** をフィルタリングするには、 **Filter by Field** スイッチを有効にし、 **Select** をクリックしてフィールドを選択し、 **Apply** をクリックします。
     1. ［**保存**］をクリックします。 

     ![You can filter the Item Subtype in your Collection by one of the item fields](./creating-collections/images/09.gif)

   * 項目のタイプを複数含める場合、

     1. 複数のアイテムタイプ(Multiple Item Types)]で[タイプ選択(Select Types)]を選択します。
     1. デュアルリストボックスで、コレクションに含める項目のタイプを追加または削除します。

     ![Select the different item Types for the Manual Collection](./creating-collections/images/02.png)

1. **スコープ** 、 **フィルタ** 、 **コンテンツの推奨** 、または **オーダリング** に基づいて、ダイナミックコレクションの基準を構成します。

   **スコープ:** 動的コレクションのアイテムのソースを定義します。 デフォルトでは、ソースは現在のサイトです。

   **フィルター** ：ダイナミックコレクションのアイテムのルールを設定します。 たとえば、「プロモーション」タグが付いた項目のみを含めることができます。

   ![Filter your Dynamic Collection by adding one or more rules.](./creating-collections/images/10.png)

    ```{tip}
    追加ボタンをクリックして、絞り込みに複数のルールを追加できます。 動的コレクションの最終的なコンテンツは、すべてのルールを追加した結果です。
    ```

   **コンテンツに関する推奨事項:** ユーザーの行動に基づいてコンテンツを表示するには、このオプションを有効にします。 詳細については、[コンテンツ推奨の構成](../../../site-building/personalizing-site-experience/experience-personalization/configuring-content-recommendations.md) を参照してください。

   ```{note}
   コンテンツの推奨オプションは、DXPインスタンスをAnalytics Cloudに接続してコンテンツを同期するときに使用できます。
   ```

   **順序:** コレクション内のアイテムは、ここで定義した順序基準を使用して表示されます。

1. ［**保存**］をクリックします。

## アセットパブリッシャーからコレクションを作成する

[アセットパブリッシャーウィジェット](../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) から新しいコレクションを作成できます。 これは、他のページでコレクションとして使用するアセットパブリッシャーのカスタマイゼーションがある場合に役立ちます。

![You can transform an Asset Publisher widget into a Collection.](./creating-collections/images/06.png)

1. **サイト管理** &rarr; **サイト・ビルダー** &rarr; **ページ** にアクセスしてください。

1. アセット・パブリッシャーが含まれるページの横にある **Actions** ボタン（[Add]（../../../images/icon-actions.png））をクリックし、 **Edit** を選択します。

   ![Edit the page which contains your Asset Publisher.](./creating-collections/images/11.png)

1. アセット・パブリッシャー **にカーソルを合わせ、ウィジェットのメニューにある*オプション*アイコン(![Options](../../../images/icon-app-options.png)) をクリックし、** 設定_を選択する。

   ![Configure the Asset Publisher Widget.](./creating-collections/images/07.png)

1. **Asset Publisher - Configuration** ダイアログで、 **Setup** タブと **Asset Selection** サブタブをクリックします。

1. 下にスクロールして、 **Create a Collection from this Configuration** をクリックします。

   ![Click the Create a collection from this configuration to transform the Asset Publisher widget into a new Collection.](./creating-collections/images/08.png)

1. コレクションの **タイトル** を入力し、 **保存** をクリックします。

1. **Asset Publisher - Configuration** ダイアログを閉じます。

1. **サイト管理** &rarr; **サイトビルダー** &rarr; **コレクション** で新しいコレクションを検索します。

## Liferay DXP 7.2

### コンテンツセットの作成

コンテンツセットは、サイト管理のコンテンツセットインターフェースから作成できます。 コンテンツセットは、手動選択または動的選択のいずれかを使用できます。 コンテンツセットはいくつでも作成でき、アセットパブリッシャーまたはカスタムアプリケーションを介して表示できます。 コンテンツセットには、指定した基準に基づいてさまざまなユーザーにさまざまなエクスペリエンスを提供する [個人用バリエーション](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md#content-set-personalization) を持たせることもできます。 基準管理はアセットパブリッシャーと共有されます。 各オプションの詳細は、 [Selecting Assets in the Asset Publisher](../../../site-building/displaying-content/using-the-asset-publisher-widget/selecting-assets-in-the-asset-publisher-widget.md) を参照してください。

#### 手動コンテンツセットの作成

手動コンテンツセットの作成方法を説明するために、架空の宇宙プログラムWebサイトのフロントページに表示される多数の画像を含むコンテンツセットを作成します。 この練習の準備として、コンテンツ・セットに使用する適切な画像を **Documents and Media** にアップロードしてください。

1. **サイト管理** &rarr; **コンテンツとデータ** にアクセスし、 **コンテンツ・セット** を選択します。

   ![Content Sets is found in the Content & Data section of Site Administration.](./creating-collections/images/20.png)

1. をクリックする！ [Add](../../../images/icon-add.png) をクリックし、 **手動選択** を選択します。

1. コンテンツセットに **Space Program Images** という名前を付けます。

次の画面で、コンテンツセットに含めるアセットを選択できます。

1. **選択** &rarr; **基本文書** をクリックする。

   ![You can select the type of asset to add to the Content Set.](./creating-collections/images/21.png)

1. ここで、追加したい各画像のボックスにチェックを入れ、 **追加** をクリックします。

これで、このコンテンツセットは、作成したサイトのどこにでも表示できるようになりました。 項目をセットに追加したりセットから削除することができ、どこに表示されていても自動的に更新されます。

#### 動的コンテンツセットの作成

動的コンテンツセットの作成方法を説明するために、「Trending」としてタグ付けされた多数のさまざまなアセットを含むコンテンツセットを作成します。 これを機能させるには、適切なタグが付いた既存のアセットがいくつか必要になります。

1. **コンテンツ・セット** ページから、 をクリックする！ [Add](../../../images/icon-add.png) &rarr; **Dynamic Selection** .
1. 名前に **Trending** と入力し、 **Save** をクリックする。

ダイナミック・コンテンツ・セットを使用すると、セット内のアイテムの **ソース** 、 **スコープ** 、 **フィルタ** 、および **順序** を選択できます。

1. **ソース** を **Any** 、 **スコープ** を **Current Site** のままにする。

1. **フィルター** を開き、 **次のタグのいずれかを含む** に設定されていることを確認し、 **タグ** ボックスに「トレンド」と入力します。

   ![Content Sets use the same filter system as the Asset Publisher.](./creating-collections/images/22.png)

1. **Ordering** を開き、 **Order By** に設定する： **発行日** 、 **次に** ： **タイトル**

1. ［**保存**］をクリックします。

これにより、現在 **トレンド** とタグ付けされているアイテムを含むコンテンツ セットが作成され、今後 **トレンド** タグが付けられるアイテムは自動的にコンテンツ セットに追加されます。

コンテンツセットを作成したので、 [それらをページに表示する](./displaying-collections.md#displaying-content-sets) ことができます。

### アセットパブリッシャー設定をコンテンツセットに変換する

このセクションの前の2つのガイドでは、 [コンテンツセットの作成](./creating-collections.md#creating-content-sets) と [コンテンツセットの表示](./displaying-collections.md#displaying-content-sets) について説明しました。 次に、既存のアセットパブリッシャー設定をコンテンツセットに変換してみます。

この場合、ページ上にアセット・パブリッシャーがあり、 **trending** とタグ付けされた画像をタイトル順にアルファベット逆順で表示するように設定されています。 **コンテンツ・セット\** 作成ツールでこれを再現するのはそれほど難しくないかもしれませんが、アセット・パブリッシャーから直接コンテンツ・セット定義を作成するのはさらに簡単です。

1. にアクセスしてください！ [Options](../../../images/icon-app-options.png) &rarr; **Configuration** for the Asset Publisher.

2. **この設定からコンテンツセットを作成する** をクリックします。

   ![You can generate a Content Set directly from the Asset Publisher configuration.](./creating-collections/images/23.png)

3. タイトルを入力し、 **保存** をクリックします。

そうすれば、新しいコンテンツセットができあがり、サイト上のあらゆる場所でアセットパブリッシャーで使用することができます。

![The Content Set is added right alongside any existing sets.](./creating-collections/images/24.png)

アセットパブリッシャーの設定をコンテンツセットに変換できました。

## 関連情報

* [コレクションとコレクション・ページについて](./about-collections-and-collection-pages.md) 
* [コレクションの表示](./displaying-collections.md) 
* [パーソナライズ・コレクション](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md) 
