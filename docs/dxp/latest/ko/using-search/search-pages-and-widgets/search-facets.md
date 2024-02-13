---
toc:
- ./search-facets/site-facet.md
- ./search-facets/type-facet.md
- ./search-facets/category-facet.md
- ./search-facets/tag-facet.md
- ./search-facets/folder-facet.md
- ./search-facets/user-facet.md
- ./search-facets/modified-facet.md
- ./search-facets/custom-facet.md
---
# 패싯 검색

# 패이셋

검색창에 키워드를 입력하고 검색 버튼을 클릭합니다. 기본 검색 환경은 오른쪽에 결과가 있고 왼쪽에 **패싯** 컬렉션이 있는 페이지로 리디렉션됩니다.

* [사이트 페이셋](search-facets/site-facet.md)
* [유형 페이셋](search-facets/type-facet.md)
* [분류 페이셋](search-facets/category-facet.md)
* [태그 페이셋](search-facets/tag-facet.md)
* [폴더 페이셋](search-facets/folder-facet.md)
* [사용자 패싯](search-facets/user-facet.md)
* [수정 페이셋](search-facets/modified-facet.md)
* [커스텀 페이셋](search-facets/custom-facet.md)

![검색 결과의 예시 페이지.](./search-facets/images/01.png)

패싯은 공통 특성 또는 패싯 용어로 검색 결과를 집계합니다.

## 패싯 사용

검색 결과를 효율적으로 필터링하려면 하나 이상의 패싯 용어를 클릭하십시오. 예를 들어 Apollo와 관련된 문서를 검색하는 경우 Type 패싯에서 용어를 확인할 수 있습니다.

![유형별로 필터링된 Apollo 검색 결과입니다.](./search-facets/images/02.png)

특히 Apollo 11과 관련된 문서를 찾으려면 폴더 패싯에서 용어를 확인할 수도 있습니다.

![폴더별로 필터링된 Apollo 검색 결과입니다.](./search-facets/images/03.png)

이런 식으로 검색 결과를 줄일 수 있습니다.

## 다중 패싯 선택

위의 예에서 볼 수 있듯이 서로 다른 패싯에서 용어를 선택하는 것은 빼기입니다(즉, AND 연산자 사용). 즉, 모든 필터 기준과 일치하는 결과만 반환됩니다.

그러나 개별 패싯 내에서 용어를 선택하는 것은 추가적입니다(즉, OR 연산자 사용). 즉, 각 용어에 대한 결합된 결과가 반환됩니다. 예를 들어 Apollo 11 폴더와 Apollo 14 폴더 모두에 대한 검색 결과를 필터링하려는 경우 두 용어를 모두 선택할 수 있습니다.

![두 폴더에 대한 Apollo 검색 결과.](./search-facets/images/04.png)

## 패싯 및 친숙한 URL

검색 기능은 패싯 필터링을 위해 친숙한 검색 URL을 사용합니다. 기본 설정에서 키워드 **테스트** 을 검색할 때 기본 기본 검색 URL은 다음과 같습니다.

    http://localhost:8080/web/guest/search?q=test

패싯 용어를 선택하면 위의 URL에 새 매개변수가 추가됩니다. 예를 들어 유형 패싯에서 블로그 항목을 선택하면 다음 URL이 생성됩니다.

    http://localhost:8080/web/guest/search?q=test&type=com.liferay.blogs.model.BlogsEntry

동일한 패싯 범주에서 다른 패싯 용어를 선택하면 동일한 매개변수가 다시 추가되지만 새로 선택한 값은 다음과 같습니다.

    http://localhost:8080/web/guest/search?q=test&type=com.liferay.blogs.model.BlogsEntry&type=com.liferay.portal.kernel.model.User

나머지 측면은 동일한 방식으로 작동합니다. Last Modified 패싯에서 지난 시간 옵션으로 필터링하면 다음 URL이 생성됩니다. 

    http://localhost:8080/web/guest/search?q=test&modified=past-hour

매개변수 이름은 각 패싯에 대해 구성할 수 있습니다.

각 패싯 유형에 대한 자세한 내용은 개별 기사를 참조하십시오.

