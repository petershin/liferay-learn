# 컨테이너에서 스크립트 실행

Tomcat 및 Liferay 파일 설정, arifact 배포 및 패치 적용 외에 Liferay 컨테이너에서 더 많은 작업을 수행하려는 경우 스크립트를 사용할 수 있습니다. 컨테이너는 [수명 주기](./container-lifecycle-and-api.md)의 여러 지점에서 특정 폴더의 스크립트를 검색합니다. 다음 표에서는 스크립트 삽입 지점에 대해 설명합니다.

| 수명 주기 단계 | 묘사                              | 대상 컨테이너 폴더                                 |
|:-------- |:------------------------------- |:------------------------------------------ |
| 사전 구성    | 구성 단계 전에 스크립트 실행                | `/usr/local/liferay/scripts/pre-configure` |
| 형성하십시요   | `번으로 파일 복사 후 실행 [Liferay Home]` | `/mnt/liferay/scripts`                     |
| 사전 시작    | Tomcat을 시작하기 전에 스크립트 실행         | `/usr/local/liferay/scripts/pre-startup`   |
| 종료 후     | Tomcat 종료 후 스크립트 실행             | `/usr/local/liferay/scripts/post-shutdown` |

다음 섹션에서는 위에서 언급한 단계에서 스크립트를 만들고 실행하는 방법을 보여줍니다.

## 구성 단계 중 스크립트 실행

Configure Phase에서 제공하는 것보다 Tomcat 및 Liferay를 구성하는 방법이 더 많은 경우 Configure Phase 스크립트에서 구현하십시오. 구성 단계에 대한 자세한 내용은 [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md#lifecycle) 을 참조하십시오.

바인드 마운트를 사용하여 단계 구성 스크립트를 설정하는 단계는 다음과 같습니다.

1. 로컬 구성 스크립트를 위한 임의의 폴더를 만듭니다.

    ```bash
    mkdir scripts
    ```

    ```{tip}
    이미 [컨테이너의 /mnt/liferay 폴더를 마운트](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 할 계획이라면 구성 단계에 포함할 로컬 마운트 폴더의 `scripts` 폴더에 구성 단계 스크립트를 추가합니다. `[local-folder]/scripts` 폴더는 컨테이너의 `/mnt/liferay/scripts` 폴더에 매핑됩니다.
    ```

1. 사전 구성 작업을 실행하기 위한 스크립트를 생성합니다.

    ```bash
    echo "inside some-pre-configure.sh" > scripts/configure-phase-script.sh
    ```

1. 스크립트의 폴더를 컨테이너의 `/mnt/liferay/scripts` 폴더에 바인딩하는 Docker 컨테이너를 실행합니다.

    ```bash
    docker run -v $(pwd)/scripts:/opt/liferay/scripts ...
    ```

진입점은 파일을 `/mnt/liferay/files` 에 복사한 후 구성 단계에서 스크립트를 실행하고 다음 메시지를 인쇄합니다.

```messages
[LIFERAY] Executing scripts in /mnt/liferay/scripts:

[LIFERAY] Executing configure-phase-script.sh.
in configure-phase-script.sh
```

## 다른 단계에서 스크립트 실행

컨테이너는 구성 단계 외부에서 스크립트를 실행하는 방법도 제공합니다.

| 수명 주기 단계 | 묘사                      | 대상 컨테이너 폴더                                 |
|:-------- |:----------------------- |:------------------------------------------ |
| 사전 구성    | 구성 단계 전에 스크립트 실행        | `/usr/local/liferay/scripts/pre-configure` |
| 사전 시작    | Tomcat을 시작하기 전에 스크립트 실행 | `/usr/local/liferay/scripts/pre-startup`   |
| 종료 후     | Tomcat 종료 후 스크립트 실행     | `/usr/local/liferay/scripts/post-shutdown` |

컨테이너의 `/usr/local/liferay/scripts` 폴더 구조는 다음과 같습니다.

```
/usr/local/liferay/scripts
├───pre-configure
├───pre-startup
└───post-shutdown
```

동일한 구조(아래 참조)로 호스트 폴더를 생성하고 스크립트로 채우면 호스트 폴더를 `/usr/local/liferay/scripts` 폴더에 매핑하여 컨테이너에서 스크립트를 사용할 수 있습니다.

```
[host folder]
├───pre-configure
├───pre-startup
└───post-shutdown
```

위에서 언급한 하위 폴더에 스크립트를 만드는 일반적인 단계는 다음과 같습니다.

1. 스크립트 단계 폴더에 대한 임의의 상위 폴더를 만듭니다.

    ```bash
    mkdir [host-folder]
    ```

1. 스크립트 단계 폴더를 만듭니다.

    ```bash
    cd [host-folder]
    mkdir pre-configure pre-startup post-shutdown
    ```

1. 단계 폴더의 임의 스크립트에서 작업을 구현합니다.

    ```{warning}
    스크립트에서 `exit` 키워드를 사용하지 마세요. 스크립트에서 `exit`를 실행하면 진입점 시작 프로세스가 중단됩니다.
    ```

    ```bash
    echo "inside pre-configure-script.sh" > pre-configure/some-pre-configure-script.sh
    ```

    ```bash
    echo "inside pre-startup-script.sh" > pre-startup/some-pre-startup-script.sh
    ```

    ```bash
    echo "inside some-post-shutdown-script.sh" > post-shutdown/some-post-shutdown-script.sh
    ```

1. 호스트 폴더를 컨테이너의 `/usr/local/liferay/scripts/` 폴더에 바인딩하는 Docker 컨테이너를 실행합니다.

    ```bash
    docker run -v $(pwd)/[host-folder]:/usr/local/liferay/scripts ...
    ```

진입점은 각 단계에서 스크립트를 실행하고 다음과 같은 메시지를 인쇄합니다.

```messages
[LIFERAY] Executing scripts in /usr/local/liferay/scripts/pre-configure:

[LIFERAY] Executing some-pre-configure-script.sh.
inside some-pre-configure-script.sh
```

## 결론

이제 컨테이너 수명 주기의 모든 부분에서 스크립트를 실행하는 방법을 알게 되었습니다.

## 추가 정보

* [Liferay Docker 이미지 사용](../using-liferay-docker-images.md)
* [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md)
* [컨테이너에 파일 제공](./providing-files-to-the-container.md)