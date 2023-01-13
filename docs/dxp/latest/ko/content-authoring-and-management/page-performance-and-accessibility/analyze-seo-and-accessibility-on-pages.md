# 페이지의 SEO 및 접근성 분석

Liferay DXP 7.4부터 페이지 감사 도구를 사용하여 페이지의 SEO 및 접근성을 검사할 수 있습니다. 페이지 감사 도구는 [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) 서비스를 사용하여 Liferay DXP에 대한 특정 권장 사항을 제공합니다. 이 도구를 사용하여 콘텐츠 작성자는 다음을 수행할 수 있습니다.

- Pages가 검색 엔진 인덱싱 및 가시성에 최적화되어 있는지 확인하여 Pages가 검색 결과에서 더 나은 순위를 매기고 올바른 고객에게 도달하는지 확인하십시오.
- 페이지가 최상의 접근성 관행을 준수하는지 확인하여 모든 개인의 사용성과 전반적인 경험을 개선합니다.
- 실행 가능한 정보를 사용하여 페이지에 영향을 미치는 SEO 및 접근성 문제를 수정합니다.

```{important}
페이지 감사 도구는 PageSpeed Insights를 사용하므로 공개적으로 액세스할 수 있는 페이지에서만 작동합니다. Liferay 시스템에 대해 활성화된 경우 개인 페이지와 함께 도구를 사용할 수 없습니다.
```

## SEO 및 접근성 검사

Liferay DXP의 페이지 감사 도구는 다음 요소를 평가합니다.

SEO 문제:

- 잘못된 이미지 종횡비
- 누락된 메타 설명
- 링크 텍스트
- 색인 생성이 차단된 페이지
- 잘못된 `hreflang`
- 잘못된 표준 URL
- 읽을 수 없는 글꼴 크기
- 작은 탭 타겟
- 누락된 `<title>` 요소
- 모든 링크를 크롤링할 수 있는 것은 아닙니다.

접근성 문제:

- 낮은 명암비
- 누락된 `img-alt` 속성
- 누락된 `입력-대체` 속성

