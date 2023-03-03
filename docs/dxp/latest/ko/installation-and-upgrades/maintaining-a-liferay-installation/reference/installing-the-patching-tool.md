# 패치 도구 설치

> 가입자

Patching Tool은 설치 및 업데이트가 쉽습니다.

## 설치

1. [고객 포털](https://customer.liferay.com/downloads) 에서 패치 도구를 다운로드합니다.

    * **DXP 7.3+의 경우** 최신 패칭 도구를 다운로드합니다.
    * **DXP 7.2의 경우** Patching Tool 2.x의 최신 버전을 다운로드합니다.

1. [Liferay Home](../../reference/liferay-home.md) 폴더(권장) 또는 다른 폴더에 Patching Tool의 압축을 풉니다.

Patching Tool 폴더 `patching-tool` 에는 `patching-tool.sh` 스크립트가 포함되어 있습니다.

Patching Tool 도움말 메시지를 인쇄하려면 `patching-tool` 폴더에서 다음 명령을 실행합니다.

```bash
cd patching-tool
./patching-tool.sh help
```

## 패치 도구 업데이트

패치 도구는 설치 중인 패치에 최신 패치 도구 버전이 필요할 때 보고합니다. 패치 도구를 업데이트하는 방법은 다음과 같습니다.

1. [고객 포털](https://customer.liferay.com/downloads) 에서 패치 도구를 다운로드합니다.

    * **DXP 7.3+의 경우** 최신 패칭 도구를 다운로드합니다.
    * **DXP 7.2의 경우** 패치 도구의 최신 2.x 버전을 다운로드합니다.

1. 기존 Patching Tool `.properties` 파일을 백업합니다.

1. `patching-tool` 폴더의 상위 폴더(일반적으로 Liferay Home)에 새 패치의 압축을 풀어 기존 Patching Tool을 덮어씁니다.

Patching Tool은 DXP 설치와 함께 구성할 준비가 되었습니다.

## 추가 정보

* [패치 도구 구성](./configuring-the-patching-tool.md)
* [패치 설치](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)
* [맞춤형 코드 및 패치 호환성](../patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/custom-code-and-patch-compatibility.md)