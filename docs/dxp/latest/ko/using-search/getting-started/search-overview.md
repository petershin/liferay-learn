# 검색 개요

검색은 Liferay의 기본 구성 요소입니다. Elasticsearch는 테스트 및 개발 목적으로 Liferay와 함께 번들로 제공됩니다. 프로덕션 환경에는 원격 서버에서 실행되는 Elasticsearch가 필요합니다. [Elasticsearch 시작하기](../installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md) 에서는 원격 서버 설정을 설명합니다. 그러나 번들로 제공되는 Elasticsearch 엔진을 사용하여 검색 기능을 즉시 탐색할 수 있습니다.

다음은 검색 기능입니다.

* 전체 텍스트 검색
* 모든 콘텐츠 유형(블로그, 문서, 웹 콘텐츠 등)의 인덱싱
* 고도로 구성 가능한 검색 페이지
* 모든 페이지의 헤더에 포함된 검색 표시줄
* 추가, 업데이트 및 삭제된 콘텐츠에 대한 자동 인덱스 동기화
* 역할 및 권한별 검색 결과 필터링
* 검색 제안
* 검색 결과 구성(예: 필터 및 정렬)
* 패싯 검색
* 고급 검색 구문(예: AND/OR/NOT, 와일드카드 등) 활성화 또는 비활성화

## 페이지 및 위젯 검색

기본 검색 페이지(`localhost:8080/search`)에는 실용적인 검색 위젯 세트가 있습니다. 사용자 정의할 수 있으며 글로벌 검색 페이지 템플릿(사용자 정의 가능)을 기반으로 합니다.

![검색 페이지 템플릿이 유용합니다.](./search-overview/images/05.png)

페이지에 검색 위젯을 추가하려면 페이지에서 추가 버튼을 클릭하고 _위젯_을 선택한 다음 검색 범주를 엽니다.

![검색 위젯이 많이 있습니다.](./search-overview/images/07.png)

자세한 내용은 [검색 페이지 구성](../search-pages-and-widgets/working-with-search-pages/search-pages.md) 또는 [검색 페이지 및 위젯](../search-pages-and-widgets/working-with-search-pages.md)을 참조하세요.

## 검색 구성 및 관리

제어판에서 검색 기능을 구성하고, 연결 및 필드 매핑을 보고, 검색 색인 작업을 수행할 수 있습니다.

제어판의 시스템 범위에서 검색을 구성할 수 있습니다. 구성 범주에서 *시스템 설정* &rarr; *검색*를 선택합니다. 검색 설정 페이지가 나타납니다.

![검색은 고도로 구성 가능합니다.](./search-overview/images/06.png)

검색 연결 및 필드 매핑을 검사하고 검색 관리 화면에서 색인을 실행할 수 있습니다. 구성 범주에서 *검색* 을 선택하여 제어판에서 탐색합니다.

![검색 관리 화면은 유익하고 유용합니다.](./search-overview/images/08.png)

[검색 관리 및 조정](../search-administration-and-tuning.md)에서 자세히 알아보십시오.

## 검색 맞춤 개발

검색 사용자 지정에는 일반적으로 다음 검색 단계 중 하나 이상이 포함됩니다.

**인덱싱** 은 검색 엔진에 하나 이상의 문서를 보내는 것입니다. 문서에는 다양한 유형(텍스트, 키워드 등)의 필드가 포함되어 있습니다. 검색 엔진은 각 필드를 처리하고 필드를 저장할지 분석할지 여부를 결정합니다.

**검색** 은 검색 쿼리를 보내고 결과를 얻는 것입니다(일명 히트) 검색 엔진에서. 쿼리 및 필터는 검색 요청의 일부가 될 수 있으며 둘 다 검색할 필드와 일치시킬 값을 지정합니다. 검색 엔진은 중첩된 쿼리 및 필터 내의 각 필드를 반복하고 선택적으로 쿼리를 실행하기 전에 특수 분석을 수행합니다(검색 시간 분석). 매핑 정의를 통해 필드별로 검색 시간 분석을 구성할 수 있습니다.

서비스 공급자 인터페이스와 API를 사용하여 검색 기능을 확장하고 호출할 수 있습니다.

* 서비스 제공자 인터페이스(SPI)는 구현하기 위한 것입니다. 소스 코드에서 이들은 `-spi` 로 끝나는 모듈에서 찾을 수 있습니다(예: [`Portal-search-spi` 모듈](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-search/portal-search-spi)).

* API에는 자체 코드에서 호출할 수 있는 메서드가 포함되어 있습니다. 소스 코드에서 이들은 `-api` 로 끝나는 모듈에서 찾을 수 있습니다(예: [`portal-search-api` module](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-search/portal-search-api)).

자세한 내용은 [개발자 안내서](../developer-guide.md) 을 참조하십시오.

## 다음

[콘텐츠 검색](./searching-for-content.md)을 통해 검색 기능을 살펴보세요. 프로덕션용 검색을 구성할 준비가 되면 [Elasticsearch 시작하기](../installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md)을 참조하십시오.
