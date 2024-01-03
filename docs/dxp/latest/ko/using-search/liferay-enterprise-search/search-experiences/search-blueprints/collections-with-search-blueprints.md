# 검색 청사진이 포함된 컬렉션

{bdg-secondary}`7.4 U88+`
{bdg-link-primary}`[베타 기능](../../../../system-administration/configuring-liferay/feature-flags.md)`

검색 청사진을 생성하면 [컬렉션 공급자](../../../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) 자동으로 등록됩니다. 청사진의 쿼리 및 구성과 일치하는 자산이 컬렉션에 추가됩니다.

```{important}
Liferay의 [Asset Framework](../../../../building-applications/data-frameworks/asset-framework.md) 에 등록된 콘텐츠만 청사진 수집 공급자에 의해 반환됩니다.
```

![Search blueprints are registered as collection providers.](./collections-with-search-blueprints/images/01.png)

검색 청사진의 컬렉션 공급자를 사용하려면

1. LPS-129412에 대해 [베타 기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md) 활성화합니다.

   청사진의 컬렉션 공급자는 Liferay가 시작되거나 청사진이 게시될 때만 등록됩니다. 기능 플래그를 활성화할 때 기존 청사진이 있는 경우 각 청사진을 편집하고 저장하여 컬렉션 공급자를 등록해야 합니다.

1. [청사진을 만듭니다](./creating-and-managing-search-blueprints.md) .

1. 콘텐츠 페이지 편집기에서 컬렉션 표시 조각을 추가합니다.

   컬렉션 페이지를 추가할 때 컬렉션 공급자를 사용할 수도 있습니다.

1. 컬렉션 공급자 필드에서 청사진의 컬렉션 공급자를 선택합니다.

다른 컬렉션과 마찬가지로 [컬렉션 필터](../../../../site-building/displaying-content/additional-content-display-options/filtering-collections-on-a-page.md) 을 사용하여 키워드 또는 범주별로 청사진 기반 컬렉션을 필터링할 수 있습니다.

## 예: 향후 이벤트 표시

달력 이벤트를 생성하고 앞으로 발생할 이벤트만 반환하도록 청사진을 구성합니다. 컬렉션 표시 조각을 사용하여 콘텐츠 페이지에 이벤트를 표시합니다.

1. LPS-129412에 대해 [베타 기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md) 활성화합니다.

1. 페이지를 만들고 달력 위젯을 추가하세요.

1. 세 가지 캘린더 이벤트를 만듭니다.

   * 과거 이벤트: 다음 5분 및 마지막 15분(또는 그 이하) 내에 발생하도록 구성합니다.
   * 미래 이벤트 1: 미래에 시작되는 이벤트를 만듭니다.
   * 미래 사건 2: 미래에 일어날 또 다른 사건을 만듭니다.

   ![Three events are added to the Calendar widget.](./collections-with-search-blueprints/images/03.png)

1. 응용 프로그램 메뉴(![전역 메뉴](../../../../images/icon-applications-menu.png))에서 _Blueprints_를 엽니다.

1. 요소 탭에서 다음 JSON을 사용하여 새 맞춤 요소를 추가합니다.

   ```json
   {
      "description_i18n": {
         "en_US": "Limit results to only future events, using the endTime field."
      },
      "elementDefinition": {
         "category": "filter",
         "configuration": {
            "queryConfiguration": {
               "queryEntries": [
                  {
                     "clauses": [
                        {
                           "context": "query",
                           "occur": "filter",
                           "query": {
                              "range": {
                                 "endTime": {
                                    "gt": "${time.current_date|date_format=timestamp}"
                                 }
                              }
                           }
                        }
                     ]
                  }
               ]
            }
         },
         "icon": "filter",
         "uiConfiguration": {}
      },
      "title_i18n": {
         "en_US": "Limit Results to Future Events."
      },
      "type": 0
   }
   ```

1. Blueprints 탭에서 미래의 캘린더 이벤트만 일치하도록 Blueprint를 구축합니다.

   * 제목: _Future Calendar Events Provider_를 입력하세요.
   * 쿼리 설정: 검색 가능 유형에서 _캘린더 이벤트_를 선택하세요.
   * 쿼리 요소: _향후 이벤트에 대한 결과 제한_ 요소를 추가합니다.

1. 청사진을 저장합니다.

1. 사이트 메뉴(![사이트 메뉴](../../../../images/icon-product-menu.png))에서 다가오는 이벤트라는 콘텐츠 페이지를 추가합니다.

1. 컬렉션 표시 조각을 페이지에 추가하고 _Future Calendar Events Provider_ 컬렉션 공급자를 선택합니다.

   글머리 기호 목록을 표시하도록 컬렉션 표시 조각을 구성합니다.

1. 페이지를 게시하면 향후 캘린더 이벤트가 나타납니다.

![Only the future events are displayed in the collection display fragment.](./collections-with-search-blueprints/images/02.png)

청사진을 활용하여 결과를 동적으로 반환하고 조각 도구 상자의 이점을 활용하여 페이지를 레이아웃하세요.
