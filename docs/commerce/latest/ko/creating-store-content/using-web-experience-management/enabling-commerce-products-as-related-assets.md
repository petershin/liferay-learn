# 상거래 제품을 관련 자산으로 활성화

Commerce 제품은 [관련 자산](https://help.liferay.com/hc/articles/360028820532-Defining-Content-Relationships) 관계를 사용하여 Liferay Commerce의 다른 자산에 연결할 수 있습니다.

```{note}
Liferay DXP 7.4+는 상거래 제품을 관련 자산으로 지원하지 않습니다. 
```

## 데이터베이스를 검색하도록 자산 브라우저 구성

1. `[Liferay Home]\osgi\marketplace\`로 이동합니다. `Liferay Home` 폴더에 대한 자세한 내용은 [Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html) .
1. `Liferay Web Experience - Liferay Asset - Impl.lpkg`를 찾은 다음 아카이브 관리자로 엽니다.
1. 아카이브 관리자 창에서 `com.liferay.asset.browser.web.jar`을 엽니다.
1. 텍스트 편집기를 사용하여 `portlet.properties` 파일을 엽니다.
1. `search.with.database=true`를 설정하고 jar를 업데이트하세요.
1. 애플리케이션 서버를 다시 시작하십시오.

```{note}
콘텐츠 편집 시 상업 제품이 관련 자산 옵션으로 표시되도록 하려면 검색 재색인을 수행해야 할 수 있습니다.
```

## 재색인 실행

재색인을 실행하여 관련 자산이 필터에 채워졌는지 확인하세요.

1. **제어판 &rarr;** 구성 **&rarr;** 검색_으로 이동하세요.
1. 모든 검색 색인 옆에 있는 **Reindex** 를 클릭하세요.

## 상업 제품의 가용성 확인

상거래 제품은 기본적으로 모든 Liferay DXP 사이트에서 사용할 수 있으므로 필터를 **Global** 로 변경해야 합니다.

1. **사이트 관리** &rarr; **콘텐츠** &rarr; **웹 콘텐츠** 를 클릭하세요.

1. (![아이콘 추가](../../images/icon-add.png)) 아이콘을 클릭한 다음 **기본 웹 콘텐츠** 를 클릭하세요.

1. **관련 자산** 섹션까지 아래로 스크롤합니다.

1. **선택** 을 클릭하세요.

1. **커머스 상품** 을 클릭하세요.

   ![Select Commerce Product in the Related Assets section.](./enabling-commerce-products-as-related-assets/images/01.png)

1. **필터 및 주문** 을 클릭한 다음 **글로벌** 을 클릭하세요.

   ![Select the Global filter to view Commerce products.](./enabling-commerce-products-as-related-assets/images/02.png)

1. 제품을 클릭하세요.

이제 상거래 제품을 관련 자산으로 사용할 수 있습니다.

## 관련 주제

* [콘텐츠 관계 정의](https://help.liferay.com/hc/articles/360028820532-Defining-Content-Relationships)
* [기본 웹 콘텐츠 기사 추가](https://learn.liferay.com/w/dxp/content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article)
