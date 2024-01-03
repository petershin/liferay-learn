# 세션 속성 어휘

{bdg-secondary}`liferay DXP/포탈 7.3+`

_세션 속성 어휘_를 사용하면 사전 정의된 값을 사용하여 [세션 기반 세그먼트 속성](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 생성할 수 있습니다. 이 옵션은 새 세그먼트를 생성하는 동안 세그먼트 편집기가 속성 값을 수동으로 입력하는 것을 원하지 않을 때 유용합니다. 대신 사용자가 미리 정의된 값 목록에서 이를 선택하기를 원합니다. 세션 속성 어휘는 세그먼트 정의 작업을 용이하게 하고 수동 입력 오류를 제거합니다.

예를 들어, 마케팅 팀은 기기의 브랜드 정보를 사용하여 Apple 기기용 새 앱 홍보와 같이 웹사이트 방문자에게 다양한 콘텐츠를 타겟팅할 수 있습니다. 마케팅 팀의 프로세스를 용이하게 하기 위해 다양한 장치 브랜드를 [사용자 세그먼트](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 연결할 수 있습니다. 이렇게 하면 마케팅 팀이 "장치 브랜드" [세션 속성](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 사용하여 세그먼트를 만들 때 다른 장치 브랜드 옵션을 입력할 필요가 없습니다. 이제 가능한 옵션 목록이 미리 정의되어 있습니다.

![The Device Brand session's property contains a list of pre-defined values.](./session-property-vocabularies/images/07.png)

세션 속성 어휘는 세 단계로 작업합니다.

1. [세션 기반 세그먼트](#configuring-the-vocabulary-for-the-session-based-segment) 에 대한 어휘를 구성합니다.

1. [세션 속성 어휘 정의](#defining-the-session-property-vocabulary).

1. [세션 기반 세그먼트](#creating-the-session-based-segment) 을 생성합니다.

## 세션 기반 세그먼트에 대한 어휘 구성

이 어휘(1)에서 정의하는 카테고리는 세션 속성 [(2)](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 사용하여 세그먼트를 생성할 때 선택할 수 있는 카테고리입니다.

![Here's the list of categories for the global Vocabulary you want to associate to the user Segment.](./session-property-vocabularies/images/01.png)

![The available options in the session-based Segment corresponds to the Categories in the global Vocabulary.](./session-property-vocabularies/images/02.png)

새로운 글로벌 어휘를 생성하거나 기존 어휘를 사용할 수 있습니다. 새 어휘를 생성하거나 기존 어휘의 카테고리를 업데이트하려면 [콘텐츠에 대한 카테고리 및 어휘 정의](./defining-categories-and-vocabularies-for-content.md) 참조하세요. 공개 또는 내부 가시성이 [인 어휘를 사용할 수 있습니다](./organizing-content-with-categories-and-tags.md#vocabulary-visibility) . 세션 속성 어휘는 전역 어휘에서만 작동합니다.

```{note}
글로벌 사이트에서는 글로벌 어휘 생성 및 편집만 가능합니다.
```

## 세션 속성 어휘 정의

세션 기반 세그먼트 [에 대한 어휘를](#configuring-the-vocabulary-for-the-session-based-segment) 후 어휘를 새 세션 속성 어휘의 사용 가능한 세션 속성 중 하나에 연결해야 합니다.

![Configuring the Vocabulary to work with the Segment's Session Property.](./session-property-vocabularies/images/03.png)

1. 글로벌 메뉴를 클릭하고 _제어판_ 탭을 클릭하세요.

1. 구성 섹션에서 _시스템 설정_을 클릭합니다.

1. 콘텐츠 및 데이터 섹션에서 _세그먼트_를 클릭합니다.

1. _세션 속성 어휘_를 클릭합니다.

1. _추가_를 클릭하여 새 세션 속성 어휘를 생성하세요.

1. 선택 속성 드롭다운 메뉴에서 속성을 선택합니다.

   ![Select the property you want to associate to the global Vocabulary.](./session-property-vocabularies/images/06.png)

    ```{note}
    다른 세션 속성 어휘에 속하는 속성을 선택할 수 없습니다. 이러한 속성은 회색으로 표시되어 사용할 수 없습니다.
    ```
1. 어휘 이름 드롭다운 메뉴에서 _어휘_를 선택합니다.

1. _저장_을 클릭하세요.

![Create a Session Property Vocabulary and save it.](./session-property-vocabularies/images/05.gif)

## 세션 기반 세그먼트 생성

[어휘](#configuring-the-vocabulary-for-the-session-based-segment) 구성하고 세션 속성 어휘 [을 정의하는](#defining-the-session-property-vocabulary) 구성한 후 Segment를 생성할 수 있습니다. 세그먼트 생성에 대한 자세한 내용은 [사용자 세그먼트 생성 및 관리](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md#creating-user-segments) 참조하세요.

세그먼트의 조건을 정의하고 전역 어휘에 연결된 세션 속성 중 하나를 사용하면 이제 세션 속성의 조건이 사전 정의되어 드롭다운 메뉴에서 선택할 수 있습니다. 이 드롭다운 메뉴는 세션 속성 어휘에서 정의한 어휘 [당신이 정의한 어휘](#defining-the-session-property-vocabulary) 대한 범주 목록에 해당합니다.

```{important}
세션 속성 어휘의 사용자 세그먼트에 연결된 카테고리 또는 어휘 중 하나를 삭제하면 세그먼트는 정의에 따라 계속 작동합니다. Liferay는 세그먼트 편집기에서 이러한 상황을 경고합니다.
```

![A warning message appears when one of the categories or the Vocabulary in the Session Property Vocabulary is missing.](./session-property-vocabularies/images/08.png)

## 관련 정보

* [콘텐츠의 카테고리 및 어휘 정의](./defining-categories-and-vocabularies-for-content.md)
* [사용자 세그먼트 생성 및 관리](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md#creating-user-segments)
* [세그먼트 편집기 UI 참조](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md)
