# 구조 필드 구성

구조 필드와 해당 속성을 편집할 수 있습니다.

1. 사이트 메뉴( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **구조** 탭을 선택합니다.

1. 수정하려는 구조의 이름을 클릭합니다.

   구조 옆에 있는 **작업** 메뉴( ![작업 아이콘](../../../images/icon-actions.png) )를 열고 **편집** 을 선택할 수도 있습니다.

1. [remove](#structure-field-options) 을 추가하거나 구조의 필드를 재구성합니다.

1. 구성하려는 필드를 선택합니다. 컨텍스트 메뉴에서 [다른 작업](#structure-field-options) 을 수행할 수도 있습니다.

1. 사이드바가 확장되면 선택한 필드에 대해 [원하는 설정을 구성](#configurable-settings) 하고 변경 사항을 **저장** 하세요.

## 구성 가능한 설정

```{important}
필드 설정은 필드 유형에 따라 다릅니다. 아래 나열된 설정은 필드에 적용되지 않을 수 있습니다.
```

**유형:** 정의에 배치된 필드 유형입니다. 이는 편집할 수 없지만 웹 콘텐츠 템플릿에서 참조할 수 있습니다.

**필드 라벨:** 필드 위에 표시할 텍스트입니다.

**라벨 표시:** 필드 라벨을 표시할지 여부입니다. 기본값은 예입니다.

**필수:** 웹 콘텐츠 구조를 사용하여 콘텐츠를 제출하려면 사용자가 필드를 채워야 하는지 여부입니다. 기본값은 아니요입니다.

**필드 참조:** 이 필드에 대한 웹 콘텐츠 템플릿에 사용되는 변수 이름입니다. 설명이 포함된 이름을 입력해야 합니다. 기본 이름이 자동으로 생성됩니다.

```{tip}
Liferay DXP는 구조의 각 새 필드에 대해 무작위 필드 참조를 할당합니다. 기본값을 좀 더 설명적인 값으로 바꾸면 템플릿 개발자가 필드를 식별하여 웹 콘텐츠 템플릿이나 디스플레이 페이지에 데이터를 배치할 수 있습니다.
```

**도움말 텍스트:** 사용자가 필드 라벨을 이해하는 데 도움이 되는 설명을 추가합니다. 도움말 텍스트는 추가 지침을 제공하기 위해 해당 분야의 부제목 역할을 합니다.

**검색 가능:** 검색을 위해 필드를 색인화할지 여부입니다. 전체 텍스트 또는 키워드만 색인화합니다.

**현지화 가능:** 필드를 사용자 언어로 현지화할 수 있는지 여부입니다. 기본값은 예입니다.

**반복 가능:** 사용자가 웹 콘텐츠를 생성하는 동안 필드를 복제할 수 있는지 여부입니다. 예를 들어, 사용자가 필드를 복제하여 기사의 두 번째 작성자를 입력할 수 있도록 반복 가능한 작성자 필드를 가질 수 있습니다. 기본값은 아니요입니다. 예로 설정하면 사용자는 필드에서 '+' 아이콘을 클릭하여 웹 콘텐츠를 생성하는 동안 이를 복제할 수 있습니다.

**다중 선택 허용:** 사용자가 여러 옵션을 선택할 수 있는지 여부입니다. 기본값은 아니요입니다.

**옵션을 알파벳순으로 정렬:** 필드의 옵션을 알파벳순으로 정렬할지 여부입니다. 기본값은 아니요입니다.

**인라인:** 선택 필드에 인라인 또는 블록 옵션이 표시되는지 여부입니다. 기본값은 예입니다.

**옵션:** 선택 필드 또는 라디오 필드에 사용 가능한 옵션입니다. 옵션을 추가 및 제거할 수 있을 뿐만 아니라 각 개별 옵션의 표시 이름(웹 콘텐츠를 생성할 때 사용자에게 표시되는 이름) 및 값(웹 콘텐츠 템플릿에서 검색할 수 있는 옵션에 대해 저장된 값) 쌍을 편집할 수 있습니다.

**스타일:** 구분 기호 필드에 대한 선택적 CSS 스타일입니다.

## 구조 필드 옵션

구조 필드 위에 마우스를 놓고 **작업**( ![작업 버튼](../../../images/icon-app-options.png) )을 클릭하면 컨텍스트 메뉴에 다음 옵션이 나타납니다.

* **복제:** 필드와 해당 설정을 모두 복제하고 충돌을 피하기 위해 이름을 반복합니다.
* **삭제:** 구조에서 필드를 제거합니다.

## 관련 정보

* [구조물 만들기](./creating-structures.md)
* [구조 관리](./managing-structures.md)
* [웹 콘텐츠 구조 이해](./understanding-web-content-structures.md)
