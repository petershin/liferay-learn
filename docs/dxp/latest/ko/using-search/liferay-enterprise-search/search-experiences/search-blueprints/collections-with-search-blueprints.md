# 검색 블루프린트가 있는 컬렉션

{bdg-secondary}`7.4 U88+`
{bdg-link-primary}`[베타 기능](../../../../시스템-관리/컨피규잉-리퍼레이/기능-플래그.md)`

검색 블루프린트를 만들면 [수집 공급자](../../../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md) 가 자동으로 등록됩니다. 블루프린트의 쿼리 및 구성과 일치하는 에셋이 컬렉션에 추가됩니다.

```{important}
라이프레이의 [에셋 프레임워크](../../../건물-애플리케이션/데이터-프레임워크/자산-프레임워크.md)에 등록된 콘텐츠만 블루프린트 컬렉션 제공업체에서 반환됩니다.
```

![검색 블루프린트는 컬렉션 제공업체로 등록됩니다.](./collections-with-search-blueprints/images/01.png)

검색 블루프린트의 컬렉션 공급자를 사용하려면,

1. LPS-129412에 대해 [베타 기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md) 를 활성화합니다.

   블루프린트의 컬렉션 제공자는 Liferay가 시작되거나 블루프린트가 게시될 때만 등록됩니다. 기능 플래그를 활성화할 때 기존 블루프린트가 있는 경우, 각 블루프린트를 편집하고 저장하여 컬렉션 제공자를 등록해야 합니다.

1. [블루프린트 만들기](./creating-and-managing-search-blueprints.md).

1. 콘텐츠 페이지 편집기에서 컬렉션 표시 조각을 추가합니다.

   컬렉션 페이지를 추가할 때 컬렉션 공급자를 사용할 수도 있습니다.

1. 컬렉션 제공자 필드에서 블루프린트의 컬렉션 제공자를 선택합니다.

다른 컬렉션과 마찬가지로 [컬렉션 필터](../../../../site-building/displaying-content/additional-content-display-options/filtering-collections-on-a-page.md)를 사용하여 키워드 또는 카테고리별로 블루프린트 기반 컬렉션을 필터링할 수 있습니다.

## 예시: 향후 이벤트 표시

캘린더 이벤트를 만들고 향후에 발생하는 이벤트만 반환하도록 블루프린트를 구성하세요. 컬렉션 표시 조각을 사용하여 콘텐츠 페이지에 이벤트를 표시합니다:

1. LPS-129412에 대해 [베타 기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md) 를 활성화합니다.

1. 페이지를 만들고 캘린더 위젯을 추가합니다.

1. 캘린더 이벤트 3개를 생성합니다:

   * 과거 이벤트: 향후 5분 이내에 발생하고 15분 이내로 지속되도록 구성합니다.
   * 미래 이벤트 1: 미래에 시작되는 이벤트를 만듭니다.
   * 미래 이벤트 2: 미래에 발생하는 다른 이벤트를 만듭니다.

   ![캘린더 위젯에 세 가지 이벤트가 추가됩니다.](./collections-with-search-blueprints/images/03.png)

1. 애플리케이션 메뉴(![Global Menu](../../../../images/icon-applications-menu.png))에서 **블루프린트** 를 엽니다.

1. 요소 탭에서 이 JSON을 사용하여 새 사용자 정의 요소를 추가합니다:

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

1. 블루프린트 탭에서 미래에 있을 캘린더 이벤트만 일치하도록 블루프린트를 작성합니다:

   * 제목: 입력 **향후 캘린더 이벤트 제공자** .
   * 쿼리 설정: 검색 가능한 유형에서 **캘린더 이벤트** 를 선택합니다.
   * 쿼리 요소: **향후 이벤트에 결과 제한** 요소를 추가합니다.

1. 청사진을 저장합니다.

1. 사이트 메뉴(![Site Menu](../../../../images/icon-product-menu.png))에서 예정된 이벤트라는 콘텐츠 페이지를 추가합니다.

1. 컬렉션 표시 조각을 페이지에 추가하고 **향후 캘린더 이벤트 제공업체** 컬렉션 제공업체를 선택합니다.

   글머리 기호 목록을 표시하도록 컬렉션 표시 조각을 구성합니다.

1. 페이지를 게시하면 향후 캘린더 이벤트가 표시됩니다.

![컬렉션 디스플레이 조각에는 향후 이벤트만 표시됩니다.](./collections-with-search-blueprints/images/02.png)

블루프린트를 활용하여 결과를 동적으로 반환하고 조각 툴박스의 이점을 활용하여 페이지를 레이아웃할 수 있습니다.
