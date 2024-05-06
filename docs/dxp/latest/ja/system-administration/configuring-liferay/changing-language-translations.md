# 翻訳ファイルの変更

> 利用可能：Liferay DXP 7.4 U4/Liferay Portal 7.4 GA8

```{note}
Liferay DXP 7.4 U17 / Liferay Portal 7.4 GA17のインポート／エクスポートおよびフィルタリング機能
```

Language Override toolを使って、既存の翻訳ファイルをオーバーライドするか新しい言語キーと翻訳ファイルを追加します。 これらのオーバーライドは、 [Configuration Scope](./understanding-configuration-scope.md)のインスタンスレベルで行われることに注意してください。 Liferayの以前のバージョンについては、 [標準言語ファイルの上書き](../../liferay-internals/extending-liferay/overriding-global-language-translations-with-language-properties.md)をご覧ください。

## 翻訳ファイルのオーバーライド

1. グローバルメニュー（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**Language Override**］ へ行きます。

1. 検索バーを使って、上書きしたい翻訳ファイルを探します。 例えば、プロダクトメニューの一番上にある `home` をオーバーライドしたい場合は、 `home`を検索してください 。

    ![Language Override UIでhomeという言葉を検索してください。](./changing-translations-with-language-override/images/01.png)

   なお、検索バーでは、選択したロケールの翻訳ファイルの言語キーを検索します。 ロケールセレクターで言語を切り替えることができます。 例えば、 `en-US` を選択すると、米国英語の翻訳ファイルを検索することができます。

1. 翻訳ファイルを探し出し、クリックします。 新しいウィンドウが開きます。 また、translationの右側にある ［**アクション**］(![Actions icon](../../images/icon-actions.png)) &rarr; ［**編集**］ をクリックすることもできます。

1. オーバーライドしたい言語ごとに翻訳ファイルを新たに入力します。 ページの下部にある [**保存**] をクリックします。

   ![オーバーライドしたい言語ごとに翻訳ファイルを新たに入力します。](./changing-translations-with-language-override/images/02.png)

1. `home` の翻訳ファイルがオーバーライドされました。

   ![home の翻訳ファイルがオーバーライドされました。](./changing-translations-with-language-override/images/03.png)

## 翻訳ファイルのオーバーライドを修正する

1. グローバルメニュー（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**Language Override**］ へ行きます。

1. 検索バーを使って、修正したいオーバーライドを探します。 オーバーライドがある翻訳だけを検索する場合は、 ［**Filter and Order**］ をクリックし、 ［**Any Language**］ を選択してください。 また、 ［**Selected Language**］ をクリックすると、選択したロケール内のオーバーライドのみを表示することができます。

   各言語キーの下に、既存のオーバーライドが表示されていることに注意してください。 例えば、"Languages With Override: en **US, ja** JP "のように。

1. 修正したい翻訳ファイルを選択します。 新しいウィンドウが開きます。 また、translationの右側にある ［**アクション**］(![Actions icon](../../images/icon-actions.png)) &rarr; ［**編集**］ をクリックすることもできます。

   オーバーライドが存在する場合、 **アクション** アイコン(![Actions icon](../../images/icon-actions.png)) には、翻訳ファイルオーバーライドを削除するオプションも用意されています。 ［**Remove all translation overrides**］ をクリックし、ポップアップウィンドウの ［**OK**］ をクリックすると、すべてのオーバーライドが削除されます。 選択したロケールにオーバーライドが存在する場合、そのロケールの翻訳だけを削除する追加オプションがあります（例：アメリカ英語が選択されている場合は、 ［**Remove translation override for en_US**］）。

   ![アクションアイコンには、翻訳オーバーライドを削除するオプションがあります。](./changing-translations-with-language-override/images/04.png)

1. 変更内容を入力し、ページ下部の ［**保存**］ をクリックします。 すべてのオーバーライドを削除して元の翻訳ファイルに戻したい場合は、 ［**オーバーライドをすべて消去**］ をクリックします。

## 言語キーと翻訳ファイルを追加する

1. グローバルメニュー（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**Language Override**］ へ行きます。

1. ［**追加**］（![Add button](../../images/icon-add.png)）をクリックすると、新しいウィンドウを開きます。

1. キーと少なくとも1つの言語ファイルを入力します。 なお、キーの最大長は1,000文字です。 完了したら、 ［**保存**］ をクリックします。

## 翻訳ファイルのエクスポートとインポート

言語のオーバーライドは、言語プロパティファイルで簡単にインポートまたはエクスポートすることができます。

### 翻訳ファイルのインポート

1. インポートするには、グローバルメニューアイコンの左側にある **アクション**(![Actions icon](../../images/icon-actions.png)) をクリックします。

1. ［**Import Translations**］ を選択すると、新しいウィンドウが表示されます。

   ![［翻訳のインポート］を選択すると、新しいウィンドウが表示されます。](./changing-translations-with-language-override/images/05.png)

1. ドロップダウンメニューで言語を選択します。

1. ［**Choose File**］ をクリックし、オーバーライドを含む `Language.properties` ファイルを選択します。 オーバーライドしたい言語ごとにファイルを用意する必要があります。 各言語には、その言語のキーを含む [言語プロパティファイル](https://github.com/liferay/liferay-portal/tree/master/modules/apps/portal-language/portal-language-lang/src/main/resources/content) があります。

1. ［**Save**］ をクリックすると、オーバーライドが保存されます。

### 翻訳ファイルのエクスポート

1. エクスポートするには、グローバルメニューアイコンの左側にある **アクション**(![Actions icon](../../images/icon-actions.png)) をクリックします。

1. ［**エクスポート**］ を選択すると、オーバーライドを含む各言語の `Language.properties` ファイルを含むZIPファイルのダウンロードが開始されます。