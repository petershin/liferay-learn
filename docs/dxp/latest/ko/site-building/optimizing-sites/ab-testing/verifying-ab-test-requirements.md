# A/B 테스트 요구 사항 확인

콘텐츠 페이지에서 A/B 테스트를 실행하기 전에 다음 요구 사항이 충족되는지 확인해야 합니다.

- Liferay DXP는 Analytics Cloud에 연결됩니다. 이 연결을 설정하는 방법에 대한 자세한 내용은 [Liferay DXP 사이트를 Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html) 에 연결을 참조하십시오.

- 귀하의 페이지는 [Content Page](../../creating-pages/understanding-pages/understanding-pages.md)입니다. 위젯 페이지는 다른 세그먼트에 대한 경험을 지원하지 않습니다.
- 테스트하려는 콘텐츠 페이지가 게시됩니다.
- 콘텐츠 페이지에서 **업데이트** 권한이 있습니다.

    ![Analytics Cloud용 Liferay DXP 구성에서 사이트 선택](verifying-ab-test-requirements/images/01.png)

    ```{note}
    Analytics Cloud에 대한 연결을 설정할 때 테스트하려는 콘텐츠가 포함된 사이트를 선택해야 합니다. *제어판* → *구성* → *인스턴스 설정* → *Analytics Cloud* → *Analytics Cloud 연결*을 클릭합니다.
    ```

**업데이트** 권한을 확인하거나 구성하려면,

1. **사이트 관리자** &rarr; **사이트 빌더** &rarr; **페이지** 로 이동합니다.
1. 콘텐츠 페이지 옆에 있는 작업 메뉴(![Action Menu](../../../images/icon-actions.png))를 클릭하고 **권한** 를 선택합니다.
1. 콘텐츠 페이지에 대한 액세스 권한이 있어야 하는 역할에 대해 **업데이트** 권한 상자를 선택하거나 확인합니다.
1. **저장** 을 클릭합니다.

## 관련 정보

- [A/B 테스트](./ab-testing.md)
- [A/B 테스트 만들기](./creating-ab-tests.md)
- [A/B 테스트 실행 및 모니터링](./running-and-monitoring-ab-tests)
- [A/B 테스트 결과 검토 및 테스트 변형 게시](./reviewing-ab-test-results-and-publishing-test-variants.md)
