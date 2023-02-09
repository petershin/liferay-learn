# 패치 설치 축소

> 가입자

Liferay DXP 7.2에서 패치 정보는 기본적으로 설치 시 패치 파일에 유지됩니다. 이렇게 하면 DXP를 이전 패치 수준으로 쉽게 복원할 수 있습니다. 그러나 패치 파일은 많은 공간을 차지할 수 있습니다. 여기에서는 패치 파일을 분리하여 설치를 줄이는 방법과 패치 작업에 필요할 때 패치 파일을 복원하는 방법을 모두 배웁니다.

패치 파일(메타 데이터, 확인 및 유효성 검사에 사용되는 파일)은 기본적으로 웹 응용 프로그램의 `WEB-INF` 폴더에 저장되기 때문에 패치 설치는 용량이 큽니다. Patching Tool은 새 패치를 설치하고 이전 패치 수준을 복원하기 위해 이러한 파일이 필요합니다. 그래서 당신은 그들을 붙잡아 야합니다. 그러나 설치에서 패치 파일을 추출하여 DXP 설치 크기를 줄일 수 있습니다. 새 패치를 설치하거나 이전 패치 수준을 복원할 준비가 되면 패치 파일을 안전하게 복원할 수 있습니다.

```{important}
이러한 패치 파일은 Liferay DXP 7.2 및 이전 버전에서만 사용됩니다. DXP 7.3+에서는 패치 파일 분리가 필요하지 않습니다.
```

설치 슬리밍 주제는 다음과 같습니다.

* [설치에서 패치 파일 분리](#separating-patch-files-from-the-installation)
* [분리된 패치 파일 복원](#restoring-separated-patch-files)

## 설치에서 패치 파일 분리

패치 도구의 `별도` 명령은 기본 사이트(웹 응용 프로그램의 `WEB-INF` 폴더)에서 패치 파일을 추출하고 ZIP 파일로 패키징합니다. 명령은 다음과 같습니다.

```bash
./patching-tool.sh separate [separation_name]
```

이 명령은 패치 파일을 패치 파일 기본 사이트에서 Patching Tool의 `patches` 폴더에 있는 `liferay-patching-files-[separation-name].zip` 파일로 이동합니다. ZIP 파일을 다른 사이트에 저장하여 설치 크기를 줄이십시오.

**경고:** 이러한 방식으로 DXP가 패치에서 분리되면 다음 패치 도구 명령만 사용할 수 있습니다.

* `auto-discovery`
* `info`
* `setup`

다른 모든 명령은 다음을 반환합니다.

```
This installation does not include data for patching. Please copy the
liferay-patching-files-[separation-name].zip file into the 'patches' directory
and run patching-tool setup.
```

## 분리된 패치 파일 복원

DXP를 다시 패치해야 할 경우 분리된 패치 파일을 복원해야 합니다.

1. `liferay-patching-files-[separation-name].zip`을 패치 도구의 `patches` 폴더에 다시 복사합니다.

1. 다음 명령을 실행합니다.

    ```bash
    ./patching-tool.sh setup
    ```

패치 파일은 설치 패치 파일 기본 사이트로 복원됩니다. 모든 패치 도구 명령을 사용할 수 있습니다.

이제 DXP 설치가 불필요한 공간을 차지하지 않도록 패치 파일을 저장하는 방법을 알게 되었습니다. 그리고 새 패치를 설치할 수 있도록 패치 파일을 복원하는 방법도 알고 있습니다.

## 추가 정보

* [패치 설치](../installing-patches-for-dxp-7-3-and-earlier.md)
* [패치 도구 설치](../../reference/installing-the-patching-tool.md)
* [패치 도구 구성](../../reference/configuring-the-patching-tool.md)
* [슬림 번들 사용](./using-slim-bundles.md)
