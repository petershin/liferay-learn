# 자동 채우기 규칙 사용

_자동 완성_ 규칙은 미리 구성된 조건을 기반으로 양식 필드의 옵션을 필터링합니다. 이미 [데이터 공급자](../data-providers/data-providers-overview.md) 을 활성화한 경우 _자동 채우기_ 규칙은 양식을 향상시키는 다음 단계입니다. 자세한 내용은 [REST 데이터 공급자를 사용하여 양식 옵션 채우기](../data-providers/using-the-rest-data-provider-to-populate-form-options.md) 을 참조하십시오.

아래 샘플 양식은 응답자에게 현금 보상 또는 휴가를 선택하도록 요청합니다. 응답자가 후자를 선택한 경우 지리적 지역을 선택한 다음 국가를 선택해야 합니다. 이 양식은 자동 완성 규칙을 사용하여 지리적 지역을 기반으로 국가를 필터링합니다.

아래 단계를 따르십시오.

1. 지역 필터를 사용하여 전 세계 국가를 가져오는 [데이터 공급자를 구성합니다.](../data-providers/using-the-rest-data-provider-to-populate-form-options.md)
1. [다음 필드를 사용하여 양식](../creating-and-managing-forms/creating-forms.md) 을 만듭니다.

    * _보상_ 이라는 단일 선택 필드와 두 가지 옵션: *현금* 또는 *모든 비용 지급 여행*
    * _지역_이라는 텍스트 필드
    * 목록에서 선택 필드 _은 [restcountries.eu](https://restcountries.eu) 데이터 공급자를 사용하는 목적지 국가 선택_ 을 선택합니다.

## 자동 채우기 규칙 구성

1. _규칙_ 탭을 클릭합니다.

1. *추가* (![Add](../../../images/icon-add.png)) 버튼을 클릭합니다.

1. If 조건에서 _Reward_ 을 선택합니다.

1. 규칙 만들기: _은_ &rarr; _값_ &rarr; _여행 경비_과 같습니다.

1. _Do_ Action 선택기에서 _Autofill_ 을 선택합니다.

1. _From Data Provider_ 선택기에서 데이터 공급자를 선택합니다.

1. _지역_ 선택기에서 _지역_ 을 선택합니다.

1. _국가_ 선택기에서 _국가_ 을 선택합니다.

    ![자동 채우기 규칙을 만듭니다.](./using-the-autofill-rule/images/01.png)

1. 완료되면 _저장_ 을 클릭합니다.

## 자동 채우기 규칙 확인

1. 양식을 게시합니다.

1. 양식이 표시되는 사이트로 이동합니다.

1. 지역 필드에 유효한 지역을 입력하고 목록에서 선택 필드의 옵션이 지역을 기준으로 필터링되는지 확인합니다. <restcountries.com> 서비스에는 아프리카, 아메리카, 아시아, 유럽, 오세아니아 및 북극 지역이 있습니다.

    ![세계 지역별로 국가를 필터링합니다.](./using-the-autofill-rule/images/02.gif)

이제 사용자는 지역을 검색한 다음 양식에서 국가를 검색할 수 있습니다.

## 추가 정보

* [양식 만들기](../creating-and-managing-forms/creating-forms.md)
* [데이터 공급자 개요](../data-providers/data-providers-overview.md)
* [REST 데이터 공급자를 사용하여 양식 옵션 채우기](../data-providers/using-the-rest-data-provider-to-populate-form-options.md)
