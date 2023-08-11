# フォームフラグメントを使ったカスタムフォームのパーソナライズ

フォームフラグメントは、カスタムオブジェクトに基づいてフォームを自動生成します。 Liferay のすぐに使えるフォームフラグメントがあなたのユースケースを満たさない場合、 [カスタムフォームフラグメントをフィールドタイプ](#map-custom-form-fragments-to-form-fields) にマッピングすることで、カスタムフォームフラグメントを作成し、フォームのスタイルを変更することができます。

カスタムフォームフラグメントは、HTML、CSS、JavaScriptコードを使用して、カスタマイズされたスタイルと機能を持つ要素を作成します。 このように、既存のデザインシステムやコンポーネント・ライブラリを使用して、フォームをカスタマイズすることができます。 詳しくは [フォーム・フラグメントの作成](../../../developer-guide/developing-page-fragments/creating-form-fragments.md) を参照してください。

```{important}
フォームフラグメントはカスタムオブジェクトでのみ使用できます。 Liferay は、少なくとも1つの公開オブジェクトができるまで、Form Components フラグメントセットを非表示にします。 公開されると、オブジェクトへのアクセス権を持つユーザーは、フォームコンポーネントのフラグメントを表示、使用することができます。 詳しくは[オブジェクトの作成](../../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)を参照してください。
```

## カスタムフォームフラグメントをフォームフィールドにマップする

フォームフィールドのデフォルトスタイルと機能を変更するには、 [カスタムフォームフラグメント](../../../developer-guide/developing-page-fragments/creating-form-fragments.md) をフィールドタイプにマッピングします：

1. **Site Menu**( ![Site Menu icon](../../../../images/icon-menu.png) ) を開き、 **Design** &rarr; **Fragments** をクリックする。

1. Fragmentsアプリケーションで、アプリケーションバーの **Options**(![Options Icon](../../../../images/icon-options.png)) &rarr; **Configuration** をクリックします。

   ![フラグメントの設定メニューから、フラグメントをフィールドにマッピングすることができる。](./personalizing-custom-forms-using-form-fragments/01.png)

1. フィールドタイプ（左列）に適用する **フォームフラグメント**（右列）を選択する。

   ![カスタムフォームフラグメントをフィールドタイプに適用します。](./personalizing-custom-forms-using-form-fragments/02.png)

1. サイトのタブでフラグメントセットを選択します。 適合するタイプのフィールドを持つフラグメントが表示される。

1. 適用したいカスタムフォームフラグメントを選択します。

   ![フィールドに適合するオプションが選択できる。](./personalizing-custom-forms-using-form-fragments/03.png)

カスタムフラグメントがフィールドタイプに適用されているかどうかは、コンテンツページまたはテンプレートページにフォームを追加することで確認できます。 フラグメントを使ったフォームの構築については [フラグメントを使ってフォームを構築する](../../../../building-applications/objects/using-fragments-to-build-forms.md) を参照してください。

カスタムフォームフラグメントをフィールドタイプに適用すると、新しいスタイル（左側）がフィールドタイプに適用されます。

![カスタムフォームフラグメントにマッピングされたフィールド(左側)は、既成のフラグメントで作成されたフィールド(右側)とは異なります。](./personalizing-custom-forms-using-form-fragments/04.png)

## 関連トピック

* [フラグメントの設定](./configuring-fragments.md)
* [フォーム・フラグメントの作成](../../../developer-guide/developing-page-fragments/creating-form-fragments.md)
* [ページフラグメントの開発](../../../developer-guide/developing-page-fragments.md)
* [フォームコンポーネント](./default-fragments-reference.md#form-components)
* [フォーム・フラグメント・オプション](./configuring-fragments/general-settings-reference.md#form-fragment-options)
* [フラグメントを使ってフォームを作る](../../../../building-applications/objects/using-fragments-to-build-forms.md)

