# 구글 클라우드 저장소

{bdg-primary}`자체 호스팅 전용`

> Liferay DXP 7.3 SP3+ 및 7.4+에서 사용 가능

Liferay DXP는 Google의 Cloud Storage(GCS) 서비스와의 통합을 제공합니다. GCS 통합을 통해 클라우드에서 Liferay 인스턴스 파일을 원활하게 저장하고 액세스할 수 있습니다.

이 연결을 사용 설정하기 전에 먼저 GCS 계정을 준비해야 합니다. 준비가 되면 제어판을 통해 GCS를 사용하도록 Liferay 인스턴스를 구성하고 GCS를 기본 저장소로 사용하도록 `dl.store.impl` 포털 속성을 설정합니다.

```{important}
문서 라이브러리에서 데이터베이스 트랜잭션 롤백이 발생하면 트랜잭션의 파일 시스템 변경 사항이 취소되지 않습니다. 문서 라이브러리 파일과 파일 시스템 저장소의 파일 간에 불일치가 발생할 수 있으며 수동 동기화가 필요할 수 있습니다. 이는 DBStore를 제외한 모든 DXP 스토어의 제한 사항입니다.
```

## GCS 전제 조건

Liferay의 GCS 통합을 활성화하려면 활성 GCS 계정과 프로젝트가 필요합니다. 서버 간, 앱 수준 인증을 사용하려면 이 프로젝트에 [스토리지 버킷](https://cloud.google.com/storage/docs/creating-buckets) 과 [서비스 계정](https://cloud.google.com/iam/docs/creating-managing-service-accounts) 있어야 합니다. 서비스 계정에 대한 JSON [보안 키](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) 도 생성해야 합니다. 자세한 내용은 공식 [Google Cloud Storage](https://cloud.google.com/storage/docs) 문서를 참조하세요.

```{important}
서비스 계정의 보안 키는 JSON 키 유형을 사용해야 합니다.
```

## Liferay에서 GCS 저장소 구성

GCS 저장소를 구성하려면 다음 단계를 따르세요.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **구성** &rarr; **시스템 설정** 로 이동합니다.

1. **파일 스토리지** 클릭하십시오.

   ![시스템 설정에서 파일 저장소를 클릭합니다.](./google-cloud-storage/images/01.png)

1. **GCS 저장소 구성** 을 클릭합니다.

1. (필수) 다음 정보를 입력합니다.

   ****서비스 계정 키** : GCS 프로젝트의 서비스 계정에 안전하게 접근하기 위해 사용되는 비공개 JSON 키.

   ****Bucket Name** : 파일을 저장하는 GCS 버킷의 이름.

   ![서비스 계정 키와 버킷 이름을 입력합니다.](./google-cloud-storage/images/02.png)

1. (선택 사항) GCS에 대한 Liferay 통화 시도를 구성합니다.

   ![GCS에 대한 Liferay 통화 시도를 구성합니다.](./google-cloud-storage/images/03.png)

1. (선택 사항) 추가 보안 계층을 위해 **AES-256 암호화 키** 을 입력합니다.

   ![AES-256 암호화 키를 입력합니다.](./google-cloud-storage/images/04.png)

1. 완료되면 **저장** 클릭합니다.

GCS Store를 구성하면 GCS를 기본 파일 저장소 시스템으로 설정할 수 있습니다.

## GCS를 기본 저장소로 설정

GCS를 Liferay 인스턴스의 기본 저장소로 사용하려면 다음 단계를 따르세요.

1. 인스턴스의 [`Portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) 파일에 다음 속성을 추가합니다.

   ```properties
   dl.store.impl=com.liferay.portal.store.gcs.GCSStore
   ```

   `portal-ext.properties` 파일이 없으면 위의 값으로 새 파일을 만들고 인스턴스의 [LIFERAY_HOME](../../../installation-and-upgrades/reference/liferay-home.md) 또는 `[USER_HOME]` 폴더에 추가합니다.

   이는 `portal.properties` 파일에서 `dl.store.impl` 의 기본값을 대체합니다.

1. Liferay 서버를 다시 시작하십시오.

## 관련 주제

* [문맥 재산](../../../installation-and-upgrades/reference/portal-properties.md)
* [파일 스토리지](../../file-storage.md)
