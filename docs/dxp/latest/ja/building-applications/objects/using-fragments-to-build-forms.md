# フラグメントを使用してフォームを構築する

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

Liferayには、コンテンツページでオブジェクトフォームを構築するためのフォームフラグメントがあります。 フォームを構築するには、コンテンツページまたはページテンプレートにフォームコンテナを追加し、それを公開オブジェクトにマッピングします。 コンテナには、各オブジェクトフィールドにマッピングされたフラグメントが自動的に入力されます。 手動でフラグメントを整理、削除、追加することができます。 公開されると、エンドユーザーはフォームを使用してオブジェクトエントリーを作成することができます。

コンテンツページでフォームを構築するためには

* フォームの破片は、マッピングされたフォームコンテナにのみ入れてください。
* フォーム内のすべてのフォームフラグメントをオブジェクトフィールドにマッピングして、データの損失を防ぐ。
* すべての必須オブジェクトフィールドに対して、フォームコンテナにフラグメントを含める。
* 必須のフォームフラグメントを可視化する。
* フォームコンテナ内に可視化された送信ボタンを含める。

デフォルトでは、Liferayには [Form Components](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) のフラグメントセットが含まれていますが、自分で作成することも可能です。 詳しくは [フォームフラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) をご覧ください。

```{important}
フォームフラグメントは、カスタムオブジェクトでのみ使用可能です。 そのため、Liferayは少なくとも1つの公開オブジェクトができるまで、Form Componentsのフラグメントセットを非表示にします。 公開されると、オブジェクトへのアクセス権を持つユーザーは、フォームコンポーネントフラグメントを閲覧、使用することができます。 詳しくは[オブジェクトの作成](../objects/creating-and-managing-objects/creating-objects.md) をご参照ください。
```

## フォームを作成する

1. コンテンツページやページテンプレートの編集を開始します。

   表示ページテンプレートは、フォームフラグメントに対応していません。

1. (オプション) フラグメントを使ったレイアウトをデザインする。 [フラグメントでレスポンシブレイアウトを構築する](../../site-building/optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) をご参照ください。

1. **フォームコンテナ** フラグメントをページに追加し、オブジェクトにマッピングします。

   コンテナは、すべてのオブジェクトフィールドに対して、Submitボタンとフラグメントを自動的に生成します。 五十音順で表示されます。 必須項目には適宜マークが付きます。

   ![フォームコンテナを追加し、オブジェクトにマッピングします。](./using-fragments-to-build-forms/images/01.png)

1. フォームに不要な非必須フィールドを削除する。

1. フォームフラグメントをドラッグ＆ドロップで再編成。 デフォルトでは、フォームの要素はアルファベット順に整理されています。

1. (オプション) フォームコンテナに基本フラグメントを追加します。 基本的なコンポーネント（グリッド、セパレータ、段落、画像など）を使って、フォームコンテナに構造とスタイルを提供することができます。

   ![フォームコンテナに基本的なフラグメントを追加し、ページ要素を再編成して目的の構造を作り出します。](./using-fragments-to-build-forms/images/02.png)

1. フラグメントを設定する。 フォームフラグメントには、 [標準の](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) と [独自の](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) の両方の構成オプションがあります。

   ```{note}
   フォームフラグメントの設定オプションは、フラグメントをオブジェクトフィールドにマッピングした後に利用可能になります。
   ```

   ![フォームフラグメントを設定する。](./using-fragments-to-build-forms/images/03.png)

1. 完了したら、 ［**公開**］ をクリックします。

## フォームコンポーネントでサポートされているフィールドタイプ

各フォームフラグメントは、1つまたは複数のオブジェクトフィールドタイプをサポートすることができます。 デフォルトのフォームコンポーネントは、これらのフィールドをサポートしています。

| フォームフラグメント | オブジェクト項目タイプ        |
|:---------- |:------------------ |
| キャプチャ      | 該当なし               |
| チェックボックス   | ブール値               |
| 日付         | 日付                 |
| ファイルアップロード | 添付ファイル             |
| 複数選択のリスト   | 複数のピックリスト          |
| 数値入力       | 整数、長整数、10進数、精密10進数 |
| リッチテキスト    | リッチテキスト            |
| プルダウン      | リレーションシップ、ピックリスト   |
| 送信ボタン      | 該当なし               |
| テキスト入力     | テキスト、ロングテキスト       |
| テキスト領域     | テキスト、ロングテキスト       |

```{tip}
オブジェクトのカテゴリ分けが有効になっている場合、タグとカテゴリのフォームフラグメントを使用して、オブジェクトエントリにメタデータを追加することができます。 
```

## 関連トピック

* [フォームコンポーネント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components)
* [フラグメントの設定](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
* [フォームフラグメントのオプション](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options)
* [フォームフラグメントを作成する](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md)
