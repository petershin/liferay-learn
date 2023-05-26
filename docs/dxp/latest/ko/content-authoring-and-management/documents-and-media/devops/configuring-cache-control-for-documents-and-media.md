# 문서 및 미디어에 대한 캐싱 구성

{bdg-secondary}`사용 가능한 Liferay 7.4 U21+ 및 GA21+`

기본적으로 문서 및 미디어 파일은 브라우저나 서버에 캐시되지 않습니다. 이는 파일 가시성이 일반적으로 동적 속성 및 구성(예: 권한)에 따라 달라지기 때문입니다. 그러나 원하는 경우 캐싱을 활성화하고 구성할 수 있습니다.

```{important}
캐싱 구성은 게스트 역할에 표시되는 문서에만 적용됩니다.
```

Liferay 시스템 또는 인스턴스에 대한 캐싱을 구성하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **시스템 설정** 또는 **인스턴스 설정** 을 클릭합니다. 구성 범위 지정에 대한 자세한 내용은 [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) 을 참조하십시오.

1. **문서 및 미디어** &rarr; **캐시 제어** 로 이동합니다.

   ![문서 및 미디어 설정에서 캐시 제어로 이동합니다.](./configuring-cache-control-for-documents-and-media/images/01.png)

1. **캐시 제어** 정책을 선택합니다.

   * 비공개: 사용자의 브라우저에서 캐싱을 허용합니다.

   * 공개: CDN 또는 프록시 서버에 의한 캐싱 허용

1. 캐시된 문서에 대해 **Max Age** 을 설정합니다. 이 값은 응답이 신선한 것으로 간주되는 시간(초)을 결정합니다. 설정된 시간이 지나면 캐시된 문서 버전이 만료되며 새로 고쳐야 합니다. 값을 `0` 로 두는 것은 값을 지정하지 않는 것과 같습니다.

1. (선택 사항) 캐싱에서 제외할 MIME 유형 목록을 입력합니다(예: `application/pdf`, `image/jpeg`, `video/mp4`).

   ```{tip}
   자주 업데이트되는 MIME 유형이 있는 경우 파일의 최신 버전이 사용자에게 표시되도록 해당 유형에 대한 캐싱을 비활성화할 수 있습니다.
   ```

1. **저장** 을 클릭합니다.

## 관련 주제

* [문서 및 미디어에 대한 스토리지 할당량 설정](./setting-storage-quotas-for-documents-and-media.md)
* [문서 및 미디어 미리보기 구성](./configuring-documents-and-media-previews.md)
* [캐시](../../../building-applications/data-frameworks/cache.md)
