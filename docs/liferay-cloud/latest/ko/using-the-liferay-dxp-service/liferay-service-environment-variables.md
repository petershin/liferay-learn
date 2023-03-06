# Liferay 서비스 환경 변수

Liferay 서비스에는 서비스, 다른 서비스에 대한 연결 및 DXP 설치 자체를 구성하는 데 사용되는 [범위의 환경 변수](#environment-variables-reference) 이 있습니다. Liferay Cloud 관련 환경 변수를 사용하거나 DXP [포털 속성](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) 을 재정의하는 변수를 정의할 수 있습니다.

## 포털 속성 재정의

Liferay 서비스의 환경 변수를 사용하여 일반적으로 포털 속성 파일에 정의된 구성을 재정의할 수 있습니다.

[포털 속성 문서](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) 을 확인하여 각 해당 포털 속성에 대한 환경 변수 이름("Env")을 찾으십시오. 예를 들어 포털 속성 `company.default.time.zone` 을 환경 변수 `LIFERAY_COMPANY_PERIOD_DEFAULT_PERIOD_TIME_PERIOD_ZONE`으로 재정의할 수 있습니다.

Liferay 서비스에 추가하는 방법에 대한 자세한 내용은 [환경 변수 정의](../reference/defining-environment-variables.md) 을 참조하십시오.

### 포털 속성 이름을 환경 변수로 변환

[포털 속성 설명서](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) 에 포털 속성의 직접 번역이 없는 경우 속성을 재정의 환경 변수로 직접 변환할 수도 있습니다.

포털 속성을 재정의하는 환경 변수:

* 숫자로 시작하면 안 됩니다.

* 앞에 접두사 `LIFERAY_` 을 추가해야 합니다.

* 대문자, 숫자 및 밑줄(`_`) 문자로만 구성되어야 합니다. 이 제약 조건에 맞지 않는 모든 문자는 해당하는 [`CharPool`](https://docs.liferay.com/dxp/portal/7.3-latest/javadocs/modules/core/petra/com.liferay.petra.string/) 또는 [유니코드](https://unicode-table.com/en/) 끝점(10진수로 변환)으로 변환되어야 합니다.

이러한 요구 사항을 충족하려면 포털 속성을 이 형식으로 변환해야 합니다. 이렇게 하면 Liferay Cloud가 전체 이름을 올바르게 인식하고 해당 포털 속성과 일치시킬 수 있습니다.

다음 단계를 사용하여 포털 속성 이름을 환경 변수 이름으로 변환합니다.

1. 문자, 숫자 또는 밑줄(마침표 포함)이 아닌 이름에 포함된 모든 문자를 해당 [`CharPool`](https://docs.liferay.com/dxp/portal/7.3-latest/javadocs/modules/core/petra/com.liferay.petra.string/) 또는 유니코드 끝점으로 변환하고 밑줄로 묶습니다.

    예를 들어 마침표(`.`)를 `_PERIOD_`또는 `_46_` (유니코드를 사용하는 경우)로 변환합니다.

1. 변수 이름의 시작 부분에 접두사 `LIFERAY_` 을 추가합니다.

1. 모든 문자를 대문자로 변환합니다.

예를 들어 포털 속성 이름 `setup.wizard.enabled`을 가져온 다음 `CharPool` 끝점을 사용하여 이름이 `LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED`인 환경 변수로 변환할 수 있습니다.

## 환경 변수 참조

다음 환경 변수는 환경 변수 UI 또는 Liferay 서비스의 `LCP.json` 파일을 통해 설정할 수 있습니다.

| 이름                                     | 기정값                    | 묘사                                                                                                                               |
|:-------------------------------------- |:---------------------- |:-------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_DATABASE_PORT`                    | `3306`                 | readOnly 사용자가 사용하는 데이터베이스 포트 구성을 설정합니다. 정의된 경우 `DATABASE_SERVICE_PORT` 인프라 환경 변수를 재정의합니다.                                        |
| `LCP_LIFERAY_JDBC_CONNECTION_URL`      |                        | 데이터베이스 연결을 만드는 데 사용되는 URL입니다. 데이터베이스 이름과 호스트를 직접 설정하는 데 사용할 수 있습니다. 값은 `jdbc:mysql://`로 시작해야 합니다.                                |
| `LCP_LIFERAY_JDBC_DRIVER`              |                        | Liferay 서비스가 사용하는 MySQL 드라이버를 지정할 수 있습니다. DXP 버전 7.0 및 7.1에서는 클러스터 구성에도 사용됩니다.                                                   |
| `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED`  | `여실한`                  | 노드 간 클러스터링 및 통신을 활성화할지 여부입니다.                                                                                                    |
| `LCP_PROJECT_MONITOR_DYNATRACE_TENANT` |                        | Dynatrace SaaS 계정의 URL(접두사)의 일부인 문자열입니다. 이것을 `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` 비밀과 함께 사용하십시오.                                |
| `LIFERAY_JVM_OPTS`                     | `-Xms4096m -Xmx12288m` | 기본 권장 옵션을 재정의하기 위해 `CATALINA_OPTS` 에 추가되는 JVM 옵션입니다. 권장 사항은 `-Xms` 을 Liferay 서비스의 사용 가능한 메모리의 25%로 설정하고 `-Xmx` 을 75%로 설정하는 것입니다. |

```{note}
여전히 `3.xx` 버전 서비스를 사용 중인 경우 `LIFERAY_JVM_OPTS` 대신 `LIFERAY_JAVA_OPTS`를 사용하여 JVM 옵션을 지정하십시오. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

### 비밀

대신 이러한 변수는 Liferay 서비스에 대한 Secrets</a> 로 정의된

이어야 합니다.</p> 

| 이름                                           | 기정값 | 묘사                                                                                                        |
|:-------------------------------------------- |:--- |:--------------------------------------------------------------------------------------------------------- |
| `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN`        |     | **Dynatrace 계정에서 찾을 수 있는 일련의 문자열 Dynatrace 배포** &rarr; **설치 시작** &rarr; **PaaS 모니터링 설정** &rarr; **설치 프로그램 다운로드** . |
| `LCP_SECRET_DATABASE_NAME`                   |     | 데이터베이스 연결(jdbc, jdbc ping 및 읽기 전용 사용자 연결)에 사용되는 데이터베이스 이름입니다.                                             |
| `LCP_SECRET_DATABASE_PASSWORD`               |     | jdbc(및 jdbc ping) 구성에만 사용되는 데이터베이스 비밀번호입니다.                                                               |
| `LCP_SECRET_DATABASE_READONLY_USER`          |     | 읽기 전용 사용자의 사용자 이름입니다.                                                                                     |
| `LCP_SECRET_DATABASE_READONLY_USER_PASSWORD` |     | 읽기 전용 사용자의 암호입니다.                                                                                         |
| `LCP_SECRET_DATABASE_USER`                   |     | 기본 데이터베이스 사용자의 사용자 이름입니다. jdbc 및 jdbc ping 연결에 사용됩니다.                                                     |
