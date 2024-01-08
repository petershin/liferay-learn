# Docker 이미지로 시작하기

최신 버전의 Liferay는 Docker Hub에서 Docker 이미지로 제공됩니다. 그것들은 두 가지 범주로 나뉩니다:

* [liferay/포탈](https://hub.docker.com/r/liferay/portal)
* [liferay/DXP](https://hub.docker.com/r/liferay/dxp)

아래 단계에 따라 Liferay의 최신 릴리스를 다운로드하고 실행하고 둘러보세요.

```{important}
도커가 없나요? 먼저 여기로 가세요: [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [윈도우](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/) 
```

## Liferay 포털 시작하기

Liferay Portal은 강력하고 유연한 웹 경험을 구축하기 위한 오픈 소스 및 커뮤니티 지원 플랫폼입니다.

1. 다음을 실행하여 새 Liferay Portal 인스턴스를 시작합니다.

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

    ```{tip}
    시작 완료를 나타내기 위해 `org.apache.catalina.startup.Catalina.start 서버 시작 [x] 밀리초`가 표시될 때까지 기다립니다.
    ```

1. 이메일 주소 **test@liferay.com** 및 비밀번호 **test** 를 사용하여 `<http://localhost:8080>`에서 Liferay에 로그인합니다.

1. 메시지가 나타나면 비밀번호(예: **learn**)를 변경하고 **저장** 을 클릭하세요.

   ![Change your password upon first login.](./starting-with-a-docker-image/images/01.png)

```{warning}
프로덕션 환경에서는 기본 관리자 계정을 사용하면 안 됩니다. 대신 귀하의 비즈니스에 맞는 [관리자 계정을 생성](./introduction-to-the-admin-account.md#creating-a-new-admin-user) 하세요.
```

## Liferay DXP 시작하기

Liferay DXP는 Liferay Portal을 기반으로 구축되어 전 세계적으로 사용되는 상업적으로 지원되는 기업용 플랫폼입니다. Docker 이미지로 시작하는 것은 간단하며 평가판 라이선스가 포함되어 있습니다.

1. 다음을 실행하여 새 Liferay DXP 인스턴스를 시작합니다.

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. 이메일 주소 **test\@liferay.com** 및 비밀번호 **test** 를 사용하여 `<http://localhost:8080>`에서 Liferay에 로그인합니다.

1. 메시지가 나타나면 비밀번호(예: **learn**)를 변경하고 **저장** 을 클릭하세요.

   ![Change your password upon first login.](./starting-with-a-docker-image/images/01.png)

```{warning}
프로덕션 환경에서는 기본 관리자 계정을 사용하면 안 됩니다. 대신 귀하의 비즈니스에 맞는 [관리자 계정을 생성](./introduction-to-the-admin-account.md#creating-a-new-admin-user) 하세요.
```

## 다음

시작하기 연습을 계속하여 [관리자 계정](./introduction-to-the-admin-account.md)을 사용하여 처음으로 로그인하는 방법을 알아보세요.

단순히 확인하는 것 이상의 일을 하시나요? 자세한 내용은 [Liferay-Tomcat 번들 설치](../installation-and-upgrades/installing-liferay/installing-a-liferay-tomcat-bundle.md)를 참조하세요.

Docker 이미지를 사용하는 [에 대해 자세히 알아보세요](../installation-and-upgrades/installing-liferay/using-liferay-docker-images.md) .
