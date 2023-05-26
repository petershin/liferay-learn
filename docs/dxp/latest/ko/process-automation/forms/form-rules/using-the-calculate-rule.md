# 계산 규칙 사용

사용자는 다른 필드를 기반으로 해당 값을 계산하여 숫자 필드를 채우는 계산 규칙을 만들 수 있습니다. 예를 들어 계산 규칙은 참석자 수와 등록비(각각 $130인 17명)를 곱하여 캠프 또는 컨퍼런스의 총 등록 비용을 계산할 수 있습니다.

```{important}
계산은 숫자 필드로 제한됩니다.
```

이 예에는 3개의 숫자 필드가 있는 양식이 있습니다.

* **참석자 수** : 숫자 필드.
* **등록비** : 사전 정의된 값 [150의](../creating-and-managing-forms/providing-help-text-and-predefined-values.md) 이 있는 숫자 필드.
* **합계** : 합계가 표시되는 숫자 필드입니다.

## 계산 규칙 구성

계산은 내장된 계산기를 사용하여 정의됩니다. 숫자 필드 값, 수학 연산자 및 상수를 혼합하여 사용하여 계산 규칙을 정의합니다.

아래 단계를 따르십시오.

1. **규칙** 탭을 클릭합니다.
1. 추가(![Add](../../../images/icon-add.png)) 버튼을 클릭합니다.
1. **If** 드롭다운 메뉴에서 **참석자 수** 을 선택합니다.
1. 조건을 만듭니다: **은** &rarr; **값** &rarr; **0** 보다 큽니다.
1. **Do** 드롭다운 메뉴에서 **Calculate** 을 선택합니다.
1. **결과를 표시할 필드 선택** 드롭다운 메뉴에서 **합계** 을 선택합니다.
1. 포함된 계산기를 사용하여 (**NumberofAttendees*RegistrationFee**) 을 입력합니다.

    ![두 필드를 곱하여 등록 합계를 계산합니다.](./using-the-calculate-rule/images/01.png)

1. 완료되면 **저장** 을 클릭합니다.

계산 규칙이 생성되었습니다.

![두 필드를 곱하여 등록 합계를 계산합니다.](./using-the-calculate-rule/images/02.png)

## 관련 주제

* [양식 만들기](../creating-and-managing-forms/creating-forms.md)
* [양식 규칙 개요](./form-rules-overview.md)
* [양식에 미리 정의된 값 제공](../creating-and-managing-forms/providing-help-text-and-predefined-values.md)
