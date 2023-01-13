---
toc:
- ./search-experiences/understanding-search-blueprints.md
- ./search-experiences/creating-and-managing-search-blueprints.md
- ./search-experiences/using-a-search-blueprint-on-a-search-page.md
- ./search-experiences/personalizing-the-search-experience.md
- ./search-experiences/search-blueprints-elements-reference.md
- ./search-experiences/search-blueprints-configuration-reference.md
- ./search-experiences/creating-and-managing-elements.md
---
# 경험 검색

{bdg-link-secondary}`사용 가능한 Liferay DXP 7.4 업데이트 5+; 7.3 업데이트 6+ <#getting-liferay-search-experiences>`

```{toctree}
:maxdepth: 1

search-experiences/understanding-search-blueprints.md
search-experiences/creating-and-managing-search-blueprints.md
search-experiences/using-a-search-blueprint-on-a-search-page.md
search-experiences/personalizing-the-search-experience.md
search-experiences/search-blueprints-elements-reference.md
search-experiences/search-blueprints-configuration-reference.md
search-experiences/creating-and-managing-elements.md
```

> **Liferay 엔터프라이즈 검색(LES) 가입자**

Liferay Enterprise Search Experiences 앱에는 최종 사용자의 검색 경험을 세밀하게 제어할 수 있는 기능 모음이 포함되어 있습니다. 검색 관리자는 복잡도가 다양한 검색 사용자 지정을 위해 검색 경험을 사용할 수 있습니다.

- Liferay의 기본 검색 페이지 동작을 약간 조정합니다.
- 검색 페이지 동작을 완전히 재정의
- 검색 사용자의 속성을 기반으로 컨텍스트 인식 검색 결과 구성

## 청사진 검색

검색 청사진은 검색 경험 애플리케이션의 첫 번째 기능입니다. 기능 및 기본 구성 요소에 대해 알아보려면 다음을 참조하십시오.

- [청사진 이해](./search-experiences/understanding-search-blueprints.md)
- [검색 Blueprint 생성 및 관리](./search-experiences/creating-and-managing-search-blueprints.md)
- [검색 페이지에서 검색 청사진 사용](./search-experiences/using-a-search-blueprint-on-a-search-page.md)
- [검색 경험 개인화](./search-experiences/personalizing-the-search-experience.md)
- [청사진 요소 참조 검색](./search-experiences/search-blueprints-elements-reference.md)
- [청사진 구성 참조 검색](./search-experiences/search-blueprints-configuration-reference.md)
- [요소 생성 및 관리](./search-experiences/creating-and-managing-elements.md)
  - [요소 생성](./search-experiences/creating-and-managing-elements/creating-elements.md)
  - [요소 관리](./search-experiences/creating-and-managing-elements/managing-elements.md)
  - [미리 정의된 요소 변수 참조](./search-experiences/creating-and-managing-elements/predefined-element-variables-reference.md)

## Liferay 검색 경험 얻기

Liferay 검색 경험은 Liferay DXP 7.3에서 [Liferay 엔터프라이즈 검색](../liferay-enterprise-search.md) 구독 및 Liferay 7.4</a>에서 Liferay DXP와 함께 번들로 제공되는Liferay DXP 고객에게 제공됩니다. 자세한 내용은 [LES 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651#DXP-7.3-LES) 을 확인하십시오.</p> 

| 버전 가용성          | 설치 방법                                                                                                               | 배송 방법 수정                                                                                              |
|:--------------- |:------------------------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------------------------------- |
| DXP 7.4 업데이트 5+ | [번들 및 활성화](activating-liferay-enterprise-search.md)                                                                 | [DXP 업데이트](../../../installation-and-upgrades/maintaining-a-liferay-installation/updating-liferay.md) |
| DXP 7.3 업데이트 6+ | [다운로드](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3) 및 설치(아래 단계) | 앱 출시                                                                                                  |


Liferay DXP 7.3에서 검색 경험은 LES 가입자에게 애드온 애플리케이션으로 제공됩니다.

1. [고객 포털](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3)에서 앱을 다운로드하십시오.
1. Liferay DXP에 애플리케이션 설치 
      * Liferay 번들을 실행하는 경우 LPKG를 `[Liferay Home]/deploy` 폴더에 복사합니다. Liferay가 실행되고 있지 않으면 Liferay를 시작하기 전에 `[Liferay Home]/osgi/marketplace` 에 직접 복사할 수 있습니다.
   * Liferay Docker 컨테이너를 실행하는 경우 [지원되는 방법 중 하나로 LPKG를 설치합니다](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md).



## 검색 경험 REST API

Search Experiences 애플리케이션은 Liferay의 다른 기본 애플리케이션과 일관성을 유지하기 위해 REST API 엔드포인트(경로 `search-experiences-rest`아래)를 게시하고 사용합니다.



```{warning}
타사 코드가 Search Experiences API를 사용하는 것은 휘발성이므로 권장하지 않습니다. 여기에는 [Blueprints 미리보기 기능](./search-experiences/creating-에서만 사용하도록 의도된 `/search` 엔드포인트가 포함됩니다. and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar). 기능이 발전함에 따라 스키마 변경이 발생할 것으로 예상되며 Liferay는 검색 경험 API를 사용하는 사용자 정의 코드를 지원하지 않습니다. 이 결정은 향후 API가 더 안정됨에 따라 변경될 수 있습니다.
```
