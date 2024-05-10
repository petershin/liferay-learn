# A/B 테스트 결과 검토 및 테스트 변형 게시

A/B 테스트가 완료되면 Analytics Cloud 및 Liferay DXP에서 테스트 결과를 확인할 수 있습니다. Analytics Cloud는 테스트 기간 동안 **필요한 신뢰 수준** 이 달성되면 승자를 선언합니다. 테스트에 필요한 신뢰도 수준을 구성하는 방법을 이해하려면 [A/B 테스트 만들기](./creating-ab-tests.md)를 참조하세요.

```{tip}
A/B 테스트 시 [Liferay의 알림](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)을 받습니다. 끝납니다.
```

A/B 테스트 결과를 검토하고 변형을 게시하려면

1. A/B 테스트가 실행 중인 콘텐츠 페이지로 이동합니다.

1. 제어 메뉴에서 **A/B 테스트** 플라스크 아이콘(![A/B 테스트 아이콘](../../../images/icon-ab-testing.png))을 클릭합니다.

1. 콘텐츠 페이지에 다른 경험이 있는 경우 **경험** 을 선택하세요.

1. **활성 테스트** 섹션에서 테스트 결과를 검토합니다.

   * **승자 선언** : 신뢰 수준 요구 사항이 충족되었습니다.
   * **승자 없음** : 테스트 기간 동안 신뢰 수준 요구 사항이 충족되지 않았습니다.

   ![Review A/B Test Results from the A/B Test panel](reviewing-ab-test-results-and-publishing-test-variants/images/01.png)

1. 변형 섹션에서 다음을 수행할 수 있습니다.

   * 확인 표시로 강조 표시된 변형을 **게시** 하세요.
   * **테스트 취소** - A/B 테스트 권장 사항을 무시하고 현재 콘텐츠 페이지를 유지합니다.

     ![You can publish the winning Variant or discard the A/B Test results.](reviewing-ab-test-results-and-publishing-test-variants/images/02.png)

   ```{note}
   A/B 테스트 변형을 게시하면 콘텐츠 페이지를 방문하는 모든 사용자에 대해 변형이 활성화됩니다.
   ```

A/B 테스트 패널에서 **Analytics Cloud에서 데이터 보기** 버튼을 클릭하면 Analytics Cloud 대시보드로 이동하여 다른 테스트 통계를 볼 수 있습니다. 자세한 내용은 [A/B 테스팅 분석](https://learn.liferay.com/w/analytics-cloud/optimization/ab-testing) 을 참조하세요.

## 관련 주제

* [A/B 테스팅](./ab-testing.md)
* [A/B 테스트 만들기](./creating-ab-tests.md)
* [A/B 테스트 요구 사항 확인](./verifying-ab-test-requirements.md)
* [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
