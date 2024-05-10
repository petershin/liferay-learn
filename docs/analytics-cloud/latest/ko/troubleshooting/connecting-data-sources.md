# 데이터 소스 연결

잘못 구성된 환경이나 데이터 소스는 Liferay DXP 데이터 소스에 대한 액세스를 방해하거나 방해할 수 있습니다. DXP 데이터 소스 문제를 해결하는 방법은 다음과 같습니다.

## Analytics Cloud에 대한 네트워크 액세스가 없습니다.

허용 목록에 다음 URL을 추가하여 DXP 설치가 Analytic Cloud 서버에 인터넷으로 액세스할 수 있는지 확인하십시오.

* `https://analytics.liferay.com`
* `https://osbasahpublisher-{regionKey}.lfr.cloud`
* `https://osbasahbackend-{regionKey}.lfr.cloud`
* `https://analytics-js-cdn.liferay.com`

```{note}
 {regionKey} 작업 공간 설정 중 초기 선택(예: ac-southamericaeast1, ac-europewest2, ac-europewest3 또는 ac-uswest1)을 기반으로 합니다.
```

```{important}
기업 인트라넷 사용량 분석과 같은 일부 사용 사례의 경우 방문자의 브라우저도 방화벽 뒤에 있습니다. 이 시나리오에서는 회사 네트워크가 위 URL에 대한 아웃바운드 액세스도 허용하는지 확인해야 합니다.
```

## Analytics Cloud에 대한 연결 검증

다음은 데이터가 Analytics Cloud로 전송되고 있는지 확인하는 데 도움이 되는 몇 가지 유용한 팁입니다.

### 분석 이벤트

Analytics 이벤트는 클라이언트의 브라우저에서 직접 전송됩니다. 데이터가 Analytics Cloud로 전송되고 있는지 확인하려면 다음 단계를 수행하십시오.

1. 추적 중인 DXP 웹사이트 페이지 중 하나를 방문하세요.
1. 브라우저 검사기를 열고 네트워크 탭으로 이동합니다.
1. XHR을 기준으로 네트워크 탭을 필터링합니다.
1. 페이지를 새로 고칩니다.
1. `osbasahpublisher`로 시작하는 요청이 표시되는지 확인하세요. 요청은 아래 스크린샷과 유사해야 합니다.

   ![Validating the connection to Analytics Cloud.](connecting-data-sources/images/01.png)

   이 요청을 볼 수 있다면 웹사이트가 분석 데이터를 Analytics Cloud 작업 공간으로 보내고 있다는 의미입니다. 요청 페이로드를 확인하고 'channelId'라는 변수가 있는지 확인하세요.

### 연락처 데이터

DXP는 로그인한 사용자의 연락처 정보를 개별 프로필 데이터로 Analytics Cloud에 전송합니다. 이 데이터는 DXP 서버에서 직접 전송됩니다.

연락처 데이터가 전송되고 있는지 확인하려면 DXP 서버 로그에서 다음과 유사한 메시지를 확인하십시오.

```
INFO  [liferay/analytics_messages_processor-1][AddAnalyticsMessagesMessageListener:70] Added 500 analytics messages

INFO  [liferay/analytics_messages_processor-1][AddAnalyticsMessagesMessageListener:70] Added 500 analytics messages

INFO  [liferay/scheduler_dispatch-3][SendAnalyticsMessagesMessageListener:149] Sent 100 analytics messages

INFO  [liferay/scheduler_dispatch-3][SendAnalyticsMessagesMessageListener:164] Deleted 100 analytics messages
```

이러한 서버 로그가 표시되면 연락처 데이터가 AC로 성공적으로 전송되고 있는 것입니다.

## 데이터 처리 시간

데이터가 Analytics Cloud에 도착하면 작업 공간 대시보드에 표시되기 전에 처리하는 데 추가 시간이 걸립니다.

Analytics 이벤트의 경우 10~15분 내에 사이트 대시보드의 24시간 필터에서 방문자 측정항목을 확인할 수 있습니다.

![Analytics Data coming in over a period of time.](connecting-data-sources/images/02.png)

세션 기간, 이탈률 등과 같은 기타 세션 관련 데이터는 방문자 세션이 끝날 때까지 기다려야 합니다. 방문자 세션은 30분 동안 활동이 없거나 UTC 00:00:00 중 먼저 도래하는 시점에 종료된 것으로 간주됩니다.

개별 프로필은 처리하는 데 더 오랜 시간이 걸리고 시간이 지남에 따라 사용할 수 있게 됩니다.

## 지원되지 않는 버전

**오류 메시지:** `지원되지 않는 버전입니다. 이 연결 방법은 데이터 소스 Liferay 버전을 지원하지 않습니다. Liferay 7.0/7.1 인스턴스에 연결하고 있는지 확인하거나 다른 연결 방법을 시도해 보십시오.`

```{important}
Liferay DXP 설치는 다음 수정팩 최소 요구 사항을 충족해야 합니다.

  * 7.4+
  * 7.3 수정팩 1
  * 7.2 수정팩 11
  * 7.1 수정팩 22
  * 7.0 수정팩 98
```

**해결:**

1. [Liferay DXP 7.0 또는 7.1 인스턴스와 연결]을 확인하세요.

1. [Liferay DXP 데이터 소스를 추가하는 단계를 따르세요](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md).

1. 오류가 지속되면 DXP 인스턴스에서 JSON 웹 서비스가 활성화되어 있는지 확인하세요. 기본적으로 활성화되어 있습니다. [포털 속성](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 설정 json.web.service.enabled=false(예: [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 에서 설정)를 사용하여 비활성화한 경우 해당 설정을 삭제하거나 속성 값을 true로 설정하세요.

## 로그인한 사용자가 익명으로 표시됨

[연락처 동기화](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) 인 경우 Analytics Cloud는 Liferay DXP 내에 존재하는 사용자 기록에 의존합니다. 따라서 [싱글 사인온 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso) 또는 [LDAP 디렉토리에 연결](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory) 사용하는 경우 Analytics Cloud와 연락처를 동기화하기 전에 모든 사용자를 Liferay DXP로 가져오거나 매핑해야 합니다.

## 사용자 동기화에 시간이 오래 걸림

Liferay DXP의 배치 엔진은 사용자 동기화에 사용됩니다. 매우 많은 수의 사용자를 동기화하는 경우 배치 크기를 늘리십시오. Liferay DXP에서 **글로벌 메뉴** &rarr; **인스턴스 설정** &rarr; **배치 엔진** 으로 이동합니다. **내보내기 배치 크기** 및 **가져오기 배치 크기** 를 '1000'으로 설정하세요.

![Increase batch size in Liferay DXP.](./connecting-data-sources/images/03.png)
