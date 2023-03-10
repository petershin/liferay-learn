# 테스트 케이스

Poshi의 테스트 케이스 파일은 테스트 블록이라는 코드 블록으로 그룹화된 테스트 시나리오 모음입니다. 세 가지 주요 테스트 블록인 `setUp`, `test`및 `tearDown`는 테스트 시나리오를 구성하는 다양한 사용자 및 시스템 상호 작용을 설명하는 여러 매크로로 구성됩니다.

## setUp 및 tearDown 블록

`*.testcase` 파일의 `setUp` 및 `tearDown` 블록은 각각 `테스트`전후에 실행됩니다. 필수는 아니지만 `setUp` 블록은 각 `테스트`의 시작과 끝에 보편적인 매크로를 재사용하는 효율적인 방법입니다. 다음은 각 테스트 전에 사용자가 로그인하는 `setUp` 블록과 다음 테스트를 준비하기 위해 모든 블로그 항목을 삭제하는 Blogs 매크로를 가리키는 `tearDown` 블록의 예입니다.

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

## 테스트 블록

`테스트` 블록에는 테스트할 시나리오를 구성하는 매크로가 포함되어 있습니다. 테스트 블록 내에서 작업 블록을 추가로 사용하여 테스트가 수행하는 작업을 더 쉽게 읽을 수 있도록 매크로를 그룹화할 수 있습니다. 위의 예에서 매크로는 주어진 조건을 사용하여 테스트를 섹션으로 나누는 BDD(행동 주도 개발)에 따라 그룹화됩니다. 작업 블록은 BDD로 제한되지 않으며 매크로를 그룹화하려는 경우에도 사용할 수 있습니다.

## 모범 사례

**테스트 이름을 간결하고 구체적이며 설명적으로 만드십시오.** : 모호한 테스트 이름은 테스트가 수행해야 하는 작업을 파악하기 어렵게 만듭니다. 예: 테스트 이름을 `BlogEntry` 로 지정하면 독자나 분석가가 테스트 중인 기능을 이해하는 데 도움이 되지 않습니다.

**의도 전달:** 가능할 때마다 "할 수 있다" 또는 "할 수 없다"와 같은 단어를 사용하여 테스트가 수행해야 하는 것을 쉽게 전달할 수 있습니다. 테스트 이름은 `AddABlogEntryWithNoTitle`입니다. 구체적이고 설명적이지만 예상되는 동작이 제목 없이 블로그 항목을 추가할 수 있는지 여부는 명확하지 않습니다.

**테스트 블록당 하나의 시나리오를 고수하십시오.** : 테스트 블록당 여러 시나리오를 테스트하면 테스트 의도가 흐려지고 테스트 런타임이 불필요하게 확장되며 나중에 실패를 분석하기가 어렵습니다.
