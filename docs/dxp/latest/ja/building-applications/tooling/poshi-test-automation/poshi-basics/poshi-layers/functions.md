# 関数

Poshiでは、関数はページオブジェクトや要素と連携するために要素が必要とする可能性のある追加のWebDriverコマンドを処理します。 関数は、`BaseWebDriverImpl`レイヤーで定義された基本メソッドを組み合わせて、テストケース用の再利用可能な関数を作成します。Javaの経験は必要ありません。

例えば、あるページで編集ボタンをクリックするテストがあるとします。 表面的には、必要なメソッドは `selenium.click()`だけであるように見えます。 テストの信頼性を高めるために、ページの読み込み待ちとコンソールログエラーのアサーションを含めることが推奨されます。 手順は次の通りになります。

1. ページが読み込まれるのを待ちます。

1. ボタンが表示されるのを待ちます。

1. ボタンをクリックします

1. コンソールログにエラーがないことを確認します。

これらの4つの異なるステップをスクリプトで記述するのではなく、BaseWebDriverImplレイヤーから組み合わせて、 **クリック** 関数という1つの実用的なメソッドを作成します。

```
Click.function
@default = "click"
@summary = "Click on '${locator1}'"
...
function click {
        WaitForSPARefresh();

        selenium.waitForVisible();

        selenium.mouseOver();

        selenium.click();

        selenium.assertJavaScriptErrors();

        selenium.assertLiferayErrors();
}
```

そして、この `クリック`関数をテスト内でxpathロケーターとともに呼び出すだけで、どの要素またはページオブジェクトをクリックすればよいかがわかるようになります。 このロケーターは暗黙のうちに文字列としてjavaレイヤーに渡されます。 その使い方は以下の通りです。
```
Click(locator1 = "//button[contains(.,'Edit')]");
```

Poshi単体では、機能をすぐに利用できます。 利用可能な関数は、 [Liferay Portalのソースにある関数ディレクトリ](https://github.com/liferay/liferay-portal/tree/master/portal-web/test/functional/com/liferay/portalweb/functions) で見つけることができます。
