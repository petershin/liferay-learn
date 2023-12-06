# A/B 테스트 만들기

A/B 테스트를 만들기 전에 다음 사항을 기억하세요.

- 기본 경험 또는 세그먼트에 매핑된 개인화된 경험에 대한 테스트를 만들 수 있습니다.
- 한 번에 한 페이지 또는 경험에 대해서만 A/B 테스트를 생성할 수 있습니다.
- 실행 중인 A/B 테스트의 일부인 경험은 편집할 수 없습니다.
- 이미 활성 A/B 테스트가 실행 중인 경험에 대해서는 테스트를 생성할 수 없습니다.
- A/B 테스트의 일부인 콘텐츠 페이지 또는 경험을 삭제하면 테스트도 삭제됩니다.
* [테스트를 실행](./running-and-monitoring-ab-tests.md)하지 않고 A/B 테스트 측면 패널을 닫으면 테스트가 초안으로 저장됩니다.

  ![When you configure a test without running it, the test is saved as a draft](./creating-ab-tests/images/05.png)

A/B 테스트를 만들려면 먼저 [테스트를 생성](#creating-the-test) 한 다음 [테스트 변형](#creating-the-test-variant) 을 생성하세요.

```{important}
테스트를 생성하기 전에 A/B 테스트를 위한 환경이 [요구 사항을 충족](./verifying-ab-test-requirements.md)하는지 확인하세요.
```

## 테스트 만들기

1. 테스트하려는 콘텐츠 페이지로 이동합니다.

1. 컨트롤 메뉴에서 **A/B 테스트**(![A/B 테스트 아이콘](../../../images/icon-ab-testing.png))를 클릭합니다.

1. **테스트 만들기** 를 클릭하세요.

   ![Click Create Test to get started.](./creating-ab-tests/images/04.png)

1. **테스트 이름** 을 입력하고 선택적으로 **설명** 을 입력합니다.

1. 테스트를 통해 추적할 목표를 선택하세요.

   - **이탈률** : 방문하고 아무런 활동(예: **클릭** 또는 **스크롤**)을 나타내지 않고 다른 페이지를 방문하지 않고 다른 페이지로 이동하는 방문자의 비율입니다.
   - **클릭수** : 세션당 페이지를 클릭한 사람의 비율입니다.

1. 테스트를 **초안**(아직 방문자에게 표시되지 않음)으로 저장하려면 **저장** 을 클릭하세요.

   ```{note}
   A/B 테스트 이름 옆에 있는 *작업* 버튼을 클릭하면 언제든지 새 A/B 테스트를 편집하거나 삭제할 수 있습니다. 삭제된 테스트는 복구할 수 없습니다(즉, 휴지통으로 보내지지 않음). 활성 실행 중인 테스트에는 이러한 옵션을 사용할 수 없습니다.
   ```

## 테스트 변형 만들기

테스트 변형은 A/B 테스트를 통해 최적화하려는 경험을 사용자 정의한 것입니다. 각 A/B 테스트는 하나의 변형을 지원합니다.

1. 콘텐츠 페이지에 대한 A/B 테스트 사이드바 패널을 엽니다.

1. A/B 테스트에 대해 **클릭** 목표를 선택한 경우 테스트하려는 요소도 선택해야 합니다.
   1. **활성 테스트** 탭과 **목표 클릭** 섹션에서 **클릭 가능한 요소 선택** 을 클릭하세요.

      - **클릭** 목표에 대한 요소 ID를 사용하여 링크, 버튼 및 입력 필드를 타겟팅할 수 있습니다.
      - 테스트하려는 요소의 **요소 ID** 를 입력할 수도 있습니다.
      - 선택한 페이지 요소를 강조 표시하려면 미리 보기(![Preview](../../../images/icon-preview.png)) 아이콘을 클릭하세요.
      * [테스트 실행 중](./running-and-monitoring-ab-tests.md) 중에는 **클릭 가능한 요소 변경** 버튼을 사용할 수 없으며 **요소 ID** 를 변경할 수 없습니다.

      ![Click the Content Page Element you want to test or enter its Element ID in the Click Goal section](./creating-ab-tests/images/03.png)

   1. 콘텐츠 페이지에서 테스트하려는 요소를 클릭합니다.

   1. **요소를 클릭 대상으로 설정** 을 클릭합니다.

      ![Click the Set Element as Click Target button to select it](./creating-ab-tests/images/01.png)

      ```{note}
      클릭 대상 요소는 전체 A/B 테스트에 적용되며 변형에 존재해야 합니다.
      ```

1. **변형** 섹션에서 **변형 생성** 을 클릭합니다.

1. 변형 이름을 입력하고 **저장** 을 클릭합니다.

1. 변형 이름 옆에 있는 **편집**(![아이콘 편집](../../../images/icon-edit.png)) 버튼을 클릭합니다. 현재 콘텐츠 페이지가 변형의 기준으로 편집 모드에서 열립니다.

1. 테스트하려는 변경사항으로 변형을 수정하세요. 예를 들어 다양한 클릭 유도 문구 텍스트를 테스트하려면 버튼을 새 텍스트로 업데이트하세요.

1. **변형 저장** 을 클릭하세요.

테스트 및 테스트 변형을 만든 후 [테스트를 실행](./running-and-monitoring-ab-tests) 할 수 있습니다.

## 관련 주제

* [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
* [A/B 테스팅](./ab-testing.md)
* [A/B 테스트 결과 검토 및 테스트 변형 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)
