# 검색 경험 개인화

검색 경험 및 검색 청사진의 주요 사용 사례 중 하나는 Liferay의 [검색 결과](../../../search-pages-and-widgets/search-results.md)개인화하는 것입니다. 개인화된 검색 경험을 통해 각 사용자는 자신의 상황에 대한 특정 세부 정보에 따라 결과를 볼 수 있습니다. 현재 Blueprint가 다음과 같은 상황별 질문의 답변에 반응하도록 만드는 요소가 있습니다.

* 사용자는 어디에 있습니까?
* 사용자에게 어떤 역할이 있습니까?
* 사용자는 어떤 사이트의 회원입니까?
* 사용자가 소유한 콘텐츠는 무엇입니까?
* 사용자가 손님입니까?
* 사용자가 신규 사용자입니까?
* 어떤 [User Segment](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)s 사용자 부분입니까?

각 사용자의 상황에 맞는 Blueprint가 없으면 기본 결과는 검색된 키워드의 텍스트가 색인화된 문서의 [토큰화된](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/analysis-tokenizers.html) 값과 얼마나 잘 일치하는지에 따라 관련성을 계산하는 쿼리를 기반으로 점수가 매겨집니다.

검색 결과를 개인화하면 사용자가 성공에 필요한 것을 찾을 가능성이 높아집니다. 그러면 사용자가 귀하의 콘텐츠에 계속 참여하게 하여 사이트의 성공 가능성이 높아집니다. 몇 가지 예는 다음과 같습니다.

* 특정 결과가 사용자의 IP 주소에 근접한 경우 우선순위 지정
* 사용자가 새로운 경우 특정 콘텐츠 우선 순위 지정
* 사용자가 인증되지 않은 경우 특정 콘텐츠 숨기기

## 개인화 요소

개인화 노력에 특히 유용한 몇 가지 요소가 있습니다.

