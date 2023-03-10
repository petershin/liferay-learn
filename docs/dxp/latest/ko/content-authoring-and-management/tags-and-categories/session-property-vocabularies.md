# 세션 속성 어휘

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.3+`

**세션 속성 어휘** 을 사용하면 미리 정의된 값을 사용하여 [세션 기반 세그먼트 속성](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 생성할 수 있습니다. 이 옵션은 새 세그먼트를 생성하는 동안 세그먼트 편집기가 속성 값을 수동으로 입력하는 것을 원하지 않을 때 유용합니다. 대신 사용자가 미리 정의된 값 목록에서 값을 선택하기를 원합니다. 세션 속성 어휘는 세그먼트 정의 작업을 용이하게 하고 수동 입력 오류를 제거합니다.

예를 들어 마케팅 팀은 기기의 브랜드 정보를 사용하여 Apple 기기용 새 앱 홍보와 같이 웹사이트 방문자에게 다양한 콘텐츠를 타겟팅할 수 있습니다. 마케팅 팀의 프로세스를 용이하게 하기 위해 다양한 장치 브랜드를 포함하는 세션 속성 어휘를 생성하고 이 어휘를 [사용자 세그먼트](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)에 연결할 수 있습니다. 이렇게 하면 마케팅 팀이 "장치 브랜드" [세션 속성](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 사용하여 세그먼트를 만들 때 다른 장치 브랜드 옵션을 입력할 필요가 없습니다. 이제 가능한 옵션 목록이 미리 정의되어 있습니다.

![장치 브랜드 세션의 속성에는 미리 정의된 값 목록이 포함되어 있습니다.](./session-property-vocabularies/images/07.png)

다음 세 단계로 세션 속성 어휘를 사용합니다.

1. [세션 기반 세그먼트](#configuring-the-vocabulary-for-the-session-based-segment) 에 대한 어휘를 구성합니다.

1. [세션 속성 어휘 정의](#defining-the-session-property-vocabulary) .

1. [세션 기반 세그먼트](#creating-the-session-based-segment) 을 만듭니다.

## 세션 기반 세그먼트에 대한 어휘 구성

이 어휘(1)에서 정의하는 범주는 세션 속성 [(](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) )를 사용하여 세그먼트를 생성할 때 선택할 수 있는 범주입니다.

![다음은 사용자 세그먼트에 연결하려는 글로벌 어휘에 대한 범주 목록입니다.](./session-property-vocabularies/images/01.png)

![세션 기반 세그먼트에서 사용 가능한 옵션은 글로벌 어휘의 범주에 해당합니다.](./session-property-vocabularies/images/02.png)

새로운 글로벌 어휘를 생성하거나 기존 어휘를 사용할 수 있습니다. 새 어휘를 만들거나 기존 어휘의 범주를 업데이트하려면 [콘텐츠에 대한 범주 및 어휘 정의](./defining-categories-and-vocabularies-for-content.md)을 참조하십시오. 공개 또는 내부 가시성이 [인](./organizing-content-with-categories-and-tags.md#vocabulary-visibility) 를 사용할 수 있습니다. 세션 속성 어휘는 전역 어휘에서만 작동합니다.

```{note}
글로벌 사이트에서만 글로벌 어휘를 생성하고 편집할 수 있습니다.
```

## 세션 속성 어휘 정의

세션 기반 세그먼트 [에 대한 어휘를 구성한 후 어휘를 새 세션 속성 어휘에서 사용 가능한 세션 속성 중](#configuring-the-vocabulary-for-the-session-based-segment) 에 연결해야 합니다.

![세그먼트의 세션 속성과 함께 작동하도록 어휘 구성.](./session-property-vocabularies/images/03.png)

1. 글로벌 메뉴를 클릭하고 **제어판** 탭을 클릭합니다.

1. 구성 섹션에서 **시스템 설정** 을 클릭하십시오.

1. 콘텐츠 및 데이터 섹션에서 **세그먼트** 을 클릭합니다.

1. **세션 속성 어휘** 을 클릭합니다.

1. **추가** 을 클릭하여 새 세션 속성 어휘를 만듭니다.

1. 선택 속성 드롭다운 메뉴에서 속성을 선택합니다.

    ![전역 어휘에 연결할 속성을 선택합니다.](./session-property-vocabularies/images/06.png)

    ```{note}
    다른 세션 속성 어휘에 속하는 속성을 선택할 수 없습니다. 이러한 속성은 회색으로 표시되어 사용할 수 없습니다.
    ```

1. Vocabulary Name 드롭다운 메뉴에서 **Vocabulary** 을 선택합니다.
1. **저장** 을 클릭합니다.

![세션 속성 어휘를 생성하고 저장합니다.](./session-property-vocabularies/images/05.gif)

## 세션 기반 세그먼트 생성

세션 속성 어휘 [ [](#configuring-the-vocabulary-for-the-session-based-segment) ](#defining-the-session-property-vocabulary) 세그먼트를 생성할 수 있습니다. 세그먼트 생성에 대한 자세한 내용은 [사용자 세그먼트 생성 및 관리](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md#creating-user-segments) 을 참조하십시오.

세그먼트의 조건을 정의하고 전역 어휘에 연결된 세션 속성 중 하나를 사용하면 이제 세션 속성에 대한 조건이 사전 정의되며 드롭다운 메뉴에서 선택할 수 있습니다. 이 드롭다운 메뉴는 세션 속성 어휘에서 정의한 어휘 [에 대한 범주 목록에 해당](#defining-the-session-property-vocabulary) .

```{important}
세션 속성 어휘에서 사용자 세그먼트에 연결된 범주 또는 어휘 중 하나를 삭제하면 세그먼트가 정의에 따라 계속 작동합니다. Liferay는 세그먼트 편집기에서 이 상황을 알려줍니다.
```

![Session Property Vocabulary에서 범주 중 하나 또는 어휘가 누락되면 경고 메시지가 나타납니다.](./session-property-vocabularies/images/08.png)

## 관련 정보

- [콘텐츠의 범주 및 어휘 정의](./defining-categories-and-vocabularies-for-content.md)
- [사용자 세그먼트 생성 및 관리](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md#creating-user-segments)
- [세그먼트 편집기 UI 참조](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md)
