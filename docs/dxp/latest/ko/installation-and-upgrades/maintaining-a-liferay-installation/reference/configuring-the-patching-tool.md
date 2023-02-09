# 패치 도구 구성

> 가입자

Patching Tool은 모든 DXP 설치에 적용할 수 있습니다. 도구의 자동 검색 옵션은 패치 도구를 구성하는 가장 쉬운 방법입니다. 응용 프로그램 서버에 DXP를 설치했거나 Patching Tool 요청을 프록시해야 하는 경우 Patching Tool을 수동으로 구성할 수 있습니다.

**아웃라인:**

* [`자동 검색`을 사용한 자동 구성](#automatic-configuration-using-auto-discovery)
* [구성 테스트](#testing-the-configuration)
* [수동 구성](#manual-configuration)
* [패치 프로필 사용](#using-patching-profiles)

## `자동 검색`을 사용한 자동 구성

Patching Tool의 `auto-discovery` 명령은 DXP 파일을 검색하고 해당 경로를 패치에 사용하는 속성 파일에 기록합니다.

패치 도구를 자동으로 구성하려면 다음 단계를 따르십시오.

1. `patching-tool` 폴더에 대한 명령줄을 엽니다.

    ```bash
    cd patching-tool
    ```

1. 자동 검색 명령을 실행합니다.

    [Liferay Home](../../reference/liferay-home.md) 이 Patching Tool의 상위 폴더인 경우 다음 명령을 실행합니다.

    ```bash
    ./patching-tool.sh auto-discovery
    ```

    [Liferay Home](../../reference/liferay-home.md) 이 다른 사이트에 있는 경우 명령에 대한 Liferay Home 경로를 지정합니다.

    ```bash
    ./patching-tool.sh auto-discovery [path to Liferay Home]
    ```

이 도구는 파일 `default.properties`에 구성을 기록합니다.

Liferay Home에 대한 잘못된 경로를 지정하거나 Liferay Home이 상위 폴더에 없는 경우 패치 도구에서 오류를 보고합니다.

```
The .liferay-home has not been detected in the given directory tree.

Configuration:
patching.mode=binary
war.path=../tomcat-9.0.17/webapps/ROOT/
global.lib.path=../tomcat-9.0.17/lib/ext/
liferay.home=**[please enter manually]**

The configuration hasn't been saved. Please save this to the default.properties file.
```

다음 방법 중 하나로 문제를 해결합니다.

* Liferay Home이 Patching Tool의 트리에 있는 경우 Liferay Home 폴더에 `.liferay-home` 파일을 만들고 `auto-discovery` 명령을 다시 실행하십시오.
* 속성 파일의 `liferay.home` 속성에 Liferay 홈 경로를 지정합니다(예: `default.properties`).

## 구성 테스트

Patching Tool이 구성된 경우 `info` 명령을 실행하면 다음과 같은 모든 제품 정보 및 패치 정보가 보고됩니다.

```
/patching-tool>./patching-tool.sh info
Loading product and patch information...
Product information:
  * build number: 7310
  * service pack version:
    - available SP version: 1
    - installable SP version: 1
  * patching-tool version: 3.0.5
  * time: 2020-09-01 14:02Z
  * host: 91WRQ72 (8 cores)
  ...
```

정보가 올바르지 않으면 구성을 수동으로 편집하십시오.

## 수동 구성

패치 도구 속성 파일을 편집합니다. `auto-discovery` 명령은 기본적으로 `default.properties` 파일을 생성하거나 지정한 파일(예: [Patching Profile](#using-patching-profiles))을 생성합니다.

### 일반 속성

| 재산                                  | 묘사                                                                                                                                                                     |
|:----------------------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `global.lib.path`                   | 전역 클래스 경로에 `.jar` 파일을 저장할 사이트를 지정합니다. 힌트: `portal-kernel.jar` 은 전역 클래스 경로에 있습니다.<br><br>DXP 7.2에서 `global.lib.path` 는 `patching.mode` 이 `바이너리`인 경우에만 사용됩니다. |
| `liferay.home`                      | 일반적으로 DXP의 `osgi` 및 `도구` 폴더의 상위 폴더인 [Liferay Home](../../reference/liferay-home.md) 폴더를 지정합니다.                                                                         |
| `module.framework.core.path`        | DXP의 `osgi/core` 폴더 경로.                                                                                                                                                |
| `module.framework.marketplace.path` | DXP의 `osgi/marketplace` 폴더 경로.                                                                                                                                         |
| `module.framework.modules.path`     | DXP의 `osgi/modules` 폴더 경로.                                                                                                                                             |
| `module.framework.portal.path`      | DXP의 `osgi/portal` 폴더 경로.                                                                                                                                              |
| `module.framework.static.path`      | DXP의 `osgi/static` 폴더 경로.                                                                                                                                              |
| `patches.folder`                    | 패치를 저장할 사이트를 지정합니다. 기본 사이트는 `./patches`입니다.                                                                                                                              |
| `패칭 모드` **(DXP 2.0 전용)**            | 패치에는 업데이트된 바이너리 및 소스 파일이 포함되어 있습니다. 모드는 적용할 파일 형식을 결정합니다.<br><br>* `바이너리` (기본값): DXP 설치 업데이트용.<br>* `소스`: DXP를 확장하는 소스 트리 업데이트용.                     |
| `소스.경로` **(DXP 2.0만 해당)**           | DXP 소스 트리 사이트를 지정합니다. `source.path` 은 `패치 모드` 이 `소스`인 경우에만 사용됩니다.                                                                                                       |
| `war.path`                          | DXP 웹 응용 프로그램의 경로(분할된 폴더 구조 또는 `.war` 파일의 경로)를 지정합니다.                                                                                                                  |

### 프록시 설정

서비스 팩 검색은 프록시 서버 뒤에서 사용할 수 있습니다. 프록시를 구성하려면 다음 설정 그룹 중 하나를 사용하고 `[PROXY_IP_ADDRESS]`를 포함한 모든 값을 바꿉니다.

```properties
### Proxy settings

# HTTP Proxy

#proxy.http.host=[PROXY_IP_ADDRESS]
#proxy.http.port=80
#proxy.http.user=user
#proxy.http.password=password

# HTTPS Proxy

proxy.https.host=[PROXY_IP_ADDRESS]
proxy.https.port=80
proxy.https.user=user
proxy.https.password=password

# SOCKS Proxy

#proxy.socks.host=[PROXY_IP_ADDRESS]
#proxy.socks.port=1080
#proxy.socks.user=user
#proxy.socks.password=password
```

## 패치 프로필 사용

자동 검색을 실행하거나 프로필을 수동으로 생성하여 여러 런타임에 대한 프로필을 생성할 수 있습니다. DXP 런타임을 자동으로 검색하려면 다음과 같은 매개변수를 사용하여 Patching Tool을 실행하십시오.

```bash
./patching-tool.sh [name of profile] auto-discovery [path/to/Liferay Home]
```

이는 동일한 검색 프로세스를 실행하고 프로필 정보를 `[프로필 이름].properties`이라는 파일에 기록합니다. 또는 `patching-tool` 폴더에서 프로필 속성 파일을 만들고 편집할 수 있습니다.

프로필을 만든 후에는 패치 도구 명령에서 사용할 수 있습니다. 예를 들어 이 명령은 `test-server.properties`이라는 프로필 파일을 사용하여 패치를 설치합니다.

```bash
./patching-tool.sh test-server install
```

## 추가 정보

* [패치 설치](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)
* [패치 도구 설치](./installing-the-patching-tool.md)