# 사이트 및 연락처 동기화

Liferay DXP를 Analytics Cloud [에 연결](./connecting-liferay-dxp-to-analytics-cloud.md)이제 사이트와 연락처를 동기화할 차례입니다.

```{note}
Liferay DXP를 처음 사용하는 경우 Analytics Cloud용 Liferay 인스턴스에 추적을 시작할 콘텐츠가 많지 않습니다. 데모 사이트를 바로 시작하여 Analytics Cloud를 배우고 싶다면 Liferay Commerce의 [Minium Accelerator 사이트](https://learn.liferay.com/commerce/latest/en/starting-a-store/using-the 사용을 고려해 보십시오. -minium-accelerator-to-jump-start-your-b2b-store.html) 샘플 콘텐츠를 생성합니다. 
```

## 사이트 동기화

사이트를 동기화하는 첫 번째 단계는 새 속성을 만드는 것입니다. 속성은 단일 Liferay 사이트 또는 여러 Liferay 사이트와 연결된 레이블입니다. Analytics Cloud는 속성 정의 방법에 따라 데이터를 집계합니다. 이 예는 단일 사이트가 속성과 연결된 간단한 설정을 보여줍니다. 여러 사이트로 속성을 정의하는 방법에 대해 자세히 알아보려면 속성 [을 사용하는 사이트 및 개인 범위 지정을 참조](../workspace-settings/scoping-sites-and-individuals-using-properties.md).

1. Analytics Cloud에서 _Settings_ &rarr; _Properties_로 이동합니다. _New Property_ 을 클릭하고 레이블을 입력합니다. (예: 미니엄 사이트).

2. Liferay DXP 인스턴스에서 전역 메뉴(![Global Menu](../images/icon-applications-menu.png))를 엽니다. _구성_ &rarr; _인스턴스 설정_로 이동합니다. _Platform_아래에서 _Analytics Cloud_을 클릭합니다. _사이트 선택_을 클릭합니다.

3. 방금 만든 속성이 사용 가능한 속성 아래에 나타납니다. 속성 이름을 클릭합니다. 다음 페이지에서 동기화할 사이트를 선택하고 _완료_을 클릭합니다.

   ![동기화할 사이트와 사용 가능한 사이트 목록을 선택합니다.](./syncing-sites-and-contacts/images/02.png)

   동기화에 성공하면 화면 왼쪽 하단에 다음 메시지가 나타납니다.

    `Success: Your request completed successfully`

## 연락처 동기화 중

다음으로 Liferay 인스턴스에 있는 기존 연락처를 동기화합니다.

```{important}
Analytics Cloud는 개별 연락처 데이터를 동기화하고 관리할 수 있는 도구를 제공합니다. 그러나 개인 정보 보호 규정(예: GDPR)을 직접적으로 다루는 것을 포함하여 문서의 여기와 다른 곳에서 논의된 도구는 이러한 개인 정보 보호 규정의 준수를 보장하지 않습니다. 웹사이트에서 개인 데이터를 처리하고 특정 개인 정보 보호법의 관할 아래 있는 각 회사 또는 개인은 이러한 규정을 완전히 준수하는 데 필요한 단계를 신중하게 결정해야 합니다.
```

1. Liferay DXP 인스턴스에서 전역 메뉴(![Global Menu](../images/icon-applications-menu.png))를 엽니다. _구성_ &rarr; _인스턴스 설정_로 이동합니다. _Platform_아래에서 _Analytics Cloud_을 클릭합니다. _연락처 선택_을 클릭합니다.

1. 연락처 동기화 옵션에서 _연락처 동기화_을 클릭합니다. 스위치를 사용하여 _모두 동기화_ 을 활성화하여 모든 연락처를 동기화합니다. 또는 연락처의 하위 집합을 동기화하려면 _사용자 그룹별 동기화_ 또는 _조직별 동기화_ 을 클릭합니다. _저장 후 다음_을 클릭합니다.

1. Liferay DXP는 두 개의 개별 테이블(연락처 및 사용자)에 연락처 데이터를 저장합니다. _연락처_ 탭과 _사용자_ 탭 사이를 전환하여 동기화할 필드를 선택합니다. Analytics Cloud는 일부 필드를 동기화해야 하므로 회색으로 표시됩니다. 이 예에서는 기본 선택을 유지합니다. _저장_을 클릭합니다.

    ![목록에서 동기화할 필드를 선택합니다.](./syncing-sites-and-contacts/images/03.png)

    동기화에 성공하면 화면 왼쪽 하단에 다음 메시지가 나타납니다.

    `Success: Your request completed successfully`

좋습니다. 이제 모든 설정이 완료되었습니다. 사용자가 사이트를 방문하고 사이트와 상호 작용하면 Analytics Cloud가 무슨 일이 일어나고 있는지 추적하기 시작합니다. 그런 일이 발생하면 추적되는 다양한 상호 작용을 확인하기 위해 [분석 대시보드 보기](././viewing-the-analytics-dashboard.md) 을 자세히 살펴볼 수 있습니다.
