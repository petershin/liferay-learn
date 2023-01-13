# 컨테이너에 파일 제공

Liferay 컨테이너는 제공된 파일을 사용하여 다음 사용 사례를 실행합니다.

* `.properties` 파일 및 `.config` 파일로 Liferay 구성
* 톰캣 구성
* 앱 및 기타 아티팩트 배포
* 패치 도구 업데이트
* 패치 DXP
* 스크립트 실행

모든 사용 사례는 컨테이너가 주요 컨테이너 폴더 내의 특정 폴더에서 파일을 찾을 때 컨테이너 생성 시 트리거될 수 있습니다.

**주요 컨테이너 폴더:**

* `/mnt/liferay`
* `/user/local/liferay/scripts`

[컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md) 은 스캔된 하위 폴더, 컨테이너가 스캔하는 단계 및 해당 파일에 대해 수행되는 작업을 지정합니다.

여러 가지 방법으로 컨테이너에 파일을 제공할 수 있습니다.

**파일을 제공하는 방법:**

* [바인드 마운트](https://docs.docker.com/storage/bind-mounts/)
* [볼륨](https://docs.docker.com/storage/volumes/)
* [`docker cp`사용](https://docs.docker.com/engine/reference/commandline/cp/)

아티팩트 배포 및 `.config` 파일 사용을 제외한 모든 사용 사례는 컨테이너 생성 시 파일을 사용할 수 있도록 해야 합니다. 바인딩 마운트 및 볼륨이 이를 수행합니다. 아티팩트 배포 및 `.config` 파일 적용은 바인드 마운트 및 볼륨을 사용하여 컨테이너 생성 시 또는 `docker cp`사용하여 런타임에 수행할 수 있습니다.

바인드 마운트는 파일을 제공하는 데 볼륨보다 간단하기 때문에 여기 예제에서 사용됩니다. 컨테이너에 탑재할 파일을 준비할 때 관리하기 쉬운 방식으로 파일을 구성하는 것이 좋습니다. Liferay 컨테이너에 대한 바인드 마운팅, 파일 구성 및 `docker cp` 사용은 여기에서 다룹니다.

## 바인드 마운트 형식

`docker run` 명령에 바인드 마운트를 원하는 만큼 지정할 수 있습니다. 각 바인드 마운트는 다음 형식을 따릅니다.

```
-v [source path in host]:[destination path in container]
```

바인드 마운트 소스는 호스트의 모든 폴더 경로 또는 파일 경로일 수 있습니다. 바인드 탑재 대상은 컨테이너의 모든 폴더 경로 또는 파일 경로일 수 있습니다.

## 스캔한 컨테이너 폴더

컨테이너는 이러한 폴더를 스캔합니다.

* `/mnt/liferay/deploy`
* `/mnt/liferay/files` (모든 파일 및 하위 폴더가 검사됨)
* `/mnt/liferay/patching`
* `/mnt/liferay/scripts`
* `/usr/local/liferay/scripts/post-shutdown`
* `/usr/local/liferay/scripts/pre-configure`
* `/usr/local/liferay/scripts/pre-startup`

각 폴더와 관련된 작업 및 사용 사례는 [API](./container-lifecycle-and-api.md#api) 을 참조하십시오.

## 바인드 마운팅을 위한 파일 구성

여러 가지 방법으로 Liferay 컨테이너 바인드 마운트를 구성할 수 있습니다.

* 키 폴더 중 하나 또는 둘 모두에 바인드: `/mnt/liferay` 및 `/usr/local/liferay/scripts`
* 하위 폴더에 바인딩
* 하위 폴더와 파일의 혼합에 바인딩

아래 표는 바인드 마운트 방법의 몇 가지 예를 보여주고 장단점을 설명합니다.

### 바인드 마운트 예

| 방법                            | 예                                                                                                                                                                      | 장점                                      | 단점                                                                               |
|:----------------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:--------------------------------------- |:-------------------------------------------------------------------------------- |
| `/mnt/liferay`에 마운트           | `-v [host-path]:/mnt/liferay`                                                                                                                                          | 입력 파일을 중앙 집중화합니다.                       | 입력 파일은 컨테이너가 예상하는 하위 폴더에 구성되어야 합니다( [위](#scanned-container-folders)에 나열된 위치 참조). |
| `/mnt/liferay` 하위 폴더에 별도로 마운트 | `-v [host-path]/[folder-1]:/mnt/liferay/deploy -v [host-path]/[folder-2]:/mnt/liferay/files`<br><br><br>참고: `[host-path]` 은 동일한 경로이거나 다른 경로일 수 있습니다. | 호스트의 다른 위치에 있는 입력 파일 그룹을 사용할 수 있는 유연성.  | 관리할 더 많은 호스트 파일 위치.                                                              |
| 개별 파일에 마운트                    | `-v [host path]/setenv.sh:/mnt/liferay/files/tomcat/bin/setenv.sh`                                                                                                     | 입력 파일은 `docker run` 명령에서 명확하게 볼 수 있습니다. | 긴 도커 실행 명령. 관리할 더 많은 호스트 파일 위치.                                                  |

컨테이너의 [구성 단계](./container-lifecycle-and-api.md#lifecycle) 에 파일을 제공하는 가장 일반적인 방법은 호스트 폴더를 컨테이너의 `/mnt/liferay` 폴더에 바인딩하는 것입니다.

## 호스트 폴더 마운트를 `/mnt/liferay`에 바인드

Liferay에 대한 구성, 패치 및 배포를 위해 파일을 중앙 집중화하려는 경우 호스트 폴더를 컨테이너의 `/mnt/liferay` 폴더에 바인딩 마운트하는 것을 고려하십시오.

```{note}
사용 사례 문서의 대부분의 예제는 이 바인드 마운트 전략을 사용합니다.
```

단계는 다음과 같습니다.

1. 기본 폴더로 사용할 호스트의 폴더를 지정합니다.

1. 기본 호스트 폴더에서 컨테이너가 작동하는 모든 `/mnt/liferay` 하위 폴더에 해당하는 하위 폴더를 만듭니다. 컨테이너 폴더 세부 정보는 [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md) 을 참조하세요.

    ```bash
    cd [host folder]
    mkdir deploy files patching scripts
    ```

    결과:

    ```
    [host folder]
    ├───deploy
    ├───files
    ├───patching
    └───scripts
    ```

    ```{note}
    모든 하위 폴더를 생성할 필요는 없으며 채우는 폴더만 생성하면 됩니다.
    ```
1. 컨테이너가 작동할 파일로 하위 폴더를 채웁니다.

    예를 들어 [추가 `portal-ext.properties` 파일](./configuring-containers.md#portal-properties) DXP를 구성하고 [보안 수정 팩](./patching-dxp-in-docker.md) 를 추가하여 설치할 수 있습니다.

    결과:

    ```
    [host folder]
    ├───deploy
    ├───files/portal-ext.properties
    ├───patching/[Security Fix Pack file name].zip
    └───scripts
    ```

1. `docker run` 명령에서 기본 호스트 폴더를 컨테이너의 `/mnt/liferay` 폴더에 바인드 마운트합니다.

    ```bash
    docker run -v [host folder path]:/mnt/liferay ...
    ```

[컨테이너 라이프사이클](./container-lifecycle-and-api.md#liferay-phases)에 따라 새 컨테이너는 마운트된 호스트 폴더에 있는(및 그 아래에 중첩된) 파일에 대해 작동한 다음 Tomcat을 시작합니다.

## `docker cp`사용

[`docker cp`](https://docs.docker.com/engine/reference/commandline/cp/) 명령은 애플리케이션, 모듈 및 구성을 Docker 컨테이너에 배포하기 위한 편리한 대안입니다.

```bash
docker cp [file] [container]:[folder path]
```

애플리케이션 배포:

```bash
docker cp some_app.lpkg my_container:/opt/liferay/deploy
```

[구성 파일 배포](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md):

```bash
docker cp com.liferay.journal.configuration.JournalServiceConfiguration.config my_container:/opt/liferay/osgi/configs
```

그러나 macOS에서 `docker cp` 을 사용하면 user/group `liferay`으로 변경되지 않고 파일의 소유권이 보존됩니다. 다음은 몇 가지 해결 방법입니다.

* `docker cp` 명령에 대한 입력으로 `tar` 을 사용하여 파일 소유권 및 권한을 설정합니다. 예를 들면 다음과 같습니다.

    ```bash
    tar -cf - command.sh --mode u=+rwx,g=-wx,o=-wx --owner liferay --group liferay | docker cp - my_container:/usr/local/liferay/scripts/pre-startup
    ```

* `docker cp` 을 사용한 후 컨테이너에서 Bash 세션을 열고 파일의 소유권을 변경합니다.

    ```bash
    docker exec -it my_container bash
    ```

    ```bash
    chown -R liferay:liferay /usr/local/liferay/scripts/pre-startup/command.sh
    ```

## 결론

이제 bind mounts 및 `docker cp` 명령을 사용하여 컨테이너에 파일을 제공하는 방법을 알았습니다. 자세한 내용은 [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md) 을 참조하세요. 사용 사례에 대한 자세한 내용은 다음 문서를 참조하십시오.

* [컨테이너 구성](./configuring-containers.md)
* [컨테이너에 앱 및 기타 아티팩트 설치](./installing-apps-and-other-artifacts-to-containers.md)
* [Docker에서 DXP 패치](./patching-dxp-in-docker.md)