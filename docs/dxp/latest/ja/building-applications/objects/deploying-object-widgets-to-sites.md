# オブジェクトウィジェットのサイトへのデプロイ

> 利用可能：Liferay DXP 7.4 U1/Liferay Portal 7.4 GA5

オブジェクトが公開されると、Liferayはサイトページにデプロイできる専用のウィジェットを自動的に生成します。 これには、サイトに範囲設定されたオブジェクトと会社に範囲設定されたオブジェクトの両方が含まれるため、サイトメニュー(![Site Menu](../../images/icon-menu.png)) とグローバルメニュー (![Global Menu](../../images/icon-applications-menu.png)) 以外のオブジェクトにもアクセスを許可することが可能です。

```{note}
オブジェクトの範囲に従って、ウィジェットのデータが保存、表示されます。
```

## オブジェクトウィジェットの表示・非表示

1. **グローバルメニュー**（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的の **オブジェクト** を選択します。

1. ［詳細］タブで、 ［**Show/Hide Widget**］ スイッチを切り替えます。

   ![［Show/Hide Widget］スイッチの切り替えを行います。](./deploying-object-widgets-to-sites/images/01.png)

1. ［**Save**］ をクリックします。

スイッチを ［**Show Widget**］ に切り替えてオブジェクトを公開すると、すぐに[サイトページにウィジェットを追加](#adding-the-widget-to-pages)できるようになります。

ただし、スイッチを ［**ウィジェットを非表示**］ に切り替えると、ウィジェットメニューに非表示となり、ページに追加することができなくなります。

```{note}
オブジェクトのウィジェットを非表示にしても、すでにデプロイされているサイトページからは削除されません。 ウィジェットを非表示にすると、ユーザーは新しいページにウィジェットを追加できなくなるだけです。
```

## ページへのウィジェットの追加

公開されたオブジェクトに対して ［**Show Widget**］ を有効にすると、そのウィジェットはウィジェットメニューの **オブジェクト** の下に表示されます。

他のページウィジェットのように、サイトページにウィジェットを追加することができます。

![サイトページへのオブジェクトウィジェットの追加します。](./deploying-object-widgets-to-sites/images/02.png)

また、ウィジェットの **オプション** ボタン (![Options Button](../../images/icon-actions.png)) をクリックすると、追加の機能や設定オプションにアクセスすることができます。

![オプションボタンをクリックすると、その他の機能や設定オプションにアクセスできます。](./deploying-object-widgets-to-sites/images/03.png)

利用可能なオプションは、ウィジェットが[コンテンツページ](../../site-building/creating-pages/using-content-pages/using-widgets-on-a-content-page.md)または[ウィジェットページ](../../site-building/creating-pages/using_widget_pages.html)にデプロイされるかどうかに依存します。

## 追加情報

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [オブジェクトエントリの表示](./displaying-object-entries.md)
