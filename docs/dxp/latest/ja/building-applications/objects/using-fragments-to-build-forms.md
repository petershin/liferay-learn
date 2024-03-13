# フラグメントでフォームを構築する

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA92+`.

Liferayには、コンテンツページにオブジェクトフォームを構築するためのフォームフラグメントがあります。 フォームを作成するには、コンテンツページまたはページテンプレートにフォームコンテナを追加し、公開オブジェクトにマッピングします。 コンテナは、各オブジェクト・フィールドにマッピングされたフラグメントを自動的に入力する。 手動でフラグメントを整理、削除、追加することができます。 公開されると、エンドユーザーはフォームを使ってオブジェクト・エントリーを作成できる。

コンテンツページにフォームを作成する、

* フォームの断片は、マッピングされたフォームコンテナにのみ配置します。
* フォーム内のすべてのフォームフラグメントをオブジェクトフィールドにマッピングし、データの損失を防ぐ。
* すべての必須オブジェクト・フィールドのフラグメントをフォーム・コンテナに含める。
* 必須フォームの断片を見えるようにする。
* フォームコンテナ内に送信ボタンを表示する。

```{note}
オブジェクトをフォームコンテナのフラグメントにマッピングすると、送信ボタンが生成されます。 [マッピング設定](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) を使ってテキストをマッピングできます。

リダイレクトのために [リンク設定](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#link-settings) を持つボタンを作成するには、`type="button"` をボタンの断片に追加します。
```

デフォルトでは、Liferayには [Form Components](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) フラグメントセットが含まれていますが、自分で作成することもできます。 詳しくは [フォーム・フラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) を参照してください。

また、フォームフラグメントは [カスタムオブジェクト](../objects/creating-and-managing-objects/creating-objects.md) でのみ使用できます。 そのため、Liferayは少なくとも1つの公開オブジェクトができるまで、Form Componentsフラグメントセットを非表示にします。 公開されると、オブジェクトへのアクセス権を持つユーザーは、フォームコンポーネントのフラグメントを表示したり使用したりすることができます。

## フォームの作成

1. コンテンツページまたはページテンプレートの編集を開始します。

   表示ページテンプレートはフォームフラグメントをサポートしていません。

1. (オプション）フラグメントを使ってレイアウトをデザインする。 詳しくは [Building Responsive Layouts with Fragments](../../site-building/optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) を参照してください。

1. **フォームコンテナ** フラグメントをページに追加し、オブジェクトにマッピングする。

   コンテナは、すべてのオブジェクトフィールドに対して、送信ボタンとフラグメントを自動的に生成します。 アルファベット順に並んでいる。 必須項目には適宜マークが付きます。

   ![Add the form container and map it to an object.](./using-fragments-to-build-forms/images/01.png)

1. フォームに不要な非必須フィールドを削除する。

1. フォームの断片をドラッグ・アンド・ドロップして再編成する。 デフォルトでは、フォーム要素はアルファベット順に整理されます。

1. (オプション）フォームコンテナに基本フラグメントを追加する。 基本的なコンポーネント（グリッド、セパレーター、段落、画像など）を使って、フォームコンテナに構造とスタイルを与えることができます。

   ![Add basic fragments to the form container and reorganize your page elements to create the desired structure.](./using-fragments-to-build-forms/images/02.png)

1. フラグメントを設定する。 フォームの断片には、 [標準の](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) と、 [ユニークな](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) の両方の設定オプションがあります。

   ```{note}
   フォーム・フラグメントの設定オプションは、フラグメントをオブジェクト・フィールドにマッピングした後に利用可能になります。
   ```

   ![Configure the form fragments.](./using-fragments-to-build-forms/images/03.png)

1. {bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)` (オプション) ドラフトモードがオブジェクトに対して有効になっている場合、フォームの送信ボタンに対して Submitted Entry Status を設定します： **Approved** または **Draft** 。

   ```{important}
   フォームフラグメントを使用して表示ページのエントリを更新する場合、エントリのステータスを承認済みから下書きに変更することはできません。
   ```

   ![Configure the Submitted Entry Status for the form's submit button.](./using-fragments-to-build-forms/images/04.png)

1. 完了したら **Publish** をクリックします。

## フォームコンポーネントでサポートされているフィールドタイプ

各フォーム・フラグメントは、1つ以上のオブジェクト・フィールド・タイプをサポートすることができる。 デフォルトのフォームコンポーネントはこれらのフィールドをサポートしています。

| フォームフラグメント | オブジェクト項目タイプ         |
| :--------- | :------------------ |
| キャプチャ      | 該当なし                |
| チェックボックス   | ブール値                |
| 日付         | 日付                  |
| ファイルアップロード | 添付ファイル              |
| 複数選択のリスト   | 複数のピックリスト           |
| 数値入力       | 整数、長整数、10進数、高精度10進数 |
| リッチテキスト    | リッチテキスト             |
| プルダウン      | リレーションシップ, ピックリスト   |
| 送信ボタン      | 該当なし                |
| テキスト入力     | テキスト、長文             |
| テキスト領域     | テキスト、長文             |

```{tip}
オブジェクトのカテゴリ分けが有効になっている場合、Tags and Categories フォームフラグメントを使用してオブジェクトエントリにメタデータを追加することができます。
```

## 関連トピック

[フォーム・コンポーネント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) 

[フラグメントの設定](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) 

[フォーム・フラグメント・オプション](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) 

[フォーム・フラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) 
