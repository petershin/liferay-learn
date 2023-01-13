# 검색 결과 위젯 구성

옵션 메뉴(![Options](../../../images/icon-app-options.png))를 열고 *구성*를 선택하여 검색 결과 위젯을 구성합니다.

![검색 결과 표시는 위젯의 구성 화면에서 구성됩니다.](./configuring-the-search-results-widget/images/02.png)

설정은 개념적으로 표시, 페이지 매김 및 통합 검색 설정으로 나눌 수 있습니다. 또한 개발 및 테스트 중에 _Display Results in Document Form_을 체크하여 각 결과에 대한 검색 엔진 문서를 검사할 수 있습니다.

## 검색 결과 표시

**표시 템플릿:** 반환된 검색 결과의 스타일을 지정하는 [위젯 템플릿](./../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 을 선택합니다. 기본 표시 스타일은 페이지가 매겨진 목록입니다. 각 목록 항목은 검색 쿼리에 대한 요약된 히트입니다. _템플릿 관리_ 링크를 클릭하여 검색 결과 위젯에 대한 새 위젯 템플릿을 추가합니다.

![카드 레이아웃은 기본 검색 환경의 대안입니다. ](./configuring-the-search-results-widget/images/01.png)

----

**강조 표시 활성화:** 검색 결과의 제목이나 요약에 나타나는 검색어를 강조 표시합니다.

![강조 표시를 사용하면 키워드와 일치하는 항목이 결과 요약에서 강조 표시됩니다.](./configuring-the-search-results-widget/images/03.png)

----

**컨텍스트에서 선택한 결과 표시:** 동일한 사이트의 페이지에서 감지된 경우 기본 디스플레이 위젯에서 클릭한 자산을 표시합니다. 예를 들어 검색 결과에서 블로그 게시물을 클릭하면 블로그 애플리케이션에 블로그 항목이 표시됩니다. 검색 결과를 클릭하면 더 이상 검색 컨텍스트에 있지 않습니다.

이 옵션을 선택하지 않거나 자산이 사이트의 페이지에 표시되지 않으면 자산이 여전히 검색 페이지 컨텍스트에 있는 동안 자산 게시자 창에 대신 표시됩니다. 올바른 권한이 있는 경우 검색 컨텍스트에서 직접 콘텐츠를 편집할 수도 있습니다. 뒤로 화살표를 클릭하여 검색 결과로 돌아갑니다.

![컨텍스트에 표시 옵션이 선택되지 않았거나 콘텐츠가 사이트의 페이지에 표시되지 않는 경우 자산 게시자 위젯은 콘텐츠를 검색 페이지 자체에 표시합니다.](./configuring-the-search-results-widget/images/04.png)

## 결과 페이지 매김 구성

결과 페이지 매김은 검색 결과 하단에 나타납니다.

![페이지당 결과 수와 페이지 매김 동작을 제어하는 데 사용되는 URL 매개변수 이름을 구성할 수 있습니다.](./configuring-the-search-results-widget/images/06.png)

**페이지 매김 시작 매개변수 이름:** 결과 페이지의 URL 매개변수 이름을 설정합니다. 기본값 *start* 이 유지되고 검색이 *test*인 경우 사용자가 두 번째 결과 페이지로 이동할 때 매개변수를 볼 수 있습니다.

```
http://localhost:8080/web/guest/search?q=test&start=2
```

**Pagination Delta:** 결과 페이지당 표시할 결과 수를 설정합니다. `portal-ext.properties` 파일에서 `search.container.page.default.delta` [특성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Search%20Container) 를 사용자 정의하지 않은 경우 기본값은 *20* 입니다.

**페이지 매김 델타 매개변수 이름:** 페이지 매김 델타 값을 저장하는 URL 매개변수의 이름을 설정합니다(기본적으로`델타`). 이 매개변수는 사용자가 숫자를 변경하면 브라우저에 표시됩니다. 사용자가 페이지당 10개의 결과를 선택하고 *개의 테스트*을 검색하면 검색 페이지가 다음 URL로 다시 로드됩니다.

```
http://localhost:8080/web/guest/search?q=test&delta=10
```

## 대체 인덱스의 결과 표시

**연합 검색 키:** 이 위젯이 기본이 아닌 색인에 대한 검색에 참여하는 경우 대체 검색 색인의 키를 입력하십시오. 설정하지 않으면 위젯이 기본 색인(`liferay-[companyId]`)에 대해 기본 검색에 참여합니다. 이 값은 일반적으로 애플리케이션 정의 색인의 이름입니다. [저수준 검색 옵션 이해](understanding-low-level-search-options.md)의 예를 참조하십시오.

**표시할 필드:** 연합 검색 키 구성을 사용하여 [대체 인덱스를 검색하는 경우](./understanding-low-level-search-options.md) 해당 인덱스에서 검색할 필드를 지정합니다. 검색 결과 위젯에 표시되려면 필드가 모두 인덱싱되고 [저장](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-store.html) 되어야 합니다.

## 검색 엔진 문서 검사

```{warning}
프로덕션 환경에서는 이 옵션을 사용하지 마십시오. 
```

**문서 형식으로 결과 표시:** 검색 결과로 표시 [문서](../../developer-guide.md) ~ [인스턴스 관리자](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) (등록된 다른 사용자 및 인증되지 않은 게스트 사용자는 문서 보기를 볼 수 없음). 색인화된 문서 기반 형식으로 검색 응답을 보려면 사이트를 개발하는 동안 이 기능을 사용하십시오. 검색 인덱서 작성의 일부는 검색 엔진 문서(인덱싱되는 개체)를 실제 Java 개체로 변환하고 다시 그 반대로 변환하는 것입니다. 이 설정을 사용하려면 이 설정을 활성화한 다음 검색 결과 요약 아래의 *세부 정보...* 링크를 클릭하십시오. 결과의 문서 보기가 검사를 위해 확장됩니다.

![결과 문서를 보면 인스턴스 관리자가 특정 자산에 대해 인덱싱되는 항목을 정확하게 검사할 수 있습니다. 이것은 한 문서의 작은 부분에 불과합니다.](./configuring-the-search-results-widget/images/05.png)

자세한 내용은 더 나은 검색어 [에 대한 제안을 반환하는 방법을 확인하십시오(예](./enabling-search-suggestions.md) "...을(를) 찾으셨습니까?") 초기에 충분한 결과가 반환되지 않은 경우.
