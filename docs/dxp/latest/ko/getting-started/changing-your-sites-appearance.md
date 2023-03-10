# 사이트 모양 변경

Liferay에는 사이트의 모양을 사용자 지정하는 다양한 방법이 있습니다. 사이트의 파비콘과 테마는 변경하려는 첫 번째 요소 중 두 가지입니다. 테마는 사이트의 기본 모양과 느낌을 설정하는 반면 파비콘은 사용자의 브라우저 탭에서 사이트를 식별하는 아이콘입니다.

## 사이트의 파비콘 변경

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../images/icon-product-menu.png))를 열고 **사이트 빌더** 로 이동합니다. **페이지** .

1. 애플리케이션 표시줄에서 **동작** 버튼(![동작 버튼](../images/icon-actions.png))을 클릭하고 **구성** 을 선택합니다.

    ![Pages 애플리케이션을 열고 애플리케이션 표시줄에서 작업 버튼을 클릭한 다음 구성을 선택합니다.](./change-your-sites-appearance/images/01.png)

1. 파비콘에서 **파비콘 변경** 을 클릭합니다.

    ![파비콘 변경 버튼을 클릭하세요.](./change-your-sites-appearance/images/02.png)

1. 이미지를 선택하거나 업로드합니다.

1. **저장** 을 클릭합니다.

귀하의 사이트는 선택한 이미지를 파비콘으로 사용합니다.

## 사이트 테마 변경하기

기본적으로 Liferay 인스턴스는 클래식 테마를 사용하지만 사용자 지정 테마를 배포하고 사용할 수 있습니다.

### 새 테마 배포

1. [Acme Sample Blue Theme](./liferay-5b2v-theme.war) 가 포함된 WAR을 다운로드합니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/getting-started/changing-your-sites-appearance/liferay-5b2v-theme.war -O
    ```

1. 테마가 포함된 WAR을 배포합니다.

    <!-- ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq) -->

    ```bash
    docker cp liferay-5b2v-theme.war docker-container:[path-to-deploy-folder]
    ```

이렇게 하면 샘플 테마가 DXP 인스턴스에 로드됩니다. 콘솔에서 다음 메시지를 확인하여 테마가 성공적으로 배포되었는지 확인할 수 있습니다.

```
2020-03-11 17:06:35.601 INFO  [fileinstall-/opt/liferay/osgi/war][BundleStartStopLogger:39] STARTED liferay-5b2v-theme_1.0.0 [1112]
```

### 사이트 테마 변경

1. 브라우저를 열고 `https://localhost:8080` 및 [관리자로 로그인합니다](./introduction-to-the-admin-account.md).

1. **사이트 메뉴**(![Site Menu](../images/icon-product-menu.png))을 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. Application Bar에서 **Actions** 버튼(![Action Button](../images/icon-actions.png))을 클릭하고 **Configuration** 를 선택합니다.

   ![페이지 화면을 열고 애플리케이션 표시줄에서 작업 버튼을 클릭한 다음 구성을 선택합니다.](./changing-your-sites-appearance/images/01.png)

1. **모양과 느낌** 섹션을 확장하고 **현재 테마 변경** 을 클릭합니다.

   ![현재 테마 변경을 클릭하여 새 테마를 선택합니다.](./changing-your-sites-appearance/images/03.png)

1. 샘플 테마를 선택합니다: **Acme Sample Blue Theme** .

1. **저장** 을 클릭합니다.

홈 페이지로 이동하여 배경색이 이제 파란색인지 확인합니다.

![이제 배경색이 파란색인지 확인합니다.](./changing-your-sites-appearance/images/04.png)

## 다음

또한 [개의 스타일 책](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 을 사용하여 디자인 요소를 추가로 사용자 지정하고 [마스터 페이지 템플릿](../site-building/creating-pages/defining-headers-and-footers/master-page-templates.md) 을 사용하여 콘텐츠 페이지의 머리글과 바닥글을 디자인할 수 있습니다. 사이트의 모양과 느낌을 사용자 정의하는 전체 개요는 [사이트 모양](../site-building/site-appearance/site-appearance.md) 을 참조하십시오.

[Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md) 에는 전문적인 모양과 느낌을 빠르게 달성하는 데 사용할 수 있는 많은 테마가 있습니다.

[나만의 테마 만들기](../site-building/site-appearance/themes/introduction-to-themes.md) 방법도 배울 수 있습니다.

<!-- ## Changing Your Site's Logo

Coming soon! -->
