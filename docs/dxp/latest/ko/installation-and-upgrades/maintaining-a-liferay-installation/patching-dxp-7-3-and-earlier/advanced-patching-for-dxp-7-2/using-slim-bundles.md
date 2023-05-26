# 슬림 번들 사용

> 가입자

Liferay DXP 7.2 수정 팩 및 서비스 팩도 Tomcat 애플리케이션 서버와 함께 번들로 출시됩니다. 기존 번들 및 **슬림 번들** 로 제공됩니다. 기존 DXP 7.2 번들에는 **패치 파일** 이 포함되어 있습니다. 패치 도구가 특정 패치를 설치하는 데 필요한 모든 소스 코드 및 백업 파일입니다. 슬림 번들은 패치 파일을 포함하지 않기 때문에 기존 번들 크기의 약 1/3입니다. 슬림 번들은 디스크 공간이 제한적이거나 비용이 많이 드는 데모용 또는 설치용입니다. 클라우드 및 컨테이너 환경에 이상적입니다.

```{important}
슬림 번들은 Liferay DXP 7.2 및 이전 버전에서만 사용됩니다. DXP 7.3+에서는 필요하지 않습니다.
```

```{warning}
대부분의 Patching Tool 명령(예: `install`)은 Fix Pack 또는 Service Pack의 패치 파일이 Slim Bundle에 설치될 때까지 Slim Bundle에서 실행할 수 없습니다.
```

Slim Bundle의 각 수정 팩/서비스 팩에 대한 패치 파일이 없으면 Slim Bundle은 다음 패치 도구 명령으로 제한됩니다.

* [`auto-discovery`](../../reference/configuring-the-patching-tool.md)
* [`info`](../../reference/getting-patch-information.md)
* `setup`

슬림 번들은 여전히 패치할 수 있지만 패치 파일을 복원하는 추가 단계가 필요합니다. 각 패치에 대한 각 패치의 패치 파일은 [도움말 센터](https://customer.liferay.com/downloads) 에서 사용할 수 있습니다.

## 슬림 번들 패치

Slim Bundle에 패치를 설치하려고 하면 Patching Tool에서 패치 파일이 필요하다고 보고합니다. 여기 메시지가 있습니다.

```
This installation does not include data for patching. Please copy the
liferay-patching-files-[separation-name].zip file into the 'patches'
directory and run patching-tool setup.
```

패치 파일을 복원하는 방법은 다음과 같습니다.

1. [도움말 센터에서 패치 파일 다운로드](https://customer.liferay.com/downloads) . 수정 팩 또는 서비스 팩으로 이동하고 드롭다운에서 **패치 파일** 을 선택하고 **다운로드** 을 클릭하여 패치 파일을 다운로드합니다.

1. 패치 파일을 Slim Bundle의 `patching-tool/patches` 폴더에 추출합니다.

1. `patching-tool` 폴더에 대한 명령줄을 엽니다.

1. 패치 도구를 사용하여 패치 파일을 설정합니다.

    ```bash
    ./patching-tool.sh setup
    ```

    슬림 번들에는 패치 파일이 있으며 패치할 준비가 되었습니다.

1. [패치 설치](../installing-patches-for-dxp-7-3-and-earlier.md)의 지침에 따라 Slim Bundle을 패치합니다.

Slim Bundle 사용의 이점을 배웠고 이를 패치하는 방법을 알고 있습니다.

## 관련 주제

* [패치 설치](../installing-patches-for-dxp-7-3-and-earlier.md)
* [패치 설치 축소](./slimming-down-patched-installations.md)
