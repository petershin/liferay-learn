# 사이트의 친숙한 URL 구성

친숙한 URL은 사용자가 사이트에 빠르게 액세스할 수 있도록 도와주는 읽기 쉬운 URL입니다. 각 URL은 고유해야 하며 `https://localhost:8080/web` 에 추가됩니다(예: `https://localhost:8080/web/helloworld/`).

```{note}
비공개 페이지가 활성화되면 친근한 URL도 설정할 수 있습니다. 일단 설정되면 `https://localhost:8080/group`에 추가됩니다.
```

## 사이트의 친숙한 URL 설정

사이트의 친숙한 URL을 설정하려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **구성** 를 확장한 다음 **사이트 설정** &rarr; **사이트 구성** &rarr; **사이트 URL** 로 이동합니다.

1. **친숙한 URL** 을 입력하십시오.

1. **저장** 을 클릭합니다.

![사이트에 친숙한 URL을 구성할 수 있습니다.](./configuring-your-sites-friendly-url/images/01.png)

사이트의 홈 페이지에 친숙한 URL을 추가하려면 다음 섹션의 추가 단계를 따르십시오.

## 인스턴스의 홈 URL 설정

인스턴스의 홈 페이지에 친숙한 URL을 추가하는 경우 페이지 요청이 `http://localhost:8080` 올바르게 리디렉션되도록 인스턴스의 홈 URL 필드를 업데이트해야 합니다. <!-- What is a Home URL? Do I HAVE to do this? What does it impact? -->

1. [글로벌 메뉴](../../../getting-started/navigating-dxp.md) ( ![Global Menu icon](../../../images/icon-applications-menu.png) )을 열고 **제어판** 탭을 클릭한 다음 **인스턴스 설정** 으로 이동합니다.

1. **플랫폼** 제목 아래에서 **인스턴스 구성** 을 선택하고 **일반** 링크를 클릭합니다.

1. **탐색** 에서 새 친숙한 홈 URL을 **홈 URL** 입력란에 입력합니다. 예를 들어 기본 사이트의 친숙한 URL을 `/my-site` 로 설정하면 사이트의 공개 홈 페이지 URL `https://localhost:8080/web/my-site/home`이 됩니다. 따라서 `/web/my-site/home`을 입력합니다.

![새로운 친숙한 URL로 리디렉션하려면 업데이트된 홈 URL을 입력하세요.](./configuring-your-sites-friendly-url/images/02.png)

이 설정을 입력하면 `localhost:8080` 에 대한 페이지 요청이 Liferay DXP 인스턴스의 새 홈 페이지의 친숙한 URL로 리디렉션됩니다.
