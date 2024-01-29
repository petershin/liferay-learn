# イベントの構造を追加する

Liferayには、 **Basic Web Content** という、すぐに使えるWebコンテンツ構造が1つだけ付属していますが、これはClarityが求めるものには適していません。 クラリティは、より専門的なタイプのコンテンツに特化した構造を必要としている： **イベント** 記事と **FAQ** である。

## イベント構成の作成開始

まず、クラリティは特定のイベントやアナウンスを説明するコンテンツの構造を必要としている。

1. まだログインしていない場合は、パブリックサイトの管理者であるPreston Palmerとしてログインしてください。

1. サイトメニューに移動する (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; **Content & Data** &rarr; **Webコンテンツ** .

1. **構造** タブをクリックする。

1. 新しい構造を追加するには、 **Add**(![Add icon](../../images/icon-add.png)) をクリックします。

1. ページ上部のタイトルフィールドをクリックし、構造体の名前を`イベント`とする。

   ![Name the new structure "Event".](./adding-a-structure-for-events/images/01.png)

1. **Properties**（ [Propertiesアイコン](../../images/icon-cog3.png) ）をクリックして構造体のプロパティにアクセスし、次の説明を入力します。

これで、必要なフィールドで構造を構成する準備ができた。

## イベント構造のフィールドを設定する

1. ビルダー* (![ビルダー・アイコン](../../images/icon-builder.png))をクリックしてビルダー・メニューを再度開きます。

1. Builder メニューから、 **Text** フィールドを構造体の本体にドラッグする。

   テキスト・フィールドは構造体に追加され、右側のメニューは自動的にその構成に変更される。

   ![Adding a new field automatically shows its configuration in the menu on the right.](./adding-a-structure-for-events/images/02.png)

1. テキスト・フィールドの設定でこれらの値を設定する：

   * **レーベル** : 概要

   * **ヘルプテキスト** ：イベントの簡単な説明

   * **フィールドタイプ** ： **複数行**

   * 必須フィールド*トグルを有効にします。

1. テキストフィールドの設定を終了し、既存のテキストフィールドの上に **リッチテキスト** フィールドをドラッグします。

   これで両方のフィールドが、それらを含むフィールド・グループに追加される。

1. リッチテキストフィールドの設定でこれらの値を設定する：

   * **レーベル:** ボディ

   * **ヘルプテキスト** ：イベントの全文

   * ***必須フィールド** トグルを有効にします。

1. リッチテキストフィールドの設定を終了し、リッチテキストフィールドの下にある既存のフィールドグループに **Image** フィールドをドラッグします。

   ![Place the Image field in the same fields group but under the Rich Text field.](./adding-a-structure-for-events/images/03.png)

   !!! note

      フィールド・グループの中にフィールド・グループを置くことができる。 この練習では、画像フィールドをリッチフィールドの下ではなく、リッチフィールドの上にドロップすると、既存のグループの中にリッチテキストと画像フィールドを持つフィールドグループが作成されます。

1. 設定メニューの画像フィールドのラベルに「バナー画像」と入力する。

1. フィールドを含むフィールドグループをクリックしてその設定にアクセスし、ラベルフィールドに`Content`と入力します。

1. ページ上部の **保存** をクリックします。

これで、サイト上のあらゆるイベントやお知らせに使えるウェブコンテンツの構造ができました。

次ページ： [よくある質問](./adding-a-structure-for-frequently-asked-questions.md) の構成を考える。

## 関連コンセプト

- [Webコンテンツストラクチャーとテンプレートへのアクセス許可の割り当て](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-structures/assigning-permissions-to-structures-and-templates)

- [ストラクチャー項目の設定](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-structures/configuring-structure-fields)

- [Webコンテンツストラクチャーを理解する](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures)
