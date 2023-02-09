# Liferay Commerce Docker 이미지 사용

최신 버전의 Liferay Commerce는 도커 이미지로 제공됩니다. Liferay Commerce의 최신 Docker 이미지 릴리스를 다운로드하고 시작하려면 다음 단계를 따르십시오.

1. Liferay 상거래 받기

    ```{tip}
    도커가 없습니까? 먼저 여기로 이동: [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [Windows](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/)
    ```

    ```bash
    docker pull [$LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE$]
    ```

1. Liferay 상거래 시작

    ```bash
    docker run -it -p 8080:8080 [$LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE$]
    ```

    ```{important}
    `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds`가 표시될 때까지 기다립니다.
    ```

1. 브라우저를 `https://localhost:8080`로 엽니다.

## 다음

확인하는 것보다 더 많은 일을 하시나요? 자세한 내용은 [설치 개요](../installation-overview.md) 을 참조하십시오.

매장을 몇 분 안에 운영하고 싶습니까? [액셀러레이터](../../starting-a-store/accelerators.md)에 대해 알아보십시오.
