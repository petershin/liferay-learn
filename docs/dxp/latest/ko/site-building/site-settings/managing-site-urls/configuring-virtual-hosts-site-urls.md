# 가상 호스트 사이트 URL 구성

가상 호스트는 도메인 이름(예: `www.helloworld.com`)을 사이트에 연결합니다. 이는 전체 도메인 또는 하위 도메인(예: `developer.helloworld.com`)일 수 있습니다. 이를 사용하여 하나의 Liferay DXP 서버에서 여러 웹사이트를 별도의 사이트로 호스팅할 수 있습니다. 가상 호스트 사이트 URL을 구성하려면 다음 단계를 따르십시오.

1. 공급자와 함께 Liferay DXP 인스턴스의 IP 주소를 가리키도록 DNS 이름을 설정합니다. <!-- I think we can take this .5 step further by either linking to a often cited resource on how on a common domain name provider, a user would update the DNS name to point to a particular IP address. -->

1. Liferay DXP 내에서 사이트 메뉴(![Site Menu](../../../images/icon-product-menu.png))를 열고 **구성** 확장한 다음 **사이트 설정** &rarr; **사이트 구성** &rarr; **사이트 URL** 으로 이동합니다.

   ![사이트 구성에서 사이트 URL로 이동합니다.](./configuring-virtual-hosts-site-urls/images/01.png)

1. **가상 호스트** 필드에 원하는 도메인 또는 하위 도메인을 입력합니다(예: `www.helloworld.com`, `http://developers.helloworld.com`).

   ![가상 호스트를 특정 로케일로 지정할 수 있습니다.](./configuring-virtual-hosts-site-urls/images/02.png)

   ```{important}
   도메인은 단일 사이트에만 적용할 수 있습니다. 단일 도메인을 여러 사이트에 매핑할 수 없습니다.
   ```

1. (선택 사항) Liferay 7.3 GA2부터 추가 가상 호스트 도메인에 대해 **더하기** 버튼(![Plus Button](../../../images/icon-plus.png))을 클릭합니다.

1. (선택 사항) Liferay 7.3 GA2부터 각 가상 호스트에 대한 언어를 선택합니다. 사이트의 각 번역에 대한 도메인이 있는 경우 각 도메인에 대한 가상 호스트를 추가할 수 있습니다.

   ```{note}
   로케일은 정의된 경우 사이트의 사용 가능한 언어로 제한됩니다. 로캘을 지정하지 않으면 사이트의 기본 로캘이 사용됩니다. 로케일은 연결된 모든 도메인의 사이트에 적용됩니다.
   ```

   ![서로 다른 도메인을 가리키도록 여러 가상 호스트를 추가할 수 있습니다.](./configuring-virtual-hosts-site-urls/images/03.png)

1. **저장** 클릭합니다.

이제 구성된 도메인을 사용하여 사이트에 액세스할 수 있습니다.

## 관련 주제

* [사이트의 친숙한 URL 구성](./configuring-your-sites-friendly-url.md)
* [리디렉션 및 404 추적 설정](./setting-up-redirects-and-404-tracking.md)