페이지 감사를 실행한 후 문제를 해결하기 위해 실행 가능한 정보와 함께 각 문제에 대한 설명을 검토할 수 있습니다. 이러한 각 요소에 대한 자세한 내용은 [Google Lighthouse 설명서](https://web.dev/learn/#lighthouse)을 참조하십시오.

## 페이지 감사 도구 구성

```{note}
페이지 감사 도구를 구성하려면 Liferay DXP에 대한 관리 액세스 권한이 필요합니다.
```

페이지 감사 도구는 기본적으로 활성화되어 있지만 페이지 감사를 실행하기 전에 도구 구성을 완료해야 합니다. 이 구성에는 다음이 필요합니다.

- PageSpeed Insights API 키. PageSpeed Insights를 자동화된 방식으로 사용하고 초당 여러 쿼리를 실행하려면 Google에서 이 키가 필요합니다. 이 API 키를 생성하려면 Google 설명서의 [PageSpeed Insights API 시작하기](https://developers.google.com/speed/docs/insights/v5/get-started) 을 참조하십시오.
- 페이지 감사를 위한 선호 전략. 기본적으로 페이지 감사 도구는 모바일 전략을 사용하지만 데스크톱 전략을 구성하여 페이지를 분석할 수도 있습니다. 모바일 전략에는 작은 화면에서 콘텐츠를 감사하기 위한 추가 규칙이 포함됩니다. 선택한 전략은 모든 페이지 감사에 적용되므로 페이지의 모바일 및 데스크톱 버전을 감사하려면 각 감사 전략을 별도로 실행해야 합니다.

![페이지 감사 도구 API 키 및 감사 전략 구성](./analyze-seo-and-accessibility-on-pages/images/01.png)

페이지 감사 도구를 구성하려면 Liferay DXP에서 Google PageSpeed Insights 설정을 구성합니다. Liferay DXP의 다른 설정과 마찬가지로 다양한 범위에서 페이지 감사 도구를 활성화하거나 비활성화할 수 있습니다. 이러한 구성 설정에 액세스하려면 관리 권한이 있어야 합니다. 자세한 내용은 [구성 범위 이해](../../system-administration/configuring-liferay/understanding-configuration-scope.md)을 참조하십시오.

### 현재 사이트에 대한 페이지 감사 도구 구성

1. 사이트 메뉴(![Site Menu](../../images/icon-product-menu-open.png))를 선택하고 구성 &rarr; 사이트 설정으로 이동합니다.
1. 콘텐츠 및 데이터 섹션에서 *페이지*을 클릭합니다.
1. 사이트 범위 섹션에서 *Google PageSpeed Insights*을 클릭합니다.

   ![현재 사이트 범위에서 Google PageSpeed Insights 설정을 사용하여 페이지 감사 도구를 구성합니다.](./analyze-seo-and-accessibility-on-pages/images/02.png)

   ```{note}
   Google PageSpeed Insights 설정은 설정이 상위 범위로 활성화된 경우에만 사이트 범위에서 사용할 수 있습니다. 자세한 내용은 [구성 범위 이해](../../system-administration/configuring-liferay/understanding-configuration-scope.md)를 참조하세요.
   ```

1. Google PageSpeed Insights 활성화 체크박스가 선택되어 있는지 확인합니다.
1. Google PageSpeed Insights API 키를 복사하고 이 키를 API 키 필드 아래에 붙여넣습니다.
1. PageSpeed Insights 테스트를 위한 선호하는 전략을 선택하세요. 선택한 전략은 모든 페이지 감사에 적용됩니다.
1. *저장*을 클릭합니다.

### Liferay DXP 시스템용 페이지 감사 도구 구성

1. Liferay DXP 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 클릭합니다.
1. *제어판* 탭을 선택하고 구성에서 *시스템 설정*을 클릭합니다.
1. 콘텐츠 및 데이터 섹션에서 *페이지*을 클릭합니다.
1. 원하는 범위(시스템, 가상 인스턴스 또는 사이트)에서 *Google PageSpeed Insights*을 클릭합니다.
1. 페이지 감사 도구를 사용하거나 사용하지 않으려면 *Google PageSpeed Insights 사용* 확인란을 선택하거나 선택 취소합니다.

   ![시스템, 가상 인스턴스 또는 사이트 범위에서 페이지 감사 도구 설정 구성](./analyze-seo-and-accessibility-on-pages/images/03.png)

1. *업데이트*을 클릭합니다.

페이지 감사 도구를 전체적으로 비활성화하려면 시스템 범위에서 Google PageSpeed Insights 활성화 옵션을 선택 취소합니다.

## 페이지 감사 도구 액세스 및 페이지 감사 실행

1. 감사할 페이지에 액세스하고 애플리케이션 표시줄에서 *페이지 감사* (![Page Audit](../../images/icon-information.png)) 버튼을 클릭합니다.

   ![새 페이지 감사를 시작하려면 페이지 감사 버튼을 클릭하십시오.](./analyze-seo-and-accessibility-on-pages/images/05.png)

   ```{note}
   페이지 감사를 아직 구성하지 않은 경우 페이지 감사 패널에 구성을 완료하라는 메시지가 표시됩니다. 이 경우 *구성*을 클릭하고 [구성을 완료](#configuring-the-page-audit-tool)합니다.
   ```

1. 페이지 감사 패널에 페이지 감사 시작 버튼이 표시됩니다.
1. *페이지 감사 실행* 을 클릭하여 페이지를 Google PageSpeed Insights에 연결하고 감사 프로세스를 시작합니다.

테스트를 실행한 후 페이지를 열고 페이지 감사(![Page Audit](../../images/icon-information.png)) 버튼을 클릭하여 항상 마지막 감사 결과를 검토할 수 있습니다.

## 페이지 감사 도구에서 SEO 및 접근성 문제 분석

감사를 실행한 후 페이지 감사 도구는 Google PageSpeed Insights 규칙에 따라 페이지 문제를 표시합니다. 테스트 이름 옆의 숫자는 특정 테스트의 총 오류 수를 나타냅니다(또는 테스트에 100개 이상의 오류가 있는 경우 `+100`).

문제를 클릭하면 세 개의 섹션이 표시됩니다.

**설명(C):** 선택한 감사 테스트에 대한 일반 정보를 제공합니다.

**팁(D):** 오류 소스에 대한 자세한 정보와 Liferay DXP에서 오류를 수정하거나 완화하는 방법을 포함합니다.

**실패 요소(E):** PageSpeed Insight 규칙을 사용하여 테스트를 통과하지 못한 페이지 요소를 나열합니다.

![페이지 감사 도구 GUI는 문제를 수정하거나 완화하기 위해 실행 가능한 정보와 함께 페이지의 문제 목록을 표시합니다.](./analyze-seo-and-accessibility-on-pages/images/04.png)

페이지 감사 도구를 사용할 때 다음 정보를 고려하십시오.

- 페이지에서 이전 감사 테스트를 실행한 경우 페이지 감사 도구는 마지막 테스트에 대한 실행 시간 및 테스트 결과를 표시합니다. 페이지 감사 결과를 업데이트하려면 다시 시작(![relaunch](../../images/icon-restore2.png)) 아이콘(A)을 클릭하여 새 테스트를 실행하십시오.
- 페이지 감사 도구는 주어진 시간에 페이지의 SEO 및 접근성 문제를 분석합니다. 페이지 또는 페이지의 콘텐츠가 변경되면(예: 동적 콘텐츠를 표시할 때) 테스트 결과가 달라질 수 있습니다.
- 페이지 감사는 [기본 경험](../../site-building/personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) 에 대한 결과만 표시합니다.
- 페이지가 현지화된 경우 각 언어에 대해 페이지 감사 테스트를 실행할 수 있습니다. 테스트를 실행하기 전에 페이지 감사 도구에서 _플래그_ 버튼을 클릭하고 언어를 선택합니다.

  ![페이지 감사 도구의 플래그 버튼을 사용하여 감사하려는 페이지 언어를 변경할 수 있습니다.](./analyze-seo-and-accessibility-on-pages/images/06.gif)

- [원격 라이브 스테이징](../../site-building/publishing-tools/staging.md) 을 사용하여 페이지를 게시하고 스테이징 환경이 인터넷에 연결되어 있지 않은 경우 라이브 환경에서 페이지 감사 도구를 사용할 수 있지만 스테이징 환경에서만 문제를 해결할 수 있습니다.

## 페이지 감사 패널 오류 문제 해결

페이지를 감사할 때 오류를 방지하려면 [유효한 Google PageSpeed Insights API 키를 구성](#configuring-the-page-audit-tool)하고 감사하려는 페이지에 인터넷에서 액세스할 수 있는지 확인하세요.

### 일반적인 오류

| 오류                 | 묘사                                                                                                                                                                                                                                   |
|:------------------ |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| API 키가 유효하지 않습니다   | Google PageSpeed Insights API 키가 잘못되었습니다. 오류 메시지에서 *Set API Key* 버튼을 클릭하여 유효한 API Key를 설정합니다. </br>API 키를 얻으려면 Google 설명서의 [PageSpeed Insights API 시작하기](https://developers.google.com/speed/docs/insights/v5/get-started) 를 참조하십시오. |
| 이 페이지는 감사할 수 없습니다. | 감사하려는 페이지는 공개적으로 액세스할 수 없습니다.                                                                                                                                                                                                        |
| 의외 과실은 일어났다        | 이것은 일반적인 오류입니다. 페이지 감사 도구가 올바르게 구성되어 있고 감사하려는 페이지가 인터넷에서 액세스 가능한지 확인하십시오.                                                                                                                                                            |

## 추가 정보

- [구글 페이지 스피드 인사이트](https://developers.google.com/speed/pagespeed/insights/)
- [PageSpeed Insights API 시작하기](https://developers.google.com/speed/docs/insights/v5/get-started)
- [구성 범위 이해](../../system-administration/configuring-liferay/understanding-configuration-scope.md)
