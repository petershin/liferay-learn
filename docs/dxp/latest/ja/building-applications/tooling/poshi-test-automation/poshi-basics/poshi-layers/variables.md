# 変数の使用

Poshiレイヤーではありませんが、Poshiのテストでは変数が大きな役割を果たします。 変数は、他のプログラミング言語と同様に、テスト、マクロ、パスで参照・再利用可能なデータを格納するために使用されます。 パスやマクロファイルに変数を使用することで、特定と再利用の両方を可能にします。

例として、以下のテストでは、ブログのエントリに抽象的な説明を追加できることを示しています。 変数 `entryAbstractDescription` は、`This is the Blog Entry Abstract Description.`として、テストケースレベルで設定されています。

```
test CanAddAbstractDescriptionToABlogEntry {

  var entryAbstractDescription = 'This is the Blog Entry Abstract Description.';

  task ("Given a blog page") {
    Navigator.gotoPage(pageName = "Blogs Page");

    BlogsNavigator.gotoAddEntry();
  }

  task ("When I add a blog entry with a custom Abstract Description") {}
    BlogsEntry.addEntryContent(
        entryContent = "${entryContent}",
        entrySubtitle = "${entrySubtitle}",
        entryTitle = "${entryTitle}");

    Panel.expandPanel(panel = "Configuration");

    BlogsEntry.addCustomAbstract(entryAbstractDescription = "${entryAbstractDescription}");

    PortletEntry.publish();
  }

  task ("and when I view the page") {
    Navigator.gotoPage(pageName = "Blogs Page");
  }

  task ("Then the Abstract Description should be displayed") {
    Blogs.viewContentAbstractDescription(entryAbstractDescription = "${entryAbstractDescription}");
  }
}
```

そして、この変数は `Blogs.viewContentAbstractDescription` マクロに渡されます。

```
macro viewContentAbstractDescription {
    var key_entryAbstractDescription = "${entryAbstractDescription}";

    AssertTextEquals.assertPartialText(
        locator1 = "BlogsEntry#CONTENT_ABSTRACT_DESC",
        value1 = "${key_entryAbstractDescription}");
}
```

同じ変数が `BlogsEntry#CONTENT_ABSTRACT_DESC` パスに渡されます。

```
</tr>
<tr>
    <td>CONTENT_ABSTRACT_DESC</td>
    <td>//div[contains(@class,'asset-content')]//div[contains(.,'${key_entryAbstractDescription}')]</td>
    <td></td>
</tr>
```
