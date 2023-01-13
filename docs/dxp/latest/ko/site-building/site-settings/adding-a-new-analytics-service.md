# 새 분석 서비스 추가

Liferay DXP에는 사이트의 트래픽을 분석하기 위한 Google Analytics 및 Piwik에 대한 지원이 포함되어 있습니다. 다른 분석 서비스가 필요한 경우 사이트에 추가할 수 있습니다. 새 분석 서비스를 활성화하려면 다음 단계를 따르십시오.

## 새 분석 서비스 추가

1. [글로벌 메뉴](../../getting-started/navigating-dxp.md) ( ![Global Menu icon](../../images/icon-applications-menu.png) )를 열고 *제어판* &rarr; *인스턴스 설정*로 이동합니다.

1. *Platform* 제목 아래에서 *Analytics* 을 선택합니다.

1. 제공된 *Analytics* 필드에 추가하려는 추가 서비스의 이름을 입력하십시오.

    ![Instance Settings를 통해 추가 분석 서비스를 입력할 수 있습니다.](./adding-a-new-analytics-service/images/01.png)

## Analytics 서비스에 대한 추적 코드 추가

1. 이름을 입력했으면 사이트 메뉴를 열고 분석을 추가하려는 사이트의 *구성* &rarr; *설정* &rarr; *고급* &rarr; *분석* 페이지로 이동합니다.

    ```{note}
    Liferay DXP 7.1 및 7.2에서는 대신 사이트 메뉴에서 *구성* → *사이트 설정* → *고급* → *분석*으로 이동합니다.
    ```

1. 분석 플랫폼에서 제공하는 JavaScript 추적 코드를 서비스의 해당 필드에 복사하십시오.

    ![사이트의 고급 구성 설정 아래에 새 분석 서비스가 나타납니다.](./adding-a-new-analytics-service/images/02.png)

이제 선택한 사이트의 모든 페이지에 추적 스크립트가 포함되어 분석 데이터를 분석 플랫폼으로 보냅니다.
