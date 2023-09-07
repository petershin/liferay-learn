---
toc:
  - ./using-liferay-docker-images/container-lifecycle-and-api.md
  - ./using-liferay-docker-images/configuring-containers.md
  - >-
    - ./using-liferay-docker-images/licensing-dxp-in-docker.md
    - ./using-liferay-docker-images/patching-dxp-in-docker.md
    - ./using-liferay-docker-images/running-scripts-in-containers.md
    - ./using-liferay-docker-images/providing-files-to-the-container.md
    - ./using-liferay-docker-images/upgrading-to-a-new-docker-image.md
    - ./using-liferay-docker-images/docker-image-versions.md
---
# Liferay 도커 이미지 사용

```{toctree}
:maxdepth: 3

using-liferay-docker-images/container-lifecycle-and-api.md
using-liferay-docker-images/configuring-containers.md
using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md
using-liferay-docker-images/licensing-dxp-in-docker.md
using-liferay-docker-images/patching-dxp-in-docker.md
using-liferay-docker-images/running-scripts-in-containers.md
using-liferay-docker-images/providing-files-to-the-container.md
using-liferay-docker-images/upgrading-to-a-new-docker-image.md
using-liferay-docker-images/docker-image-versions.md
```

도커 허브는 [Liferay DXP](https://hub.docker.com/r/liferay/dxp) 및 [Liferay 포털](https://hub.docker.com/r/liferay/portal) 도커 이미지를 리눅스 톰캣과 함께 번들로 호스팅합니다. Liferay 도커 허브 페이지에서는 다양한 릴리스에 대한 이미지 세부 정보 및 태그를 제공합니다.

* [Liferay DXP 이미지](https://hub.docker.com/r/liferay/dxp)
* [라이프레이 포털 이미지](https://hub.docker.com/r/liferay/portal)

이러한 컨테이너는 시작 및 중지할 수 있는 표준 Docker 컨테이너입니다. 다음 예제에서는 [도커 CLI (`도커`)](https://docs.docker.com/engine/reference/commandline/docker/) 를 사용하지만, 원하는 도커 컨테이너 도구를 사용할 수 있습니다.

## 처음으로 컨테이너 시작하기

컨테이너는 포트 `8080` 에서 수신 대기하며 모든 Docker 컨테이너와 마찬가지로 시작됩니다.

1. [호스트 포트(예: `8080`)를 컨테이너의 `8080` 포트에 매핑하는 컨테이너](https://docs.docker.com/engine/reference/commandline/run/) 를 실행합니다.

    ```bash
    docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
    ```

    컨테이너가 실행되고 이 Tomcat 시작 완료 메시지를 포함한 로그 메시지를 인쇄합니다:

    ```
    INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [xx,xxx] milliseconds
    ```

    ```{note}
    메모리, CPU 및 기타 Docker 컨테이너 리소스를 구성할 수 있습니다. 위의 `-m 8g` 명령 인수는 컨테이너의 메모리 제한을 8기가바이트로 설정합니다. 자세한 내용은 [Docker 런타임 옵션](https://docs.docker.com/config/containers/resource_constraints/) 을 참조하세요.
    ```

1. 이메일 주소 **test@liferay.com** 및 비밀번호 **test** 를 사용하여 Liferay( `<http://localhost:8080>` )에 로그인합니다. 메시지가 표시되면 비밀번호를 변경합니다.

    ![라이프레이의 랜딩 페이지입니다.](./using-liferay-docker-images/images/01.png)

Liferay를 사용할 준비가 되었습니다.

```{note}
도커 컨테이너 ls`는 실행 중인 컨테이너의 ID와 이름을 포함하여 각 컨테이너를 나열합니다. docker container ls -a`는 실행 중이 아닌 컨테이너를 포함하여 모든 컨테이너를 나열합니다.
```

## 로그 보기

라이프레이 로그 메시지와 로그 파일은 실시간으로 확인하거나 호스트에 복사할 수 있습니다.

### `도커 로그` 명령

[`docker logs`](https://docs.docker.com/engine/reference/commandline/logs/) 명령은 컨테이너 로그 메시지를 인쇄합니다.

| 명령                           | 결과                                     |
|:---------------------------- |:-------------------------------------- |
| `docker logs [container]`    | 현재 모든 로그 메시지를 출력합니다.                   |
| `docker logs -f [container]` | `tail -f [file]` 처럼 새 로그 메시지를 스트리밍합니다. |
| `docker logs -t [container]` | 각 로그 메시지에 타임스탬프를 추가합니다.                |

### `도커 cp` 명령

아래와 같이 [`docker cp`](https://docs.docker.com/engine/reference/commandline/cp/) 명령을 사용하여 로그 파일을 호스트 머신에 복사할 수 있습니다.

```bash
docker cp [container]:/opt/liferay/logs/liferay.[timestamp].log .
```

## 컨테이너 중지

다음은 컨테이너를 중지하는 두 가지 방법입니다.

| 방법 | 장점 | 단점 |
| :----- | :--- | :--- |
| `docker exec [컨테이너] /opt/liferay/tomcat/bin/shutdown.sh` | Liferay, Tomcat 및 기타 앱에서 리소스를 확보할 수 있습니다. 컨테이너 진입점은 [종료 후 스크립트](./using-liferay-docker-images/container-lifecycle-and-api.md#post-shutdown-phase-api) 를 실행합니다. | |
| `-i` 인수로 실행 중인 터미널 세션의 `Ctrl-C`.<br><br>참고: 연결된 컨테이너에 [`SIGINT` 또는 `SIGKILL` 신호](https:/ /docs.docker.com/engine/reference/commandline/attach/#extended-description) . | 컨테이너를 중지하는 가장 빠른 방법입니다. | Liferay, Tomcat 및 컨테이너 진입점은 리소스를 해제하지 않고 즉시 중지됩니다. 진입점의 [종료 후 단계](./using-liferay-docker-images/container-lifecycle-and-api.md#post-shutdown-phase-api) 를 건너뜁니다. 프로덕션 환경에서는 이 방법을 사용하지 마십시오. |

## 컨테이너 다시 시작

컨테이너는 모든 Docker 컨테이너와 마찬가지로 다시 시작할 수 있습니다.

```bash
docker start [container]
```

```{warning}
컨테이너가 다시 시작되면 해당 엔트리 포인트가 다시 실행됩니다( [컨테이너 라이프사이클 및 API](./using-liferay-docker-images/container-lifecycle-and-api.md#lifecycle) 를 참조하세요). 엔트리 포인트를 통해 [실행 중인 스크립트](./using-liferay-docker-images/running-scripts-in-containers.md)가 안전하게 다시 실행될 수 있는지 확인합니다.
```

```{tip}
도커 컨테이너 ls -a`를 실행하여 컨테이너의 이름 또는 ID를 조회합니다.
```

이제 라이프레이 컨테이너 시작, 중지, 모니터링에 대한 기본 사항을 알아보았습니다.

## 다음 단계

컨테이너 엔트리 포인트의 기능을 알고 컨테이너의 API를 배우려면 [컨테이너 라이프사이클 및 API](./using-liferay-docker-images/container-lifecycle-and-api.md)를 참조하세요. 컨테이너 사용을 시작하려면 다음 사용 사례 중 하나를 실행해 보세요:

* [컨테이너 구성](./using-liferay-docker-images/configuring-containers.md)
* [컨테이너에 앱 및 기타 아티팩트 설치하기](./using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md)
* [도커에서 DXP 패치 적용](./using-liferay-docker-images/patching-dxp-in-docker.md)
* [컨테이너에 파일 제공](./using-liferay-docker-images/providing-files-to-the-container.md)
* [새 Docker 이미지로 업그레이드하기](./using-liferay-docker-images/upgrading-to-a-new-docker-image.md)
* [도커 이미지 버전](./using-liferay-docker-images/docker-image-versions.md)
