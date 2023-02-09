# 양식 만들기

_Forms_ 애플리케이션으로 다중 필드 양식을 만들 수 있습니다. 필수 프로세스 자동화 권한 [이 있는 인증된 사용자만](./forms-permissions-reference.md) 을 만들 수 있습니다. 최소한 _사이트 관리_ 메뉴 및 _Forms_ 애플리케이션에 액세스할 수 있는 권한이 있어야 합니다.) DXP 역할 및 권한에 대한 자세한 내용은 [역할 및 권한](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)을 참조하십시오.

![양식은 기본적으로 목록 형식으로 표시됩니다.](./creating-forms/images/01.png)

## 양식 작성

아래 샘플은 호텔 투숙객 피드백 설문 양식입니다.

1. _제품 메뉴_ (![Product Menu](../../../images/icon-product-menu.png))을 연 다음 _사이트 관리_ 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다. 양식을 만들 사이트를 선택합니다.
1. _콘텐츠 & 데이터_  &rarr; _양식_를 클릭합니다.
1. _추가_ 버튼(![Add](../../../images/icon-add.png))을 클릭합니다. 양식 작성기 보기가 나타납니다.
1. 양식의 이름을 입력합니다: **Guest Feedback Survey**.
1. 짧은 설명을 입력합니다.
1. 페이지 이름을 입력합니다. 그렇지 않으면 기본값인 _Untitled Page (1 of X)_을 사용합니다.
1. _추가_ 버튼(![Add](../../../images/icon-add.png))을 클릭하여 _요소 추가_ 사이드바를 표시합니다(아직 열리지 않은 경우).

    ![양식 양식을 만들 때 9가지 필드 유형 중에서 선택할 수 있습니다.](./creating-forms/images/02.png)

1. _목록_ 에서 선택 필드를 양식 작성기로 드래그합니다.
1. 다음 값을 입력합니다.

    * **레이블**: _호텔 방문을 평가하십시오._
    * **도움말 텍스트**: 지금은 공백으로 두십시오. 추가 지침을 제공하기 위해 해당 분야의 부제목을 원하는 경우 유용할 것입니다.
    * **필수 필드** 선택기에서 토글을 _예_ 로 전환합니다.
    * 선택 목록을 작성하기 위해 수동 옵션을 선택된 상태로 두십시오. 필드를 데이터 공급자로 채우는 방법에 대해 알아보려면 [Data Providers](../data-providers/using-the-rest-data-provider-to-populate-form-options.md)을 참조하십시오.

1. _옵션_ 섹션에서 설문 조사 질문에 대한 값을 입력합니다.

    * **훌륭한**
    * **좋은**
    * **중립적**
    * **나쁜**

    ```{note}
    필드 중 하나를 입력하면 다른 빈 선택 줄이 자동으로 추가됩니다. 완료되면 마지막 하나를 비워 두십시오.
    ```

    ![목록 옵션에서 선택](./creating-forms/images/03.png)

1. 텍스트 필드와 같은 추가 요소를 추가하려면 _Select from List_ 요소 아래에 _Text Field_ 요소를 끌어다 놓습니다.
1. _텍스트 필드_의 _기본_ 탭에서 다음을 입력합니다.

    * **라벨**: *댓글*
    * **도움말 텍스트**: 공백으로 두십시오.
    * **필드 유형**: 더 긴 주석을 허용하려면 _여러 줄_ 라디오 버튼을 클릭합니다.
    * **필수 필드:** 토글을 _NO_로 둡니다.

1. 사이드바를 닫습니다.
1. 양식을 초안으로 저장하려면 _양식_ 저장을 클릭하십시오.

### 양식 페이지 추가

양식에 여러 페이지가 적합하다고 판단되면 Liferay Forms는 다중 페이지 양식을 지원합니다.

양식 페이지를 추가하려면

1. 양식 작성기 보기로 이동합니다.
1. 첫 번째 양식 페이지 하단에 있는 _새 페이지_ 버튼을 클릭합니다.

    ![양식 페이지를 추가할 수 있습니다.](./creating-forms/images/06.png)

1. 새 양식 페이지는 양식 작성기 하단(성공 페이지 앞)에 추가됩니다.
1. 페이지 이름을 입력합니다.
1. 추가 요소를 끌어다 놓습니다.
1. 필요한 경우 더 많은 페이지를 추가하십시오.

Liferay 7.3에서는 기존 양식 페이지를 재정렬할 수 있습니다. 양식 작성기에서 페이지 오른쪽 모서리에 있는 위쪽 또는 아래쪽 화살표를 클릭합니다.

![양식 페이지를 재정렬할 수 있습니다.](./creating-forms/images/13.png)

### 성공 페이지 추가

_성공 페이지_ 은 양식 제출자가 양식 끝에 도달했고 양식이 성공적으로 제출되었음을 알려줌으로써 양식 제출자에게 해결 방법을 제공합니다.

기본 성공 페이지는 편리합니다.

![기본 성공 페이지는 양식 제출이 성공했음을 나타내는 명확한 표시기를 제공합니다.](./creating-forms/images/08.png)

성공 페이지를 원하지 않으면 기본 성공 페이지에서 작업(![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 _Remove Success Page_를 선택합니다.

성공 페이지를 사용자 지정하려면

1. Title 필드(기본적으로_Thank You_ )를 클릭하고 편집기 상자를 사용합니다.
1. 메시지 필드(기본적으로_Your information was..._ )를 클릭하고 편집기를 사용하여 성공 메시지를 사용자 지정합니다.

![기본 성공 페이지는 사용자 정의할 수 있습니다.](./creating-forms/images/12.png)

### 양식 게시

양식을 작성했으면 _게시_ 버튼을 클릭하여 대상 고객에게 공개합니다.

양식을 게시하면 양식을 작성하기 위해 사용자에게 보낼 수 있는 URL이 생성됩니다.

![양식이 게시되면 공유할 수 있는 URL이 생성됩니다.](creating-forms/images/11.png)

자세한 내용은 [양식 공유](../sharing-forms-and-managing-submissions/sharing-forms.md) 을 참조하십시오.

## 양식 복제

양식을 처음부터 작성하지 않고도 유사한 양식을 작성하기 위해 양식을 복제할 수 있습니다. 양식을 복제하려면 다음 단계를 따르십시오.

1. _사이트 관리_ &rarr; _콘텐츠 & 데이터_ &rarr; _양식_로 이동합니다.
1. 원본 양식 옆에 있는 _작업_ 버튼(![Actions](../../../images/icon-actions.png))을 클릭합니다.

    ![양식 복제](./creating-forms/images/10.png)

1. _복제_을 클릭합니다.

이렇게 하면 원래 설문 조사 양식의 사본이 생성됩니다. 사용자는 복제 양식 수정을 시작할 수 있습니다.

![복제 양식 생성](./creating-forms/images/05.png)

## 다음

* [양식 공유](../sharing-forms-and-managing-submissions/sharing-forms.md)
* [양식 항목 관리](../sharing-forms-and-managing-submissions/managing-form-entries.md)
* [텍스트 및 숫자 필드 항목 유효성 검사](./validating-text-and-numeric-field-entries.md)
* [양식 제출 시 CAPTCHA 활성화](../sharing-forms-and-managing-submissions/enabling-captcha-on-form-submissions.md)
* [양식 구성 참조](./forms-configuration-reference.md)
