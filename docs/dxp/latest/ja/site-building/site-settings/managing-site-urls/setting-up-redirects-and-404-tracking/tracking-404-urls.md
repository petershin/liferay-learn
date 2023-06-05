# 404URLのトラッキング

Redirectionアプリケーションでは、404エラーにつながるサイトリクエストを表示・管理することができます。 有効になっている間、Liferayは各エラーをカタログ化するので、エラーの原因を評価し、問題を迅速に解決することができます。 これらのURLは、リダイレクトの設定に従って、データベースに保存されます。

![404 URLを表示および管理できます。](./tracking-404-urls/images/01.png)

```{important}
Liferay 7.4+では、404トラッキングはデフォルトで無効になっています。 この機能を利用するには、まず [404トラッキングを有効にする](#enabling-404-tracking) 必要があります。 これにより、404トラッキングとRedirectionアプリケーションの404 URLタブの両方が有効になります。
```

## 404 URLの表示

カタログ化されたリクエストは、 **タイプ** と **日付** の両方でフィルタリングできます。 タイプでフィルタリングするときは、表示する404 URLを ［**Active URLs**］（ 、 ［**Ignored URLs**］ 、または ［**All**］ から選択できます。 日付によるフィルタリングでは、すべてのURLを表示するか、あるいは過去1日、1週間、1ヶ月以内にリクエストされたURLのみを表示するかを決めることができます。 また、カタログ化されたリクエストを、 **更新日** や **リクエスト数** で順序付けすることもできます。

デフォルトでは、このページにはすべての有効なURLが番号順に表示されます。

![カタログ化された404 URLをフィルタリングして順序付けできます。](./tracking-404-urls/images/02.png)

## 404URLを無視する/しない

**Actions** ボタン (![Actions button](../../../../images/icon-actions.png)) をクリックし、 **Ignore** / **Unignore** を選択して、URL をアクティブまたは無視するように定義します。 無視すると、URLはデフォルトの［有効］ビューで非表示になりますが、ステータスはいつでも変更できます。

![URLが有効か無視されているかを判別できます。](./tracking-404-urls/images/03.png)

## 404 URLのリダイレクトの作成

404 URL のエイリアスリダイレクトを作成するには、その **Actions** ボタン (![Actions button](../../../../images/icon-actions.png)) をクリックし、 **Create Redirect** を選択してください。 これは、選択された404のソースURLがあらかじめ入力されたフォームを表示します。 記入を終え、 **Create** をクリックし、新しいリダイレクトを保存してください。

![404 URLのリダイレクトを作成します。](./tracking-404-urls/images/04.png)

## 404設定の構成

404URLをリクエスト間で保持する期間、データベースに保存する404URLの最大数、404URLチェックの間隔を設定することができます。

1. **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **Control Panel** タブをクリックし、 **System Settings** &rarr; **Pages** &rarr; **Redirection** under Virtual Instance Scope に移動します。

デフォルトでは、404URLの最大年齢は30日に設定され、404URLの最大数は1000エントリに設定され、システムは24時間ごとに404URLをチェックするようになっています。

![保持する404 URLの期間と数を決定します](./tracking-404-urls/images/05.png)

## 404トラッキングの有効化

{bdg-secondary}`7.4以降で利用可能`

1. **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブをクリックし、 **システム設定** &rarr; **ページ** &rarr; **リダイレクト** と進みます。

   ![有効]にチェックを入れ、 [保存]をクリックします。](./tracking-404-urls/images/06.png)

1. Check **Enabled** .

1. ［**Update**］ をクリックします。

有効にすると、Redirectionアプリケーションの404URL管理タブにアクセスできるようになります。

```{important}
アプリケーションを有効化または無効化しても、データベースに保存されているデータには影響しません。 無効にした場合は、いつでもデータにアクセスできるように機能を再有効化することができます。
```

## 関連トピック

* [サイトURLの管理](../../managing-site-urls.md)
* [エイリアスリダイレクトの使用](./using-alias-redirects.md)
* [パターンリダイレクトの利用](./using-pattern-redirects.md)
* [バーチャルホストのサイトURLの設定](../configuring-virtual-hosts-site-urls.md)
* [サイトのフレンドリURLを設定する](../configuring-your-sites-friendly-url.md)
