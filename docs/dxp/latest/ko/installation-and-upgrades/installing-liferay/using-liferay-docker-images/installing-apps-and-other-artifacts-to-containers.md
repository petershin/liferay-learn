# 컨테이너에 앱 및 기타 아티팩트 설치

애플리케이션 및 기타 아티팩트(예: [DXP 활성화 키](../../setting-up-liferay/activating-liferay-dxp.md))는 컨테이너의 `/mnt/liferay/deploy` 폴더를 통해 DXP Docker 컨테이너에 설치됩니다. 컨테이너 진입점은 `/mnt/liferay/deploy` 폴더를 컨테이너의 `[Liferay Home]/deploy` 폴더(예: `/opt/liferay/deploy`)에 심볼릭으로 연결합니다. `/mnt/liferay/deploy` 폴더에 제공하는 모든 아티팩트는 Liferay에 자동 배포됩니다.

다음은 아티팩트를 설치하는 두 가지 방법입니다.

* [바인드 마운트를 사용하여 아티팩트 설치](#installing-artifacts-using-a-bind-mount)
* [`docker cp`을 사용하여 아티팩트 설치](#installing-artifacts-using-docker-cp)

```{note}
[Docker 볼륨](https://docs.docker.com/storage/volumes/)을 사용하여 아티팩트를 컨테이너에 설치할 수도 있습니다.
```

## 바인드 마운트를 사용하여 아티팩트 설치

단계는 다음과 같습니다.

1. 호스트 폴더와 `deploy`이라는 하위 폴더를 만듭니다.

    ```bash
    mkdir -p [host folder]/deploy
    ```

1. 아티팩트를 `[호스트 폴더]/deploy` 폴더에 복사합니다. 예를 들어,

    ```bash
    cp my-app.lpkg [host folder]/deploy
    ```

1. 아티팩트의 폴더를 컨테이너의 `/mnt/liferay/deploy` 폴더에 매핑하는 바인드 마운트를 포함하는 컨테이너를 생성합니다. 이 예제의 아티팩트는 `deploy`폴더에 있으므로
컨테이너의 `/mnt/</a>` 마운트를 바인딩할 수 있습니다. 
   
   

    ```bash
    docker run -it -m 8g -p 8080:8080 -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```
</p></li> </ol> 

Liferay가 아티팩트를 시작하고 설치합니다. 컨테이너는 다음과 같은 메시지를 보고합니다.



```message
[LIFERAY] The directory /mnt/liferay/deploy is ready. Copy files to [host folder]/deploy on the host operating system to deploy modules to Liferay Portal at runtime.
```




```{note}
Liferay가 시작된 후 `[호스트 폴더]/deploy` 폴더에 복사하여 Liferay에 추가 아티팩트를 설치할 수 있습니다.
```




## `docker cp`을 사용하여 아티팩트 설치

이와 같은 `docker cp` 명령을 사용하여 아티팩트를 실행 중인 컨테이너의 `/mnt/liferay/deploy` 폴더에 복사합니다.



```bash
docker cp ~/my-apps/some-app.lpkg [container]:/opt/liferay/deploy
```


자세한 내용은 [컨테이너](./providing-files-to-the-container.md) 에 파일 제공을 참조하십시오.

이제 Liferay에 앱 및 기타 아티팩트를 설치하는 방법을 알았습니다.



## 추가 정보

* [Liferay Docker 이미지 사용](../using-liferay-docker-images.md)
* [컨테이너에 파일 제공](./providing-files-to-the-container.md)
* [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md)
* [컨테이너 구성](./configuring-containers.md)
* [Docker에서 DXP 패치](./patching-dxp-in-docker.md)