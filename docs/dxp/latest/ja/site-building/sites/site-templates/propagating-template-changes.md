# テンプレート変更のプロパゲート

サイト テンプレートのプロパゲーションが有効になっている場合、テンプレートのページに変更を加え、その変更を接続されているサイトに自動的に伝搬させることができます。 しかし、テンプレートから継承されたサイトページに変更を加えると、テンプレートの変更がそのページに伝搬されなくなります。 ページのプロパゲーションを復元するには、サイト内でそのページに加えられた変更を破棄する必要があります。 複数の継承されたページを編集し、サイトテンプレートからの伝播を復元したい場合は、それぞれのページの変更を個別にリセットする必要があります。

```{note}
デフォルトでは、変更が加えられた後、そのサイトにユーザーが最初にアクセスしたときに、接続されている各サイトに対して個別にプロパゲーションがトリガーされます。 しかし、ユーザーがテンプレートを*Ready for Propagation*に切り替えるたびに、同時に接続されたサイトへの伝搬もトリガーするようにシステムを構成することができます。 詳しくは、 [サイトテンプレートプロパゲーションの設定](./configuring-site-template-propagation.md) を参照してください。
```

## どのテンプレートの変更が伝播されますか？

テンプレートのページとページ要素への変更のみが、接続されているサイトに伝わります。 これには、新しく作成されたページだけでなく、既存のページのフラグメントやウィジェットの変更も含まれます。 その他のアプリケーション・データは、最初のサイト作成時にのみコピーされ、その後の変更は自動的に反映されません。

このため、サイトテンプレートは主に複数のサイトでページを管理するためのものです。 サイト間でウェブコンテンツやその他のアセットを作成・管理する必要がある場合は、 [アセットライブラリ](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md)をご利用ください。

## 伝搬の有効化と無効化

[](./creating-site-templates.md)テンプレートを作成する際に、自動伝搬を有効にするか無効にするかを決めますが、この設定はいつでも変更できます。

![テンプレート作成時の自動伝搬を有効または無効にします。](./propagating-template-changes/images/01.png)

テンプレート作成後のプロパゲーションを有効または無効にするには、以下の手順に従います：

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **サイトテンプレート** をクリックする。

1. 希望のテンプレートを選択する。

1. **プロパゲーション** ボタンをクリック (![Propagation Button](../../../images/icon-merge.png))

   伝搬が有効になっている場合は、 **伝搬を無効にする** をクリックして、テンプレートの変更が接続されているサイト ページに自動的に伝搬されないようにします。

   ![Propagation が有効になっている場合は、Disable Propagation をクリックします。](./propagating-template-changes/images/02.png)

   伝搬が無効になっている場合は、 **Ready for Propagation** をクリックして、自動伝搬を有効にします。

   ![Propagation が無効になっている場合は、Ready for Propagation をクリックします。](./propagating-template-changes/images/03.png)

また、サイトテンプレート申請ページで自動伝播の有効/無効を設定することもできます。 **Actions**(![Actions Button](../../../images/icon-actions.png)) をクリックし、 **Disable Propagation** または **Ready for Propagation** を選択します。

![目的のサイトテンプレートのアクションボタンをクリックし、[Disable Propagation]または [Ready for Propagation]を選択します。](./propagating-template-changes/images/04.png)

## 継承されたページをテンプレートに再接続する

テンプレートから継承したサイトページに変更を加えた場合、そのページはテンプレートのページから切り離され、自動的には反映されません。 サイトページをテンプレートに再接続するには、サイトページへの変更を破棄する必要があります。

以下の手順に従って、サイトページの変更を破棄し、テンプレートと再同期してください：

1. サイトページに移動する。

1. アプリケーションバーの **追加情報** アイコン (![Information](../../../images/icon-control-menu-information.png)) をクリックします。

   ![追加情報]アイコンをクリックし、 [変更をリセット]を選択します。](./propagating-template-changes/images/05.png)

1. **Reset Changes** をクリックします。

   ```{warning}
   変更をリセットする **サイトのページに加えられたすべての変更を直接元に戻す**。 その結果、データが失われる可能性がある。 注意して続行してください。
   ```

<!-- ## Resolving Propagation Conflicts

In some cases, you may encounter conflicts when propagating Site Template changes. For example, if Pages in a template have conflicting friendly URLs, Liferay DXP stops the propagation and displays an error message.

![You may encounter propagation conflicts.](./propagating-template-changes/images/06.png)

After encountering a conflict, follow these steps to restore automatic propagation:

1. Manually resolve all conflicts identified in the error message.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Configuration*, and go to *Site Settings*.

1. Click the *Reset and Propagate* button to reset the merge fail count and attempts to propagate your site's changes again. -->

## 関連トピック

* [サイトテンプレート](../site-templates.md)
* [サイトテンプレートプロパゲーションの設定](./configuring-site-template-propagation.md)
