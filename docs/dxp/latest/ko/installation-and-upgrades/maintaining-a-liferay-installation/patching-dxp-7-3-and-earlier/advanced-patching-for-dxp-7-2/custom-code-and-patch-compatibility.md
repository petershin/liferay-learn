# 맞춤형 코드 및 패치 호환성

> 가입자

DXP 7.2 설치를 사용자 지정하거나 패치하는 코드를 배포하는 경우 사용 중인 모든 패치와의 호환성을 유지해야 합니다. 다음 항목에서는 이를 수행하는 방법을 설명합니다.

* [사용자 정의 패치에 대한 패치 수준 정보 저장](#storing-patch-level-information-for-custom-patches)
* [패치 수준 차이 비교](#comparing-patch-level-differences)
* [패치와 커스텀 플러그인 간의 충돌 처리](#handling-collisions-between-patches-and-custom-plugins)

```{important}
이러한 사용자 지정 및 패치 지침은 Liferay DXP 7.2에만 적용됩니다. DXP 7.3+에는 적용되지 않습니다.
```

## 사용자 정의 패치에 대한 패치 수준 정보 저장

Patching Tool의 `store` 및 `diff` 명령은 Liferay DXP 패치 및 사용자 정의 DXP 패치를 포함하여 패치 간의 차이점과 함께 작동합니다. `store` 명령은 패치 소스 코드에 대한 패치 수준 파일을 작성합니다. `diff` 명령은 패치 간의 차이점을 인쇄합니다.

`./patching-tool.sh store` 명령은 `diff` 명령에서 사용하는 패치 수준 정보를 관리합니다. 패치에는 패치 수준을 저장하고 `diff` 명령에 사용할 수 있는 정보를 준비하기 위한 소스 코드가 포함되어 있어야 합니다. 다음은 `store` 명령 옵션입니다.

* `add`: 패치 레벨을 `패치` 폴더에 저장합니다.
* `info`: 저장된 패치 레벨을 구성하는 패치 목록을 출력합니다.
* `rm`: 이전에 저장된 패치 레벨 정보를 제거합니다.
* `업데이트`: 패치 수준 정보를 추가하거나 업데이트합니다.

자세한 사용 정보를 보려면 `./patching-tool.sh help store`을 실행하십시오.

## 패치 수준 차이 비교

`./patching-tool.sh diff` 명령은 두 패치 수준 간의 차이점을 인쇄합니다. 적어도 하나의 저장된 패치 수준을 사용할 수 있어야 합니다. 이 명령은 출력 필터링 옵션을 허용합니다.

* `충돌`: 배포된 플러그인과 충돌하는 수정된 파일을 나열합니다.
* `파일`: 수정된 파일을 나열합니다.
* `fixed-issues`: 패치로 수정되는 LPS/LPE 문제(문제 추적 시스템에서)를 나열합니다.
* `html`: 필터링 옵션(소스``, 파일 ``또는 수정된 문제 `개`개) 중 하나와 함께 지정하고 패치 수준 이후에 차이를 HTML 파일(`<stored-name-1>-<stored-name-2>-[type]-diff.html`) `diffs` 폴더에 있습니다. 추가는 녹색으로 표시되고 삭제는 빨간색으로 표시됩니다.
* `소스`: 두 패치 수준 간의 소스 코드 차이점을 보여줍니다.

자세한 사용 정보를 보려면 `./patching-tool.sh help diff`을 실행하십시오.

## 패치와 커스텀 플러그인 간의 충돌 처리

일부 패치는 플러그인을 통해 사용자 정의한 파일을 업데이트합니다. `list-collisions` 명령은 OSGi 조각 번들에서 JSP 파일 차이점(충돌)을 반환합니다.

```bash
./patching-tool.sh list-collisions
```

다음 diff 명령의 별칭입니다.

```bash
./patching-tool.sh diff collisions files _base
```

`_base` 인수는 리터럴 패치 수준 이름입니다. 충돌은 소스 코드 파일이 포함된 설치된 패치에 대해서만 나타납니다.

특정 패치를 제거했거나 어떤 종류의 충돌이 있는 경우 `-force` 인수를 사용하여 Patching Tool이 현재 사용 가능한 패치를 설치하도록 강제합니다.

예:

```bash
./patching-tool.sh profile_name install -force
```

이제 사용자 정의 코드 및 사용자 정의 패치를 다른 DXP 패치와 통합하는 방법을 알았습니다.

## 추가 정보

* [패치 설치](../installing-patches-for-dxp-7-3-and-earlier.md)
* [패치 도구 설치](../../reference/installing-the-patching-tool.md)
* [패치 도구 구성](../../reference/configuring-the-patching-tool.md)
