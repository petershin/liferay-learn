# 페이지의 친숙한 URL 구성

Liferay DXP를 사용하면 사이트의 각 페이지에 친숙한 URL을 설정할 수 있습니다. 이러한 URL을 사용하면 사이트를 크롤링하는 검색 엔진 및 기타 도구에 주요 정보를 제공하면서 페이지 주소를 쉽게 이해하고 기억할 수 있습니다.

사이트 페이지를 만들 때 페이지 이름과 일치하도록 친숙한 URL이 자동으로 생성되지만 언제든지 변경할 수 있습니다. Liferay DXP는 또한 깨진 링크를 방지하고 변경 사항을 쉽게 되돌릴 수 있는 방법을 제공하기 위해 페이지에 대해 이전에 사용된 URL의 기록을 유지합니다.

## 페이지의 친숙한 URL 변경

페이지의 친숙한 URL을 변경하려면 **제품 메뉴** 을 열고 **사이트 빌더** &rarr; **페이지** 으로 이동합니다. 그런 다음 사용자 지정하려는 페이지에 대해 **작업** 버튼(![Actions button](../../../images/icon-staging-bar-options.png))을 클릭하고 **구성** 를 선택합니다.

![사용자 지정하려는 페이지의 작업 버튼을 클릭하고 구성을 선택합니다.](./configuring-your-pages-friendly-url/images/01.png)

또는 사용자 지정하려는 페이지로 이동하고 **페이지 구성** 버튼(![페이지 구성 버튼](../../../images/icon-cog.png)을 클릭하여 개별 페이지 설정에 액세스할 수 있습니다. ))**응용 프로그램 표시줄** 의 오른쪽 상단에 있습니다.

일반 탭에서 **친숙한 URL** 필드를 사용하여 페이지의 새 URL을 입력합니다. 현지화된 URL을 설정하려면 **언어 플래그** 을 클릭하고 원하는 언어를 선택하십시오. 완료되면 **저장** 을 클릭합니다.

![친숙한 URL 필드를 사용하여 페이지의 사용자 지정 URL을 설정합니다.](./configuring-your-pages-friendly-url/images/02.png)

이 필드에 입력된 값은 [사이트 URL](./../../site-settings/managing-site-urls/configuring-your-sites-friendly-url.md) 에 추가되며 고유해야 합니다.

```{note}
사용자 지정 URL을 설정할 때 사이트의 페이지 계층 구조를 유지할 필요가 없습니다. 이것은 하위 페이지가 친근한 URL의 일부로 상위를 포함할 필요가 없음을 의미합니다.
```

## 페이지의 URL 기록 관리

> 사용 가능: Liferay DXP/Portal 7.3+

Liferay DXP는 페이지에 사용되는 모든 친숙한 URL 목록을 유지합니다. 즉, 친숙한 URL을 변경할 때 수동으로 제거하지 않는 한 링크가 끊어지지 않도록 이전 URL이 페이지와 연결된 상태로 유지됩니다. 이전 URL을 사용하는 페이지 요청의 경우 Liferay는 활성 친화적 URL을 가리키는 브라우저(또는 다른 소비자)에 대한 리디렉션을 제공합니다.

페이지와 관련된 전체 URL 목록을 보고 관리하려면 **기록** 아이콘(![Friendly URL History icon](../../../images/icon-history.png))을 클릭하십시오. 선택한 언어에 대한 페이지의 활성 및 이전 URL을 표시하는 모달 창이 열립니다. **언어 플래그** 버튼을 클릭하여 다른 언어에 대한 설정된 URL을 볼 수도 있습니다.

![페이지의 친숙한 URL 기록을 언어별로 봅니다.](./configuring-your-pages-friendly-url/images/03.png)

여기에서 이전 URL 위로 마우스를 가져가면 다음 옵션이 표시됩니다.

**복원 URL** : 활성 URL을 이전 URL로 바꾸려면 **URL 복원** 버튼(![Restore icon](../../../images/icon-restore2.png))을 클릭하여 활성화합니다.

**URL 잊어버리기** : 페이지와 연결된 친숙한 URL을 더 이상 원하지 않으면 **URL 잊어버리기** 버튼(![Delete icon](../../../images/icon-delete.png))을 클릭하십시오. 사용자가 잊어버린 URL을 사용하여 페이지에 액세스하려고 하면 링크가 끊어지고 Liferay가 "찾을 수 없음" 메시지를 렌더링합니다.

![이전 URL 위로 마우스를 가져가면 복원 및 삭제 옵션이 표시됩니다.](./configuring-your-pages-friendly-url/images/04.png)

## 관련 주제

* [사이트의 친숙한 URL 구성](./../../site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [개별 페이지 구성](./configuring-individual-pages.md)
<!--Include Reference to SEO article when finished.-->
