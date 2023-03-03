# A/B 테스트 결과 검토 및 테스트 변형 게시

A/B 테스트가 완료되면 Analytics Cloud 및 Liferay DXP에서 테스트 결과를 확인할 수 있습니다. Analytics Cloud는 테스트 기간 동안 *필수 신뢰 수준*에 도달하면 우승 변형을 선언합니다. 테스트에 필요한 *신뢰 수준*을 구성하는 방법을 이해하려면 [A/B 테스트 만들기](./creating-ab-tests.md)를 참조하세요.

```{tip}
A/B 테스트가 수행될 때 [Liferay에서 알림](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)을 수신합니다. 끝납니다.
```

A/B 테스트 결과를 검토하고 변형을 게시하려면

1. A/B 테스트가 실행 중인 콘텐츠 페이지로 이동합니다.
1. 컨트롤 메뉴에서 *A/B 테스트* 플라스크 아이콘(![A/B 테스트 아이콘](../../../images/icon-ab-testing.png))을 클릭합니다. Liferay DXP 7.3부터 플라스크 아이콘을 통해 A/B 테스트 패널에 액세스하고 [경험 선택 대화 상자](../../personalizing-site-experience/를 통해 경험에 대한 테스트 상태를 볼 수도 있습니다. 경험-개인화/creating-and-managing-experiences.md).
   
1. 콘텐츠 페이지에 대한 다른 경험이 있는 경우 *경험*을 선택합니다.
1. *활성 테스트* 섹션에서 테스트 결과를 검토합니다. 

    * *우승자 선언*: 테스트 변형 중 하나가 필수 신뢰 수준을 충족했습니다.
    * *승자 없음*: 테스트 기간 동안 필요한 신뢰 수준을 충족하는 테스트 변형이 없습니다.
      
      ![A/B 테스트 패널에서 A/B 테스트 결과 검토](reviewing-ab-test-results-and-publishing-test-variants/images/01.png)

1. 변형 섹션에서 다음을 수행할 수 있습니다.

    * *확인 표시로 강조 표시된 우승 변형을 게시* 합니다.
    * *수상하지 못한 변형을* 게시합니다.
    * *테스트*을 버리고 A/B 테스트 권장 사항을 무시하고 현재 콘텐츠 페이지를 유지합니다.
      
      ![우승 변형을 게시하거나 A/B 테스트 결과를 삭제할 수 있습니다.](reviewing-ab-test-results-and-publishing-test-variants/images/02.png) 

    ```{note}
    A/B 테스트 변형 중 하나를 게시하면 변형이 콘텐츠 페이지를 방문하는 모든 사용자에게 활성화됩니다.
    ```

A/B 테스트 패널에서 *Analytics Cloud* 의 데이터 보기 버튼을 클릭하여 Analytics Cloud 대시보드로 이동하고 다른 테스트 통계를 볼 수 있습니다. 자세한 내용은 [A/B 테스트](https://learn.liferay.com/analytics-cloud/latest/ko/optimization/a-b-testing.html) 을 참조하십시오.

## 관련 정보

* [A/B 테스트](./ab-testing.md)
* [A/B 테스트 만들기](./creating-ab-tests.md)
* [A/B 테스트 요구 사항 확인](./verifying-ab-test-requirements.md)
* [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
