# 라이프레이 서비스 환경 변수

Liferay 서비스에는 [범위의 환경 변수](#environment-variables-reference) 가 있으며, 이 변수는 서비스 구성, 다른 서비스와의 연결 및 DXP 설치 자체에 사용됩니다. Liferay Cloud 전용 환경 변수를 사용하거나 DXP [포털 속성](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) 을 재정의하는 변수를 정의할 수 있습니다.

## 포털 속성 재정의

Liferay 서비스에서 환경 변수를 사용하여 일반적으로 포털 속성 파일에 정의된 구성을 재정의할 수 있습니다.

[포털 속성 설명서](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) 에서 각 포털 속성에 해당하는 환경 변수 이름("Env")을 확인하세요. 예를 들어, 포털 속성 `company.default.time.zone` 을 환경 변수 `LIFERAY_COMPANY_PERIOD_DEFAULT_PERIOD_TIME_PERIOD_ZONE`으로 재정의할 수 있습니다.

[환경 변수 정의하기](../reference/defining-environment-variables.md) 를 참조하여 Liferay 서비스에 환경 변수를 추가하는 방법에 대해 자세히 알아보세요.

### 포털 속성 이름을 환경 변수로 변환하기

[포털 속성 문서](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) 에 포털 속성의 직접 번역이 없는 경우 속성을 재정의 환경 변수로 직접 변환할 수도 있습니다.

포털 속성을 재정의하는 환경 변수:

* 숫자로 시작하지 않아야 합니다.

* 접두사 `LIFERAY_` 가 앞에 추가되어야 합니다.

* 대문자, 숫자, 밑줄(`_`) 문자로만 구성되어야 합니다. 이 제약 조건에 맞지 않는 문자는 해당 [`CharPool`](https://docs.liferay.com/dxp/portal/7.3-latest/javadocs/modules/core/petra/com.liferay.petra.string/) 또는 [유니코드](https://unicode-table.com/en/) 엔드포인트(십진수로 변환)로 변환해야 합니다.

이러한 요구 사항을 충족하려면 모든 포털 속성을 이 형식으로 변환해야 합니다. 이렇게 하면 Liferay Cloud가 전체 이름을 올바르게 인식하고 해당 포털 속성과 일치시킬 수 있습니다.

포털 속성 이름을 환경 변수 이름으로 변환하려면 다음 단계를 따르세요:

1. 이름에 포함된 문자, 숫자 또는 밑줄(마침표 포함)이 아닌 모든 문자를 해당 [`CharPool`](https://docs.liferay.com/dxp/portal/7.3-latest/javadocs/modules/core/petra/com.liferay.petra.string/) 또는 유니코드 엔드포인트로 변환하고 밑줄로 묶습니다.

    예를 들어 마침표 문자(`.`)를 `_PERIOD_`또는 `_46_` (유니코드를 사용하는 경우)로 변환합니다.

1. 변수 이름 시작 부분에 접두사 `LIFERAY_` 을 추가합니다.

1. 모든 문자를 대문자로 변환합니다.

예를 들어, 포털 속성 이름 `setup.wizard.enabled`을 `CharPool` 엔드포인트를 사용하여 환경 변수 이름으로 변환할 수 있습니다: `liferay_setup_period_wizard_period_enabled`.

## 환경 변수 참조

다음 환경 변수는 환경 변수 UI 또는 Liferay 서비스의 `LCP.json` 파일을 통해 설정할 수 있습니다:

| 이름                                     | 기정값                    | 묘사                                                                                                                             |
|:-------------------------------------- |:---------------------- |:------------------------------------------------------------------------------------------------------------------------------ |
| `LCP_DATABASE_PORT`                    | `3306`                 | 읽기 전용 사용자가 사용하는 데이터베이스 포트 구성을 설정합니다. `DATABASE_SERVICE_PORT` 인프라 환경 변수가 정의되어 있는 경우 이 변수를 재정의합니다.                               |
| `LCP_LIFERAY_JDBC_CONNECTION_URL`      |                        | 데이터베이스 연결에 사용된 URL입니다. 데이터베이스 이름과 호스트를 직접 설정하는 데 사용할 수 있습니다. 값은 `jdbc:mysql://`로 시작해야 합니다.                                     |
| `LCP_LIFERAY_JDBC_DRIVER`              |                        | Liferay 서비스에서 사용하는 MySQL 드라이버를 지정할 수 있습니다. DXP 버전 7.0 및 7.1에서는 클러스터 구성에도 사용됩니다.                                                |
| `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED`  | `true`                 | 클러스터링 및 노드 간 통신을 활성화할지 여부입니다.                                                                                                  |
| `LCP_PROJECT_MONITOR_DYNATRACE_TENANT` |                        | Dynatrace SaaS 계정의 URL(접두사)의 일부인 문자 문자열입니다. `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` 시크릿과 함께 사용하세요.                               |
| `LIFERAY_JVM_OPTS`                     | `-Xms4096m -Xmx12288m` | 기본 권장 옵션을 재정의하기 위해 `CATALINA_OPTS` 에 추가될 JVM 옵션입니다. 권장 사항은 `-Xms` 을 Liferay 서비스 사용 가능한 메모리의 25%로 설정하고 `-Xmx` 을 75%로 설정하는 것입니다. |

### 비밀

이러한 변수는 대신 Liferay 서비스에 대해 [를 비밀](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md) 로 정의해야 합니다:

| 이름                                           | 기정값 | 묘사                                                                                       |
|:-------------------------------------------- |:--- |:---------------------------------------------------------------------------------------- |
| `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN`        |     | **에서 찾을 수 있습니다. Dynatrace 배포** &rarr; **설치 시작** &rarr; **PaaS 모니터링 설정** &rarr; **설치 프로그램 다운로드** . |
| `LCP_SECRET_DATABASE_NAME`                   |     | 데이터베이스 연결에 사용되는 데이터베이스 이름(jdbc, jdbc ping 및 읽기 전용 사용자 연결)입니다.                            |
| `LCP_SECRET_DATABASE_PASSWORD`               |     | jdbc(및 jdbc ping) 구성에만 사용되는 데이터베이스 비밀번호입니다.                                              |
| `LCP_SECRET_DATABASE_READONLY_USER`          |     | 읽기 전용 사용자의 사용자 이름입니다.                                                                    |
| `LCP_SECRET_DATABASE_READONLY_USER_PASSWORD` |     | 읽기 전용 사용자의 비밀번호입니다.                                                                      |
| `LCP_SECRET_DATABASE_USER`                   |     | 기본 데이터베이스 사용자의 사용자 이름입니다. jdbc 및 jdbc 핑 연결에 사용됩니다.                                       |
