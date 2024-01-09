# 패치 설치

> 가입자

[패치 도구](../reference/installing-the-patching-tool.md) 은 Liferay DXP 7.3 SP3 이전 버전에 대해 수정 팩(보안 수정 팩 및 서비스 팩 포함)을 적용합니다. 또한 모든 DXP 버전에 핫픽스를 적용합니다.

```{note}
Liferay DXP 7.3 SP3+에 업데이트(또는 보안 업데이트)를 적용하는 경우 [Liferay 업데이트](../updating-liferay.md)를 참조하십시오.
```

DXP 번들 및 DXP 애플리케이션 서버 설치의 패치 단계는 비슷합니다. DXP 번들에는 사전 구성된 Patching Tool이 포함되어 있으므로 즉시 패치를 적용할 수 있습니다. 그러나 DXP 응용 프로그램 서버를 설치하려면 패치를 적용하기 전에 Patching Tool을 설치 및 구성해야 합니다.

```{warning}
**항상** 패치하기 전에 데이터베이스와 설치를 [백업](../backing-up.md)하십시오.
```

```{note}
Docker 컨테이너에서 DXP를 실행하는 경우, [Docker에서 DXP 패치하기](../../installing-liferay/using-liferay-docker-images/patching-dxp-in-docker.md) 의 지침을 따르세요.
```

