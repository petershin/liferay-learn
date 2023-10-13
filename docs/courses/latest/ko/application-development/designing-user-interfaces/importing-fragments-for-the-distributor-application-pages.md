# 배포자 응용 프로그램 페이지에 대한 조각 가져오기

게시된 개체는 Liferay의 핵심 프레임워크와 통합되므로 페이지 조각을 양식 조각 및 컬렉션 표시 조각과 같은 개체 항목에 매핑할 수 있습니다. 여기서는 배포자 애플리케이션 페이지에서 사용할 사전 구성된 조각 구성을 가져옵니다. 그러나 조각을 가져오기 전에 제공된 양식 컨테이너의 객체 ID를 인스턴스의 배포자 애플리케이션 객체 ID로 압축을 풀고 업데이트하세요.

## 가져올 조각 준비

1. 배포자 애플리케이션 개체의 ID를 검색하고 나중에 사용할 수 있도록 저장합니다.

   ![Distributor Application 개체 편집을 시작하고 해당 ID를 복사합니다.](./importing-fragments-for-the-distributor-application-pages/images/01.png)

1. [Distributor Application 조각 세트](./liferay-b2m3.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/designing-user-interfaces/importing-fragments-for-the-distributor-application-pages/liferay-b2m3.zip -O
   ```

   ```bash
   unzip liferay-b2m3.zip
   ```

1. `liferay-b2m3/fragment-compositions/application-form`폴더로 이동합니다.

1. 코드 편집기에서 `-composition-definition.json` 파일을 엽니다.

1. `className`에 이 값을 입력하고 `[OBJECT_ID]` 배포자 응용 프로그램 개체의 ID( `com.liferay.object.model.ObjectDefinition#[OBJECT_ID]`로 바꿉니다.

   예를 들어,

   ```json
   "formReference": {
       "className": "com.liferay.object.model.ObjectDefinition#34844",
       "classType": 0
   }
   ```

1. 파일을 저장하고 조각 세트를 압축합니다.

   ```bash
   zip distributor-application-fragment-set.zip liferay-b2m3 -r
   ```

이제 조각 세트를 사이트로 가져올 수 있습니다.

## 조각 세트 가져오기

1. **사이트 메뉴**( ![Site Menu](../../images/icon-product-menu.png) )을 열고 **디자인** 확장한 다음 **조각** 클릭합니다.

1. 조각 세트에 대해 **작업**( ![Actions Button](../../images/icon-actions.png) )을 클릭하고 **가져오기** 선택합니다.

   ![조각 세트에 대한 작업 버튼을 클릭하고 가져오기를 클릭합니다.](./importing-fragments-for-the-distributor-application-pages/images/02.png)

1. `distribution-application-fragment-set.zip` 파일을 선택하고 **Import** 클릭합니다.

   ![distribution-application-fragment-set.zip 파일을 선택하고 가져오기를 클릭합니다.](./importing-fragments-for-the-distributor-application-pages/images/03.png)

1. 배포자 애플리케이션 조각을 성공적으로 가져왔는지 확인합니다. 이 세트에는 세 개의 조각이 포함되어야 합니다.

   * 양식 페이지
   * 성공 페이지
   * 페이지 표시

   ![배포자 애플리케이션 조각을 성공적으로 가져왔는지 확인합니다.](./importing-fragments-for-the-distributor-application-pages/images/04.png)

이제 조각을 가져왔으므로 이를 사용하여 배포자 애플리케이션 개체를 페이지에 통합할 수 있습니다.

다음: [적용 페이지에 양식 추가하기](./adding-the-form-to-the-apply-page.md)

## 관련 개념

* [개체 항목 표시](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/displaying-object-entries)
* [조각을 사용하여 양식 작성](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/using-fragments-to-build-forms)