**부스트 근접성:** [ipstack](https://ipstack.com) 서비스를 사용하여 문서의 [geopoint](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/geo-point.html) 필드에 표시된 대로 사용자 위치에 더 가까운 검색 결과를 제공합니다. [아래 예](#building-a-blueprint-to-personalize-search-results) 에서는 서비스를 설정하고 Boost Proximity Element를 사용하는 방법을 보여줍니다.

**현재 언어에 대한 콘텐츠 부스트:** 현재 세션의 언어와 일치하는 `defaultLanguageId` 필드로 검색 결과를 부스트합니다.

**게스트 사용자를 위한 범주의 콘텐츠 숨기기:**[특정 범주](../../../../content-authoring-and-management/tags-and-categories/와 일치하는 검색 결과를 숨깁니다. definition-categories-and-vocabularies-for-content.md) 필드, 검색 사용자가 인증되지 않은 경우.

**내 콘텐츠로 검색 제한:** 문서의 `userId` 필드가 검색 사용자와 일치하는 경우에만 검색 결과를 반환합니다.

**내 사이트로 검색 제한:**[사용자가 구성원인 사이트](../../../../site-building/sites/site-membership/로 범위가 지정된 검색 결과만 반환합니다. add-members-to-sites.md).

**내 사이트의 콘텐츠 부스트:** 검색 사용자가 결과 범위가 지정된 사이트의 구성원인 경우 검색 결과를 부스트합니다.

**새 사용자 계정에 대한 카테고리의 콘텐츠 부스트:**[특정 카테고리](../../../../content-authoring-and-management/tags-and-categories/로 검색 결과를 부스트합니다. definition-categories-and-vocabularies-for-content.md) 검색 사용자의 계정이 특정 시간 범위에서 생성된 경우.

**사용자 세그먼트에 대한 범주의 콘텐츠 부스트:** 사용자가 특정 사용자 세그먼트에 속하는 경우 [특정 범주로 검색 결과를 부스트합니다](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) [사용자 세그먼트](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md).

<!-- TODO: Move these descriptions to the Elements Reference guide when written, and link to them. Since we don't currently have the Elements Reference guide written, we must describe them here. -->

## 검색 결과를 개인화하기 위한 청사진 구축

경우에 따라 사용자의 사이트를 기반으로 결과를 표시해야 할 수 있습니다. 이렇게 하려면 다음을 수행해야 합니다.

* [사용자의 IP 주소( <https://ipstack.com>를 지리적으로 지정하는 서비스를 구성합니다.](#configure-the-ipstack-service)
* [Liferay 자산의 지리적 사이트를 찾습니다.](#configure-a-geolocated-asset)
* [지리적 사이트 서비스와 통신하는 요소로 Blueprint를 생성합니다.](#configure-a-geolocation-aware-blueprint)

### Ipstack 서비스 구성

Blueprint를 구성하기 전에 [ipstack 키](https://ipstack.com/) 획득하고 Liferay에서 ipstack 서비스를 활성화해야 합니다.

1. <https://ipstack.com> 로 이동하여 API 키를 얻습니다.
1. Liferay에서 시스템 설정 &rarr; 플랫폼 &rarr; 검색 경험 &rarr; Ipstack으로 이동합니다.
1. **활성화됨** 클릭합니다.
1. API 키를 입력합니다.
1. **저장** 클릭합니다.

![시스템 설정에서 ipstack 서비스를 구성합니다.](./personalizing-the-search-experience/images/01.png)

### 지리적 사이트 자산 구성

ipstack 서비스 및 Boost Proximity Element와 함께 작동하려면 검색 문서에 [geopoint 필드](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/geo-point.html) 이 있어야 합니다. Liferay에는 기존 자산에 사용자 정의 필드로 추가할 수 있는 호환 가능한 지리적 사이트 필드가 포함되어 있습니다.

1. 제어판 &rarr; 사용자 정의 필드로 이동합니다.
1. 블로그 항목에 새 사용자 정의 필드를 추가합니다. 
      - 유형: 지리적 사이트
   - 필드 이름: 사이트
1. **저장** 클릭합니다.
1. 두 개의 새 블로그 항목을 추가합니다(사이트 메뉴를 열고 Content & Data &rarr; Blogs로 이동). 
      - 첫 번째 블로그 항목 
          - 제목: **블로그 제목**
     - 콘텐츠: **블로그 콘텐츠**
     - 사용자 지정 필드 아래에서 사이트 정보 핀을 현재 사이트에서 약 100km 떨어진 곳으로 드래그합니다.
     - 블로그를 게시합니다.
   - 두 번째 블로그 항목 
          - 제목: **두 번째 블로그 제목**
     - 콘텐츠: **두 번째 블로그 콘텐츠**
     - 사용자 정의 필드에서 지리적 사이트 핀을 현재 사이트에 최대한 가깝게 드래그합니다.
     - 블로그를 게시합니다.

```{tip}
핀을 더 정확하게 배치하기 위해 지리적 사이트 지도를 확대합니다.
```

검색 페이지에서 단어 **블로그** 을 검색합니다. 더 짧은 제목 및 콘텐츠 필드가 있는 블로그 항목(첫 번째 항목, **블로그 제목**)이 검색 결과 위젯에 가장 먼저 나타납니다. 

### 지리적 사이트 인식 Blueprint 구성

이제 ipstack 서비스를 구성하고 geopoint 데이터로 문서를 검색했으므로 검색 사용자와의 근접성을 기준으로 특정 결과를 향상시키는 Blueprint를 구성할 준비가 되었습니다.

1. 전역 메뉴 &rarr; 애플리케이션(검색 경험)에서 **청사진** 클릭하여 청사진 애플리케이션을 엽니다.

1. **추가**(![Add](../../../../images/icon-add.png))을 클릭하여 청사진을 추가합니다.
   
   ![청사진 추가 창에서 청사진 생성을 시작합니다.](./creating-and-managing-search-blueprints/images/02.png)

1. 새 검색 청사진 창에서 청사진에 이름(필수)과 설명(선택 사항)을 지정합니다.

1. [Query Builder](#using-the-query-builder) 사용하여 Boost Proximity Element를 추가하십시오.
   
      - 필드를 `expando__keyword__custom_fields__location_geolocation`로 설정합니다.
   - 감쇠를 0.8로 설정합니다.
   - 축척을 10km로 설정합니다.
   - 부스트 값을 100으로 설정합니다.
![부스트 근접 요소를 구성합니다.](./personalizing-the-search-experience/images/02.png)

1. Blueprint를 빌드하고 구성하면서 테스트합니다. **미리보기** 클릭합니다.

1. 귀하의 사이트에 있는 사용자의 검색 경험을 모델링하려면 톱니바퀴 아이콘(![Cog](../../../../images/icon-cog3.png))을 클릭하여 공용 IPV4 주소를 검색 컨텍스트로 설정하십시오. 
   
   - 키: `search.experiences.ip.address`
   - 값: `[내 공용 IPV4 주소]`
     
**완료** 클릭합니다.

1. 키워드 **블로그** 입력하고 사이트에 더 가까운 사이트 정보 블로그 항목이 더 먼 블로그 항목보다 먼저 반환되는지 확인합니다.

1. Blueprint 작업을 마치면 **저장** 클릭합니다.

이제 [Liferay 검색 페이지에 청사진을 적용](./using-a-search-blueprint-on-a-search-page.md)할 수 있습니다.

송신 IP 주소에 근접하여 문서의 점수를 매기는 가우시안 함수를 조정해야 할 수도 있습니다. 

**Decay** 사용자에 대한 자산의 근접성이 스케일과 같을 때 부스트 값을 줄이는 요인을 정의합니다.

**척도** 은 사용자의 IP 주소 사이트에서 멀어지는 거리이며 그 이상에서는 결과의 관련성이 떨어지기 시작합니다.

**부스트** 정의된 척도 내에서 결과를 부스트하는 숫자 값입니다.

예를 들어 사용자로부터 10km 이내의 사이트에 있는 검색 결과에 대해 부스트를 100으로 지정하고 감쇠 계수를 0.5로 정의하면 사용자로부터 정확히 10km 떨어진 결과는 최대 부스트 값의 절반을 받게 되므로 부스트됩니다. 50까지. 10km 이상의 거리에서는 가우시안 함수가 나머지 점수를 결정합니다.

자세한 내용은 [Elastic의 함수 점수 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl-function-score-query.html) 설명서를 참조하세요.