DXP 번들을 패치하는 경우 아래의 기본 패치 단계를 계속하십시오. 응용 프로그램 서버에서 DXP를 패치하는 경우 [패치 단계를 따르기 전에](#preparing-to-patch-dxp-on-an-application-server) **추가 준비를** .

## 패치 단계

1. 패치를 `patching-tool/patches` 폴더에 다운로드하십시오. 패치의 압축을 풀지 마십시오.

    * 수정 팩 및 서비스 팩은 도움말 센터의 [다운로드](https://customer.liferay.com/downloads) 페이지에 있습니다.
    * 핫픽스는 [헬프 센터](https://help.liferay.com/hc) 티켓에 있습니다.

1. 애플리케이션 서버를 종료하십시오.

    사유:

    * Unix 스타일 시스템에서는 일반적으로 실행 중인 파일을 교체할 수 있지만 이전 파일은 메모리에 상주합니다.
    * Windows 시스템에서 사용 중인 파일은 잠겨 있으며 패치할 수 없습니다.

1. `patching-tool` 폴더에서 Patching Tool의 `install` 명령을 실행하여 패치를 설치합니다.

    ```bash
    cd patching-tool
    ./patching-tool.sh install
    ```

    출력은 다음과 같습니다.

    ```
    There's no configuration available. Running auto-discovery in the parent folder.
    Directory is not set in command line, using ../
    Auto discovery looks for portal segments. The selected directory is "/home/russell/liferay-bundles/cross-cluster-replication_7.2_LRDOCS-8715/liferay-dxp-7.2.10.3-sp3".
    Configuration has been written into the default.properties:
    patching.mode=binary
    war.path=../tomcat-9.0.33/webapps/ROOT/
    global.lib.path=../tomcat-9.0.33/lib/ext/
    liferay.home=../
    One patch is ready to be installed. Applying dxp-10...
    Cleaning up: [1%..10%..20%..30%..40%..50%..60%..70%..80%..90%..100%]
    Installing patches: [1%..10%..20%..30%..40%..50%..60%..70%..80%..90%..100%]
    Syncing...
    The patches contain database index modification. Run the patching tool with the index-info parameter for more information.
    The installation was successful. One patch is installed on the system.
    ```

1. `info` 명령을 실행하고 현재 설치된 패치에 대한 정보를 확인하여 설치된 패치를 확인합니다.

    ```bash
    ./patching-tool.sh info
    ```

    출력에는 현재 설치된 패치가 나열됩니다.

    ```
    Loading product and patch information...
    Product information:
      * installation type: binary
      * build number: 7210
      * service pack version:
        - available SP version: 3
        - installable SP version: 3
      * patching-tool version: 2.0.15
      * time: 2021-01-21 18:02Z
      * host: russell-pc (8 cores)
      * plugins: no plugins detected
    Currently installed patches: dxp-10-7210
    Available patches: dxp-8-7210, dxp-10-7210
    Detailed patch list: 
      [ -] dxp-8-7210 :: Currently not installed; Won't be installed: dxp-10 contains the fixes included in this one :: Built for LIFERAY
      [*I] dxp-10-7210 :: Installed; Will be installed. :: Built for LIFERAY
    ```

1. 모든 DXP 캐시를 정리합니다.

    `[Liferay Home]/osgi/state` 폴더를 삭제합니다.

    ```bash
    cd [Liferay Home]
    rm -rf osgi/state
    ```

    `[Liferay Home]/work` 폴더를 비웁니다.

    ```bash
    rm -rf work/*
    ```

    애플리케이션 서버 캐시를 삭제하십시오. 캐시를 찾을 수 있는 사이트에 대해서는 응용 프로그램 서버 공급업체의 설명서를 참조하십시오.

    ```{note}
    모듈의 변경 사항이 내부에만 있는 경우 변경 사항은 OSGi 프레임워크에 보이지 않고 모듈이 설치된 상태로 유지되며 모듈의 상태가 지속됩니다. 다음 DXP 시작 전에 OSGi 번들 상태 정보를 지우면 해당 모듈이 적절한 상태로 다시 설치됩니다.
    ```

1. 패치 릴리스 정보에 미시적 또는 사소한 스키마/데이터 변경 사항이 언급되어 있는 경우 [데이터베이스 업그레이드 도구](../../upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md) 을 사용하여 사소한 변경 사항(필수) 및 원하는 모든 미시적 변경 사항을 적용하십시오.

    ```{important}
    Liferay DXP 7.2 GA1 또는 수정팩 1에서 DXP 7.2 SP1/수정팩 2(또는 그 이상)로 업데이트하는 경우 데이터베이스 업그레이드 도구를 사용하여 데이터와 데이터베이스를 업데이트해야 합니다.
    ```

1. DXP의 `web.xml` 파일을 사용자 정의한 경우 수정 팩에 포함된 새 `web.xml` 파일에 사용자 정의를 병합하십시오. 수정팩은 항상 기존 `web.xml` 파일을 덮어씁니다.

1. 패치에 인덱스 업데이트가 있는 경우 시작 시 인덱스를 업데이트하도록 DXP를 구성합니다.

    `info` 명령을 사용하여 인덱스 업데이트를 확인하십시오.

    ```bash
    cd patching-tool
    ./patching-tool.sh info
    ```

    인덱스 업데이트가 있는 경우 [`database.indexes.update.on.startup`](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) Portal 속성을 [`portal-ext.properties` 파일](../../reference/portal-properties.md)에서 `true` 로 설정합니다.

    ```properties
    database.indexes.update.on.startup=true
    ```

    `LIFERAY_` OR `IX_` 으로 시작하는 인덱스만 업데이트됩니다. 사용자 정의 인덱스가 이 명명 규칙을 사용하지 않는지 확인하십시오.

1. 응용 프로그램 서버에 DXP 7.3을 다시 설치하는 경우 패치가 적용된 DXP 응용 프로그램을 [임시 사이트](#preparing-to-patch-dxp-on-an-application-server) 에서 다시 `.war` 파일로 압축하고 파일을 응용 프로그램 서버에 복사합니다. 애플리케이션 서버에 대한 [DXP 설치 지침](../../installing-liferay/installing-liferay-on-an-application-server.md) 을 참조하십시오.

1. 애플리케이션 서버를 다시 시작하십시오.

축하합니다! DXP 인스턴스가 패치되어 실행 중입니다.

```{note}
패치가 설치되지 않거나 발생하는 오류를 해결할 수 없는 경우 [도움말 센터 티켓](https://help.liferay.com/hc/) 을 열고 전체 패치 도구 `정보`를 제공하세요. `./patching-tool.sh info > output.txt`를 실행하고 `output.txt` 파일을 티켓에 첨부하여 출력합니다.
````

## 응용 프로그램 서버에서 DXP 패치 준비

응용 프로그램 서버에 DXP를 설치한 경우 다음과 같이 준비하십시오.

1. DXP 7.3을 패치하고 `.war` 파일로 배포된 경우 패치를 위해 임시 사이트에 `.war`의 압축을 풉니다.

1. 아직 설치하지 않은 경우 [패칭 도구 설치](../reference/installing-the-patching-tool.md).

1. `auto-discovery` 명령을 실행하여 DXP 설치를 위한 [패칭 도구 구성](../reference/configuring-the-patching-tool.md).

    ```bash
    cd patching-tool
    ./patching-tool.sh 자동 검색
    ```

1. DXP 7.3을 패치하는 경우 Patching Tool의 `war.path` 속성(예: in `default.properties`)을 압축 해제된 DXP `.war` 사이트로 설정합니다.

1. 이전 섹션의 [패치 단계](#basic-patching-steps) 을 계속하십시오.

이제 DXP 번들 및 DXP 애플리케이션 서버 설치를 패치하는 방법을 알았습니다.

## 관련 주제

* [패치 도구 설치](../reference/installing-the-patching-tool.md)
* [패치 도구 구성](../reference/configuring-the-patching-tool.md)
* [패치 제거](../reference/uninstalling-patches.md)
