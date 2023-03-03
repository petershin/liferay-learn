# 데이터 소스 연결

잘못 구성된 환경 또는 데이터 소스는 Liferay DXP 데이터 소스에 대한 액세스를 방해하거나 방해할 수 있습니다. 다음은 DXP 데이터 소스 문제를 해결하는 방법입니다.

## Analytics Cloud에 대한 네트워크 액세스 없음

허용 목록에 다음 URL을 추가하여 DXP 설치에서 Analytic Cloud 서버에 대한 인터넷 액세스 권한이 있는지 확인하십시오.

* `https://analytics.liferay.com`
* `https://osbasahpublisher-{regionKey}.lfr.cloud`
* `https://osbasahbackend-{regionKey}.lfr.cloud`
* `https://analytics-js-cdn.liferay.com`

```{note}
{regionKey} 은 작업 공간 설정 중 초기 선택을 기반으로 합니다(예: ac-southamericaeast1, ac-europewest2, ac-europewest3 또는 ac-uswest1).
```

```{important}
기업 인트라넷 사용 분석과 같은 일부 사용 사례의 경우 방문자의 브라우저도 방화벽 뒤에 있습니다. 이 시나리오에서는 본사 네트워크가 위 URL에 대한 아웃바운드 액세스도 허용하는지 확인해야 합니다.
```

## Analytics Cloud에 대한 연결 유효성 검사

다음은 데이터가 Analytics Cloud로 전송되고 있는지 확인하는 데 도움이 되는 몇 가지 유용한 팁입니다.

### 분석 이벤트

분석 이벤트는 클라이언트의 브라우저에서 직접 전송됩니다. 데이터가 Analytics Cloud로 전송되고 있는지 확인하려면 다음 단계를 수행하십시오.

1. 추적 중인 DXP 웹사이트의 페이지 중 하나를 방문하십시오.
1. 브라우저 검사기를 열고 네트워크 탭으로 이동합니다.
1. XHR로 네트워크 탭을 필터링합니다.
1. 페이지를 새로 고칩니다.
1. `osbasahpublisher`로 시작하는 요청이 표시되는지 확인합니다. 요청은 아래 스크린샷과 유사해야 합니다.

    ![Analytics Cloud에 대한 연결을 검증합니다.](connecting-data-sources/images/01.png)

    이 요청을 볼 수 있다면 웹 사이트에서 분석 데이터를 Analytics Cloud 작업 영역으로 보내고 있음을 의미합니다. 요청 페이로드를 확인하고 `channelId`이라는 변수가 있는지 확인합니다.

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

Analytics 이벤트의 경우 10~15분 이내에 사이트 대시보드의 24시간 필터에서 방문자 메트릭을 볼 수 있어야 합니다.

![분석 데이터는 일정 기간 동안 수신됩니다.](connecting-data-sources/images/02.png)

세션 기간, 이탈률 등과 같은 기타 세션 관련 데이터는 방문자 세션이 끝날 때까지 기다려야 합니다. 방문자 세션은 30분 동안 활동이 없을 때 또는 UTC 00:00:00 중 먼저 도래하는 시간에 종료된 것으로 간주됩니다.

개별 프로필은 시간이 지남에 따라 처리하고 사용할 수 있게 되는 데 시간이 더 걸립니다.

## 지원되지 않는 버전

**오류 메시지:** `지원되지 않는 버전. 이 연결 방법은 데이터 소스 Liferay 버전을 지원하지 않습니다. Make sure you are connecting to Liferay 7.0/7.1 instance or try a different method of connection.`

```{important}
Liferay DXP 설치는 다음 수정 팩 최소 요구 사항을 충족해야 합니다.

  * 7.4+
  * 7.3 수정 팩 1
  * 7.2 수정 팩 11
  * 7.1 수정 팩 22
  * 7.0 수정 팩 98
```

**결의안:**

1. [Liferay DXP 7.0 또는 7.1 인스턴스와 연결]해야 합니다.

1. [Liferay DXP 데이터 소스 추가](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md)단계를 따르십시오.

1. 오류가 지속되면 DXP 인스턴스에서 JSON 웹 서비스가 활성화되어 있는지 확인하십시오. 기본적으로 활성화되어 있습니다. [포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JSON) 설정 json.web.service.enabled=false(예: [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 에서 설정)를 사용하여 비활성화한 경우 설정을 삭제하거나 속성 값을 true로 설정합니다.

## 로그인한 사용자가 익명으로 표시됨

[연락처 동기화](../getting-started/syncing-sites-and-contacts.md#syncing-contacts) 일 때 Analytics Cloud는 Liferay DXP 내에 존재하는 사용자 레코드에 의존합니다. 따라서 [싱글 사인온 구성](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/securing-liferay/configuring-sso.html) 또는 [LDAP 디렉토리에 연결](https://learn.liferay.com/dxp/latest/ko/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.html) 을 사용하는 경우 연락처를 Analytics Cloud와 동기화하기 전에 모든 사용자를 Liferay DXP로 가져오거나 매핑해야 합니다.
