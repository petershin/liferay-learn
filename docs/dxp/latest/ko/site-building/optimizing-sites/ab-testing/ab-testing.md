# A/B 테스트

> Liferay DXP 7.2 SP1+에서 사용할 수 있습니다.

A/B 테스트를 사용하면 다양한 사용자에 대한 변형을 테스트하여 콘텐츠의 가장 효과적인 버전을 결정할 수 있습니다. 대부분의 방문자는 페이지의 현재 콘텐츠와 디자인을 보는 반면 일부 그룹은 대안 *변형*을 봅니다. 그런 다음 현재 페이지와 변형의 성능을 테스트하여 이탈률 ** 또는 *클릭률*과 같이 특정 목표에 대해 더 나은 성능을 보이는 버전을 결정할 수 있습니다.

다음 예를 고려하십시오. 은행의 마케팅 팀은 새 신용 카드를 광고하는 콘텐츠 페이지를 만듭니다. 이 페이지는 몇 주 동안 게시되었지만 재설계하면 새 신용 카드를 더 잘 홍보하는 데 도움이 될 수 있습니다. 마케팅 팀은 A/B 테스트를 사용하여 방문자에게 무작위로 새 페이지 변형을 테스트하여 각 페이지 버전의 클릭률을 비교할 수 있도록 합니다. 새 변형이 원본 페이지보다 더 효과적인 경우 이를 게시하고 원본 페이지를 교체할 수 있습니다.

![A/B 테스트를 사용하여 서로 다른 두 가지 행동 유도 버튼의 효율성 비교](./ab-testing/images/01.png)

A/B 테스트를 실행하려면 Liferay DXP 인스턴스 [이 Liferay Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html) 에 연결되어 있어야 합니다. 프로세스는 다음과 같습니다.

* Liferay DXP에서 A/B 테스트를 만듭니다.
* A/B 테스트는 Analytics Cloud와 자동으로 동기화됩니다.
* Liferay DXP 또는 Analytics Cloud에서 A/B 테스트를 시작하거나 종료합니다.
* Liferay DXP 및 Analytics Cloud는 테스트가 완료되면 테스트 상태와 우승 변형을 보여줍니다.
* Analytics Cloud에서 A/B 테스트의 다른 측면(테스트 기록, 통계, 변수 비교 등)을 관리합니다.

Analytics Cloud에서 A/B 테스트 작업에 대한 자세한 내용은 [A/B 테스트](https://learn.liferay.com/analytics-cloud/latest/ko/optimization/a-b-testing.html) 을 참조하십시오.

## 관련 정보

- [A/B 테스트 요구 사항 확인](./verifying-ab-test-requirements.md)
- [A/B 테스트 만들기](./creating-ab-tests.md)
- [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
- [A/B 테스트 결과 검토 및 테스트 변형 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)
