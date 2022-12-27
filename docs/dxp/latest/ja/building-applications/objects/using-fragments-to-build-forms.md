# フラグメントを使ったフォームの構築

{bdg-secondary}`利用可能な Liferay 7.4 U45+/GA45+`

Liferay には、コンテンツページでオブジェクトフォームを構築するためのフォームフラグメントがあります。 フォームを作成するには、コンテンツページまたはページテンプレートにフォームコンテナを追加し、それを発行オブジェクトにマッピングします。 コンテナは、各オブジェクトのフィールドにマッピングされたフラグメントを自動的に入力する。 手動でフラグメントを整理、削除、追加することができます。 公開されると、エンドユーザーはフォームを使ってオブジェクトのエントリーを作成できるようになります。

コンテンツページにフォームを作成するためには

* フォームフラグメントはマッピングされたフォームコンテナにのみ入れてください。
* フォーム内のすべてのフォームフラグメントをオブジェクトフィールドにマッピングし、データ損失を防止します。
* すべての必須オブジェクトフィールドに対して、フォームコンテナにフラグメントを含める。
* 必須のフォームフラグメントを見えるようにする。
* フォームコンテナに可視的な送信ボタンを含める。

デフォルトでは、Liferay には [Form Components](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) フラグメントセットが含まれていますが、自分で作成することも可能です。 詳しくは、 [フォームフラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) をご覧ください。

```{important}
フォームフラグメントは、カスタムオブジェクトでのみ使用可能です。 そのため、Liferayは少なくとも1つの公開オブジェクトができるまで、Form Componentsフラグメントセットを非表示にします。 公開されると、そのオブジェクトにアクセスできるユーザーは、Form Componentsのフラグメントを表示および使用することができます。 詳しくは、[オブジェクトの作成](../objects/creating-and-managing-objects/creating-objects.md) をご覧ください。
```

## Creating a Form

1. コンテンツページまたはページテンプレートの編集を開始します。

   表示ページテンプレートは、フォームフラグメントに対応していません。

1. (オプション) フラグメントを使ったレイアウトを設計する。 詳しくは、 [フラグメントによるレスポンシブレイアウトの構築](../../site-building/optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) をご覧ください。

1. **フォームコンテナ** フラグメントをページに追加し、オブジェクトにマップします。

   コンテナは、すべてのオブジェクトフィールドのSubmitボタンとフラグメントを自動的に生成します。 アルファベット順で表示されます。 必須項目には適宜マークを付けています。

   ![フォームコンテナを追加し、オブジェクトにマップします。](./using-fragments-to-build-forms/images/01.png)

1. フォームに不要な非必須フィールドを削除します。

1. フォームの断片をドラッグ＆ドロップで再編成することができます。 デフォルトでは、フォームの要素はアルファベット順に整理されています。

1. (オプション) フォームコンテナに基本フラグメントを追加します。 基本的な構成要素（グリッド、セパレータ、段落、画像など）を使って、フォームコンテナに構造とスタイルを与えることができます。

   ![フォームコンテナに基本的なフラグメントを追加し、ページ要素を再編成して目的の構造を作り上げます。](./using-fragments-to-build-forms/images/02.png)

1. フラグメントを設定する。 フォームフラグメントには、 [標準](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) と [ユニーク](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) の両方の構成オプションがあります。

   ```{note}
   フォームフラグメントの設定オプションは、フラグメントをオブジェクトフィールドにマッピングした後に利用可能になります。
   ```

   ![フォームフラグメントを設定する。](./using-fragments-to-build-forms/images/03.png)

1. 完了したら、 [**Publish**] をクリックします。

## フラグメントコンポーネントでサポートされているフィールドタイプ

各フォームフラグメントは、オブジェクトフィールドタイプに対応する1つ以上のフォームフィールドタイプをサポートすることができます。

デフォルトのフォームコンポーネントは、これらのフィールドをサポートしています。

| フラグメント     | フォームフィールドタイプ   | オブジェクト項目タイプ          |
|:---------- |:-------------- |:-------------------- |
| キャプチャ      | 該当なし           | 該当なし                 |
| チェックボックス   | ブール値           | ブール値                 |
| 日付         | 日付             | 日付                   |
| ファイルアップロード | ファイル           | 添付ファイル               |
| 数値入力       | 数字             | 整数、長整数、10進数、精密10進数   |
| プルダウン      | リレーションシップ、セレクト | リレーションシップ、ピックリスト     |
| 送信ボタン      | 該当なし           | 該当なし                 |
| テキスト入力     | テキストボックス       | テキスト、ロングテキスト、リッチテキスト |

## 追加情報

* [フォームコンポーネント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components)
* [フラグメントの設定](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
* [フォームフラグメントのオプション](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options)
* [フォームフラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md)
