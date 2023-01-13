# 변수 사용

Poshi 레이어는 아니지만 변수는 Poshi 테스트의 큰 부분을 차지합니다. 다른 프로그래밍 언어와 마찬가지로 변수는 테스트, 매크로 및 경로에서 참조하고 재사용할 수 있는 데이터를 저장하는 데 사용됩니다. 경로 및 매크로 파일에서 변수를 사용하면 변수를 구체적이고 재사용할 수 있습니다.

예를 들어, 아래 테스트는 블로그 항목에 추상 설명을 추가할 수 있다고 주장합니다. 변수 `entryAbstractDescription` 은 테스트 케이스 수준에서 `로 설정됩니다. 이것은 블로그 항목 요약 설명입니다.`:

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

그런 다음 변수는 `Blogs.viewContentAbstractDescription` 매크로에 전달됩니다.

```
macro viewContentAbstractDescription {
    var key_entryAbstractDescription = "${entryAbstractDescription}";

    AssertTextEquals.assertPartialText(
        locator1 = "BlogsEntry#CONTENT_ABSTRACT_DESC",
        value1 = "${key_entryAbstractDescription}");
}
```

동일한 변수가 `BlogsEntry#CONTENT_ABSTRACT_DESC` 경로에 전달됩니다.

```
</tr>
<tr>
    <td>CONTENT_ABSTRACT_DESC</td>
    <td>//div[contains(@class,'asset-content')]//div[contains(.,'${key_entryAbstractDescription}')]</td>
    <td></td>
</tr>
```
