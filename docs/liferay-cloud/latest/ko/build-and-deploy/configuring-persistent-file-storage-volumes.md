# 영구 파일 스토리지 볼륨 구성

관리자는 배포 유형(`배포` 또는 `StatefulSet`)에 따라 Liferay Cloud에서 서비스에 대한 볼륨을 구성할 수 있습니다. 배포 유형에 따라 영구 공유 스토리지(NFS) 또는 전용 스토리지(SSD)에 볼륨을 저장할 수 있습니다. 이 문서에서는 서비스의 `LCP.json` 파일을 통해 볼륨을 구성하는 방법을 설명합니다. 배포 유형에 대한 자세한 내용은 [배포 유형 이해](./understanding-deployment-types.md) 을 참조하십시오.

```{note}
`/opt/liferay/data` 디렉토리(기본적으로 `data`로 명명됨)는 `liferay` 및 `backup` 서비스의 문서 라이브러리용으로 예약되어 있습니다. 이 볼륨은 `LCP.json` 파일에서 구성할 필요가 없으며 경로를 변경할 수 없습니다. 이 구성이 있는 경우 문제를 일으키지 않고 안전하게 제거할 수 있습니다.
```

서비스에 대한 새 볼륨을 구성하려면 다음 단계를 따르십시오.

1. 유지할 데이터가 포함된 폴더를 선택합니다(예: `/opt/storage`).

1. 특정 환경(예: `liferay/`)에 대한 리포지토리의 `LCP.json` 파일로 이동합니다.

1. `볼륨` 구성을 `LCP.json` 파일에 추가합니다. 이 구성에는 각 볼륨에 대한 키가 포함되어야 합니다. 예를 들어, 다음 구성에는 `/opt/storage`에 대한 `스토리지` 키가 포함되어 있습니다.

```json
{
    "id": "liferay",
    "memory": 8192,
    "cpu": 8,
    "volumes": {
        "storage": "/opt/storage"
    }
}
```

```{important}
`StatefulSet` 유형 서비스의 경우 볼륨 구성에 대한 변경 사항을 적용하려면 서비스를 삭제한 다음 다시 배포해야 합니다.
```

```{note}
버전 3.xx 서비스를 사용하는 경우 `liferay` 서비스용 `LCP.json` 파일은 대신 `lcp/liferay/` 디렉토리에 있습니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

## 서로 다른 서비스 간에 볼륨 공유

`배포` 유형 서비스의 볼륨만 NFS를 사용하는 동일한 환경의 다른 서비스와 공유할 수 있습니다. `StatefulSet` 유형 서비스에는 각각 공유할 수 없는 자체 볼륨이 있습니다.

볼륨을 공유하려면:

1. 서비스에 대한 Github 리포지토리의 `LCP.json` 파일로 이동합니다(`[ProjectID]/liferay/LCP.json`).

1. 다음을 입력:
     * 서비스 아이디
     * 공유할 콘텐츠의 사이트(절대경로)
     * 다른 서비스에 대해 동일한 볼륨 키

다음 예에서 `service1` 및 `service2` 은 NFS의 공유 볼륨을 사용하여 `/documents/images` 의 파일을 공유합니다. 이렇게 하면 두 서비스 모두 키와 선언된 파일 경로를 통해 볼륨 내의 파일에 액세스할 수 있습니다.

첫 번째 서비스(`service1`)는 `/documents/images`에서 사진을 공유합니다.

```json
{
  "id": "service1",
  "volumes": {
    "photos": "/documents/images"
  }
}
```

두 번째 서비스(`service2`)는 같은 사이트에 볼륨을 선언하여 NFS를 통해 공유할 수 있도록 합니다.

```json
{
  "id": "service2",
  "volumes": {
    "photos": "/documents/images"
  }
}
```

두 서비스 모두 서비스가 다시 시작된 후 다음 배포 시 NFS의 지정된 볼륨에 액세스할 수 있습니다.

## 볼륨 내용 제거

서비스가 삭제되더라도 볼륨은 환경에 유지됩니다. 서비스에 사용 중인 볼륨의 이름을 변경하거나 기존 볼륨의 이름을 변경하여 새 볼륨을 사용할 수 있지만 이전 볼륨의 콘텐츠는 여전히 존재합니다(NFS 또는 서비스의 SSD). 또한 볼륨을 유지하지 않으려면 볼륨의 내용을 직접 제거해야 합니다.

## 추가 정보

* [Github 리포지토리 구성](../getting-started/configuring-your-github-repository.md)
* [LCP.json을 통한 구성](../reference/configuration-via-lcp-json.md)
* [배포 유형 이해](./understanding-deployment-types.md)
