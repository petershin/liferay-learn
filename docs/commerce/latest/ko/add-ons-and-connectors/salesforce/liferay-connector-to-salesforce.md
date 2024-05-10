# Salesforce에 대한 Liferay 커넥터

{bdg-primary}`구독`

{bdg-secondary}`liferay DXP 7.4 U35+`

Salesforce에 대한 Liferay 커넥터는 [Talend](https://help.talend.com/home) 작업 디자인과 Liferay의 [작업 스케줄러 사용](https://learn.liferay.com/w/dxp/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler) 사용하여 Salesforce에서 Liferay DXP로 데이터를 가져옵니다. 커넥터 [다운로드하고 Liferay 인스턴스에 '.lpkg' 파일로 배포할](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) 있습니다. 이 파일에는 Salesforce 데이터 필드를 Liferay 데이터 필드에 매핑하는 Talend 작업이 포함되어 있습니다.

일단 배포되면 Liferay는 각 Talend 작업에 대한 작업 스케줄러 작업을 자동으로 생성합니다. 그런 다음 각 작업을 수동으로 구성 및 실행하거나 Job Scheduler를 통해 특정 간격으로 실행되도록 예약할 수 있습니다.

## 지원되는 엔터티

다음 차트는 Liferay 대응 항목과 함께 지원되는 Salesforce 엔터티를 보여줍니다. 현재 Salesforce 데이터만 Liferay로 가져올 수 있습니다.

| Salesforce | liferay     |
| :--------- | :-------- |
| 계정         | 계정        |
| 계정 주소      | 계정        |
| 계정 연락처     | 사용자       |
| 가격 목록      | 가격 목록     |
| 가격 장부 항목   | 커머스 가격 입력 |
| 제품         | 제품        |
| 명령         | 명령        |
| 주문 항목      | 주문 항목     |

```{note}
Salesforce에는 Liferay의 제품 카탈로그에 해당하는 엔터티가 없습니다. Salesforce 제품을 Liferay로 가져오려면 externalReferenceCode가 'SALESFORCE'로 설정된 카탈로그가 필요합니다. 카탈로그가 없으면 Liferay는 자동으로 카탈로그를 생성하고 이를 사용하여 수입 제품을 저장합니다.
```

## Liferay DXP에 커넥터 배포

1. [Liferay Marketplace](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) 에서 커넥터를 다운로드하세요.

1. `.lpkg` 파일을 DXP 인스턴스의 [Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html) 폴더에 복사합니다.

1. 애플리케이션 서버 콘솔에 다음 메시지가 나타나는지 확인하십시오.

   ```log
   Salesforce 1.0.0.lpkg에 대한 Liferay 커넥터 처리
   파일 설치를 완료하려면 포털 인스턴스를 다시 시작해야 합니다:/Users/able/bundles/osgi/marketplace/Liferay%20Connector%20to%20Salesforce%20-%20Impl.lpkg
   ```

1. Liferay DXP 인스턴스를 다시 시작합니다.

1. 다시 시작한 후 **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr;로 이동하여 배포가 성공했는지 확인합니다. **작업 스케줄러** .

   성공하면 4개의 새로운 작업 스케줄러 작업이 표시됩니다.

   ![Verify the addition of four new job scheduler tasks.](./liferay-connector-to-salesforce/images/01.png)

   이러한 작업을 실행하기 전에 해당 컨텍스트 매개변수를 구성해야 합니다.

## 작업 스케줄러 작업 구성

생성 시 각 Talend 작업 스케줄러 작업에 대한 설정 편집기는 기본 컨텍스트 매개변수로 자동으로 채워집니다. 이러한 매개변수를 사용하여 필요한 자격 증명을 제공하고 런타임 시 각 작업의 동작을 수정할 수 있습니다.

```{warning}
설정 편집기에서 매개변수를 제거할 때는 주의하십시오. 키 값이 비어 있으면 설정을 저장할 때 사라집니다. 키-값 쌍이 손실되면 복원할 수 없으며 작업을 다시 생성해야 합니다.
```

### 자격 증명 참조

각 작업에는 Liferay 및 Salesforce 자격 증명을 입력하기 위한 다음 필드가 포함되어 있습니다.

| 컨텍스트 매개변수            | 묘사                      |
| :------------------- | :---------------------- |
| `LiferayServerURL`   | Liferay 서버의 URL         |
| `LiferayUser`        | Liferay 계정 사용자 이름       |
| `LiferayPassword`    | liferay 계정 비밀번호           |
| `SalesForceURL`      | Salesforce SOAP API URL |
| `SalesForceUser`     | Salesforce 계정 사용자 이름    |
| `SalesForcePassword` | Salesforce 계정 비밀번호      |
| `SalesForceToken`    | Salesforce OAuth API 토큰 |

```{note}
새로 수정되거나 생성된 레코드만 가져오도록 Salesforce에서 데이터를 필터링할 수 있습니다. 이렇게 하려면 작업 구성에서 `deltamins` 매개변수를 설정해야 합니다. 이 매개변수는 새 기록이나 수정된 기록을 확인하는 간격(분)을 지정합니다.

예를 들어 `deltamins = 20` 및 `lastRunDate = 01/12/2022 12:00:00`인 경우 `01/12/2022 11:40:00` 이후에 생성되거나 수정된 레코드만 Salesforce에서 검색됩니다. 레코드가 이미 존재하는 경우 Liferay의 가져오기 전략은 필요한 경우 이를 업데이트하고 새 레코드만 삽입합니다.
```

### 제품 참조

| 컨텍스트 매개변수                      | 묘사                                                   | 기정값          |
| :----------------------------- | :--------------------------------------------------- | :----------- |
| `catalogName`                  | Salesforce 데이터를 저장하기 위한 카탈로그 이름                      | `Salesforce` |
| `catalogExternalReferenceCode` | 카탈로그를 생성하거나 가져오기 위한 외부 참조 코드입니다. 'SALESFORCE'여야 합니다. | `SALESFORCE` |
| `catalogDefaultCurrency`       | 카탈로그의 기본 통화                                          | `USD`        |
| `catalogDefaultLanguage`       | 카탈로그의 기본 언어                                          | `en_US`      |
| `catalogId`                    | Salesforce 데이터를 저장하기 위한 카탈로그 ID                      | 실행 중에 결정됨    |
| `allowBackOrder`               | 재고가 소진될 때 제품이 이월 주문을 지원하는지 여부를 정의하는 부울 값             | `true`       |
| `displayAvailability`          | 제품 세부정보 페이지에 제품의 가용성을 표시할지 여부를 정의하는 부울 값             | `false`      |
| `productType`                  | 모든 제품 생성 시 사용되는 제품 유형                                | `simple`     |
| `freeShipping`                 | 제품이 무료 배송을 지원하는지 여부를 정의하는 부울 값                       | `false`      |
| `shippable`                    | 제품 배송 가능 여부를 정의하는 부울 값                               | `true`       |
| `shippingSeparately`           | 제품이 별도 배송을 지원하는지 여부를 정의하는 부울 값                       | `true`       |

### 가격표 참조

| 컨텍스트 매개변수       | 묘사                                     | 기정값     |
| :-------------- | :------------------------------------- | :------ |
| `catalogId`     | 가격표와 연결할 카탈로그의 ID                      | `0`     |
| `currencyCode`  | 가격표의 기본 통화 코드                          | `USD`   |
| `neverExpire`   | 가격표의 만료 여부를 정의하는 부울                    | `true`  |
| `priority`      | 적용 가능한 가격표가 여러 개인 경우 가격표의 우선순위를 결정합니다. | `0`     |
| `hasTierPrice`  | 가격표에 계층화된 가격이 포함되어 있는지 여부를 정의하는 부울     | `false` |
| `standardPrice` | 가격표에 표준 가격이 포함되어 있는지 여부를 정의하는 부울       | `false` |

### 계정 참조

| 컨텍스트 매개변수             | 묘사                                                                                                                           | 기정값 |
| :-------------------- | :--------------------------------------------------------------------------------------------------------------------------- | :-- |
| `accountType`         | 모든 계정 생성 시 사용되는 계정 유형: 1(개인) 또는 2(비즈니스)                                                | `2` |
| `countryMapping_null` | 계정 주소에 대한 국가 매핑입니다. 이 구문을 사용해야 합니다 `countryMapping_NAME=COUNTRY_ISO_CODE`(예: `countryMapping_Croatia=HR`) |     |
| `regionMapping_null`  | 계정 주소에 대한 지역 매핑입니다. 이 구문을 사용해야 합니다 `regionMapping_NAME=REGION_ISO_CODE`(예: `regionMapping_Milan=MI`)      |     |

### 주문 참조

| 컨텍스트 매개변수                   | 묘사                                                                                                                         | 기정값                                                                                                                                                                |
| :-------------------------- | :------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `channelId`                 | 주문을 가져오는 ID 채널                                                                                                             | UI에서 채널 ID를 복사합니다. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 **커머스** &rarr; **채널** 로 이동합니다. 채널을 선택하고 이름 옆에 있는 ID를 복사하세요. |
| `defaultCurrency`           | 주문의 기본 통화                                                                                                                  | `USD`                                                                                                                                                              |
| `statusMapping_null`        | 주문 상태에 대한 상태 매핑입니다. 다음 구문을 사용해야 합니다: `statusMapping_SalesforceStatusName=LiferayStatusCode(예: statusMapping_Activated=5)`  | `5`                                                                                                                                                                |
| `paymentStatusMapping_null` | 주문 결제 상태에 대한 상태 매핑입니다. 다음 구문을 사용해야 합니다: `결제 상태 매핑_SalesforceStatusName=LiferayStatusCode(예: PaymentStatusMapping_Payed=2)` | `2`                                                                                                                                                                |

```{warning}
일부 기본값은 자리 표시자일 뿐입니다. 이러한 값을 사용하여 작업을 실행하면 오류가 발생할 수 있습니다. 성공적인 가져오기를 위해 모든 값을 검토하십시오.
```

## 작업 스케줄러 작업 실행

구성한 후에는 **지금 실행** 을 클릭하여 각 작업을 수동으로 실행하거나 자동으로 실행되도록 예약할 수 있습니다. 자세한 내용은 [작업 스케줄러 사용](https://learn.liferay.com/w/dxp/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler) 참조하십시오.

```{important}
이러한 작업을 실행하면 리소스가 많이 소모되고 플랫폼 성능이 저하될 수 있습니다. 성능에 미치는 영향을 줄이려면 사용량이 가장 많은 시간에는 실행하지 마십시오.
```

## 관련 주제

* [liferay 마켓플레이스](https://marketplace.liferay.com/p/liferay-connector-to-salesforce)
* [작업 스케줄러 사용](https://learn.liferay.com/w/dxp/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler)
