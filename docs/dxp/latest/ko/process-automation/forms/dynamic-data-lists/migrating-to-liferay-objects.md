# Liferay 객체로 마이그레이션

동적 데이터 목록은 더 이상 사용되지 않으며 2024년 말까지 제거될 예정입니다. 데이터 손실을 방지하고 동일한 기능을 얻으려면 구조와 데이터를 Liferay 개체로 마이그레이션하십시오. [개체](../../../building-applications/objects.md) 은 코드를 작성하거나 모듈을 배포할 필요 없이 Liferay UI에서 애플리케이션을 구축하기 위한 로우 코드 기능을 제공합니다. 각 애플리케이션은 Liferay의 핵심 프레임워크(예: 헤드리스, 권한, 워크플로)와 완전히 통합되어 있으며 UI 또는 전용 REST API를 통해 액세스하여 데이터 항목을 생성하고 관리할 수 있습니다.

동적 데이터 목록 작업에는 데이터 정의를 만든 다음 이를 사용하여 데이터 항목 목록(`DDLRecords`)을 저장하는 양식(`DDLRecordSet`)을 만드는 작업이 포함됩니다. 객체 사용에는 객체 정의 생성, 관련 및 게시가 포함됩니다. 게시되면 애플리케이션에 액세스하여 객체 항목을 생성할 수 있습니다. DDL과 비교하여 Objects는 사용자 정의 비즈니스 로직 구현 및 사용자 인터페이스 설계를 위한 추가 도구를 포함하면서 데이터 구조 모델링을 위한 훨씬 더 강력하고 통합된 환경을 제공합니다.

데이터를 마이그레이션하려면,

1. 동적 데이터 목록에 대한 개체 정의를 만듭니다. 목록에 선택 또는 라디오 필드가 포함된 경우 이러한 옵션을 정의하기 위한 선택 목록도 만들어야 합니다.

1. 데이터 목록의 기록을 XML 또는 CSV 파일로 내보내고 JSON 파일로 변환하세요.

1. [데이터 마이그레이션 센터](../../../headless-delivery/consuming-apis/data-migration-center.md) 사용하여 JSON 파일을 개체 정의로 가져옵니다.

!!! note
데이터 마이그레이션 센터를 사용하려면 COMMERCE-8087 [베타 기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) 를 활성화해야 합니다.

## 동적 데이터 목록에 대한 개체 정의 만들기

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 원하는 개체 폴더로 이동하여 **추가** 버튼(![추가 버튼](../../../images/icon-add.png))을 클릭합니다.

1. 초안에 대한 세부정보를 제공하세요.

   **레이블** : 개체 관리 및 지원되는 응용 프로그램 컨텍스트(예: 작업 흐름, 표시 페이지 템플릿, 양식)에서 개체를 식별합니다.

   **복수형 레이블** : UI에서 개체 응용 프로그램의 표시 이름을 결정합니다.

   **객체 이름** : 객체의 'definition.name'을 결정하며 게시 후에는 변경할 수 없습니다.

   ![Enter a Label, Plural Label, and Name for the object draft.](./migrating-to-liferay-objects/images/01.png)

1. **저장** 을 클릭하세요.

