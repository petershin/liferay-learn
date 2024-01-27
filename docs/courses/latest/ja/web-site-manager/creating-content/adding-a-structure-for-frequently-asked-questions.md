# よくある質問の構造を追加する

クラリティは、サイト管理者が質問を追加、削除、グループ化しやすいように、よくある質問ページを管理する方法を求めています。

ここでは、任意の数の質問を持つ記事を作成できるように、繰り返しフィールドを持つ構造を作成します。 反復可能なフィールドとは、いくつでもインスタンスを持つことができるフィールドのことです。 この場合、繰り返し使用できるテキストフィールドのペア（質問とその答え）を追加します。

## FAQ構造の作成開始

1. まだログインしていない場合は、パブリックサイトの管理者であるPreston Palmerとしてログインしてください。

1. サイトメニューに移動する (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; _Content & Data_ &rarr; _Webコンテンツ_.

1. 構造*タブをクリックする。

1. 新しい構造を追加するには、_Add_ (![Add icon](../../images/icon-add.png)) をクリックします。

   ![Add a new structure alongside the Event structure.](./adding-a-structure-for-frequently-asked-questions/images/01.png)

1. ページ上部のタイトルフィールドをクリックし、構造体に「FAQs」という名前を付けます。

1. *プロパティ* ([プロパティのアイコン](../../images/icon-cog3.png))をクリックし、次の説明を入力します。

これで、必要なフィールドで構造を構成する準備ができた。

## FAQ構造のフィールドを設定する

1. *ビルダー* (![ビルダー・アイコン](../../images/icon-builder.png))をクリックしてビルダー・メニューを再度開きます。

1. Builder メニューから、_Text_ フィールドを構造体の本体にドラッグする。

   テキスト・フィールドは構造体に追加され、右側のメニューは自動的にその構成に変更される。

   ![Adding a new field automatically shows its configuration in the menu on the right.](./adding-a-structure-for-frequently-asked-questions/images/02.png)

1. テキスト・フィールドの設定でこれらの値を設定する：

   * **Label**：質問

   * **Label**：質問
フィールドタイプ**：*複数行

   * 必須フィールド*トグルを有効にします。

1. Advanced*タブをクリックし、_Field Reference_の値を`QuestionText`に変更する。

   自動生成された参照値の代わりにこれを使えば、後でテンプレートで参照するのが簡単になる。

1. テキスト・フィールドの設定を終了し、ビルダー・メニューからリッチ・テキスト・フィールドを最初のテキスト・フィールドの上にドラッグします。

   これにより、両方のフィールドが、それらを含むフィールド・グループに追加される。

1. リッチテキストフィールドの設定でこれらの値を設定する：

   - **ラベル回答

   - 必須フィールド*トグルを有効にします。

1. Advanced*タブをクリックし、_Field Reference_の値を`AnswerText`に変更する。

1. つのテキスト・フィールドを含むフィールド・グループをクリックして、その設定にアクセスし、これらのフィールドを設定する：

   - **Label**：よくある質問

   - Collapsible*トグルを有効にする。

   - Repeatable*トグルを有効にする。

   ![The completed FAQs structure has a repeatable field group, for any number of paired questions and answers.](./adding-a-structure-for-frequently-asked-questions/images/03.png)

1. Advanced*タブをクリックし、_Field Reference_の値を`FAQ`に変更する。

1. ページ上部の_保存_をクリックします。

FAQやイベントコンテンツの記事をサイトに追加することができます。 しかし、コンテンツ構造には、それに付随する表示テンプレートが必要だ。

次： [イベント構造用のテンプレートを追加する](./adding-a-template-to-display-an-event.md) .

## 関連コンセプト

- [ウェブコンテンツの構造とテンプレートへの権限の割り当て](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-structures/assigning-permissions-to-structures-and-templates) 

- [構造体フィールドの設定](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-structures/configuring-structure-fields) 

- [ウェブコンテンツの構造を理解する](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures) 
