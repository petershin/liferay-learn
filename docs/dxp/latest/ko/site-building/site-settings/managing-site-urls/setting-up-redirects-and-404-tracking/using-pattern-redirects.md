# 패턴 리디렉션 사용

{bdg-secondary}`7.4 U48+/GA48+ 사용 가능`

패턴 리디렉션은 정규식을 사용하여 여러 소스 URL 및 대체 URL에 대한 패턴을 정의합니다. 따라서 새 URL에 매핑할 대규모 URL 그룹이 있을 때 가장 잘 사용됩니다. Nginx 또는 Apache와 같은 웹 서버에서 대량 리디렉션을 생성할 수 있지만 이는 기본 기능이므로 Liferay에서 직접 패턴 리디렉션을 설정할 수 있습니다.

```{important}
Liferay는 현재 사이트의 친숙한 URL을 기반으로 리디렉션 패턴을 친숙한 URL로 해석하므로 친숙하지 않은 URL(예: 가상 호스트 이름, 포트 번호)이 있는 리디렉션 패턴을 사용하거나 현재 사이트 범위 외부의 페이지로 리디렉션(예: 리디렉션)할 수 없습니다. A 사이트의 A 페이지에서 B 사이트의 B 페이지로).

하지만 주소 앞에 프로토콜을 추가하면 외부 웹사이트로 리디렉션할 수 있습니다. (예: 외부 웹사이트로 리디렉션하려면 http://www.externalwebsite.com을 사용하세요.)

사용하는 정규식에 따라 패턴 리디렉션은 [별칭 리디렉션](./using-alias-redirects.md)보다 느릴 수 있으며 의도한 것보다 더 많은 URL 일치가 발생할 수 있습니다. 이러한 이유로 가능하면 별칭 리디렉션을 권장합니다. 자세한 내용은 [리디렉션 및 404 추적 설정](../setting-up-redirects-and-404-tracking.md)을 참조하세요.
```

## 패턴 리디렉션 만들기

1. **사이트 메뉴**( ![사이트 메뉴](../../../../images/icon-product-menu.png) )를 열고 **구성** &rarr; **리디렉션** 으로 이동합니다.

1. **패턴** 탭으로 이동하세요.

   ![Go to the Patterns tab in the Redirection application.](./using-pattern-redirects/images/01.png)

1. 패턴 필드에 소스 URL에 대한 정규식을 입력합니다. 각 페이지의 친숙한 URL 시작 부분에 암시적으로 고정되어 있으므로 `/home`은 정규 표현식의 `^/home`과 동일합니다.

   Liferay는 Java 정규식 패키지에서 제공하는 모든 작업을 지원합니다. 자세한 내용은 [JDK 설명서](https://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html) 를 참조하세요.

1. 도착 URL을 입력하세요.

   ```{tip}
   참조를 사용하여 교체 패턴의 URL 그룹을 캡처할 수 있습니다. 예를 들어 다음 이미지에서 `$1` 값은 `(d+)` 정규식으로 캡처된 값 그룹으로 대체됩니다.
   ```

   ![Enter source and destination URLs for your redirect patterns.](./using-pattern-redirects/images/02.png)

1. (선택 사항) 사이트에 대한 여러 리디렉션 패턴을 추가하려면 **플러스** 버튼을 클릭하세요.

1. **저장** 을 클릭하세요.

```{warning}
순환 리디렉션을 만들지 마세요. 이는 콘텐츠 친화적 URL에 대한 리디렉션을 정의할 때 쉽게 생성할 수 있습니다(예: 동일한 콘텐츠에 대해 서로 다른 친숙한 URL 간 리디렉션). Liferay는 이러한 루프를 안정적으로 감지할 수 없습니다.
```

### 패턴 리디렉션 생성: 도메인 변경

https://www.old-site.com 및 https://www.new-site.com과 같은 두 개의 도메인이 있는 경우 한 도메인에서 다른 도메인으로 페이지를 리디렉션할 수 있습니다.

1. https://www.old-site.com으로 이동합니다.

1. **사이트 메뉴**( ![사이트 메뉴](../../../../images/icon-product-menu.png) )를 열고 **구성** &rarr; **리디렉션** 으로 이동합니다.

1. 패턴 아래에 `^(.*)`를 추가합니다.

   이 정규식은 소스 요청의 전체 URL 경로를 캡처합니다.

1. 도착 URL 아래에 `https://www.new-site.com/$0`을 추가합니다.

   `$0`은 소스에서 대상 URL까지 캡처된 전체 URL 경로를 추가합니다.

1. **저장** 을 클릭하세요.

이제 https://www.old-site.com/examplepage로 이동하면 https://www.new-site.com/examplepage로 리디렉션됩니다.

## 패턴 리디렉션 이해

사용자가 소스 URL에 액세스하려고 하면 Liferay는 지정된 순서대로 레이아웃 친화적인 URL에 대해 패턴을 테스트합니다. 일치 프로세스는 대략 다음 규칙을 따릅니다.

* URL이 제어판 URL인 경우 제어판 URL을 캡처할 수 없으므로 일치가 수행되지 않습니다.

* 현재 URL에 대한 별칭 리디렉션이 있는 경우 사용자는 해당 대상으로 리디렉션됩니다.

* 별칭이 발견되지 않으면 Liferay는 모든 패턴이 소진되거나 그 중 하나가 일치할 때까지 각 리디렉션 패턴을 순서대로 테스트합니다. Liferay는 사용자를 첫 번째 일치 항목으로 리디렉션합니다.

## 관련 주제

* [사이트 URL 관리](../../managing-site-urls.md)
* [별칭 리디렉션 사용](./using-alias-redirects.md)
* [가상 호스트 사이트 URL 구성](../configuring-virtual-hosts-site-urls.md)
* [사이트의 친숙한 URL 구성](../configuring-your-sites-friend-url.md)
