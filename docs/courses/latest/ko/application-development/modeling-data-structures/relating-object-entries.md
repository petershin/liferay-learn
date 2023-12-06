# 객체 항목 관련

개체 관계를 정의한 후 Liferay UI 또는 관계 REST API라는 두 가지 방법으로 항목을 연결할 수 있습니다. 여기에서는 UI를 통해 관련 평가 및 적용을 연습합니다.

## 테스트 데이터 추가

1. [이 연습](./liferay-g2n9.zip)에 대한 리소스를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-g2n9.zip -O
   ```

   ```bash
   unzip liferay-g2n9.zip
   ```

   여기에는 응용 프로그램 및 평가 항목을 생성하기 위한 두 개의 스크립트가 포함됩니다.

1. `liferay-g2n9` 폴더의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-g2n9/curl
   ```

1. Distributor Application 개체에 대한 세 가지 항목을 생성하려면 다음 명령을 실행합니다.

   ```bash
   ./DistributorApplication_POST_Batch.sh
   ```

1. 배포자 응용 프로그램에 항목이 나타나는지 확인하십시오.

   ![Verify the entries appear in Distributor Applications.](./relating-object-entries/images/01.png)

1. 애플리케이션 평가 개체에 대한 세 가지 항목을 생성하려면 다음 명령을 실행합니다.

   ```bash
   ./ApplicationEvaluation_POST_Batch.sh
   ```

1. 애플리케이션 평가에 항목이 나타나는지 확인합니다.

   ![Verify the entries appear in Application Evaluations.](./relating-object-entries/images/02.png)

이제 이 항목들을 연관시키십시오.

## 항목 관련

1. 애플리케이션 평가 항목 편집을 시작합니다.

1. 평가 신청 필드의 값을 선택합니다. 관계 필드에 사용 가능한 옵션에는 보기 권한이 있는 모든 애플리케이션이 포함됩니다.

   ![By default, application entries are identified by their IDs.](./relating-object-entries/images/03.png)

   기본적으로 애플리케이션 항목은 해당 ID로 식별됩니다.

1. 개체를 열고 배포자 응용 프로그램 정의 편집을 시작합니다.

1. 제목 필드를 **회사 이름** 으로 설정하고 **저장** 을 클릭하세요. 이는 관계 필드에서 개체 항목을 식별하는 데 사용되는 필드를 결정합니다.

   ![Set Title Field to Business Name and click Save.](./relating-object-entries/images/04.png)

1. 애플리케이션 평가로 돌아가 항목 편집을 시작합니다.

1. 평가 신청 필드의 값을 선택합니다. 이제 애플리케이션은 비즈니스 이름 필드를 사용하여 식별됩니다.

   ![Applications are now identified using the business name field.](./relating-object-entries/images/05.png)

1. 배포자 응용 프로그램을 열고 항목 편집을 시작합니다.

1. **평가 메모** 탭으로 이동합니다.

1. **추가**(![추가 버튼](../../images/icon-add.png))를 클릭하고 기존 애플리케이션 평가에서 선택합니다.

   ![Select from existing application evaluations.](./relating-object-entries/images/06.png)

   관계 테이블은 ID와 제목 필드를 사용하여 관련된 각 평가를 식별합니다.

   ![The relationship table uses the ID and title field to identify each related evaluation.](./relating-object-entries/images/07.png)

1. 애플리케이션 평가 정의의 제목 필드를 **작성자** 로 업데이트합니다.

1. 배포자 애플리케이션으로 돌아가서 이제 관계 테이블이 ID 및 작성자 필드를 사용하여 관련 평가를 식별하는 것을 확인합니다.

    ![The relationship table now uses the ID and Author fields to identify related evaluations.](./relating-object-entries/images/08.png)

## 결론

축하해요! Delectable Bonsai의 유통업체 온보딩 흐름에 필요한 데이터 구조를 성공적으로 모델링했습니다. 이제 워크플로, 유효성 검사, 알림 등 애플리케이션에 생명을 불어넣는 데 필요한 비즈니스 로직의 통합을 시작할 수 있습니다. 이 작업은 다음 모듈에서 수행합니다.

모듈 2: [비즈니스 로직 구현](../implementing-business-logic.md)

## 관련 개념

* [관계 REST API](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/using-custom-object-apis#relationship-rest-apis)
* [관계 REST API 사용](https://learn.liferay.com/en/w/dxp/building-applications/objects/objects-tutorials/using-apis/using-relationship-rest-apis)
