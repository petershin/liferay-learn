# 자산 게시자 위젯을 사용하여 자산 표시

웹 콘텐츠를 만들 때 콘텐츠는 게시판 항목 및 블로그 게시물과 마찬가지로 자산이라는 점을 기억하십시오. 가장 일반적인 자산 유형은 [웹 콘텐츠](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)입니다. Asset Publisher 위젯은 기본적으로 다음 자산 유형을 지원합니다.

* Blogs입장
* 북마크 항목
* 갈피표 폴더
* 캘린더 이벤트
* 기본 문서
* 구글 드라이브 바로가기
* 문서 도서관 폴더
* 동적 데이터 목록 레코드
* 기술 자료 문서
* 전보국 메시지
* 웹 내용을 편집하십시오
* 웹 내용 급식
* Wiki페이지

```{note}
Liferay DXP 7.2부터 개발자는 [Info Framework](https://help.liferay.com/hc/ko/articles/360029067251-Introduction-to-The-Info-Framework) 를 사용하여 [에서 자산을 표시할 수 있습니다. 정보 목록](https://help.liferay.com/hc/ko/articles/360029067271-Creating-an-Information-List-Provider) .
```

원하는 자산을 표시하도록 자산 게시자를 구성하는 가장 쉬운 방법은 필요에 맞는 [컬렉션](../../../content-authoring-and-management/collections-and-collection-pages.md) 을 사용하는 것입니다. 컬렉션에 자산을 수동으로 할당하든 동적으로 할당하든 자산 게시자 위젯은 컬렉션이 정의한 순서대로 자산을 자동으로 로드합니다. Liferay DXP 7.4 U10+ 또는 GA14에서 자산 게시자는 기본적으로 컬렉션 구성을 사용합니다.

![표시할 자산을 검색하는 컬렉션, 수동 또는 동적 방법을 사용하도록 자산 게시자 위젯을 구성할 수 있습니다.](./displaying-assets-using-the-asset-publisher-widget/images/01.png)

자산 게시자 위젯의 수동 또는 동적 구성을 구성하여 컬렉션 없이 표시되는 자산을 결정할 수도 있습니다. 수동 선택을 통해 표시되는 자산을 제어할 수 있지만 정기적으로 목록을 업데이트하는 경우 목록을 유지 관리하는 것이 번거로울 수 있습니다. 이 경우 자산 게시자 위젯을 사용하여 콘텐츠를 동적으로 선택하는 것이 더 편리합니다.

## Show Options

Asset Publisher 위젯은 자산을 표시합니다. 표시 방식을 조정하는 데 사용할 수 있는 많은 [구성 옵션](./configuring-asset-publisher-display-settings.md) 이 있습니다. 기본적으로 자산 게시자는 전체 보기에 대한 링크와 함께 최근 게시된 자산의 초록(미리 보기)을 표시합니다. 자산 표, 자산 제목 목록 또는 자산의 전체 콘텐츠를 표시하도록 자산 게시자를 구성할 수 있습니다. 특정 자산을 표시하도록 구성하고 목록에 표시할 항목 수를 선택할 수도 있습니다. Asset Publisher를 사용하여 선택한 콘텐츠 유형, 최근 콘텐츠 또는 콘텐츠를 태그 및 범주별로 표시할 수 있습니다.

## 혼합 콘텐츠 게시

Asset Publisher 위젯은 자산을 게시하므로 이미지, 문서, 블로그 및 물론 웹 콘텐츠와 같은 혼합 콘텐츠 유형을 게시하는 데 탁월합니다. 이것은 보다 동적인 웹사이트를 만드는 데 도움이 됩니다. 사용자가 만든 위키 항목, 블로그 게시물 또는 게시판 메시지를 웹 콘텐츠와 관련하여 배치할 수 있습니다.

![자산 게시자 위젯을 사용하여 혼합 콘텐츠 유형을 게시할 수 있습니다.](./displaying-assets-using-the-asset-publisher-widget/images/02.png)

## 추가 정보

* [자산 게시자 위젯에서 자산 선택](./selecting-assets-in-the-asset-publisher-widget.md)
* [Asset Publisher 디스플레이 설정 구성](./configuring-asset-publisher-display-settings.md)
* [자산 게시자 구독 구성](./configuring-asset-publisher-subscriptions.md)