객체가 생성되면 객체를 편집하여 범위, 플랫폼 통합 등을 구성할 수 있습니다. 자세한 내용은 [객체 초안 편집](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md#editing-object-drafts) 참조하십시오.

동적 데이터 목록에 선택 및 라디오 필드가 포함된 경우 이러한 필드 옵션을 저장하려면 선택 목록 [개체 초안 편집(#adding-picklists) 해야 합니다. 그렇지 않으면 [해서 개체 정의에 데이터](#adding-data-fields) 를 추가할 수 있습니다.

### 선택 목록 추가

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **선택 목록** 을 클릭합니다.

1. **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭합니다.

1. 목록의 이름을 입력합니다.

   ![Enter a name for the picklist.](./migrating-to-liferay-objects/images/02.png)

1. 선택 목록을 편집합니다.

1. 항목 아래에서 **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭합니다.

1. 항목의 이름과 키를 입력합니다.

   **이름** : 항목의 표시 이름을 결정하며 생성 후 현지화할 수 있습니다.

   **키** : 객체 필드에 저장된 항목의 값을 결정하고 카멜 표기법을 사용합니다.

   !!! important
   항목의 키 값은 데이터 목록의 선택 또는 라디오 필드에 설정된 옵션 이름과 일치해야 합니다. 선택 및 라디오 필드에서 낙타 표기법을 사용하지 않는 경우 선택 목록 항목 키와 일치하도록 옵션 이름을 업데이트합니다.

   ![Enter a name and key for the item.](./migrating-to-liferay-objects/images/03.png)

1. 저장을 클릭합니다.

1. 다른 항목을 추가하려면 위 단계를 반복하세요.

   ![Repeat the process to add multiple items to the list.](./migrating-to-liferay-objects/images/04.png)

선택 목록을 만든 후에는 개체 정의의 데이터 필드에 사용할 수 있습니다.

### 데이터 필드 추가

1. 개체 정의 편집을 시작합니다.

1. **필드** 탭으로 이동하여 **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭합니다.

1. **레이블** 과 **필드 이름** 을 입력합니다.

   **레이블** : 이 값은 개체 UI의 필드를 식별하며 필드가 생성된 후 현지화될 수 있습니다.

   **필드 이름** : 이 값은 백엔드의 필드 이름을 결정하며 카멜 표기법을 사용합니다. 필드가 게시되면 이 값을 변경할 수 없습니다.

1. 필드 **유형** 을 선택합니다. 필드 유형이 DDL 필드와 호환되는 경우 [필드 호환성 참조](#field-compatibility-reference) 참조하세요.

1. 필드가 필수인지 확인합니다.

   ![Enter a label and field name, select a field type, and determine whether the field is mandatory.](./migrating-to-liferay-objects/images/05.png)

1. 저장을 클릭합니다.

1. 다른 필드를 추가하려면 위 단계를 반복하세요.

   ![Repeat the above steps to add other fields.](./migrating-to-liferay-objects/images/06.png)

데이터 필드를 추가한 후 이를 편집하여 검색 가능성, 기본값, 현지화 가능성 등의 추가 설정을 구성하세요. 자세한 내용은 [필드](../../../building-applications/objects/creating-and-managing-objects/fields.md) 참조하세요.

### 개체 정의 게시

개체 정의를 구성하고 데이터 필드를 추가한 후 개체를 게시하여 사용할 수 있도록 만드세요. 이렇게 하려면 개체의 **세부정보** 탭으로 이동하여 **게시** 를 클릭하세요. 게시한 후에는 개체에 대한 양식과 디스플레이를 디자인할 수 있습니다. 관리 인터페이스를 디자인하려면 [레이아웃](../../../building-applications/objects/creating-and-managing-objects/layouts.md) 및 [보기](../../../building-applications/objects/creating-and-managing-objects/views.md) 참조하세요. 정보 프레임워크 및 페이지 빌더 기능과의 개체 통합에 대해 알아보려면 [개체 항목 표시](../../../building-applications/objects/displaying-object-entries.md) 및 [조각을 사용하여 양식 작성](../../../building-applications/objects/using-fragments-to-build-forms.md) 을 참조하세요.

다음으로 데이터 목록 레코드를 내보내고 사용자 정의 개체 정의로 가져옵니다.

## 데이터 항목 내보내기 및 변환

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** 를 확장한 다음 **동적 데이터 목록** 을 클릭합니다.

1. 원하는 데이터 목록에 대해 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **내보내기** 를 선택합니다.

   !!! important
   중첩된 필드 값은 내보내지지 않습니다.

1. **CSV** 또는 **XML** 을 선택하고 **확인** 을 클릭합니다.

   ![Select a file extension type and click OK.](./migrating-to-liferay-objects/images/07.png)

1. 타사 서비스를 사용하여 파일을 JSON으로 변환합니다.

JSON 파일이 준비되면 이를 사용자 정의 개체 정의로 가져올 수 있습니다.

## DDL 항목 가져오기

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **응용 프로그램** 탭으로 이동한 다음 **데이터 마이그레이션 센터** 를 클릭합니다.

1. **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭하고 **파일 가져오기** 를 선택합니다.

1. 가져오기에 대한 **이름** 을 입력합니다.

1. 엔터티 유형으로 **사용자 정의 개체** 를 선택합니다.

   ![Enter a name and select an Entity Type.](./migrating-to-liferay-objects/images/08.png)

1. 데이터 목록 기록이 포함된 **JSON 파일** 을 선택하세요.

   ![Select the JSON file with your data list records.](./migrating-to-liferay-objects/images/09.png)

1. **소스 파일 필드** 를 객체 정의 필드에 매핑합니다.

   ![Map the source file fields to object definition fields.](./migrating-to-liferay-objects/images/10.png)

1. **다음** 을 클릭하세요.

1. 레코드에 대한 필드 매핑을 검토하고 **가져오기 시작** 을 클릭하세요.

   ![Review the mapping and click Start Import.](./migrating-to-liferay-objects/images/11.png)

1. 가져오기가 성공했는지 확인합니다.

   ![Confirm the import is successful.](./migrating-to-liferay-objects/images/12.png)

1. 항목이 사용자 정의 개체에 나타나는지 확인합니다.

    ![Verify the entries appear in the custom object.](./migrating-to-liferay-objects/images/13.png)

## 필드 호환성 참조

| DDL 필드 유형 | 개체 필드 유형 |
| :-------- | :------- |
| 불리언       | 불리언      |
| 색깔        | 원본       |
| 날짜        | 날짜       |
| 소수        | 소수       |
| 문서 및 미디어  | 부착       |
| 지리 사이트
     | 원본       |
| HTML      | 서식있는 텍스트 |
| 정수        | 정수       |
| 페이지에 연결   | 서식있는 텍스트 |
| 숫자        | 소수       |
| Radio     | 선택목록     |
| 가려내는      | 선택목록     |
| 원본        | 원본       |
| 텍스트 박스    | 긴 텍스트    |
| 웹 콘텐츠     | 서식있는 텍스트 |

## 관련 주제

* [개체](../../../building-applications/objects.md)
* [객체 생성](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)
* [개체에 필드 추가](../../../building-applications/objects/creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [선택 목록 만들기](../../../building-applications/objects/picklists/creating-picklists.md)
