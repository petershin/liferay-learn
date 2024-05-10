# 설치 개요

Liferay Commerce는 Liferay DXP에 구축된 디지털 상거래 플랫폼입니다. 이 문서에서는 Liferay Commerce를 설치, 배포 및 유지 관리하기 위한 전제 조건 및 사용 가능한 옵션에 대해 설명합니다.

## 전제 조건

최적의 설치 환경을 위해 시작하기 전에 호환성 매트릭스 및 관련 설치 자료를 검토하십시오.

* [지원되는 기술 목록은 Liferay DXP 7.3 및 Commerce 3.0 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151) 참조하십시오. <!-- * See the \[Liferay DXP 7.3 Deployment Checklist\]() for information about Liferay DXP architecture and performance tuning guidelines. --> ## 라이프레이 커머스로 시작하기

Liferay Commerce 3.0은 Liferay Portal 7.3 CE GA6 및 Liferay DXP 7.3 GA1과 함께 번들로 제공됩니다. Community Edition은 Commerce의 기본 버전과 함께 번들로 제공되는 반면 Enterprise Edition은 모든 기능을 갖춘 Enterprise Commerce와 함께 제공됩니다. CE 및 Enterprise 버전 모두 Docker 이미지 및 다운로드 가능한 번들로 제공됩니다.

| 설치 방법                                                                                                                              | 목적                                                                              |
|:---------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------- |
| [Docker 이미지로 시작하기](https://learn.liferay.com/w/dxp/getting-started/starting-with-a-docker-image#get-started-with-liferay)       | Docker 이미지로 시작하는 것이 Liferay Commerce 둘러보기를 시작하는 가장 빠른 방법입니다.                    |
| [Liferay-Tomcat 번들 설치](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/installing-a-liferay-tomcat-bundle) | 응용 프로그램 서버와 함께 사전 번들로 제공되는 Liferay Commerce. Liferay 설치 실행을 시작하는 가장 일반적인 방법입니다. |

Liferay Portal 번들 및 이미지에는 상거래 관련 추가 설치 단계가 필요하지 않습니다. 기본 상거래 기능이 활성화되어 시작할 때 즉시 사용할 수 있습니다.

반대로 DXP 설치에서는 기본 및 엔터프라이즈 상거래 모듈이 모두 기본적으로 비활성화되어 있으며 사용하려면 활성화가 필요합니다. DXP 및 Commerce 라이센스가 모두 배포되고 검증되면 모든 Commerce 모듈이 시작되고 즉시 사용 가능해집니다. 서버를 다시 시작할 필요가 없습니다. 자세한 내용은 [Liferay Commerce Enterprise](./activating-liferay-commerce-enterprise.md) 활성화를 참조하십시오.

## Liferay 상거래 유지

Liferay Commerce 경험의 품질을 보장하고 향상시키기 위해 정기적인 유지 관리 업데이트 및 제품 업그레이드를 사용할 수 있습니다. 자세한 내용은 다음 문서를 참조하세요.

* [유지 보수 버전](./maintenance-versions.md)
* [Liferay Commerce 업그레이드](./upgrading-liferay-commerce.md)

## Liferay Commerce 2.1 이하

Liferay Commerce의 이전 릴리스에는 Commerce 3.x 이상에서 더 이상 필요하지 않은 추가 설치 단계가 필요했습니다.

### 전제 조건

Liferay Commerce 2.1 이하를 설치하기 전에 설치 버전에 해당하는 시스템 요구 사항 및 Liferay DXP 배포 체크리스트를 검토하십시오.

* [지원되는 기술 목록은 Liferay Commerce 2.0 호환성 매트릭스](https://web.liferay.com/documents/14/21598941/Liferay+Commerce+2.0+Compatibility+Matrix/0ed97477-f5a7-40a6-b5ab-f00d5e01b75f) 참조하십시오.
* [Liferay DXP 7.1 배포 체크리스트](https://www.liferay.com/documents/10182/3292406/Liferay+DXP+7.1+Deployment+Checklist/cacaac23-9e02-411a-dcc9-adf86f95c513)
* [Liferay DXP 7.2 배포 체크리스트](https://www.liferay.com/documents/10182/3292406/Liferay+DXP+7.2+Deployment+Checklist.pdf/22dee290-6b06-0bdc-aa89-30bb88d1d42e?t=1566483298239)

### Docker 이미지를 사용하여 설치

Docker를 사용하여 Liferay Commerce를 설치합니다. 자세한 내용은 [Liferay Commerce Docker 이미지 사용](./installing-commerce-2-1-and-below/using-the-liferay-commerce-docker-image.md) 을 참조하십시오.

### 번들을 사용하여 설치

[Liferay Community Downloads](https://commerce.liferay.dev/download) 페이지의 번들을 사용하여 Liferay Commerce를 설치합니다. 자세한 내용은 [Liferay Commerce Tomcat 번들 사용](./installing-commerce-2-1-and-below/using-the-liferay-commerce-tomcat-bundle.md) 을 참조하십시오.

### 기존 Liferay DXP 설치를 사용하여 설치

기존 Liferay DXP 설치에 `LPKG` 파일을 배포하여 Liferay Commerce를 설치합니다. 자세한 내용은 [기존 설치에 Liferay Commerce 배포](./installing-commerce-2-1-and-below/deploying-liferay-commerce-to-an-existing-liferay-installation.md) 참조하십시오.

## 관련 주제

* [Liferay 디지털 경험 플랫폼 성능](https://www.liferay.com/documents/10182/3292406/Liferay+DXP+Performance+-+Benchmark+Study+of+Liferay+DXP+7.1/fe7d4cd2-2efc-b5cc-9680-825ec9bad5be)
* [프록시 서버를 통해 Marketplace 앱 활성화](https://help.liferay.com/hc/ko/articles/360018427391)
