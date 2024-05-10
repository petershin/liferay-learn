# A/B 테스트 실행 및 모니터링

A/B 테스트를 실행할 때 다음 매개변수를 구성할 수 있습니다.

**트래픽 분할:** 페이지를 방문할 때 방문자가 원본과 변형 페이지로 무작위로 분할되는 비율입니다. 방문자는 원본과 대안으로 무작위로 나뉘며 A/B 테스트가 완료될 때까지 항상 동일한 페이지가 표시됩니다.

**신뢰도 필요 수준:** 테스트의 정확성을 나타냅니다. 필요한 신뢰 수준이 높을수록 승자를 선언하는 데 시간이 더 오래 걸립니다.

**승자 발표 예상 시간** 은 테스트 기간의 추정치를 제공합니다. 이 추정은 트래픽 분할 및 신뢰 수준 필수 구성과 예상 페이지 트래픽(Analytics Cloud에서 제공하는 트래픽 기록 기반)을 기반으로 합니다.

![A/B Test Run Configurations are tunable to your requirements.](running-and-monitoring-ab-tests/images/01.png)

테스트를 생성한 후 **A/B 테스트**(![A/B 테스트 아이콘](../../../images/icon-ab-testing.png))를 클릭하여 테스트 상태를 검토합니다.

Liferay DXP는 테스트 상태와 테스트 완료 시 승자만 표시합니다. Analytics Cloud에서 A/B 테스트의 다른 측면을 관리할 수 있습니다. 자세한 내용은 Analytics Cloud 설명서의 [A/B 테스팅](https://learn.liferay.com/w/analytics-cloud/optimization/ab-testing) 을 참조하세요.

A/B 테스트가 완료되면 테스트 결과를 검토하고 선호하는 변형을 게시할 수 있습니다. 자세한 내용은 [A/B 테스트 결과 검토 및 테스트 변형 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)를 참조하세요.

## A/B 테스트 실행

```{note}
테스트를 실행하기 전에 A/B 테스트를 생성해야 합니다. 자세한 내용은 [A/B 테스트 만들기](./creating-ab-tests.md)를 참조하세요.
```

1. A/B 테스트를 실행하려는 콘텐츠 페이지로 이동합니다.
1. 컨트롤 메뉴에서 **A/B 테스트** 버튼(![A/B 테스트 아이콘](../../../images/icon-ab-testing.png))을 클릭합니다.
1. 콘텐츠 페이지에 다른 경험이 있는 경우 경험을 선택하세요.
1. **활성 테스트** 섹션에서 **검토 및 테스트 실행** 을 클릭합니다.
1. 선택적으로 테스트에 대한 **트래픽 분할** 및 **신뢰 수준 필요** 설정을 구성합니다.
1. **실행** 을 클릭한 다음 **확인** 을 클릭합니다.

**테스트 종료** 를 클릭하면 언제든지 실행 중인 테스트를 취소할 수 있습니다. A/B 테스트를 삭제하려면 먼저 테스트를 종료해야 합니다.

## 관련 주제

* [A/B 테스팅](./ab-testing.md)
* [A/B 테스트 요구 사항 확인](./verifying-ab-test-requirements.md)
* [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
* [A/B 테스트 결과 검토 및 테스트 변형 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)
