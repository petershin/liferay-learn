# Liferay Talend 구성 요소 개요

{bdg-warning}`지원되지 않음`

데이터 통합 작업에 Talend Open Studio를 사용하는 경우 Liferay의 Talend 구성 요소를 사용하면 Liferay/DXP 포털과 기타 외부 시스템(예: MySQL, SAP, Salesforce) 간에 데이터를 더 쉽게 가져오고 내보낼 수 있습니다. 7.4.x부터 이러한 구성 요소는 [Liferay DXP/Portal 코드베이스](https://github.com/liferay/liferay-portal/tree/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend) 의 일부이며 Talend Open Studio에 빌드하고 추가해야 합니다. 일단 추가되면 이러한 구성 요소를 사용하여 Liferay에 연결하고 다른 Talend 구성 요소와 함께 ETL 작업을 수행하는 Talend [작업](https://help.talend.com/r/lqV2ftgSbYSEBU9Bwsd61w/eAVXNKXfys1ji9dujoRfrg) 을 설계할 수 있습니다.

Liferay의 Talend 구성 요소는 즉시 사용 가능한 Headless API와 REST Builder를 사용하여 개발된 모든 맞춤형 API에 연결할 수 있습니다. 모든 구성 요소에는 정의된 헤드리스 API 엔드포인트가 필요합니다. 각 끝점 경로는 `/headless-` (예:`/headless-delivery-api`)로 시작하고 적절한 버전 하위 경로(예:`/headless-commerce-admin-catalog/v1.0`, `)를 포함해야 합니다. /headless-commerce-delivery-catalog/v1.0`).

## Liferay Talend 구성 요소

**Liferay 연결 구성 요소** ( [`tLiferayConnection`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayconnection/TLiferayConnectionDefinition.java) ): 다른 구성 요소에서 사용하는 Liferay DXP/Portal 인스턴스와의 연결을 설정합니다. Liferay 호스트 URL 값은 루트 도메인으로 설정되어야 합니다(예: `http://localhost:8080`, `https://yourserver.com`).

**Liferay 입력 구성 요소** ( [`tLiferayInput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayinput/TLiferayInputDefinition.java) ): 구성된 헤드리스 API 끝점에 GET 요청을 제출합니다. 그런 다음 데이터를 검색하고 OpenAPI 사양에 설명된 스키마로 변환한 다음 정의된 Talend 데이터 흐름으로 전달합니다.

**Liferay 출력 구성 요소** ( [`tLiferayOutput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayoutput/TLiferayOutputDefinition.java) ): 정의된 Talend 입력에서 데이터를 수신하여 OpenAPI 사양에 설명된 스키마로 변환하고 POST/PUT 요청을 구성된 헤드리스 API 엔드포인트에 제출합니다.

**Liferay 배치 파일** ( [`tLiferayBatchFile`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferaybatchfile/TLiferayBatchFileDefinition.java) ): 데이터를 수신하고 OpenAPI 사양에 설명된 스키마에 따라 형식을 지정합니다. 그런 다음 이 데이터를 JSON 파일로 집계합니다.

**Liferay 배치 출력 파일** ( [`tLiferayBatchOutput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferaybatchoutput/TLiferayBatchOutputDefinition.java) ): JSON 파일을 정의된 헤드리스 배치 엔진 엔드포인트에 제출합니다. `tLiferayBatchFile` 구성 요소에서 이 파일을 수신할 수 있지만 다른 구성 요소에서 배치 파일을 수신하고 제출할 수도 있습니다.

이러한 구성 요소를 사용하여 Talend Open Studio에서 복잡한 데이터 흐름 관리 프로세스를 만들고 실행할 수 있습니다. 자세한 설치 지침은 [Liferay Talend 구성 요소 설치](./installing-liferay-talend-components.md) 을 참조하십시오.

## 추가 정보

* [Liferay Talend 구성 요소 설치](./installing-liferay-talend-components.md)
* [Liferay Talend 구성 요소를 사용하여 Talend 작업 설계](./designing-talend-jobs-using-liferay-talend-components.md)
