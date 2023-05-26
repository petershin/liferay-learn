# 문서 및 미디어에 대한 스토리지 할당량 설정

`data.limit.dl.storage.max.size` 포털 속성을 활성화하여 문서 및 미디어에서 저장소 할당량을 정의할 수 있습니다. 이 속성의 값을 정의하면 정의된 할당량을 초과하는 업로드 시도가 실패하고 오류 메시지가 표시됩니다. 이 할당량은 특히 문서 및 미디어와 API 사용자(예: 게시판 첨부 파일, 블로그 이미지)에 적용됩니다.

![한도를 초과하는 업로드 시도는 실패하고 오류 메시지가 표시됩니다.](./setting-storage-quotas-for-documents-and-media/images/01.png)

```{important}
설정은 전역이지만 각 인스턴스는 현재 소비된 할당량을 추적합니다. 할당량을 100MB로 정의하고 인스턴스가 10개 있는 경우 문서 및 미디어에서 사용할 수 있는 최대 글로벌 스토리지는 약 1GB입니다.
```

기본적으로 `data.limit.dl.storage.max.size` 포털 속성은 비활성화되어 있습니다. `Portal-ext.properties` 파일을 사용하여 이 값을 재정의할 수 있습니다.

Liferay 인스턴스에서 문서 및 미디어에 대한 글로벌 스토리지 할당량을 설정하려면 다음 단계를 따르십시오.

1. `Portal-ext.properties` 파일을 만듭니다.

1. `data.limit.dl.storage.max.size` 속성을 새 속성 파일에 추가하고 해당 값을 원하는 스토리지 할당량으로 설정합니다.

   속성 값은 바이트 단위로 설정해야 합니다. 예를 들어 다음 값은 저장소 할당량을 100MB로 설정합니다.

   ```properties
   data.limit.dl.storage.max.size=104857600
   ```

   음수 또는 `0` 할당하면 속성이 비활성화됩니다.

1. `Portal-ext.properties` 파일을 [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) 폴더 또는 `[USER_HOME]` 폴더에 배포합니다. 자세한 내용은 [포털 속성](../../../installation-and-upgrades/reference/portal-properties.md) 을 참조하십시오.

1. 새 속성 파일을 적용하려면 Liferay 서버를 다시 시작하십시오.

정상적인 상황에서 시스템은 스토리지 할당량을 동적으로 업데이트합니다. 그러나 경우에 따라 데이터베이스 손상, 런타임 오류 또는 기타 원인으로 인해 수동 업데이트가 필요할 수 있습니다. 이렇게 하려면 Gogo Shell에서 `documentLibrary:update` OSGi 명령을 실행합니다.

```{warning}
할당량 업데이트는 문서 및 미디어에 저장된 문서의 양에 따라 시간과 리소스가 많이 소요될 수 있습니다. 프로덕션 환경에서 이 명령을 실행할 때 주의하십시오.
```

## 관련 주제

* [문서 및 미디어](../../documents-and-media.md)
* [문맥 재산](../../../installation-and-upgrades/reference/portal-properties.md)
