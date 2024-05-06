# 언어 번역 변경

> 사용 가능: Liferay DXP 7.4 U4/Liferay Portal 7.4 GA8.

```{note}
Liferay DXP 7.4 U17/Liferay Portal 7.4 GA17의 가져오기/내보내기 및 필터링 기능
```

언어 재정의 도구를 사용하여 기존 번역을 재정의하거나 새 언어 키 및 번역을 추가합니다. 이러한 재정의는 인스턴스 수준 [구성 범위](./understanding-configuration-scope.md)에서 발생합니다. 이전 Liferay 버전의 경우 [글로벌 언어 번역 재정의](../../liferay-internals/extending-liferay/overriding-global-language-translations-with-language-properties.md)을 참조하십시오.

## 번역 재정의

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. **제어판** &rarr; **구성** &rarr; **언어 재정의** 로 이동합니다.

1. 재정의하려는 번역을 찾으려면 검색 창을 사용하십시오. 예를 들어 제품 메뉴 상단에 있는 `home` 을 재정의하려면 `home`이라는 용어를 검색하십시오.

    ![Language Override UI에서 home이라는 용어를 검색합니다.](./changing-translations-with-language-override/images/01.png)

   검색 표시줄은 선택한 로케일의 번역에 대한 언어 키를 검색합니다. 로케일 선택기를 사용하여 언어를 전환하십시오. 예를 들어 미국 영어 번역 내에서 검색하려면 `en-US` 을 선택합니다.

1. 번역을 찾아 클릭합니다. 새 창이 열립니다. 번역 오른쪽에 있는 **작업**(![Actions icon](../../images/icon-actions.png)) &rarr; **편집** 를 클릭할 수도 있습니다.

1. 재정의하려는 각 언어에 대해 새 번역을 입력합니다. 페이지 하단의 **저장** 을 클릭합니다.

   ![재정의하려는 각 언어에 대해 새 번역을 입력합니다.](./changing-translations-with-language-override/images/02.png)

1. `home` 에 대한 번역이 이제 무시됩니다.

   ![집에 대한 번역이 이제 재정의되었습니다.](./changing-translations-with-language-override/images/03.png)

## 번역 재정의 수정

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. **제어판** &rarr; **구성** &rarr; **언어 재정의** 로 이동합니다.

1. 수정하려는 재정의를 찾으려면 검색 표시줄을 사용하십시오. 재정의가 있는 번역에 대해서만 결과를 필터링하려면 **필터 및 주문** 을 클릭하고 **모든 언어** 을 선택합니다. 또는 **선택한 언어** 을 클릭하여 선택한 로캘 내에서만 재정의를 표시합니다.

   기존 재정의는 각 언어 키 아래에 표시됩니다. 예: "재정의된 언어: en_US, ja_JP".

1. 수정하려는 번역을 선택합니다. 새 창이 열립니다. 번역 오른쪽에 있는 **작업**(![Actions icon](../../images/icon-actions.png)) &rarr; **편집** 를 클릭할 수도 있습니다.

   재정의가 있는 경우 **작업** 아이콘(![Actions icon](../../images/icon-actions.png))에는 번역 재정의를 제거하는 옵션도 있습니다. 팝업 창에서 **모든 번역 재정의 제거** 을 클릭하고 **확인** 을 클릭하여 모든 재정의를 제거합니다. 선택한 로케일에 대체가 존재하는 경우 해당 로케일의 번역만 제거하는 추가 옵션이 있습니다(예: 미국 영어가 선택된 경우 **Remove translation override for en_US**).

   ![작업 아이콘에는 번역 재정의를 제거하는 옵션이 있습니다.](./changing-translations-with-language-override/images/04.png)

1. 변경 사항을 입력하고 페이지 하단에서 **저장** 을 클릭합니다. 모든 재정의를 제거하고 원래 번역으로 되돌리려면 **모든 재정의 지우기** 을 클릭하십시오.

## 언어 키 및 번역 추가

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. **제어판** &rarr; **구성** &rarr; **언어 재정의** 로 이동합니다.

1. **추가**(![Add button](../../images/icon-add.png))을 클릭하면 새 창이 열립니다.

1. 키와 하나 이상의 언어 번역을 입력하십시오. 키의 최대 길이는 1,000자입니다. 완료되면 **저장** 을 클릭합니다.

## 언어 번역 가져오기 및 내보내기

언어 재정의는 언어 속성 파일을 사용하여 쉽게 가져오거나 내보낼 수 있습니다.

### 언어 번역 가져오기

1. 가져오려면 전역 메뉴 아이콘 왼쪽에 있는 **작업**(![Actions icon](../../images/icon-actions.png))을 클릭합니다.

1. **번역 가져오기** 을 선택하면 새 창이 열립니다.

   ![번역 가져오기를 선택하면 새 창이 열립니다.](./changing-translations-with-language-override/images/05.png)

1. 드롭다운 메뉴를 사용하여 언어를 선택합니다.

1. **파일** 선택을 클릭하고 재정의가 포함된 `Language.properties` 파일을 선택합니다. 재정의하려는 각 언어에 대해 별도의 파일을 제공해야 합니다. 각 언어에는 해당 언어에 대한 키가 포함된 자체 [언어 속성 파일](https://github.com/liferay/liferay-portal/tree/master/modules/apps/portal-language/portal-language-lang/src/main/resources/content) 이 있습니다.

1. **저장** 을 클릭하면 이제 재정의가 저장됩니다.

### 언어 번역 내보내기

1. 내보내려면 전역 메뉴 아이콘 왼쪽에 있는 **작업**(![Actions icon](../../images/icon-actions.png))을 클릭합니다.

1. **내보내기** 을 선택하면 재정의가 있는 각 언어에 대한 `Language.properties` 파일이 포함된 ZIP 파일이 다운로드되기 시작합니다.