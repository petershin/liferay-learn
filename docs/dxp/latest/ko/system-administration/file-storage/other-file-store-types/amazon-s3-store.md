# Amazon 단순 스토리지 서비스

Amazon의 단순 스토리지 서비스(S3)는 DXP의 S3 Store가 파일을 클라우드에 원활하게 저장하는 데 사용하는 클라우드 기반 스토리지 솔루션입니다. AWS 계정이 있고 S3 **버킷** 을 생성했으면 S3 스토어를 구성할 수 있습니다.

[AWS 계정](https://aws.amazon.com/s3/) 을 만들 때 Amazon은 귀하를 귀하의 계정에 연결하는 [고유한 키](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html/) 를 할당합니다. 이 키를 사용하여 다음 섹션에서 S3 Store를 구성합니다.

S3는 파일 스토리지에 **버킷** 개념을 사용합니다. Amazon UI에서 DXP 파일에 대한 [버킷](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html) 을 생성합니다. DXP 서버 호스트에 가능한 한 가까운 [지역](https://docs.aws.amazon.com/general/latest/gr/s3.html) 에 버킷을 구성해야 합니다.

```{note}
AWS 서명 버전 4 요청 승인을 지원하기 위해 필요한 조치는 없습니다.
```

## 상점 구성

다음 단계에 따라 상점을 구성하십시오.

1. Amazon S3에는 SAXParser가 필요합니다. 애플리케이션 서버에 아직 SAXParser가 없는 경우 [Xerces SAXParser](https://xerces.apache.org/mirrors.cgi) 을 애플리케이션 서버의 전역 라이브러리 폴더(예: Tomcat의 `/lib/ext` 또는 JBoss EAP 및 WildFly의 `/module` )에 다운로드할 수 있습니다.

1. 다음 속성을 사용하여 [`system-ext.properties`](../../../installation-and-upgrades/reference/system-properties.md) 파일에서 SAXParser를 지정합니다.

    ```properties
    org.xml.sax.driver=com.sun.org.apache.xerces.internal.parsers.SAXParser
    ```

1. `system-ext.properties` 파일을 DXP 애플리케이션 클래스 경로(예: `/WEB-INF/classes/`)에 있는 폴더에 복사합니다.

1. 다음 속성으로 [`Portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) 을 구성합니다.

    ```properties
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

1. DXP를 다시 시작합니다.
1. 제어판에서 **구성** &rarr; **시스템 설정** &rarr; **파일 저장소** 로 이동합니다.
1. **S3 Store** 화면에서 다음과 같이 스토어를 구성합니다.

    * **Bucket Name** : 버킷의 이름.
    * **액세스 키** : AWS 액세스 키.
    * **비밀 키** : 당신의 비밀 키.
    * **S3 지역** : [지리적 지역](https://docs.aws.amazon.com/general/latest/gr/s3.html) ; 기본값은 `us-east-1`입니다.

    ![Amazon S3 스토어 구성](./amazon-s3-store/images/01.png)

1. 다른 필드는 기본 설정으로 둡니다.
1. **저장** 을 클릭합니다.

이제 DXP 인스턴스가 Amazon S3 스토어를 사용하고 있습니다.

```{important}
[업로드된 파일에 대한 바이러스 백신 검사 활성화](../enabling-antivirus-scanning-for-uploaded-files.md)를 고려하십시오.
```

## 클러스터 환경에서 저장소 사용

클러스터 환경에서 S3 Store를 사용하려면 다음 단계를 따르십시오.

1. 애플리케이션 서버에 아직 SAXParser가 없는 경우 [Xerces SAXParser](https://xerces.apache.org/mirrors.cgi) 을 각 노드의 애플리케이션 서버 전역 라이브러리 폴더에 복사합니다.

1. `system-ext.properties` 파일을 DXP 응용 프로그램의 `/WEB-INF/classes/` 폴더에 복사합니다.

DXP는 클러스터 전체에서 Amazon S3 스토어를 사용하고 있습니다.

## 데이터베이스 롤백 제한

```{warning}
문서 라이브러리에서 데이터베이스 트랜잭션 롤백이 발생하는 경우 트랜잭션의 파일 시스템 변경 사항은 되돌릴 **아닙니다**. 문서 라이브러리 파일과 파일 시스템 저장소의 파일 간에 불일치가 발생할 수 있으며 수동 동기화가 필요할 수 있습니다. [디비스토어](./dbstore.md) 을 제외한 모든 DXP 저장소는 이 제한에 취약합니다.
```

Amazon 서비스 사용에 대한 자세한 내용은 Amazon Simple Storage 설명서를 참조하십시오.

## 추가 정보

* [파일 스토리지 구성](../../file-storage.md)
* [버킷 제한 사항](https://docs.aws.amazon.com/AmazonS3/latest/dev//BucketRestrictions.html#bucketnamingrules)
* [디비스토어](./dbstore.md)
* [파일 저장소 마이그레이션](../file-store-migration.md)