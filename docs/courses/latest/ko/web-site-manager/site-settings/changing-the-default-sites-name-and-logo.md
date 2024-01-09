# 기본 사이트의 이름 및 로고 변경

Liferay 인스턴스는 "Liferay"(친숙한 URL로 `/guest` 사용)라는 기본 사이트와 함께 기본적으로 제공됩니다. 이 사이트는 인스턴스의 기본 방문 페이지이므로 해당 세부 정보는 인스턴스 설정과 직접 연결됩니다.

여기서는 이 사이트를 새로운 공개 Clarity 사이트로 용도 변경하게 됩니다.

## 사이트 로고 변경

Kyle Klein, [사용자 관리](https://learn.liferay.com/w/courses/liferay-administrator/users-accounts-organizations/managing-users#create-an-administrator) 로 로그인하면 인스턴스 설정을 변경할 수 있습니다.

1. Liferay 인스턴스에 액세스하고 Kyle Klein으로 로그인하십시오.

1. 화면 상단에서 전역 메뉴( ![응용 프로그램 메뉴](../../images/icon-applications-menu.png) )를 열고 **제어판** &rarr; **인스턴스 설정** 을 클릭합니다.

1. 인스턴스 설정 페이지에서 **인스턴스 구성** 을 클릭합니다.

   ![The default site's name and logo are set on the Instance Configuration screen.](./changing-the-default-sites-name-and-logo/images/01.png)

1. Clarity 사이트 로고를 다운로드하고 압축을 푸세요.

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/site-settings/liferay-v6j4.zip -O
   ```

   ```bash
   unzip liferay-v6j4.zip
   ```

1. 인스턴스 구성 페이지에서 **로고 변경** 버튼( ![아이콘 변경](../../images/icon-change.png) )을 클릭합니다.

1. 다운로드한 이미지(`ClarityLogo.png`)를 팝업 모달에 업로드하고 **완료** 를 클릭하세요.

   ![Use the pop-up modal to upload the Clarity logo.](./changing-the-default-sites-name-and-logo/images/02.png)

1. **저장** 을 클릭하세요.

## 사이트 이름 변경

이제 기본 "Liferay"를 적절한 사이트 이름으로 변경하십시오.

1. 인스턴스 구성에서 **일반** 범위를 클릭합니다.

   ![Click the General scope to change the site's name.](./changing-the-default-sites-name-and-logo/images/03.png)

1. **이름** 필드에 **Clarity** 를 입력합니다.

## 기타 중요한 인스턴스 설정 변경

또한 홈 URL과 이메일 도메인을 사이트에 더 적합한 용어로 변경해야 합니다.

1. 동일한 일반 구성 페이지에서 **메일 도메인** 필드의 도메인을 `clarityvisionsolutions.com`으로 변경합니다.

1. **홈 URL** 필드에 `/web/p`를 입력합니다.

   다음 연습에서는 사이트의 친숙한 URL을 변경하므로 인스턴스가 변경 사항에 따라 사용자를 올바르게 리디렉션할 수 있도록 지금 홈 URL을 변경해야 합니다.

1. 페이지 하단의 **저장** 을 클릭하세요.

이제 사이트의 일반 세부정보에 Clarity 브랜드가 올바르게 반영됩니다. 기본 홈 페이지(자체 호스팅 또는 Docker 인스턴스의 경우 `localhost:8080/web/guest`)를 다시 방문하여 변경 사항을 확인하세요.

![The default home page now has the Clarity name and logo.](./changing-the-default-sites-name-and-logo/images/05.png)

하지만 이 사이트의 URL은 아직 `/guest`를 사용하기 때문에 Clarity에 맞지 않습니다. 다음으로 사이트 [에 대한 해당 설정과 기타 설정을](./changing-your-public-sites-settings.md) 합니다.

## 관련 개념

* [인스턴스 설정](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration)
