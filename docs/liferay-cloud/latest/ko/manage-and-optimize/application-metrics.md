# 애플리케이션 지표

Liferay Cloud의 내장 모니터링을 통해 각 환경 서비스에서 사용하는 리소스를 추적할 수 있습니다. 이러한 애플리케이션 메트릭에는 메모리 및 CPU 사용량과 네트워크 데이터 전송이 포함됩니다. 웹 서버, Liferay, 검색, 데이터베이스 및 백업과 같은 기본 Liferay 클라우드 스택 서비스에 대한 지표를 사용할 수 있습니다.

## 서비스 팝오버

환경의 **개요** 및 **서비스** 페이지와 개별 서비스 페이지를 포함하여 Liferay Cloud 환경의 여러 페이지에서 서비스의 현재 리소스 사용량을 빠르게 확인할 수 있습니다. 서비스 아이콘 위로 마우스를 가져가면 서비스의 리소스 사용량 팝오버를 볼 수 있습니다.

![서비스 아이콘 위로 마우스를 가져갑니다.](./application-metrics/images/01.png)

## 확장된 애플리케이션 메트릭

사용자는 **모니터링** 페이지에서 확장된 서비스 메트릭을 볼 수 있습니다.

1. 환경 메뉴에서 **모니터링** 을 클릭합니다.
1. 드롭다운 메뉴를 사용하여 모니터링할 서비스 및 기간을 선택합니다.

![Liferay Cloud를 사용하여 서비스를 모니터링할 수 있습니다.](./application-metrics/images/02.png)

사용자는 **서비스** 페이지에서 확장된 서비스 메트릭을 볼 수도 있습니다.

1. 환경 메뉴에서 **서비스** 을 클릭합니다.

1. 모니터링하려는 **서비스** 을 클릭합니다.

1. **메트릭** 탭을 클릭합니다.

![서비스 페이지에서 메트릭을 봅니다.](./application-metrics/images/03.png)

## 서비스에 할당된 리소스 결정

서비스의 `LCP.json` 파일 구성은 해당 서비스에 할당된 총 메모리와 CPU를 결정하고 애플리케이션 메트릭은 시간 경과에 따른 리소스 사용량을 보여줍니다.

다음은 `LCP.json` 파일의 `liferay` 서비스에 대한 CPU 및 메모리 할당의 예입니다.

```
"id": "liferay",

"memory": 8192,
"cpu": 8
```

사용자는 Liferay Cloud 콘솔에서 할당된 리소스를 볼 수 있습니다.

![Liferay Cloud 콘솔에서 환경 서비스에 할당된 리소스를 봅니다.](./application-metrics/images/04.png)

## 고급 애플리케이션 지표(프로덕션만 해당)

Liferay Cloud를 사용하면 [Dynatrace의](https://www.dynatrace.com/) 고급 성능 모니터링을 생산 환경과 통합할 수 있습니다.

자세한 내용은 [Dynatrace 제한 사항](../reference/platform-limitations.md#dynatrace) 을 참조하십시오.

### 생산 환경과 Dynatrace 통합

Dynatrace를 통합하려면 다음 단계를 따르십시오.

1. Dynatrace 계정을 만듭니다.

1. Dynatrace 비밀 `토큰` 및 `테넌트` 값을 생성합니다.

1. Dynatrace `토큰` 값을 Liferay 서비스에 대한 [비밀](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md) 으로 추가합니다.

1. Dynatrace `테넌트` Dynatrace 환경 변수를 Liferay 서비스 프로덕션 환경의 `LCP.json` 파일에 추가합니다. 예를 들어:

```json
{
    "environments": {
      "prd": {
        "env": {
          "LCP_PROJECT_MONITOR_DYNATRACE_TENANT": "tot02934"
        }
      }
    }
}
```

| 이름 | 묘사 |
|:-- |:-- |
|    |    |


`LCP_PROJECT_MONITOR_DYNATRACE_TENANT` | Dynatrace SaaS 계정의 URL(접두사)의 일부인 문자열입니다. | `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` | Dynatrace 계정에서 찾을 수 있는 문자열입니다. 토큰을 얻으려면 **Manage** &rarr; **Deploy Dynatrace** &rarr; **Set up PaaS Integration** 로 이동한 다음 환경 ID를 입력하고 **Generate new token** 을 클릭하십시오. |

이러한 값에 대한 자세한 내용은 [공식 Dynatrace 문서](https://www.dynatrace.com/support/help/dynatrace-api/basics/dynatrace-api-authentication/) 를 참조하세요.

### Dynatrace에 액세스

이제 Liferay Cloud 콘솔에서 Dynatrace의 고급 성능 모니터링에 액세스할 수 있습니다.

1. 프로덕션 환경으로 이동합니다.

1. 환경 메뉴에서 **모니터링** 을 클릭합니다.

1. **고급** 탭을 클릭합니다.

1. **Dynatrace 대시보드로 이동** 버튼을 클릭하여 Dynatrace 대시보드에 액세스합니다.
   
   ![Liferay Cloud Console에서 Dynatrace 대시보드에 액세스](./application-metrics/images/05.png)

로그 트레일을 확인하고 맞춤형 대시보드를 생성하려면 Dynatrace 자격 증명으로 로그인하십시오.

## 관련 주제

* [Liferay DXP 서비스 사용](../customizing-liferay-dxp-in-the-cloud.md)
* [실시간 알림](./real-time-alerts.md)
* [할당량](./quotas.md)
