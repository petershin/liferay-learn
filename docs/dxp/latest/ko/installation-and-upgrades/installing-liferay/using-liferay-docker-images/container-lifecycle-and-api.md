# 컨테이너 수명 주기 및 API

높은 수준에서 컨테이너는 Liferay가 배포된 Tomcat을 시작합니다. 그러나 컨테이너 진입점은 다음 사용 사례를 실행하기 위한 API를 제공합니다.

* 스크립트 호출
* Tomcat 및 Liferay 구성
* 아티팩트 배포
* 패치 설치
* 패치 도구 업데이트

컨테이너는 이러한 사용 사례를 트리거하고 구성하기 위한 API를 제공합니다. 수명 주기의 여러 단계에서 사용 사례를 실행합니다.

## 라이프사이클

환경에서 컨테이너를 생성한 후 컨테이너 진입점은 해당 환경에서 다음 수명 주기 단계를 실행합니다.

1. **사전 구성:** [Tomcat 및 Liferay를 구성하기 전에 사용자 제공 스크립트](./running-scripts-in-containers.md) 를 실행합니다.
1. **구성:** Tomcat에서 Liferay 실행을 준비합니다.
    1. [Tomcat의 Java 런타임 환경 설정](./configuring-containers.md#jvm-options).
    1. [사용자 제공 파일](./configuring-containers.md) 을 [Liferay Home](../../reference/liferay-home.md)에 복사합니다.
    1. [사용자 제공 스크립트 실행](./running-scripts-in-containers.md).
    1. [사용자 제공 아티팩트 배포](./installing-apps-and-other-artifacts-to-containers.md).
    1. [Patching Tool](./patching-dxp-in-docker.md#updating-the-patching-tool) 을 사용자가 제공한 버전으로 업데이트합니다.
    1. [사용자 제공 패치 설치](./patching-dxp-in-docker.md).
1. **사전 시작:** [Tomcat을 시작하기 전에](./running-scripts-in-containers.md) 사용자 제공 스크립트를 실행합니다.
1. **Tomcat 시작:** Catalina 스크립트를 사용하여 Tomcat을 시작합니다.
1. **종료 후:** [Tomcat이 중지된 후 사용자 제공 스크립트](./running-scripts-in-containers.md) 을 실행합니다.

## API

컨테이너 진입점은 다음 컨테이너 폴더에서 파일을 검색하고 해당 파일을 사용하여 컨테이너, Tomcat 및 Liferay를 구성하고 Liferay에서 작동하도록 합니다.

* `/mnt/liferay`
* `/user/local/liferay/scripts`

```{note}
[bind mounts](https://docs.docker.com/storage/bind-mounts/), [volumes](https://docs.docker.com/)을 사용하는 것을 포함하여 여러 가지 방법으로 이러한 컨테이너 폴더에 파일을 전달할 수 있습니다. storage/volumes/) 및 `docker cp`. 자세한 내용은 [컨테이너에 파일 제공](./providing-files-to-the-container.md)을 참조하세요.
```

위의 키 폴더에는 특정 작업을 위해 지정된 하위 폴더가 있습니다. 하위 폴더, 해당 파일에 대해 수행된 작업 및 관련 사용 사례는 다음 섹션에서 수명 주기 단계 순서로 나열됩니다.

다음 수명 주기 단계는 사용자 제공 파일에 적용됩니다.

* [단계 API 사전 구성](#pre-configure-phase-api)
* [단계 API 구성](#configure-phase-api)
* [사전 시작 단계 API](#pre-startup-phase-api)
* [종료 후 단계 API](#post-shutdown-phase-api)

### 단계 API 사전 구성

| 파일 사이트                                      | 액션              | 사용 사례                                                   |
|:------------------------------------------ |:--------------- |:------------------------------------------------------- |
| `/usr/local/liferay/scripts/pre-configure` | 스크립트를 알파벳순으로 실행 | [구성 단계 이전에 스크립트 실행](./running-scripts-in-containers.md) |

### 단계 API 구성

| 파일 사이트                   | 액션                                                                                                                                                                                                                                                                                  | 사용 사례                                                                                                          |
|:----------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------------------- |
| `/mnt/liferay/files`    | Liferay Home(`/opt/liferay`) 아래의 해당 폴더에 파일 복사                                                                                                                                                                                                                                       | [컨테이너 구성](./configuring-containers.md)<br><br>[Tomcat 구성](./configuring-containers.md#jvm-options) |
| `/mnt/liferay/scripts`  | 스크립트를 알파벳순으로 실행                                                                                                                                                                                                                                                                     | [구성 중 스크립트 실행](./running-scripts-in-containers.md)                                                             |
| `/mnt/liferay/deploy`   | Liferay 시작 시 아티팩트 자동 배포를 위해 `/mnt/liferay/deploy` 을 `/opt/liferay/deploy` 에 심볼릭 링크합니다.<br><br>런타임 시 `/mnt/liferay/deploy`, `/opt/liferay/deploy`또는 두 폴더 중 하나에 마운트된 폴더에 복사된 모든 아티팩트를 자동 배포합니다.<br><br>참고: 자동 배포된 아티팩트는 `/opt/liferay/osgi`아래의 적절한 폴더로 이동됩니다. | [컨테이너에 앱 및 기타 아티팩트 설치](./installing-apps-and-other-artifacts-to-containers.md)                                 |
| `/mnt/liferay/patching` | 패치 도구가 제공되면 설치하십시오. 제공된 모든 패치를 설치합니다.                                                                                                                                                                                                                                               | [Docker에서 DXP 패치](./patching-dxp-in-docker.md)                                                                 |

### 사전 시작 단계 API

| 파일 사이트                                    | 액션              | 사용 사례                                                         |
|:---------------------------------------- |:--------------- |:------------------------------------------------------------- |
| `/usr/local/liferay/scripts/pre-startup` | 스크립트를 알파벳순으로 실행 | [Tomcat을 시작하기 전에 스크립트 실행](./running-scripts-in-containers.md) |

### 종료 후 단계 API

| 파일 사이트                                      | 액션              | 사용 사례                                                     |
|:------------------------------------------ |:--------------- |:--------------------------------------------------------- |
| `/usr/local/liferay/scripts/post-shutdown` | 스크립트를 알파벳순으로 실행 | [Tomcat 종료 후 스크립트 실행](./running-scripts-in-containers.md) |

## 다음

이제 컨테이너 수명 주기 및 API에 익숙해졌으므로 [컨테이너에 파일을 제공](./providing-files-to-the-container.md)하는 가장 좋은 방법을 결정할 수 있습니다. 또는 위의 표에 언급된 사용 사례를 연습할 수 있습니다. 귀하의 편의를 위해 여기에 나열되어 있습니다.

* [컨테이너 구성](./configuring-containers.md)
* [컨테이너에 앱 및 기타 아티팩트 설치](./installing-apps-and-other-artifacts-to-containers.md)
* [Docker에서 DXP 패치](./patching-dxp-in-docker.md)