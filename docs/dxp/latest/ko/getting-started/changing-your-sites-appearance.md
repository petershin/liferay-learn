# 사이트 모양 변경하기

Liferay에는 사이트 모양을 사용자 정의하는 다양한 방법이 있습니다. 사이트의 파비콘과 테마는 변경하고 싶은 첫 번째 요소 중 두 가지입니다. 테마는 사이트의 기본 모양과 느낌을 설정하는 반면, 파비콘은 사용자의 브라우저 탭에서 사이트를 식별하는 아이콘입니다.

## 사이트의 파비콘 변경하기

다음을 실행하여 새 Liferay 인스턴스를 시작하십시오.

```bash
docker run -it -m 8g -p 8080:8080 liferay/portal:latest
```

http://localhost:8080에서 Liferay에 로그인합니다. 이메일 주소 `test@liferay.com`과 비밀번호 `test`를 사용하세요. 메시지가 나타나면 비밀번호를 `learn`으로 변경하세요.

그런 다음 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 애플리케이션 표시줄에서 **작업**(![작업 버튼](../images/icon-actions.png))을 클릭하고 **구성** 을 선택합니다.

   ![Open the Pages application, click Actions in the Application Bar, and select Configuration.](./changing-your-sites-appearance/images/01.png)

1. 파비콘 아래에서 **파비콘 선택**(![파비콘 선택 버튼](../images/icon-switch.png))을 클릭합니다.

   ![Click the Select Favicon button.](./changing-your-sites-appearance/images/02.png)

1. 이미지를 선택하거나 업로드하세요.

1. **저장** 을 클릭하세요.

귀하의 사이트는 파비콘으로 선택한 이미지를 사용합니다.

## 사이트 테마 변경하기

기본적으로 Liferay 인스턴스는 클래식 테마를 사용하지만 사용자 정의 테마를 배포하고 사용할 수 있습니다.

### 새 테마 배포

1. Acme 샘플 블루 테마 WAR 파일을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/getting-started/changing-your-sites-appearance/resources/liferay-5b2v.zip -O
   ```

   ```bash
   unzip liferay-5b2v.zip
   ```

1. .war 파일이 있는 폴더로 이동하여 배포합니다.

   ```bash
   docker cp liferay-5b2v-theme.war [docker-container-id]:[path-to-deploy-folder]
   ```

```{note}
`[docker-container-id]`를 바꾸려면 `docker ps`를 사용하여 liferay/portal:latest의 ID를 찾으세요. `[배포 폴더 경로]`는 `opt/liferay/deploy`입니다.
```

그러면 샘플 테마가 DXP 인스턴스에 로드됩니다. 콘솔에서 다음 메시지를 확인하여 테마가 성공적으로 배포되었는지 확인할 수 있습니다.

```
2020-03-11 17:06:35.601 INFO  [fileinstall-/opt/liferay/osgi/war][BundleStartStopLogger:39] STARTED liferay-5b2v-theme_1.0.0 [1112]
```

### 사이트 테마 변경

1. 브라우저를 열고 `https://localhost:8080`으로 이동한 후 [관리자로 로그인하세요](./introduction-to-the-admin-account.md) .

1. **사이트 메뉴**(![사이트 메뉴](../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 애플리케이션 표시줄에서 **작업**(![작업 버튼](../images/icon-actions.png))을 클릭하고 **구성** 을 선택합니다.

   ![Open the Pages screen, click Actions in the Application Bar, and select Configuration.](./changing-your-sites-appearance/images/01.png)

1. 테마 아래에서 **현재 테마 변경** 을 클릭하세요.

   ![Click Change Current Theme to select a new theme.](./changing-your-sites-appearance/images/03.png)

1. 샘플 테마(**Acme Sample Blue Theme**)를 선택합니다.

1. **저장** 을 클릭하세요.

홈 페이지로 이동하여 배경색이 이제 파란색인지 확인합니다.

![Confirm the background color is now blue.](./changing-your-sites-appearance/images/04.png)

## 다음

또한 [스타일북](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 사용하여 디자인 요소를 추가로 사용자 정의하고 [마스터 페이지 템플릿](../site-building/creating-pages/defining-headers-and-footers/master-page-templates.md) 사용하여 콘텐츠 페이지의 머리글 및 바닥글을 디자인할 수 있습니다. 사이트의 모양과 느낌을 사용자 정의하는 방법에 대한 전체 개요는 [사이트 모양](../site-building/site-appearance/site-appearance.md) 참조하세요.

[Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md) 에는 전문적인 모양과 느낌을 빠르게 얻는 데 사용할 수 있는 다양한 테마가 있습니다.

[자신만의 테마를 만드는 방법도 배울 수 있습니다](../site-building/site-appearance/themes/introduction-to-themes.md).

<!-- ## Changing Your Site's Logo

Coming soon! -->
