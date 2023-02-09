# Docker 이미지로 시작하기

Liferay의 최신 버전은 Docker 이미지로 제공됩니다. 다음 단계에 따라 최신 Liferay 릴리스를 다운로드, 실행 및 둘러보세요.

```{important}
도커가 없습니까? 먼저 여기로 이동: [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [Windows](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/)
```

## Liferay 포털 시작하기

Liferay Portal은 매력적이고 유연한 웹 경험을 구축하기 위한 오픈 소스 및 커뮤니티 지원 플랫폼입니다.

1. Docker 이미지를 가져옵니다.

    ```bash
    docker pull [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
    ```

1. 도커 이미지를 시작합니다.

    ```bash
    docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
    ```

    ```{tip}
    시작 완료를 나타내기 위해 `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds`가 표시될 때까지 기다리십시오.
    ```

1. 이메일 주소 _test@liferay.com_ 와 암호 _test_을 사용하여 `<http://localhost:8080>` 에서 Liferay에 로그인합니다. 메시지가 표시되면 암호를 변경합니다.

    ![Liferay Portal 초기 랜딩 페이지.](./starting-with-a-docker-image/images/01.png)

## Liferay DXP 시작하기

Liferay DXP는 상업적으로 지원되고 전 세계에서 사용되는 기업용 플랫폼으로 Liferay Portal을 기반으로 구축되었습니다. Docker 이미지로 시작하는 것은 간단하며 평가판 라이선스가 포함되어 있습니다.

1. Docker 이미지를 가져옵니다.

    ```bash
    docker pull [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
    ```

1. 도커 이미지를 시작합니다.

    ```bash
    docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
    ```

1. 이메일 주소 _test@liferay.com_ 와 암호 _test_을 사용하여 `<http://localhost:8080>` 에서 Liferay에 로그인합니다. 메시지가 표시되면 암호를 변경합니다.

## 다음

시작하기 연습을 계속하고 [관리자 계정](./introduction-to-the-admin-account.md)을 사용하여 처음으로 로그인하는 방법을 알아보세요.

확인하는 것보다 더 많은 일을 하시나요? 자세한 내용은 [Liferay-Tomcat 번들 설치](../installation-and-upgrades/installing-liferay/installing-a-liferay-tomcat-bundle.md) 을 참조하십시오.

Docker 이미지를 사용하여 [에 대해 자세히 알아보세요](../installation-and-upgrades/installing-liferay/using-liferay-docker-images.md).
