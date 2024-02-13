---
toc:
  - >-
    - ./patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md
    - ./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2.md
---
# 이전 DXP 버전 패치 적용

```{note}
Liferay DXP는 최신 릴리스에 번들 릴리스를 사용합니다. 업데이트를 적용하는 경우 [Liferay 업데이트](./updating-liferay.md)를 참조하세요. 모든 핫픽스는 패치입니다. 핫픽스를 적용하는 경우 계속 읽으세요.
```

Liferay가 수정 사항을 릴리스하면 DXP 인스턴스를 최신 상태로 유지해야 합니다. Liferay는 수정 사항을 취합하여 **패치** 라는 ZIP 파일로 기업 구독자에게 제공합니다.

## 패치 유형

패치에는 여러 가지 종류가 있으며 각기 다른 용도로 사용됩니다.

* **수정 팩:** 가장 최근의 문제를 해결합니다.
* **보안 수정 팩:** 최신 보안 문제를 즉시 해결하세요.

**모든 DXP 버전**

* **핫픽스:** 비즈니스에 중요한 DXP 문제를 빠르게 해결하기 위해 고객이 요청하는 경우.

**DXP 7.3 SP3 이전 버전의 경우**

* **수정 팩:** 가장 최근의 문제를 해결합니다.
* **보안 수정 팩:** 최신 보안 문제를 즉시 해결하세요. 참고, Liferay DXP 7.3 SP3+는 보안 업데이트를 사용합니다. 자세한 내용은 [Liferay 업데이트](./updating-liferay.md) 를 참조하세요.
* **서비스 팩:** 더 많은 테스트가 필요한 대규모 수정 사항을 통합합니다. 서비스 팩 릴리스에는 전체 DXP 서비스 팩 Tomcat 번들도 포함되어 있습니다.

[패치 유형 이해](./patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md) 에서 위의 패치 옵션에 대해 설명합니다.

## 패치 설치

필요한 패치가 있으면 패치 도구를 사용하여 적용하세요. [패치 설치하기](./patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md) 에서는 안전하고 포괄적으로 DXP를 패치하기 위한 기본 단계를 제공합니다.

## 패치 도구 구성

[`patching-tool.sh 자동 검색` 명령](./reference/configuring-the-patching-tool.md) 은 Tomcat 번들 및 일반적인 앱 서버 구성에 대해 도구를 자동으로 구성합니다. 또한 패치 툴을 수동으로 구성하여 DXP 설치 변형을 처리할 수도 있습니다.

## 기타 패치 주제

패치를 적용할 때 지원 요청에 패치 정보를 제출하거나 더 이상 필요하지 않은 패치를 제거해야 할 수 있습니다.

* [패치 정보 얻기](./reference/getting-patch-information.md)
* [패치 제거](./reference/uninstalling-patches.md)

## DXP 7.2 패치 적용

다음 항목에서는 DXP 7.2에서 패치를 관리하기 위한 모범 사례를 제공합니다:

* [패치된 설치 슬림화](./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/slimming-down-patched-installations.md)
* [슬림 번들 사용](./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/using-slim-bundles.md)
* [패치와 커스텀 플러그인 간 충돌 처리하기](./patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/custom-code-and-patch-compatibility.md)

이제 패치 개요를 이해했으니 [패치 유형](./patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md) 에 대해 알아보세요. 그런 다음 [패치 설치하기](./patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)에 따라 패치를 적용할 준비가 된 것입니다.
