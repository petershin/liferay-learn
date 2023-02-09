# 핫픽스 적용

> 가입자

핫픽스는 고객이 확인한 중요한 DXP 문제를 해결하기 위해 업데이트 사이(또는 DXP 7.3 SP3 이전 버전의 경우 수정 팩 사이)에 제공되는 수정 또는 수정 모음입니다. [도움말 센터 티켓](https://help.liferay.com/hc)을 통해 Hotfix에서 요청할 수 있습니다. 핫픽스를 받은 후 패치 도구를 사용하여 설치할 수 있습니다.

```{warning}
**항상** 핫픽스를 적용하기 전에 데이터베이스와 설치를 [백업](./backing-up.md)하십시오.
```

```{note}
Docker 컨테이너에서 DXP를 실행하는 경우 [Docker에서 DXP 패칭](../installing-liferay/using-liferay-docker-images/patching-dxp-in-docker.conf)의 지침에 따라 핫픽스를 적용하십시오. md).
```

## 핫픽스 요청

핫픽스를 요청하는 방법은 다음과 같습니다.

1. [도움말 센터로 이동](https://help.liferay.com/hc)
1. 티켓을 제출.

Liferay 지원 팀은 귀하와 협력하여 문제가 제품에 있는지 확인하고 의도하지 않은 제품 동작에 대한 수정 사항을 제공합니다.

## 패치 도구 구성

패치 도구는 핫픽스를 적용합니다. 구성 방법은 다음과 같습니다.

1. 응용 프로그램 서버에 DXP를 `.war` 파일로 배포한 경우 핫픽스를 적용할 임시 사이트에 `.war` 의 압축을 풉니다.
1. [Liferay Home](../reference/liferay-home.md) 에서 `patching-tool.sh` 패치 도구 스크립트를 찾거나 DXP 설치에 패치 도구가 없는 경우 패치 도구를 설치하십시오.

    * **DXP Tomcat 번들:** `[Liferay Home]/patching-tool/`
    * **DXP 앱 서버 설치:** [서버 호스트에 Patching Tool](./reference/installing-the-patching-tool.md) 을 설치합니다.

1. DXP 설치를 위한 패치 도구를 구성합니다.

    **DXP Tomcat 번들:** 도구가 자동으로 [`auto-discovery` 명령](./reference/configuring-the-patching-tool.md)실행되도록 구성합니다.

    ```bash
    ./patching-tool.sh auto-discovery
    ```

    **DXP 앱 서버 설치:** [Patching Tool의 `war.path` 속성(예: in `default.properties`)을 압축 해제된 DXP `.war` 사이트로 설정하는 것을 포함하여 1](./reference/configuring-the-patching-tool.md)수동으로 Patching Tool을 구성합니다.

## 핫픽스 설치

1. [Help Center](https://help.liferay.com/hc) 티켓에서 `patching-tool/patches` 폴더로 패치를 다운로드하십시오. 패치의 압축을 풀지 마십시오.
1. 애플리케이션 서버를 종료하십시오.

    사유:

    * Unix 스타일 시스템에서는 일반적으로 실행 중인 파일을 교체할 수 있지만 이전 파일은 메모리에 상주합니다.
    * Windows 시스템에서 사용 중인 파일은 잠겨 있으며 패치할 수 없습니다.

1. `patching-tool` 폴더에서 Patching Tool의 `install` 명령을 실행하여 패치를 설치합니다.

    ```bash
    cd patching-tool
    ./patching-tool.sh install
    ```

1. `info` 명령을 실행하고 현재 설치된 패치에 대한 정보를 확인하여 설치된 패치를 확인합니다.

    ```bash
    ./patching-tool.sh info
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

1. 응용 프로그램 서버에 DXP를 다시 설치하는 경우 패치된 DXP 응용 프로그램을 [임시 사이트](#preparing-to-patch-dxp-on-an-application-server) 에서 다시 `.war` 파일로 압축하고 파일을 응용 프로그램 서버에 복사합니다. 애플리케이션 서버에 대한 [DXP 설치 지침](../installing-liferay/installing-liferay-on-an-application-server.md) 을 참조하십시오.
1. 애플리케이션 서버를 다시 시작하십시오.

축하합니다! DXP 설치에 핫픽스를 적용했습니다.

## 추가 정보

* [Docker에서 DXP 패치](../installing-liferay/using-liferay-docker-images/patching-dxp-in-docker.md)
* [패치 정보 얻기](./reference/getting-patch-information.md)
* [패치 제거](./reference/uninstalling-patches.md)