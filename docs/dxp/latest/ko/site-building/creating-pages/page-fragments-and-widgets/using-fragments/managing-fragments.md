# 조각 관리

Liferay DXP는 Liferay UI에서 조각을 관리하기 위한 도구를 제공합니다. 기본 제공 도구를 사용하면 조각 코드를 빠르게 편집하고 사이트 간 조각 세트 내보내기/가져오기 등을 수행할 수 있습니다.

```{tip}
사이트 간에 조각과 세트를 공유하려면 이를 글로벌 사이트에 추가하거나 내보내기/가져오기 작업을 사용하세요.

ZIP 파일이 있는 경우 조각 세트 및 개별 페이지 조각 내에서 내보내기/가져오기 작업을 사용할 수 있습니다. 또는 LAR 파일이 있는 경우 응용 프로그램 표시줄에 있는 옵션 메뉴에서 내보내기/가져오기 옵션을 사용할 수 있습니다.
```

## 조각 세트 관리

1. **사이트 메뉴**(![사이트 메뉴](../../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다.

1. 원하는 조각 세트를 선택합니다.

1. 세트의 **작업** 버튼(![Actions](../../../../images/icon-actions.png))을 클릭합니다.

   ![Click the fragment set's Actions button to access management options.](./managing-fragments/images/01.png)

1. 작업을 선택하세요:

   **편집** : 조각 세트의 이름이나 설명을 변경합니다.

   **내보내기** : 조각 세트를 '.zip' 파일로 다운로드합니다. 이 파일에는 세트의 '.json', 조각 코드, 리소스가 포함되어 있습니다.

   **가져오기** : 조각과 리소스를 '.zip' 파일로 세트에 업로드합니다. 가져온 조각에 잘못된 규칙이 있으면 초안으로 저장됩니다. 이 가져오기 프로세스는 [페이지 템플릿 가져오기 프로세스](../../adding-pages/exporting-and-importing-page-templates.md#importing-a-page-template) 와 유사하게 작동합니다.

   **삭제** : 현재 조각 세트와 해당 내용을 모두 제거합니다.

```{tip}
여러 세트를 내보내려면 조각 세트 *작업* 버튼(![작업](../../../../images/icon-actions.png))을 클릭하고 *내보내기*를 선택합니다. 그런 다음 내보내려는 세트를 확인하고 *내보내기*를 클릭합니다. 각 세트는 별도의 '.zip' 파일로 다운로드됩니다.
```

## 개별 페이지 조각 관리

1. **사이트 메뉴**(![사이트 메뉴](../../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다.

1. 원하는 조각 세트를 선택합니다.

1. 조각의 **작업** 버튼(![Actions](../../../../images/icon-actions.png))을 클릭합니다.

   ![Click the fragment's Actions button to access fragment management options.](./managing-fragments/images/02.png)

1. 아래에서 작업을 선택하세요.

**편집** : 조각의 코드 또는 구성을 수정합니다.

**썸네일 변경** : 조각의 썸네일 이미지를 변경합니다.

**썸네일 제거** : 조각의 썸네일 이미지를 제거하고 기본 조각 유형 아이콘을 사용합니다.

**이름 바꾸기** : 조각의 이름을 변경합니다.

**캐시 가능으로 표시 또는 표시 해제** : 조각을 캐시 가능으로 표시하거나 표시 해제합니다. 조각이 캐시되면 해당 페이지의 성능이 향상됩니다.

**사용 보기** : 조각이 사용된 페이지를 봅니다. 페이지의 이름, 유형, 버전 및 페이지가 마지막으로 전파된 이후의 시간을 볼 수 있습니다. 페이지를 선택하여 전파할 수도 있습니다.

**내보내기** : 조각을 '.zip' 파일로 다운로드합니다.

**사본 만들기** : 조각을 복제합니다. 중복된 조각은 끝에 (**Copy**) 가 추가되어 동일한 이름을 공유합니다.

**이동** : 조각을 다른 조각 세트로 이동합니다.

**삭제** : 조각을 제거합니다.

```{important}
사용자는 [저장된 조각 구성](./saving-fragment-compositions.md)을 편집하거나 복사할 수 없습니다.
```

## 조각 복사

{bdg-secondary}`Liferay DXP 7.2 SP1+ 및 Liferay Portal 7.2 GA2+의 경우`

1. **사이트 메뉴**(![사이트 메뉴](../../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다.

1. 원하는 조각 세트를 선택합니다.

1. 조각의 **작업** 버튼(![Actions](../../../../images/icon-actions.png))을 클릭하고 **복사 대상** 을 선택합니다.

   ![Click the fragment's Actions button and select Copy To.](./managing-fragments/images/03.png)

1. 조각을 복사하려는 세트를 선택합니다.

```{tip}
사용자는 [기본 조각](./default-fragments-reference.md)을 직접 편집할 수 없습니다. 그러나 기본 조각을 사용자 정의 세트에 복사하고 편집할 수 있습니다.
```

## 관련 주제

[조각 사용](../using-fragments.md)

[조각 구성](./configuring-fragments.md)

[기본 조각 참조](./default-fragments-reference.md)
