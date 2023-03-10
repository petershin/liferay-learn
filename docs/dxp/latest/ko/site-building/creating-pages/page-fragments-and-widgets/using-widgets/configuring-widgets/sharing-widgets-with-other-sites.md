---
uuid: 3615f3c0-721f-4ba5-abf8-f1d19826a20a
---

# 다른 사이트와 위젯 공유

사이트에서 실행 중인 위젯 인스턴스를 Facebook, OpenSocial 및 Netvibes와 같은 다른 웹사이트에 삽입하여 다른 사이트와 위젯을 공유할 수 있습니다. 이것은 당신이 그렇지 않았다면 가질 수 없었던 당신의 웹사이트에 대한 노출의 완전히 새로운 길을 열어줍니다.

![위젯의 구성 메뉴에 있는 공유 탭은 다양한 방법으로 위젯을 공유할 수 있습니다.](./sharing-widgets-with-other-sites/images/01.png)

1. 위젯의 **옵션** 아이콘(![Options](../../../../images/icon-app-options.png)) &rarr; **구성** &rarr; **공유** 클릭합니다.

1. 공유 아래에는 Facebook, OpenSocial Gadget 및 Netvibes의 세 가지 하위 탭이 있습니다. 선택한 컨텍스트에 따라 진행합니다.

```{note}
모든 웹사이트에서 토글을 전환하여 탐색을 허용합니다. 위젯을 추가하려는 웹사이트에 제공된 JavaScript 코드 스니펫을 복사하여 붙여넣습니다. 사용자가 다른 웹사이트에서 페이지를 로드하면 코드가 사이트에서 관련 위젯을 가져와서 표시합니다.
```

## 페이스북

모든 위젯을 Facebook 앱으로 추가할 수 있습니다. 이렇게 하려면 먼저 개발자 키를 가져와야 합니다.

1. 공유에서 Facebook 탭으로 이동합니다.

1. **API 키 검색** <!--\[ include link -\]()--> 및 **캔버스 페이지 URL** <!--\[ include link -\]()--> 페이스북에서. 공유 탭에 복사하여 붙여넣으십시오.

    ![위젯의 구성 메뉴에 있는 공유 탭은 다양한 방법으로 위젯을 공유할 수 있습니다.](./sharing-widgets-with-other-sites/images/02.png)

1. **저장** 클릭하고 Liferay DXP의 Facebook 탭으로 돌아갑니다. **콜백 URL** 이 제공되며 Facebook에 복사하여 붙여넣을 수 있습니다. Facebook에서 앱을 열 때 애플리케이션을 렌더링하는 데 올바른 콜백 URL이 사용됩니다.

1. 선택적으로 **Allow users to add [application-name] to Facebook** 활성화합니다. 그런 다음 앱의 옵션 메뉴로 이동하여 **Facebook에 추가** 선택할 수 있습니다.

## 오픈소셜 가젯

OpenSocial은 소셜 네트워킹 및 기타 웹 애플리케이션을 위한 컨테이너와 일련의 API로 구성됩니다. Liferay DXP는 모든 OpenSocial 호환 페이지에서 OpenSocial 가젯으로 사용할 애플리케이션을 제공할 수 있습니다.

1. OpenSocial 플랫폼에서 Liferay 위젯을 제공하려면 제공된 가젯 URL을 복사하여 붙여넣고 사용 중인 OpenSocial 플랫폼의 적절한 구성 페이지에 추가하십시오. Liferay 인스턴스는 해당 플랫폼의 페이지에 직접 해당 위젯을 제공합니다.

    제공된 URL은 위젯의 특정 인스턴스에 대해 고유하므로 동일한 위젯의 여러 인스턴스를 다른 OpenSocial 가젯으로 제공할 수 있습니다.

1. 공유 탭에서 **오픈소셜 가젯** 로 이동하고 선택기를 활성화합니다 **사용자가 오픈소셜 플랫폼에 [application-name] 추가할 수 있도록 허용합니다** .

1. **저장** 클릭하고 위젯의 **옵션** 버튼을 다시 방문합니다. **OpenSocial 플랫폼에 추가** 이라는 이름의 새 버튼이 나타납니다. 이 새 버튼을 선택하면 OpenSocial 플랫폼에 위젯을 공유하기 위한 URL이 제공됩니다.

## Netvibes

Netvibes는 사용자가 로그인하여 자신만의 개인 대시보드를 만들고 사용자 지정 가능한 위젯을 추가할 수 있는 유사한 환경을 제공합니다.

공유 탭에서 **Netvibes** 로 이동하여 **사용자가 Netvibes 페이지에 [application-name] 추가하도록 허용** 선택기를 활성화합니다. 그런 다음 제공된 URL을 사용하여 사용 중인 Liferay 위젯의 인스턴스를 기반으로 사용자 정의 Netvibes 위젯을 만들 수 있습니다.

## 추가 정보

- [위젯 권한 설정](./setting-widget-permissions.md)
