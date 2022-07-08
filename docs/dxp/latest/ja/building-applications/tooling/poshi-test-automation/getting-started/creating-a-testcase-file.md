# テストケースファイルの作成

## テストシナリオ

以下のテストシナリオを使用して、最初のテストケースファイルを作成します。

  learn.liferay.comの記事に自分の名前が表示されないことをテストします。 下記の手順で行います。 別のブラウザで手動で操作して手順を確認してください。

  1. [Liferay Learn サイト](http://learn.liferay.com)に移動します。

  1. 検索入力フィールドをクリックします。

  1. 検索キーワードに自分の名前を入力してください。

  1. Enterキーを押して、検索キーワードを入力します。

  1. 検索結果がないことをアサートします。 自分の名前で検索して結果が出る場合は、他の名前を選択してください。

  1. 利用できる記事がないというメッセージが表示されることをアサートします。

## テストケースファイルの構築

1. `poshi-standalone/poshi-tests/testcase` ディレクトリに空のファイルを作成し、 `LiferayLearnSearch.testcase`という名前を付けます。

1. マクロファイルは、定義ブロックで始まります。 これを `LiferayLearnSearch.testcase` ファイルに追加してください。

    ```
    definition {

    }
    ```

1. 定義ブロックの中に、setUpブロックを作成します。 テストはLiferay Learnサイトに移動することから始まるので、setupブロックには次のような関数を含めることができます。

    ```
    setUp {
        task("Setup: Navigate to the Liferay Learn website.") {
          Default.Open(locator1 = "http://learn.liferay.com");
        }
    }
    ```

1. 説明とテスト名を追加して、テストブロックを開始します。 簡潔、具体的、かつ説明的な方法でテスト名を付けます。 与えられたテストシナリオに対して、 `CannotSearchForMyName`を使用します。

    ```
    @description = "There should be no search results when I search for my name."
    test CannotSearchForMyName {

    }
    ```

1. テストブロック内に、 `LiferayLearnSearch.macro` ファイルにあるマクロをテストシナリオで説明した順序で追加します。 変数の検索語句を渡すことを忘れないでください。 変数について詳しくは、 [変数の使用](../poshi-basics/poshi-layers/variables.md)を参照してください。 出来上がったテストは次のようになるはずです。

    ```
    definition {

      setUp {
        task("Setup: Navigate to the Liferay Learn website.") {
          Default.Open(locator1 = "http://learn.liferay.com");
        }
      }

      @description = "There should be no search results when I search for my name."
      test CannotSearchForMyName {
        task("When I search for my name") {
          LiferayLearnSearch.searchForTerm(searchTerm = "yourNameHere");
        }

        task("Then I should see the No Results message.") {
          LiferayLearnSearch.assertNoResults(searchTerm = "yourNameHere");
        }

      }
    }
    ```
