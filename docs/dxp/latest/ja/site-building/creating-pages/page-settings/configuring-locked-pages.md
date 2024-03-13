# ロックされたページの設定

{bdg-secondary}`Liferay DXP 2023.Q3+/Portal 7.4 GA92+`

<!-- The feature flag had been removed, but the commit was reverted: https://github.com/liferay/liferay-portal/commit/6313e4d18f4610d6c45009b33932d666113adfd7 - Eric -->

!!! important
    この機能は現在リリース機能フラグの後ろにある。 詳しくは [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) をお読みください。

Liferayは、複数のユーザーが同じページを編集しようとしたときの衝突を避けるために、編集中のページをロックします。

この機能は、 [コンテンツ](../using-content-pages.md) 、 [マスター](../defining-headers-and-footers/master-page-templates.md) 、 [ユーティリティ](../adding-pages/using-utility-pages.md) 、 [コレクションページ](../../../content-authoring-and-management/collections-and-collection-pages.md) 、 [ページ](../adding-pages/creating-a-page-template.md) 、 [表示ページ](../../displaying-content/using-display-page-templates.md) テンプレートで動作します。

## ページのロック

ユーザーがページの編集を開始し、新しいコンテンツを追加すると、ページがロックされ、他のユーザーがアクセスできなくなります。

ユーザーがロックされたページにアクセスしようとすると、代わりに「使用中のページ」というメッセージが表示されます。 このページには、前のページが存在するかどうかによって、[Go Back]または[Go To][前のページ名]が表示されます。

!!! note
    ユーザーが破棄できるのは、ロックされていないページの下書きのみです。

![Trying to access locked pages redirects the user to a generic error page](./configuring-locked-pages/images/01.png)

すべてのイベントがページをロックするわけではありません：

- ページをロックしなくても、 [マスターページ](../defining-headers-and-footers/managing-master-page-templates.md) や [スタイルブック](../../site-appearance/style-books.md) を変更することができます。
- ページがロックされていても、 [Fragments](../page-fragments-and-widgets/using-fragments.md) を伝播することができます。
- [、ページがロックされていても、ページのページテンプレート](../adding-pages/exporting-and-importing-page-templates.md) をインポートすることができます。

!!! tip 
    [パブリケーション](../../publishing-tools/publications.md) で作業している場合、ページとそのパブリケーションは一緒にロックされ、ロック解除されます。

## ページのロック解除

ほとんどの場合、システムが自動的にロックを解除するので、ページのロック解除を心配する必要はない。

例えば、ユーザがページを編集モードから表示モードに変更した時、ユーザがログアウトした時、ユーザがページのあるタブを閉じた時、Liferayはページのロックを解除します。

編集モードで開いているページを変更せずに長時間放置すると、自動的にロックが解除されます。 時間は設定できる：

1. ![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、[設定]の下にある[コントロールパネル] &rarr; [インスタンス設定]に移動します。

1. コンテンツとデータ]で、[ページ]を選択します。

1. Virtual Instance Scopeで、 **Locked Pages** を選択します。

1. 自動ロック解除プロセスを許可する*を切り替えます。

   この機能を無効にしたい場合は、機能をオフにしてください。

1. **オートセーブしない時間** を分単位で設定します。

```{warning}
システムは15分ごとにロックされたページをチェックするため、自動保存なしの時間は正確ではないかもしれません。
```

![Set the automatic unlocking time in Instance Settings](./configuring-locked-pages/images/02.png)

サイト管理者またはスーパー管理者は、手動でページのロックを解除できます。

1. ![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **設定** &rarr; **ロックされたページ** に移動します。

1. ロック解除したいページの横にある **Actions**(![Actionsボタン](../../../images/icon-actions.png))をクリックし、 &rarr; **Unlock** 。

   ロック(![ロックアイコン](../../../images/icon-lock.png))アイコンまたはその横のActionsボタン &rarr; Unlockをクリックすることで、複数のページを選択し、一括でロックを解除することができます。

ページのロックが解除される。 自動保存された変更はすべて保持され、ページを編集できるようになります。

```{tip}
このリストでは、ページのタイプ、現在ページを編集しているユーザー、最後の自動保存からの時間も見ることができます。
```

![If you are a Site Administrator or a Super Administrator, you can unlock any page manually](./configuring-locked-pages/images/03.png)

## 関連トピック

[コンテンツ・ページへの要素の追加](../using-content-pages/adding-elements-to-content-pages.md)

[ウィジェットをページに追加する](../using-widget-pages/adding-widgets-to-a-page.md)
