# 공개 사이트 설정 변경

이제 공개 Clarity 사이트를 처음 변경했으므로 더 많은 사이트별 설정을 변경할 준비가 되었습니다.

인스턴스 설정 변경이 완료되었으므로 Kyle은 나머지 변경 사항을 직접 수행할 필요가 없습니다. 시작하기 전에 로그아웃했다가 공개 사이트 관리자인 Preston Palmer로 다시 로그인하십시오.

## 사이트 설명 추가

이제 Clarity 사이트에는 공개 시장으로서의 목적에 맞는 설명이 필요합니다.

1. Clarity 사이트로 돌아갑니다.

   `localhost:8080/web/guest`를 방문하면 자체 호스팅 인스턴스가 있는 기본 사이트로 리디렉션됩니다.

1. 사이트 메뉴에서 **구성** &rarr; **사이트 설정** 을 클릭합니다.

1. 사이트 설정 페이지에서 **사이트 구성** 을 클릭합니다.

   ![Click Site Configuration to access the general settings for your site.](./changing-your-public-sites-settings/images/01.png)

1. **설명** 필드에 "Clarity에서 완벽한 안경을 찾아보세요!"를 입력하세요.

1. **저장** 을 클릭하세요.

## 사이트 멤버십 설정 검사

이 화면 하단에는 사이트 멤버십에 대한 두 가지 컨트롤도 있습니다.

**멤버십 유형** : 사이트에서 멤버십이 작동하는 방식을 정의합니다. 선택 사항은 사용자가 사이트에 가입할 수 있음(**열림**), 사이트가 표시되지만 사용자가 가입을 요청해야 함(**제한됨**) 또는 사용자가 사이트에 특별히 초대되어야 하고 다른 방법으로는 볼 수 없음(**비공개**)입니다. ).

**수동 회원 관리 허용** : 사이트에 사용자를 수동으로 추가하거나 제거할 수 있는지 선택합니다.

나중에 개인 인트라넷과 엑스트라넷 사이트를 만들 때는 더 제한적인 멤버십 유형이 적합합니다.

이 사이트의 경우 모든 사용자가 계정에 등록할 수 있도록 기본 옵션을 유지하세요.

## 역할별로 메뉴 액세스 제한

다음으로 사이트의 주요 메뉴에 대한 액세스를 제한합니다. 사이트 사용자의 제어 메뉴(화면 상단에 있는 메뉴 표시줄)를 비활성화하면 왼쪽에 있는 사이트 메뉴에 액세스할 수도 없습니다.

기본적으로 사이트에 이미 가입한 새 회원은 [해당 권한이 있는 역할](https://learn.liferay.com/web/guest/w/dxp/users-) 이 없기 때문에 이러한 메뉴에 액세스할 수 없습니다. 및 권한/역할 및 권한/역할 및 권한 이해). 그러나 공개 Clarity 사이트에서는 이 설정을 사용하여 메뉴에 대한 액세스 권한을 부여할 역할을 신중하게 선택해야 합니다.

1. 사이트 구성 페이지에서 사이트 범위 아래의 **메뉴 액세스** 를 클릭합니다.

1. **역할별 제어 메뉴 표시** 확인란을 클릭합니다.

   ![Restrict Control Menu access so you can specifically choose which roles grant access to the Control Menu and Site Menu.](./changing-your-public-sites-settings/images/02.png)

1. **저장** 을 클릭하세요.

이제 사이트에서 특별히 선택된 역할을 가진 사용자(기본적으로 전역 관리자 또는 사이트 관리자만)만 이러한 중요한 메뉴를 볼 수 있습니다. 지금은 새 역할을 추가하지 마세요.

## 사이트 URL 변경

친숙한 URL은 특정 사이트로 연결되는 슬래시(`/`) 뒤의 URL 부분입니다. Clarity 사이트의 친숙한 URL을 더 적절한 URL로 구성하세요.

1. 사이트 구성 페이지에서 사이트 범위 아래의 **사이트 URL** 을 클릭합니다.

1. **Friendly URL** 필드에서 기본값(`/guest`)을 새 값 `/p`로 바꿉니다.

1. **저장** 을 클릭하세요.

이제 `/p`가 공개 사이트의 URL에 추가되고 [이전 인스턴스 설정 변경](./changing-the-default-sites-name-and-logo. md#change-other-important-instance-settings) .

## 쿠키 기본 설정 검사

다음으로 사용자가 사이트 쿠키를 허용하거나 거부하는 설정을 검사합니다.

1. 사이트 설정 메뉴로 돌아가려면 페이지 상단의 **뒤로** 버튼을 클릭하세요.

1. **쿠키** 를 클릭하세요.

   ![Click Cookies to access the configuration for specific optional cookies and their descriptions.](./changing-your-public-sites-settings/images/03.png)

여기서 위쪽 확인란을 사용하면 명시적 쿠키 동의 모드에서 사이트에서 선택한 쿠키에 대해 사용자가 더 많은 제어권을 제공하는 배너와 동의 패널이 활성화됩니다.

배너는 사이트의 쿠키를 수락하지 않은 경우 사용자에게 알리고 선택적인 **모두 거부** 버튼을 사용하여 쿠키가 필요한 이유를 설명합니다. 동의 패널은 사용자가 선택할 쿠키 유형을 확인하고 선택하는 데 도움이 됩니다.

Clarity 사이트에는 배너와 동의 패널을 적절하게 구성하기 위해 회사의 개인 정보 보호 정책에 대한 설명이 포함된 웹 페이지가 필요합니다. 지금은 옵션을 선택하지 않은 상태로 두세요.

## 접근성 메뉴 활성화

사용자가 더 나은 접근성과 가독성을 위해 사이트 동작을 조정할 수 있도록 Clarity 사이트에 대한 접근성 메뉴를 활성화합니다.

1. 사이트 설정 메뉴로 돌아가려면 페이지 상단의 뒤로 버튼을 클릭하세요.

1. **접근성** 을 클릭하세요.

   ![Click Accessibility to access the control to enable the Accessibility Menu.](./changing-your-public-sites-settings/images/04.png)

1. **접근성 메뉴 활성화** 확인란을 선택하세요.

1. **저장** 을 클릭하세요.

이 옵션을 활성화하면 사이트 페이지를 보는 사용자가 탭 키를 사용하여 **접근성 메뉴 열기** 버튼을 표시할 수 있습니다. 해당 버튼을 클릭하면 접근성 옵션이 포함된 팝업 모달이 표시됩니다.

![The Accessibility Menu gives a range of options to improve the site's behavior to suit their needs, such as underlining all links.](./changing-your-public-sites-settings/images/05.png)

축하해요! 공개 웹사이트 구성에 대한 이 모듈을 완료했습니다.

다음으로 [사이트에 대한 페이지 생성](../creating-pages.md)을 시작하세요.

## 관련 개념

* [DXP 탐색](https://learn.liferay.com/web/guest/w/dxp/getting-started/navigating-dxp)
* [사이트 설정 참고](https://learn.liferay.com/web/guest/w/dxp/site-building/site-settings/site-settings-ui-reference)
* [역할 및 권한 이해](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions)
