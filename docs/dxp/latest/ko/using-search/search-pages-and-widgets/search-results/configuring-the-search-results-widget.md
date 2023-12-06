# 검색 결과 위젯 구성

옵션 메뉴(![Options](../../../images/icon-app-options.png))를 열고 **구성** 을 선택하여 검색 결과 위젯을 구성합니다.

![The display of Search Results is configured in the widget's configuration screen.](./configuring-the-search-results-widget/images/02.png)

설정은 개념적으로 표시, 페이지 매김, 통합 검색 설정으로 나눌 수 있습니다. 또한 개발 및 테스트 중에 **문서 형식에 결과 표시** 를 선택하여 각 결과에 대한 검색 엔진 문서를 검사할 수 있습니다.

## 검색 결과 표시

**표시 템플릿:** 반환된 검색 결과의 스타일을 지정하는 [위젯 템플릿](./../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md)을 선택합니다. 기본 표시 스타일은 페이지가 매겨진 목록입니다. 각 목록 항목은 검색 쿼리에 대한 요약된 히트입니다. 검색 결과 위젯에 대한 새 위젯 템플릿을 추가하려면 **템플릿 관리** 링크를 클릭하세요.

![카드 레이아웃은 기본 검색 환경의 대안입니다. ](./configuring-the-search-results-widget/images/01.png)

**기본 빈 결과 메시지 표시**(7.4 U82+): 검색 결과가 없을 때 기본 메시지를 표시합니다. 빈 결과 메시지를 설정하는 사용자 정의 표시 템플릿을 사용하는 경우에만 이 기능을 비활성화하십시오.

**기본 페이지 매김 표시**(7.4 U82+): 기본 페이지 매김을 사용합니다. 페이지 매김을 정의하는 사용자 정의 표시 템플릿을 사용하는 경우에만 이 기능을 비활성화하십시오.

**하이라이트 활성화:** 검색결과 제목이나 요약에 표시되는 검색어를 강조표시합니다.

![With highlighting enabled, matches to the keyword are highlighted in the result summary.](./configuring-the-search-results-widget/images/03.png)

**선택한 결과를 컨텍스트에 표시:** 클릭한 자산이 동일한 사이트의 페이지에서 감지된 경우 기본 디스플레이 위젯에 표시합니다. 예를 들어 검색 결과에서 블로그 게시물을 클릭하면 블로그 애플리케이션에 블로그 항목이 표시됩니다. 검색 결과를 클릭한 후에는 더 이상 검색 컨텍스트에 있지 않습니다.

이 옵션을 선택 취소하거나 자산이 사이트의 페이지에 표시되지 않으면 해당 자산은 검색 페이지 컨텍스트에 있는 동안 대신 자산 게시자 창에 표시됩니다. 적절한 권한이 있으면 검색 컨텍스트에서 직접 콘텐츠를 편집할 수도 있습니다. 검색 결과로 돌아가려면 뒤로 화살표를 클릭하세요.

![If the display in context option is unchecked or the content isn't displayed on a Page in the Site, an Asset Publisher widget displays the content in the Search Page itself.](./configuring-the-search-results-widget/images/04.png)

## 결과 페이지 매김 구성

결과 페이지 매김은 검색 결과 하단에 나타납니다.

![The number of results per page and the URL parameter names used to control pagination behavior are configurable.](./configuring-the-search-results-widget/images/06.png)

**페이지 매김 시작 매개변수 이름:** 결과 페이지의 URL 매개변수 이름을 설정합니다. 기본값 **start** 가 유지되고 검색이 **test** 인 경우 사용자가 두 번째 결과 페이지로 이동할 때 매개변수를 볼 수 있습니다.

```
http://localhost:8080/web/guest/search?q=test&start=2
```

**페이지 매김 델타:** 결과 페이지당 표시할 결과 수를 설정합니다. `search.container.page.default.delta`를 사용자 정의하지 않은 경우 기본값은 **20** 입니다. [property](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Search%20Container) 를 `portal-ext.properties` 파일에 추가하세요.

**페이지 매김 델타 매개변수 이름:** 페이지 매김 델타 값(기본값은 `delta`)을 저장하는 URL 매개변수의 이름을 설정합니다. 이 매개변수는 사용자가 번호를 변경하면 브라우저에 표시됩니다. 사용자가 페이지당 10개의 결과를 선택하고 **test** 를 검색하면 검색 페이지가 다음 URL로 다시 로드됩니다.

```
http://localhost:8080/web/guest/search?q=test&delta=10
```

## 대체 인덱스의 결과 표시

**통합 검색 키:** 이 위젯이 기본이 아닌 색인 검색에 참여하는 경우 대체 검색 색인의 키를 입력하세요. 설정되지 않은 경우 위젯은 기본 인덱스(`liferay-[companyId]`)에 대한 기본 검색에 참여합니다. 이 값은 일반적으로 애플리케이션 정의 인덱스의 이름입니다. [낮은 수준 검색 옵션 이해](understanding-low-level-search-options.md)의 예를 참조하세요.

**표시할 필드:** 통합 검색 키 구성을 사용하여 [대체 색인](./understanding-low-level-search-options.md)을 검색하는 경우 해당 색인에서 검색할 필드를 지정합니다. 검색 결과 위젯에 표시되려면 필드가 색인화되고 [stored](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/mapping-store.html) 이어야 합니다.

## 검색 엔진 문서 검사

```{warning}
프로덕션 환경에서는 이 옵션을 사용하지 마십시오.
```

**문서 형식으로 결과 표시:** [인스턴스 관리자](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 에게 [문서](../../developer-guide.md) 검색으로 결과를 표시합니다. (다른 등록된 사용자 및 인증되지 않은 게스트 사용자는 문서 보기를 볼 수 없습니다.) 사이트를 개발하는 동안 이 기능을 사용하면 색인화된 문서 기반 형식으로 검색 응답을 볼 수 있습니다. 검색 인덱서 작성의 일부는 검색 엔진 문서(인덱싱되는 개체)를 실제 Java 개체로 변환하고 다시 변환하는 것입니다. 이 설정을 사용하려면 활성화한 다음 검색 결과 요약 아래의 *세부 정보...* 링크를 클릭하세요. 결과의 문서 보기가 검사를 위해 확장됩니다.

![결과 문서를 보면 인스턴스 관리자가 특정 자산에 대해 색인화되는 내용을 정확하게 검사할 수 있습니다. 이것은 하나의 문서 중 극히 일부에 불과합니다.](./configuring-the-search-results-widget/images/05.png)

자세한 내용은 [더 나은 검색어를 위한 제안을 반환](./enabling-search-suggestions.md)하는 방법(예: "...을 찾으셨나요?")을 확인하세요. 처음에 충분한 결과가 반환되지 않은 경우.
