---
uuid: 86f08f77-e511-4054-86eb-13cf4b3dd3ba
---

# 패턴 리디렉션 사용

{bdg-secondary}`사용 가능 7.4 U48+/GA48+`

패턴 리디렉션은 정규식을 사용하여 여러 소스 URL 및 대체 항목에 대한 패턴을 정의합니다. 이러한 이유로 새 URL에 매핑할 URL 그룹이 많을 때 사용하는 것이 가장 좋습니다. Nginx 또는 Apache와 같은 웹 서버에서 대량 리디렉션을 생성할 수 있지만 Liferay는 즉시 이를 제공하므로 Liferay에서 직접 패턴 리디렉션을 설정할 수 있습니다.

```{important}
Liferay는 리디렉션 패턴을 현재 사이트의 친숙한 URL을 기반으로 친숙한 URL로 해석하기 때문에 친숙하지 않은 URL(예: 가상 호스트 이름, 포트 번호)이 있는 리디렉션 패턴을 사용하거나 현재 사이트 외부의 페이지로 리디렉션할 수 없습니다.

사용하는 정규식에 따라 패턴 리디렉션이 [alias redirects](./using-alias-redirects.md)보다 느려질 수 있으며 의도한 것보다 더 많은 URL 일치가 발생할 수 있습니다. 이러한 이유로 가능한 경우 별칭 리디렉션이 권장됩니다. 자세한 내용은 [리디렉션 및 404 추적 설정](../setting-up-redirects-and-404-tracking.md)을 참조하십시오.
```

## 패턴 리디렉션 만들기

1. *사이트 메뉴* (![Site Menu](../../../../images/icon-product-menu.png))을 열고 *구성* &rarr; *리디렉션*로 이동합니다.

1. *패턴* 탭으로 이동합니다.

   ![리디렉션 애플리케이션의 패턴 탭으로 이동합니다.](./using-pattern-redirects/images/01.png)

1. 패턴 필드에 소스 URL에 대한 정규식을 입력하십시오. 각 페이지의 친숙한 URL 시작 부분에 암시적으로 고정되어 있으므로 정규식에서 `/home` 은 `^/home` 과 동일합니다.

   Liferay는 Java 정규식 패키지에서 제공하는 모든 작업을 지원합니다. 자세한 내용은 [JDK 설명서](https://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html) 참조하십시오.

1. 도착 URL을 입력하세요.

   ```{tip}
   대체 패턴에서 URL 그룹을 캡처하기 위해 참조를 사용할 수 있습니다. 예를 들어 다음 이미지에서 `$1` 값은 `(\d+)` 정규식으로 캡처된 값 그룹으로 대체됩니다.
   ```

   ![리디렉션 패턴의 소스 및 대상 URL을 입력합니다.](./using-pattern-redirects/images/02.png)

1. (선택 사항) *더하기* 버튼을 클릭하여 사이트에 대한 여러 리디렉션 패턴을 추가합니다.

1. *저장*클릭합니다.

```{warning}
순환 리디렉션을 생성하지 마십시오. 이는 콘텐츠 친화적 URL에 대한 리디렉션을 정의할 때 쉽게 생성할 수 있습니다(예: 동일한 콘텐츠에 대한 서로 다른 친숙한 URL 간의 리디렉션). Liferay는 이러한 루프를 안정적으로 감지할 수 없습니다.
```

## 패턴 리디렉션 이해

사용자가 소스 URL에 액세스하려고 시도하면 Liferay는 지정된 순서대로 레이아웃 친화적 URL에 대해 패턴을 테스트합니다. 일치 프로세스는 대략 다음 규칙을 따릅니다.

* URL이 제어판 URL인 경우 제어판 URL을 캡처할 수 없으므로 일치가 수행되지 않습니다.

* 현재 URL에 대한 별칭 리디렉션이 있는 경우 사용자는 해당 대상으로 리디렉션됩니다.

* 별칭이 없으면 Liferay는 모든 패턴이 소진되거나 그 중 하나가 일치할 때까지 각 리디렉션 패턴을 순서대로 테스트합니다. Liferay는 사용자를 첫 번째 경기로 리디렉션합니다.

## 추가 정보

* [사이트 URL 관리](../../managing-site-urls.md)
* [별칭 리디렉션 사용](./using-alias-redirects.md)
* [가상 호스트 사이트 URL 구성](../configuring-virtual-hosts-site-urls.md)
* [사이트의 친숙한 URL 구성](../configuring-your-sites-friendly-url.md)
