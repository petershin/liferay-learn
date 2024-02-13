---
toc:
  - ./managing-site-urls/configuring-your-sites-friendly-url.md
  - ./managing-site-urls/configuring-virtual-hosts-site-urls.md
  - ./managing-site-urls/setting-up-redirects-and-404-tracking.md
---
# 사이트 URL 관리

Liferay DXP는 사이트 URL 구성 및 관리를 위한 다양한 기본 기능을 제공합니다.

## 가상 호스트 사이트 URL

Liferay 서버에 대한 가상 호스트를 구성하여 도메인 이름(예: `www.helloworld.com`) 및 하위 도메인 이름(예: `developer.helloworld.com`)을 사이트에 연결하십시오. 이러한 방식으로 하나의 Liferay DXP 서버에서 여러 개의 개별 사이트를 호스팅할 수 있습니다. 자세한 내용은 [가상 호스트 사이트 URL 구성](./managing-site-urls/configuring-virtual-hosts-site-urls.md) 을 참조하십시오.

## 친숙한 URL

사용자가 사이트에 빠르게 액세스할 수 있도록 친근한 URL을 정의하십시오. Liferay 서버의 각 친숙한 URL은 고유해야 하며 `https://[server:port]/web` (예: `https://localhost:8080/web/hello-world/`)에 추가됩니다. 자세한 내용은 [사이트의 친숙한 URL 구성](./managing-site-urls/configuring-your-sites-friendly-url.md) 을 참조하십시오.

```{note}
페이지 및 문서에 대해 친숙한 URL을 구성할 수도 있습니다. [페이지의 친숙한 URL 구성](../creating-pages/page-settings/configuring-your-pages-friendly-url.md) 및 [문서 URL 구성](../../content-authoring-and-management/documents-and-media/uploading-and-managing/configuring-document-urls.md)를 참조하십시오.
```

## 사이트 리디렉션

404를 방지하고 사용자 환경을 개선하려면 사이트에 대한 URL 리디렉션을 설정하십시오. Liferay DXP를 사용하면 별칭 리디렉션과 패턴 리디렉션이라는 두 가지 유형의 리디렉션을 정의할 수 있습니다.

**별칭 리디렉션** : 이러한 리디렉션은 절대 소스 URL과 절대 대상 URL을 명시적으로 정의합니다. 이러한 이유로 대부분의 사용 사례에서 더 예측 가능하고 권장됩니다. 사이트에 대한 별칭 리디렉션 설정에 대한 지침은 [별칭 리디렉션 사용](./managing-site-urls/setting-up-redirects-and-404-tracking/using-alias-redirects.md) 참조하십시오.

**패턴 리디렉션** {bdg-secondary}`7.4 U42+/GA42+`: 이러한 리디렉션은 정규식을 사용하여 소스 URL 및 해당 대체에 대한 패턴을 정의합니다. 이러한 이유로 URL 계열을 빠르게 일치시키는 데 가장 적합합니다. 그러나 정규식에 따라 별칭 리디렉션보다 속도가 느려 의도한 것보다 더 많은 URL 일치가 발생할 수 있습니다. 사이트에 설정하는 방법에 대한 자세한 내용은 [패턴 리디렉션 사용](./managing-site-urls/setting-up-redirects-and-404-tracking/using-pattern-redirects.md) 참조하십시오.

## 404 URL

리디렉션 도구를 사용하여 404 오류로 이어지는 사이트 요청을 추적하고 관리합니다. 활성화되면 Liferay DXP는 각 404 오류를 분류하므로 모든 문제를 평가하고 신속하게 해결할 수 있습니다. 자세한 내용 및 사용 가능한 구성 옵션은 [추적 404 URL](./managing-site-urls/setting-up-redirects-and-404-tracking/tracking-404-urls.md) 참조하십시오.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 사이트의 친숙한 URL 구성
:link: ./managing-site-urls/configuring-your-sites-friendly-url.md
:::

:::{grid-item-card} 가상 호스트 사이트 URL 구성
:link: ./managing-site-urls/configuring-virtual-hosts-site-urls.md
:::

:::{grid-item-card} 리디렉션 및 404 추적 설정
:link: ./managing-site-urls/setting-up-redirects-and-404-tracking.md
:::
::::
