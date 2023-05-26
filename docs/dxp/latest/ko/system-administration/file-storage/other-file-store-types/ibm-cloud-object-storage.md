# IBM 클라우드 오브젝트 스토리지

{bdg-primary}`자체 호스팅 전용`

Liferay DXP는 AWS S3 저장소와 동일한 구성을 사용하도록 S3 호환성 계층으로 IBM의 [Cloud Object Storage](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-getting-started-cloud-object-storage) 저장소를 구현합니다. IBM 계정을 설정하고 버킷을 생성했으면 인스턴스의 S3 Store를 구성할 준비가 된 것입니다.

## 상점 구성

1. 글로벌 메뉴에서 **제어판** 탭을 열고 **시스템 설정** &rarr; **파일 저장소** &rarr; **S3 Store** 로 이동합니다.

1. 최소한 다음 구성 값을 입력합니다.

   * **Bucket Name** : 파일을 저장하기 위해 S3에서 사용하는 버킷 이름을 설정합니다.
   * **액세스 키** : 계정 액세스 키를 설정합니다.
   * **비밀키** : 계정 비밀키를 설정합니다.
   * **S3 엔드포인트** : S3에 연결하는 데 사용할 기본 엔드포인트를 설정합니다.
   * **S3 Region** : S3가 사용자가 생성한 버킷을 저장하는 지역을 나타내는 S3 Region을 설정합니다.

   ```{important}
   현재 상점은 *HMAC 자격 증명*만 지원합니다. 자세한 정보는 공식 [IBM Cloud Object Storage 문서](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-uhc-hmac-credentials-main) 를 참조하세요.
   ```

1. 완료되면 **저장** 클릭합니다.

시스템 설정 구성이 완료되면 IBM Cloud Object Storage 저장소를 기본값으로 설정해야 합니다. 이렇게 하려면 `portal-ext.properties` 파일에서 다음 특성을 설정하십시오.

```properties
dl.store.impl=com.liferay.portal.store.s3.IBMS3Store
```

## 클러스터 환경에서 저장소 사용

클러스터 환경에서 IBM Cloud Object Storage 저장소를 사용하려면 모든 노드의 구성이 동일해야 합니다. 특히 `portal-ext.properties` 파일과 시스템 설정의 S3 Store 설정이 동일한지 확인하십시오.

## 데이터베이스 롤백 제한

문서 라이브러리에서 데이터베이스 트랜잭션 롤백이 발생하면 트랜잭션의 파일 시스템 변경 사항이 취소되지 않습니다. 문서 라이브러리 파일과 파일 시스템 저장소의 파일 간에 불일치가 발생할 수 있으며 수동 동기화가 필요할 수 있습니다. DBStore를 제외한 모든 DXP 스토어는 이 제한에 취약합니다.

IBM 서비스 사용에 대한 자세한 내용은 공식 IBM Cloud Object Storage 문서를 참조하십시오.

## 관련 주제

* [파일 스토리지](../../file-storage.md)
* [아마존 S3 스토어](./amazon-s3-store.md)
* [디비스토어](./dbstore.md)
