# A/B 테스트 실행 및 모니터링

A/B 테스트를 실행할 때 다음 매개변수를 구성할 수 있습니다.

- *트래픽 분할*: 페이지를 방문할 때 변형 간에 임의로 분할된 방문자의 비율입니다. 방문자는 변형에 무작위로 할당되며 A/B 테스트가 완료될 때까지 항상 동일한 변형을 봅니다.
- *필요한 신뢰 수준*: 테스트의 정확도를 나타냅니다. 필요한 신뢰 수준이 높을수록 우승 변형을 선언하는 데 더 오래 걸립니다.

승자 선언 *예상 시간* 은 예상 테스트 기간을 제공합니다. 이 추정은 *트래픽 분할* 및 *신뢰 수준 필수* 구성과 예상 페이지 트래픽(Analytics Cloud에서 제공하는 트래픽 기록 기반)을 기반으로 합니다.

![A/B 테스트 실행 구성은 요구 사항에 맞게 조정할 수 있습니다.](running-and-monitoring-ab-tests/images/01.png)

테스트를 생성한 후 *A/B Testing* 버튼(![A/B Test icon](../../../images/icon-ab-testing.png))을 클릭하여 테스트 상태 및 완료 및 종료된 A/B 테스트 기록을 검토합니다. Liferay DXP 7.3부터는 경험 선택 대화 상자 [를 통해 경험에 대한 A/](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)테스트 상태를 볼 수도 있습니다.

Liferay DXP는 테스트가 완료될 때 테스트의 상태와 우승 변형만 표시합니다. Analytics Cloud에서 A/B 테스트의 다른 측면을 관리할 수 있습니다. 자세한 내용은 Analytics Cloud 설명서의 [A/B 테스트](https://learn.liferay.com/analytics-cloud/latest/ko/optimization/a-b-testing.html) 을 참조하십시오.

A/B 테스트가 완료되면 테스트 결과를 검토하고 선호하는 테스트 변수를 게시할 수 있습니다. 자세한 내용은 [A/B 테스트 결과 검토 및 테스트 변수 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)을 참조하십시오.

## A/B 테스트 실행

```{note}
테스트를 실행하기 전에 A/B 테스트를 만들고 변형을 테스트해야 합니다. 자세한 내용은 [A/B 테스트 만들기](./creating-ab-tests.md)를 참조하세요.
```

1. A/B 테스트를 실행할 콘텐츠 페이지로 이동합니다.
1. 컨트롤 메뉴에서 *A/B Testing* 버튼(![A/B Test icon](../../../images/icon-ab-testing.png))을 클릭합니다.
1. 콘텐츠 페이지에 대한 다른 경험이 있는 경우 해당 경험을 선택하십시오.
1. *활성 테스트* 섹션에서 *검토 및 테스트 실행*을 클릭합니다.
1. 필요에 따라 테스트에 대해 *트래픽 분할* 및 *신뢰 수준 필수* 설정을 구성합니다.
1. *실행* 을 클릭한 다음 *확인*을 클릭하십시오.

*Terminate Test*을 클릭하여 언제든지 실행 중인 테스트를 취소할 수 있습니다. 완료되거나 취소된 테스트 기록은 기록 탭에서 사용할 수 있습니다. A/B 테스트를 삭제하려면 먼저 테스트를 종료해야 합니다.

## 관련 정보

- [A/B 테스트](./ab-testing.md)
- [A/B 테스트 요구 사항 확인](./verifying-ab-test-requirements.md)
- [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
- [A/B 테스트 결과 검토 및 테스트 변형 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)
