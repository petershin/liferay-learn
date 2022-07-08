# テストケース

Poshiのテストケースファイルは、テストブロックと呼ばれるコードのブロックにグループ化されたテストシナリオの集合体です。 `setUp`、`test`、`tearDown`の3つの主要テストブロックは、テストシナリオを構成するさまざまなユーザーおよびシステム連携を記述する複数のマクロで構成されています。

## setUpとtearDownブロック

`*.testcase`ファイルの`setUp`と`tearDown`ブロックは、各`テスト`の前後にそれぞれ実行されます。 必須ではありませんが、 `setUp`ブロックは、各`テスト`の開始と終了に普遍的なマクロを再利用する効率的な方法です。 以下は、各テストの前にユーザーがログインする `setUp`ブロックと、次のテストに備えるためにすべてのブログエントリーを削除するブログマクロを指す `tearDown`の例です。

```
definition {

  setUp {

    task ("Setup: Login") {
      User.firstLoginPG();
    }  
  }

  tearDown {

    BlogsEntry.tearDownCP();
  }

  test CanAddEntryInAdmin{

    task ("Given a site wherein I have System Admin privileges to Blogs Admin") {
      BlogsNavigator.openBlogsAdmin(siteURLKey = "guest");
    }

    task ("When I add a Blogs entry") {
      Blogs.addEntry(
        entryContent = "Blogs Entry Content",
        entryTitle = "Blogs Entry Title");
    }

    task ("And when I navigate to the entry") {
      BlogsNavigator.openBlogsAdmin(siteURLKey = "guest");

      BlogsNavigator.gotoEntryCP(entryTitle = "Blogs Entry Title");
    }

    task ("Then the entry should be viewable") {
      BlogsEntry.viewEntryCP(
        entryContent = "Blogs Entry Content",
        entryTitle = "Blogs Entry Title");
    }
  }
}
```

## テストブロック

`test`ブロックは、テストするシナリオを構築するマクロを含んでいます。 テストブロックの中で、さらにタスクブロックを使ってマクロをグループ化することで、テストが何を行っているかを読みやすくすることができます。 上の例では、Given-When-Thenを使ってテストをセクションに分解するBDD（ビヘイビア駆動開発）に従ってマクロがグループ化されています。 なお、タスクブロックはBDDに限定されず、マクロのグループ化にいかようにも使用できることに注意してください。

## ベストプラクティス

**テスト名を簡潔、具体的、かつ説明的にする**：テスト名が曖昧だと、何をするためのテストなのかが分かりにくくなります。 例えば、テストに `BlogEntry` という名前を付けても、読者やアナリストがどの機能をテストしているのかを理解する助けにはなりません。

**意図を伝える**：「 できる」「できない」などの言葉を可能な限り使い、テストが何を行うべきかを簡単に伝えます。 テスト名を`AddABlogEntryWithNoTitle`とします。 具体的かつ説明的ですが、予想される動作が、ブログエントリーをタイトルなしで追加できるかどうかが明確ではありません。

**テストブロックごとに1つのシナリオに固執する**：テストブロックごとに複数のシナリオをテストすると、テストの意図が不明瞭になり、テストの実行時間が不必要に長くなり、後で失敗を分析することが難しくなります。
