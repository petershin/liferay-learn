---
toc:
- ./patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md
- ./patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md
- ./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2.md
---
# 이전 DXP 버전 패치

```{toctree}
:maxdepth: 3

patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md
patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md
patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2.md
```

```{note}
Liferay DXP는 최신 릴리스에 번들 릴리스를 사용합니다. 업데이트를 적용하는 경우 [Liferay 업데이트](./updating-liferay.md)를 참조하십시오. 모든 핫픽스는 패치입니다. 핫픽스를 적용하는 경우 계속 읽으십시오.
```

Liferay가 수정 사항을 릴리스함에 따라 DXP 인스턴스를 최신 상태로 유지하고 싶을 것입니다. Liferay는 수정 사항을 집계하여 **패치** 이라는 ZIP 파일로 기업 가입자가 사용할 수 있도록 합니다.

## 패치 유형

여러 종류의 패치가 있으며 서로 다른 용도로 사용됩니다.

* **수정 팩:** 가장 최근의 문제를 해결합니다.
* **보안 수정 팩:** 최신 보안 문제를 즉시 해결합니다.

**모든 DXP 버전**

* **핫픽스:** 고객이 비즈니스에 중요한 DXP 문제를 빠르게 해결하도록 요청했습니다.

**DXP 7.3 SP3 이전 버전의 경우**

* **수정 팩:** 가장 최근의 문제를 해결합니다.
* **보안 수정 팩:** 최신 보안 문제를 즉시 해결합니다. Liferay DXP 7.3 SP3+는 보안 업데이트를 사용합니다. 자세한 내용은 [Liferay](./updating-liferay.md) 업데이트를 참조하십시오.
* **서비스 팩:** 더 많은 테스트가 필요한 더 큰 수정 사항을 통합합니다. 서비스 팩 릴리스에는 전체 DXP 서비스 팩 Tomcat 번들도 포함됩니다.

[패치 유형 이해하기](./patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md) 은 위의 패치 옵션을 설명합니다.

## 패치 설치

필요한 패치가 있으면 Patching Tool을 사용하여 적용하십시오. [패치 설치](./patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md) 은 DXP를 안전하고 포괄적으로 패치하기 위한 기본 단계를 제공합니다.

## 패치 도구 구성

[`patching-tool.sh auto-discovery` 명령](./reference/configuring-the-patching-tool.md) 은 Tomcat 번들 및 일반 앱 서버 구성에 대해 자동으로 도구를 구성합니다. DXP 설치 변형을 처리하도록 Patching Tool을 수동으로 구성할 수도 있습니다.

## 기타 패치 주제

패치를 적용할 때 지원 요청에 패치 정보를 제출하거나 더 이상 필요하지 않은 패치를 제거해야 할 수 있습니다.

* [패치 정보 얻기](./reference/getting-patch-information.md)
* [패치 제거](./reference/uninstalling-patches.md)

## DXP 7.2 패치

다음 주제는 DXP 7.2에서 패치를 관리하기 위한 모범 사례를 제공합니다.

* [패치 설치 축소](./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/slimming-down-patched-installations.md)
* [슬림 번들 사용](./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/using-slim-bundles.md)
* [패치와 커스텀 플러그인 간의 충돌 처리](./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/custom-code-and-patch-compatibility.md)

이제 패치 개요를 요약했으므로 사용할 수 있는 [패치 유형](./patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md) 에 대해 알아보십시오. 그러면 [패치 설치](./patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)다음에 패치를 적용할 준비가 된 것입니다.
