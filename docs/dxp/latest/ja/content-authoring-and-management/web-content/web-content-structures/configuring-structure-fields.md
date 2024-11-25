# ストラクチャー項目の設定

構造フィールドとそのプロパティを編集できる：

1. サイトメニュー ( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **コンテンツ & データ** &rarr; **ウェブコンテンツ** .

1. [**ストラクチャー**] タブを選択します。

1. 修正したい構造の名前をクリックする。

    また、構造体の横にある **アクション** メニュー ( ![Actions icon](../../../images/icon-actions.png) ) を開き、 **編集** を選択することもできます。

1. [](#structure-field-options) を追加、削除、または構造内のフィールドを再編成する。

1. 設定したいフィールドを選択する。 コンテキストメニューで [他のアクション](#structure-field-options) を実行することもできます。

1. サイドバーが展開されたら、 [選択したフィールドに希望する設定](#configurable-settings) を構成し、 **変更を保存** する。

## 構成可能な設定

```{important}
フィールド設定は、フィールドのタイプによって異なります。 以下の設定は、フィールドに適用されない場合があります。
```

**Type:** 定義に配置されるフィールドのタイプ。 これは編集できないが、ウェブコンテンツのテンプレートから参照できる。

**項目ラベル:** フィールドの上に表示するテキスト。

**ラベルを表示する：** フィールドラベルを表示するかどうか。 デフォルト値はYes。

**必須：** Webコンテンツ構造を使用してコンテンツを送信するために、ユーザーがフィールドに入力する必要があるかどうか。 デフォルト値はNo。

**フィールド参照：** フィールド参照：このフィールドのウェブコンテンツテンプレートで使用される変数名。 わかりやすい名前を入力する必要があります。 デフォルト名は自動的に生成される。

```{tip}
Liferay DXPは、構造体の新しいフィールドごとにランダムなフィールド参照を割り当てます。 デフォルト値をより説明的なものに置き換えることで、テンプレート開発者はウェブコンテンツテンプレートや表示ページにデータを配置するためのフィールドを特定することができます。
```

**ヘルプテキスト：** ユーザーがフィールドラベルを理解するのに役立つコメントを追加します。 ヘルプ・テキストは、フィールドの小見出しとして機能し、追加ガイダンスを提供します。

**検索可能：** 検索用にフィールドをインデックス化するかどうか。 テキスト全体またはキーワードにのみインデックスを付ける。

**ローカライズ可能:** フィールドをユーザーの言語でローカライズできるかどうか。 デフォルト値はYes。

**繰り返し可能：** ウェブコンテンツを作成する際に、ユーザーがフィールドを複製できるかどうか。 例えば、繰り返し入力可能な著者フィールドを持つことで、ユーザはそのフィールドを複製して記事の2人目の著者を入力することができます。 デフォルト値はNo。 Yesに設定すると、ウェブコンテンツの作成中に、ユーザーはフィールド上で `+` アイコンをクリックして複製することができます。

**複数選択を許可する：** ユーザーが複数のオプションを選択できるかどうか。 デフォルト値はNo。

**オプションをアルファベット順に並べる：** フィールドのオプションをアルファベット順に並べるかどうか。 デフォルト値はNo。

**インライン：** セレクトフィールドにインラインオプションを表示するか、ブロックオプションを表示するか。 デフォルト値はYes。

**オプション:** 選択フィールドまたはラジオフィールドで使用可能なオプション。 オプションの追加と削除だけでなく、各オプションの表示名（ユーザーがウェブコンテンツを作成するときに表示される名前）と値（ウェブコンテンツテンプレートで取得できる、オプションに保存されている値）のペアを編集することもできます。

**スタイル:**[セパレーター]フィールドのオプションのCSSスタイル。

## ストラクチャー項目オプション

構造体フィールドにカーソルを合わせて **アクション**( ![Actions button](../../../images/icon-app-options.png) ) をクリックすると、そのコンテキストメニューにこれらのオプションが表示されます：

* **複製：** フィールドとそのすべての設定を複製し、競合を避けるために名前を反復します。
* **削除する：** 構造体からフィールドを削除します。

## 関連情報

* [ストラクチャーの作成](./creating-structures.md)
* [ストラクチャーの管理](./managing-structures.md)
* [Web コンテンツストラクチャーを理解する](./understanding-web-content-structures.md)
