# REST API를 사용하여 필드 추가

`object-admin` 서비스는 필드 추가와 같은 객체 정의에 대한 CRUD 작업을 수행하기 위한 REST API를 제공합니다. 여기에서는 이러한 API를 사용하여 Distributor Application 개체에 비즈니스 및 신용 참조 필드를 추가합니다.

1. 이 연습을 위한 [리소스](./liferay-p6k3.zip) 를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-p6k3.zip -O
   ```

   ```bash
   unzip liferay-p6k3.zip
   ```

   이 .zip 파일에는 'object-admin' REST API를 호출하는 셸 스크립트가 포함되어 있습니다.

1. `liferay-p6k3/curl`로 이동합니다.

   ```bash
   cd liferay-p6k3/curl
   ```

1. 비즈니스 정보를 저장하기 위한 필드를 생성하려면 다음 스크립트를 실행하세요.

   ```bash
   ./ObjectField_POST_BusinessDetails_ByExternalReferenceCode.sh
   ```

   | 필드 이름                         | 유형    |
   | :---------------------------- | :---- |
   | `businessName`                | 원본    |
   | `businessWebsite`             | 원본    |
   | `businessEstablishedDate`     | 날짜    |
   | `businessEmployeeNumber`      | 정수    |
   | `businessAnnualRevenue`       | 원본    |
   | `businessOtherBrandsOffered`  | 긴 텍스트 |
   | `businessPhoneNumber`         | 원본    |
   | `businessAddressLineOne`      | 원본    |
   | `businessAddressLineTwo`      | 원본    |
   | `businessCity`                | 원본    |
   | `businessStateProvinceRegion` | 원본    |
   | `businessZipPostalCode`       | 원본    |
   | `businessCountry`             | 원본    |
   | `businessLicenseNumber`       | 원본    |
   | `businessResaleNumber`        | 원본    |
   | `businessTaxIDNumber`         | 원본    |
   | `businessLicense`             | 부착    |
   | `businessProofOfInsurance`    | 부착    |

1. 기업의 은행 세부정보를 저장하기 위한 필드를 만듭니다.

   ```bash
   ./ObjectField_POST_BankDetails_ByExternalReferenceCode.sh
   ```

   | 필드 이름                     | 유형 |
   | :------------------------ | :- |
   | `bankName`                | 원본 |
   | `bankAccountNumber`       | 원본 |
   | `bankPhoneNumber`         | 원본 |
   | `bankAddressLineOne`      | 원본 |
   | `bankAddressLineTwo`      | 원본 |
   | `bankCity`                | 원본 |
   | `bankStateProvinceRegion` | 원본 |
   | `bankZIPPostalCode`       | 원본 |
   | `bankCountry`             | 원본 |

1. 비즈니스 참조 세부정보를 수신하기 위한 필드를 만듭니다.

   ```bash
   ./ObjectField_POST_BusinessReference_ByExternalReferenceCode.sh
   ```

   | 필드 이름                          | 유형 |
   | :----------------------------- | :- |
   | `referenceSupplierName`        | 원본 |
   | `referencePhoneNumber`         | 원본 |
   | `referenceAddressLineOne`      | 원본 |
   | `referenceAddressLineTwo`      | 원본 |
   | `referenceCity`                | 원본 |
   | `referenceStateProvinceRegion` | 원본 |
   | `referenceZIPPostalCode`       | 원본 |
   | `referenceCountry`             | 원본 |

완료되면 배포자 애플리케이션에는 48개의 필드가 있어야 합니다.

![The Distributor Application object should have 48 fields.](./adding-fields-using-rest-apis/images/01.png)

엄청난! 이러한 필드는 Delectable Bonsai가 KYC 정책 및 AML 법률을 준수하여 각 지원자를 평가하고 심사하는 데 필요한 데이터를 수집하는 데 도움이 될 수 있습니다.

이제 개체 정의는 각 잠재적 파트너십의 비즈니스 가치를 평가하기 위해 정보를 수집해야 합니다.

다음: [배포자 응용 프로그램에 대한 선택 목록 만들기](./creating-picklists-for-distributor-applications.md)
