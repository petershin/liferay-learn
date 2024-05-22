---
toc:
- ./setting-up-redirects-and-404-tracking/using-alias-redirects.md
- ./setting-up-redirects-and-404-tracking/using-pattern-redirects.md
- ./setting-up-redirects-and-404-tracking/tracking-404-urls.md
---
# 리디렉션 및 404 추적 설정

{bdg-secondary}`7.4 U48+/GA48+`

URL 무결성을 유지하는 것은 모든 사이트에서 중요합니다. Liferay의 **리디렉션** 도구는 HTTP 리디렉션을 관리하고 개별 사이트에 대한 404 오류를 추적하는 편리한 통합 방법을 제공합니다. 끊어진 링크를 피하고 수정하여 사용자 경험과 사이트 SEO를 모두 개선하는 데 사용하십시오.

애플리케이션에 액세스하려면 **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **구성** &rarr; **리디렉션** 로 이동합니다.

![사이트 메뉴의 리디렉션 페이지로 이동합니다.](./setting-up-redirects-and-404-tracking/images/01.png)

## 리디렉션 정의

두 가지 종류의 리디렉션을 정의할 수 있습니다.

**별칭 리디렉션** : 절대 소스 및 대상 URL을 사용하여 영구(301) 또는 임시(302) URL 리디렉션을 정의합니다.

**패턴 리디렉션** {bdg-secondary}`7.4 U48+/GA48+`: 소스 URL 및 해당 교체에 대한 패턴을 설정하는 정규식을 사용하여 대량 리디렉션을 정의합니다.

Liferay는 예측 가능성이 높기 때문에 대부분의 경우 별칭 리디렉션을 권장합니다. 패턴 리디렉션은 일치하는 URL 계열에 가장 적합합니다. 정확한 정규식에 따라 패턴 리디렉션이 느려지고 의도한 것보다 더 많은 URL 일치가 발생합니다. 자세한 내용은 [별칭 리디렉션 사용](./setting-up-redirects-and-404-tracking/using-alias-redirects.md) 및 [패턴 리디렉션 사용](./setting-up-redirects-and-404-tracking/using-pattern-redirects.md) 참조하십시오.

## 404 오류 해결

리디렉션 애플리케이션에서 404 오류를 발생시키는 사이트 요청을 보고 관리할 수 있으므로 모든 문제를 평가하고 신속하게 해결할 수 있습니다. Liferay 7.4+의 경우 404 추적은 기본적으로 비활성화되어 있습니다. 이 기능을 활성화하면 리디렉션 응용 프로그램에서 404 URL 탭이 활성화되고 오류 목록 작성이 시작됩니다. 자세한 내용은 [추적 404 URL](./setting-up-redirects-and-404-tracking/tracking-404-urls.md) 을 참조하십시오.


