# 활성화-비활성화 규칙 사용

활성화/비활성화 규칙은 하나 이상의 조건에 따라 필드를 편집 가능하게 만듭니다. 선택적 정보를 입력하거나 특정 그룹에 속하는 사용자만 데이터를 수집할 때 유용합니다. 예를 들어, 야영장이나 병원에서는 사람들에게 치료에 영향을 미칠 수 있는 약물이나 알레르기를 나열하도록 요청할 수 있습니다. 이 필드는 사용자가 예를 선택한 경우에만 편집할 수 있습니다.

이 예를 계속하여 다음 필드가 있는 등록 양식을 가정합니다.

* **약을 복용하고 있습니까?** : 두 가지 옵션이 있는 필수 단일 선택 필드: **예** 및 **아니오** .
* **모든 약물 목록** : 텍스트 필드 요소.

활성화/비활성화 규칙 구성:

1. **규칙** 탭을 클릭합니다.
1. 추가(![Add](../../../images/icon-add.png)) 버튼을 클릭합니다.
1. 선택 **약을 복용하고 있습니까? 조건 드롭다운 메뉴에서** .
1. 조건 만들기: **은** &rarr; **값** &rarr; **예** 과 같습니다.
1. 작업 드롭다운 메뉴에서 **활성화** 을 선택합니다.
1. 선택 **모든 약물 목록** .

    ![조건에 따라 활성화-비활성화 규칙을 만듭니다.](./using-the-enable-disable-rule/images/01.png)

1. 완료되면 **저장** 을 클릭합니다.

활성화 규칙이 생성되었으며 사용자는 예를 선택한 경우에만 필드를 편집할 수 있습니다. 그렇지 않으면 필드가 회색으로 표시됩니다.

![사용자가 아니오를 선택하면 필드가 비활성화됩니다.](./using-the-enable-disable-rule/images/02.png)

응답자가 예라고 답한 경우 필드를 편집할 수 있습니다.

![사용자가 예를 선택하면 필드가 활성화됩니다.](./using-the-enable-disable-rule/images/03.png)

## 관련 주제

* [양식 만들기](../creating-and-managing-forms/creating-forms.md)
* [양식 규칙 개요](./form-rules-overview.md)
* [요구 규칙 사용](./using-the-require-rule.md)
* [활성화 규칙 사용](./using-the-enable-disable-rule.md)
* [페이지로 이동 규칙 사용](./using-the-jump-to-page-rule.md)
* [자동 채우기 규칙 사용](./using-the-autofill-rule.md)
* [계산 규칙 사용](./using-the-calculate-rule.md)
