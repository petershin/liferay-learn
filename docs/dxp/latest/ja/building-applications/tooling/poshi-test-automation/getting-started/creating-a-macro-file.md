# マクロファイルの作成

## テストシナリオ

以下のテストシナリオを使用して、最初のマクロファイルを作成します。

  learn.liferay.comの記事に自分の名前が表示されないことをテストします。 下記の手順で行います。 別のブラウザで手動で操作して手順を確認してください。

  1. [Liferay Learn サイト](http://learn.liferay.com) に移動します。

  1. 検索入力フィールドをクリックします。

  1. 検索キーワードに自分の名前を入力してください。

  1. Enterキーを押して、検索キーワードを入力します。

  1. 検索結果がないことをアサートします。 自分の名前で検索して結果が出る場合は、他の名前を選択してください。

  1. 利用できる記事がないというメッセージが表示されることをアサートします。

## マクロファイルの構築

1. `poshi-standalone/poshi-tests/macros` ディレクトリに空のファイルを作成し、 `LiferayLearnSearch.macro`という名前を付けます。

1. マクロファイルは、定義ブロックで始まります。 これを `LiferayLearnSearch.macro` ファイルに追加してください。

    ```
    definition {

    }
    ```

1. .macroファイルの定義ブロックの中で、マクロブロックを使って個々のマクロを定義します。 そのためには、マクロキーワードの後に、文字列の識別子名を使用します。 これらのマクロ名はユニークであり、意図された連携を説明するものでなければなりません。 詳細は [マクロ](../poshi-basics/poshi-layers/macros.md) を参照してください。 このシナリオでは、用語を検索するマクロは、単純に `searchForTerm`と呼ぶことができます。

1.  テストシナリオのステップ2からステップ4は、合わせて1つの検索連携を構成するアクションです。 これらの3つのステップは、 `searchForTerm` マクロブロックの中に含まれます。 これらのアクションは、 [パスファイルの作成](./creating-a-path-file.md) の記事で作成したロケーターと [関数](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-runner-resources/src/main/resources/default/testFunctional/functions) を使用してスクリプト化できます。 関数の使い方の詳細は、 [関数](../poshi-basics/poshi-layers/functions.md)をご覧ください。

    このマクロは以下の結果となります。

    ```
    macro searchForTerm {
        Default.Click(
            locator1 = "LiferayLearn#SEARCH_BAR");

        Default.Type(
            locator1 = "LiferayLearn#SEARCH_BAR",
            value1 = "${searchTerm}");

        Default.KeyPress(
            locator1 = "LiferayLearn#SEARCH_BAR",
            value1 = "\ENTER");
    }
    ```

1. `searchForTerm` マクロとは別に、テストシナリオでは結果をアサートするための2つ目のマクロを要求しています。 ステップ5と6は別々のアサーションですが、一緒になって検索結果がないことをアサーションするという一つのユーザー連携を形成します。 このマクロは、 `assertNoResults`という名前にすることができます。

    ```
    macro assertNoResults {
        Default.AssertElementNotPresent(locator1 = "LiferayLearn#SEARCH_RESULTS",
            value1 = "${searchTerm}");

        Default.AssertElementPresent.assertVisible(locator1 = "LiferayLearn#NO_RESULTS_MESSAGE");
    }
    ```

1. マクロファイルは、次のような結果となります。

    ```
    definition {

        macro assertNoResults {
            Default.AssertElementNotPresent(locator1 = "LiferayLearn#SEARCH_RESULTS",
                value1 = "${searchTerm}");

            Default.AssertElementPresent.assertVisible(locator1 = "LiferayLearn#NO_RESULTS_MESSAGE");

        }

        macro searchForTerm {
            Default.Click(
                locator1 = "LiferayLearn#SEARCH_BAR");

            Default.Type(
                locator1 = "LiferayLearn#SEARCH_BAR",
                value1 = "${searchTerm}");

            Default.KeyPress(
                locator1 = "LiferayLearn#SEARCH_BAR",
                value1 = "\ENTER");
        }
    }
    ```
