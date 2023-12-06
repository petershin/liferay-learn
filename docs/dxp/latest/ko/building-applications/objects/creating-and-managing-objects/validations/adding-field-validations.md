# 필드 유효성 검사 추가

{bdg-secondary}`라이프레이 7.4 2023.Q3+/GA98+`

유효성 검사는 유효한 필드 항목을 결정하기 위한 규칙을 설정합니다. 각 유효성 검사에는 개체 UI를 통해 설정할 수 있는 자체 트리거, 조건 및 오류 메시지가 있습니다. [Groovy 스크립트](#using-groovy-validations) 또는 [Liferay 표현식](#using-expression-builder-validations)을 사용하여 유효성 검사를 정의할 수 있습니다.

![Create validations for custom and system object fields.](./adding-field-validations/images/01.png)

!!! note
기본 유효성 검사가 요구 사항을 충족하지 않는 경우 `objectValidationRule` 클라이언트 확장을 사용하여 사용자 지정 유효성 검사를 만들 수 있습니다. 자세한 내용은 [마이크로서비스 클라이언트 확장](../../../client-extensions/microservice-client-extensions.md)을 참조하세요.

유효성 검사를 추가하려면

1. **전역 메뉴**( ![전역 메뉴](../../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다** . 

1. 객체 정의 편집을 시작합니다.

1. **유효성 검사** 탭으로 이동하여 **추가**( ![추가 버튼](../../../../images/icon-add.png) )를 클릭합니다.

1. **레이블** 을 입력하고 유효성 검사 유형(**Groovy** 또는 **Expression Builder**)을 선택합니다.

   객체 유효성 검사 규칙 클라이언트 확장을 인스턴스에 배포한 경우 해당 확장도 옵션으로 표시됩니다.

   ![Enter a label and select a validation type.](./adding-field-validations/images/02.png)

1. **저장** 을 클릭하세요.

1. 유효성 검사 편집을 시작합니다.

1. 기본 정보 탭에서 유효성 검사를 활성화합니다.

   ![Activate the validation.](./adding-field-validations/images/03.png)

1. 유효성 검사 실행 시기를 결정하려면 **트리거 이벤트** 를 선택하세요.

   각 검증에는 하나의 트리거 이벤트만 있을 수 있습니다.

1. **조건** 탭으로 이동하여 유효성 검사에 조건을 추가하세요.

   조건에는 복잡한 논리를 수행하기 위한 여러 필드와 함수가 포함될 수 있습니다.

   ![Add conditions to the validation.](./adding-field-validations/images/04.png)

   Groovy를 사용할 때 측면 패널을 통해 사용 가능한 데이터 필드를 찾아보고 조건에 추가할 수 있습니다. 자세한 내용은 [Groovy 유효성 검사 사용](#using-groovy-validations)을 참조하세요.

   표현식 작성기를 사용하면 측면 패널을 통해 필드, 연산자 및 함수를 찾아보고 조건에 추가할 수 있습니다. 자세한 내용은 [Expression Builder 유효성 검사 사용](#using-expression-builder-validations)을 참조하세요.

   !!! 중요
   Groovy 스크립트 검증은 Liferay Experience Cloud 자체 관리형 및 Liferay DXP 자체 호스팅에만 사용할 수 있습니다.

1. 현지화 가능한 **오류 메시지** 를 입력하세요. 이 메시지는 유효성 검사가 트리거되고 필드 항목이 정의된 조건 중 하나 이상을 충족하지 않을 때마다 나타납니다.

1. 오류 메시지가 나타나는 위치를 결정하려면 출력 유효성 검사 유형을 선택하십시오.

    **전체 유효성 검사(양식 요약**) : 양식 상단에 오류 메시지를 표시합니다.

    **부분 유효성 검사(인라인 필드**) : 지정된 필드 옆에 오류 메시지를 표시합니다.

    ![Enter an error message and select an output validation type.](./adding-field-validations/images/05.png)

1. **저장** 을 클릭하세요.

활성화된 동안 모든 새 개체 항목에 대해 유효성 검사가 실행되고 [레이아웃](../layouts.md) 및 [양식 컨테이너](../../using-fragments-to-build-forms.md)에 표시됩니다.

![Validations are displayed in form containers.](./adding-field-validations/images/06.png)

## Groovy 검증 사용

{bdg-primary}'Liferay Experience Cloud 자체 관리 및 Liferay DXP 자체 호스팅'

Groovy 유효성 검사는 모든 표준 [Groovy 스크립트](https://groovy-lang.org/) 기능을 지원합니다. 조건을 정의할 때 `invalidFields` 변수를 사용해야 합니다. Liferay는 'invalidFields'가 'true'를 반환하는 경우에만 유효성 검사 오류 메시지를 표시합니다.

![Use the side panel to add field elements to your Groovy validations.](./adding-field-validations/images/07.png)

Liferay는 **저장** 을 클릭할 때 [GroovyShell 클래스](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html)를 사용하여 Groovy 스크립트에서 유효한 구문을 확인합니다. 스크립트가 유효하지 않은 경우 Liferay는 오류 메시지를 표시합니다.

## 표현식 작성기 유효성 검사 사용

표현식 빌더는 요소 측면 패널에서 액세스할 수 있는 사전 정의된 필드, 연산자 및 함수를 제공합니다. 요소를 클릭하면 조건 편집기에 추가됩니다. 이러한 함수는 부울 값을 반환합니다. 제공된 연산자 및 함수의 전체 목록은 [Expression Builder 유효성 검사 참조](./expression-builder-validations-reference.md)를 참조하세요.

!!! important
텍스트, 숫자, 날짜 및 부울 필드 유형에는 식 작성기 유효성 검사만 사용할 수 있습니다.

![Use the side panel to add field, operator, and function elements to your validation.](./adding-field-validations/images/08.png)

Liferay는 저장을 클릭하면 표현식에서 유효한 구문을 확인합니다. 표현식이 유효하지 않으면 Liferay는 오류 메시지를 표시합니다.

### 식 작성기 연산자

다음 표에는 표현식 작성기 유효성 검사에 사용할 수 있는 연산자가 나열되어 있습니다.

| 운영자                              | 묘사                         |
| :------------------------------- | :------------------------- |
| 그리고 ( `AND` ) | 종속 관계를 나타내는 데 사용되는 등위 접속사  |
| 나누기 ( `/` )   | 나눗셈을 위한 수학 연산자             |
| 빼기( `-` )     | 뺄셈을 위한 수학 연산자              |
| 또는 ( `OR` )   | 독립적인 관계를 나타내는 데 사용되는 등위접속사 |
| 플러스( `+` )    | 덧셈을 위한 수학 연산자              |
| 곱하기( `*` )    | 곱셈을 위한 수학 연산자              |

### 표현식 빌더 기능

다음 표에는 호환되는 필드 유형과 함께 사용 가능한 표현식 작성기 함수가 나열되어 있습니다.

| 운영자         | 텍스트 필드 | 숫자 필드 | 날짜 필드 | 묘사                                                              |
| :---------- | :----- | :---- | :---- | :-------------------------------------------------------------- |
| 날짜 비교       |        |       | ✔     | 날짜 필드의 값이 설정된 값과 동일한지 확인합니다.                                    |
| 붙임          | ✔      |       |       | 여러 문자열 또는 텍스트 필드를 결합하고 다른 유효성 검사 기능과 함께 사용할 수 있는 단일 문자열을 반환합니다. |
| 조건          | ✔      | ✔     | ✔     | 사용자 입력이 하나 이상의 조건을 충족하는지 확인하고 부울 값을 반환합니다.                      |
| 포함한다        | ✔      | ✔     |       | 필드에 지정된 값이 포함되어 있는지 확인하고 부울을 반환합니다.                             |
| 포함하지 않음     | ✔      | ✔     |       | 필드에 지정된 값이 포함되어 있지 않은지 확인하고 부울을 반환합니다.                          |
| 미래 날짜       |        |       | ✔     | 날짜 필드의 값이 미래인지 확인하고 부울을 반환합니다.                                  |
| URL 임       | ✔      |       |       | 텍스트 필드가 URL인지 확인하고 부울을 반환합니다.                                   |
| 이메일인가요?     | ✔      |       |       | 텍스트 필드가 이메일인지 확인하고 부울을 반환합니다.                                   |
| 십진수임        |        | ✔     |       | 숫자 필드가 소수인지 확인하고 부울을 반환합니다.                                     |
| 빈 값임        | ✔      |       |       | 텍스트 필드가 비어 있는지 확인하고 부울을 반환합니다.                                  |
| 같음          | ✔      | ✔     |       | 필드 값이 지정된 값과 같은지 확인하고 부울을 반환합니다.                                |
| 다음보다 큼      |        | ✔     |       | 숫자 필드가 특정 숫자 값보다 큰지 확인하고 부울을 반환합니다.                             |
| 다음보다 크거나 같음 |        | ✔     |       | 숫자 필드가 특정 숫자 값보다 크거나 같은지 확인하고 부울을 반환합니다.                        |
| 정수임         |        | ✔     |       | 숫자 필드가 정수인지 확인하고 부울을 반환합니다.                                     |
| 다음보다 작음     |        | ✔     |       | 숫자 필드가 특정 숫자 값보다 작은지 확인하고 부울을 반환합니다.                            |
| 다음보다 작거나 같음 |        | ✔     |       | 숫자 필드가 특정 숫자 값보다 작거나 같은지 확인하고 부울을 반환합니다.                        |
| 동일하지 않음     | ✔      | ✔     |       | 필드 값이 지정된 값과 다른지 확인하고 부울을 반환합니다.                                |
| 성냥          | ✔      |       |       | 텍스트 필드가 특정 문자열 값이나 RegEx 표현식과 일치하는지 확인하고 부울을 반환합니다.             |
| 이전 값        | ✔      | ✔     | ✔     | 지정된 필드에 대한 이전 값을 검색합니다.                                         |
| 지난 날짜       |        |       | ✔     | 날짜 필드의 값이 과거인지 확인하고 부울을 반환합니다.                                  |
| 범위          |        |       | ✔     | 날짜 범위가 과거 날짜로 시작하고 미래 날짜로 끝나는지 확인하고 부울을 반환합니다.                  |
| 합집합         |        | ✔     |       | 여러 숫자 필드를 함께 추가하고 다른 유효성 검사 기능과 함께 사용할 수 있는 단일 숫자를 반환합니다.       |

자세한 내용과 예제는 [Expression Builder 유효성 검사 참조](./expression-builder-validations-reference.md)를 참조하세요.

## 사용 가능한 필드 참조

조건을 구성할 때 개체의 사용자 정의 또는 시스템 필드를 사용할 수 있습니다. 일대다 관계의 하위 측에 있는 관계 필드에서 선택할 수도 있습니다.

다음은 사용자 정의 개체에 사용할 수 있는 모든 기본 필드입니다.

| 분야                      | 묘사                      |
| :---------------------- | :---------------------- |
| `companyId`             | 항목이 생성된 포털 인스턴스         |
| `createDate`            | 항목이 생성된 시기              |
| `currentDate`           | 출품작이 제출된 날짜             |
| `currentUserId`         | 출품작을 제출하는 사용자의 ID       |
| `externalReferenceCode` | 항목에 대한 외부 참조 코드         |
| `groupId`               | 항목이 생성된 사이트 ID          |
| `lastPublishDate`       | 항목이 마지막으로 게시된 날짜        |
| `modifiedDate`          | 항목이 마지막으로 수정된 날짜        |
| `mvccVersion`           | 항목의 MVCC 버전             |
| `objectDefinitionId`    | 항목 객체의 ID               |
| `objectEntryId`         | 항목의 ID                  |
| `status`                | 항목의 워크플로 상태             |
| `statusByUserId`        | Workflow에 할당된 사용자의 ID   |
| `statusByUserName`      | 워크플로에 할당된 사용자의 이름       |
| `statusDate`            | 워크플로 상태가 마지막으로 업데이트된 날짜 |
| `userId`                | 항목 작성자의 ID              |
| `userName`              | 항목 작성자의 사용자 이름          |
| `uuid`                  | 항목의 고유한 범용 ID           |

시스템 개체에는 자체 기본 필드가 있지만 위 차트와 일부 겹치는 부분이 있습니다.

## 관련 주제

* [오브젝트 생성하기](../creating-objects.md)
* [객체에 필드 추가](../fields/adding-fields-to-objects.md)
* [표현식 작성기 유효성 검사 참조](./expression-builder-validations-reference.md)
