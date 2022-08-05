# テンプレートの変更を伝える

サイトテンプレートの伝搬を有効にすると、テンプレートのページに変更を加え、その変更を接続されているサイトに自動的に伝搬させることができます。 ただし、テンプレートから継承したサイトページを変更すると、テンプレートの変更がそのページに反映されなくなります。 ページの伝搬を復元するには、本サイトで行われたページの変更を破棄する必要があります。 複数の継承ページを編集し、サイトテンプレートからの伝播を復元したい場合は、それぞれ個別に変更をリセットする必要があります。

```{note}
デフォルトでは、接続された各サイトに対して、変更後にユーザーが最初にアクセスしたときに、個別に伝搬が開始されます。 ただし、ユーザーがテンプレートを*Ready for Propagation*に切り替えるたびに、接続されているサイトにも同時に伝搬させるようにシステムを設定することは可能です。 詳しくは、[サイトテンプレート伝搬の設定](./configuring-site-template-propagation.md)をご覧ください。
```

## テンプレートの変更はどのように伝搬されるのですか？

テンプレートのページとページ要素への変更のみが、接続されているサイトに伝搬されます。 これには、新しく作成されたページだけでなく、既存のページのフラグメントやウィジェットを変更する場合も含まれます。 その他のアプリケーションデータは、最初のサイト作成時にのみコピーされ、その後の変更は自動的に反映されません。

このため、サイトテンプレートは、主に複数のサイトにまたがるページを管理するためのものです。 サイト間でWebコンテンツやその他のアセットを作成・管理する必要がある場合は、 [Asset Libraries](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md)を使用します。

## プロパゲーションの有効化・無効化

[テンプレート作成時](./creating-site-templates.md)自動伝播を有効にするか無効にするかを決定しますが、この設定はいつでも変更することができます。

![テンプレート作成時の自動伝搬の有効・無効を設定します。](./propagating-template-changes/images/01.png)

テンプレート作成後のプロパゲーションを有効または無効にするには、以下の手順に従います。

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 *コントロールパネル* タブを開き、 *サイトテンプレート*をクリックします。

1. 希望する *テンプレートを選択します*。

1. *伝達* ボタン (![Propagation Button](../../../images/icon-merge.png)) をクリックします。

   伝搬が有効な場合、 *Disable Propagation* をクリックして、テンプレートの変更が接続されているサイトページに自動的に伝搬されないようにします。

   ![Propagationが有効な場合は、Disable Propagationをクリックします。](./propagating-template-changes/images/02.png)

   伝搬が無効になっている場合は、 *Ready for Propagation* をクリックして、自動伝搬を有効にします。

   ![Propagationが無効になっている場合は、Ready for Propagationをクリックします。](./propagating-template-changes/images/03.png)

また、「サイトテンプレート」アプリケーションページで、自動伝搬を有効または無効にすることもできます。 希望するテンプレートの *Actions* ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 *Disable Propagation* または *Ready for Propagation*を選択するだけです。

![目的のサイトテンプレートの「Actions」ボタンをクリックし、「Disable Propagation」または「Ready for Propagation」を選択します。](./propagating-template-changes/images/04.png)

## 継承されたページをテンプレートに再接続する

テンプレートから継承したサイトページを変更した場合、テンプレートのページとは切り離され、自動的に伝搬されません。 サイトページをテンプレートに再接続するには、サイトページへの変更を破棄する必要があります。

サイトページの変更を破棄し、そのテンプレートと再同期するには、以下の手順に従います。

1. サイトページに移動します。

1. アプリケーションバーの情報アイコン(![Information](../../../images/icon-control-menu-information.png))をクリックします。

   ![情報アイコンをクリックし、「変更をリセット」を選択します。](./propagating-template-changes/images/05.png)

1. *Reset Changes*をクリックします。

   ```{warning}
   変更のリセット **サイトページで行われた変更を直接元に戻す**。 その結果、データが失われる可能性があります。 注意して続行してください。
   ```


<!-- ## Resolving Propagation Conflicts

In some cases, you may encounter conflicts when propagating Site Template changes. For example, if Pages in a template have conflicting friendly URLs, Liferay DXP stops the propagation and displays an error message.

![You may encounter propagation conflicts.](./propagating-template-changes/images/06.png)

After encountering a conflict, follow these steps to restore automatic propagation:

1. Manually resolve all conflicts identified in the error message.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Configuration*, and go to *Site Settings*.

1. Click the *Reset and Propagate* button to reset the merge fail count and attempts to propagate your site's changes again. -->

## 追加情報

* [サイトテンプレート](../site-templates.md)
* [サイトテンプレートプロパゲーションの設定](./configuring-site-template-propagation.md)
