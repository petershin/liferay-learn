# 패턴 리디렉션 사용

{bdg-secondary}`사용 가능 7.4 U42+/GA42+`

패턴 리디렉션은 정규식을 사용하여 여러 소스 URL 및 대체 항목에 대한 패턴을 정의합니다. 이러한 이유로 새 URL에 매핑해야 하는 대규모 URL 그룹이 있을 때 가장 잘 사용됩니다. Nginx 또는 Apache와 같은 웹 서버를 사용하여 대량 리디렉션을 설정할 수 있지만 Liferay는 즉시 이 기능을 제공하므로 Liferay DXP에서 직접 패턴 리디렉션을 설정할 수 있습니다.

```{important}
Liferay에서 리디렉션 패턴은 현재 사이트의 친숙한 URL을 기반으로 친숙한 URL로 해석됩니다. 이러한 이유로 친숙하지 않은 URL(예: 가상 호스트 이름, 포트 번호)로 리디렉션 패턴을 사용하거나 현재 사이트 외부의 페이지로 사용자를 리디렉션할 수 없습니다.

또한 사용하는 정규식에 따라 패턴 리디렉션이 [alias redirects](../managing-site-urls.md#site-redirects) 보다 느리고 의도한 것보다 더 많은 URL 일치가 발생할 수 있습니다. 이러한 이유로 대부분의 사용 사례에서 별칭 리디렉션이 권장됩니다. 설정에 대한 자세한 내용은 [리디렉션 도구 사용](./using-the-redirection-tool.md)을 참조하세요.
```

사이트에 대한 패턴 리디렉션을 설정하려면 다음 단계를 따르세요.

1. 원하는 사이트로 이동합니다.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **구성** 를 확장한 다음 **사이트 설정** 으로 이동합니다.

1. 콘텐츠 및 데이터에서 **페이지** 을 클릭하고 **리디렉션 패턴** 탭으로 이동합니다.

   ![시스템 설정에서 페이지를 클릭하고 리디렉션 패턴 탭으로 이동합니다.](./using-pattern-redirects/images/01.png)

1. 리디렉션 패턴을 입력합니다. 필요한 경우 **더하기** 버튼을 클릭하여 사이트에 대한 여러 리디렉션 패턴을 추가할 수 있습니다.

   각 리디렉션 패턴에는 소스 URL 패턴과 대상 URL 패턴이 포함되어야 합니다. 이러한 값은 동일한 항목에 추가되며 하나 이상의 공백으로 구분됩니다. 원본 URL을 설정할 때 정규식을 사용하십시오. 각 정규식은 각 페이지의 친숙한 URL 시작 부분에 암시적으로 고정되어 있습니다(예: 정규식에서 `/home` 은 `^/home` 과 동일함).

   Liferay는 Java 정규식 패키지에서 제공하는 모든 작업을 지원합니다. 자세한 내용은 공식 [JDK 설명서](https://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html) 을 참조하십시오.

   ![리디렉션 패턴의 소스 및 대상 URL을 입력합니다.](./using-pattern-redirects/images/02.png)

   ```{tip}
   원하는 경우 참조를 사용하여 교체 패턴의 URL 그룹을 캡처할 수 있습니다. 예를 들어 위의 이미지에서 `$1` 값은 `(\d+)` 정규식으로 캡처된 값 그룹으로 대체됩니다.
   ```

1. **저장** 을 클릭합니다.

사용자가 소스 URL에 액세스하려고 시도하면 Liferay는 지정된 순서대로 레이아웃 친화적 URL에 대해 패턴을 테스트합니다. 일치 프로세스는 대략 다음 규칙을 따릅니다.

* URL이 제어판 URL인 경우 제어판 URL을 캡처할 수 없으므로 일치가 수행되지 않습니다.

* 현재 URL에 대한 별칭 리디렉션이 있는 경우 사용자는 해당 대상 URL로 리디렉션됩니다.

* 별칭이 없으면 Liferay는 모든 패턴이 소진되거나 그 중 하나가 일치할 때까지 각 리디렉션 패턴을 순서대로 테스트합니다. Liferay는 사용자를 첫 번째 경기로 리디렉션합니다.

## 관련 주제

* [사이트 URL 관리](../managing-site-urls.md)
* [리디렉션 도구 사용](./using-the-redirection-tool.md)
* [가상 호스트 사이트 URL 구성](./managing-site-urls/configuring-virtual-hosts-site-urls.md)
* [사이트의 친숙한 URL 구성](./managing-site-urls/configuring-your-sites-friendly-url.md)
