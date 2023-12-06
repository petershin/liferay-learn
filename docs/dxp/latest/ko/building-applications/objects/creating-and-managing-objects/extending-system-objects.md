# 시스템 개체 확장

{bdg-secondary}`라이프레이 7.4 U86+/GA86+`

Liferay 개체를 사용하면 지원되는 시스템 서비스를 확장할 수 있습니다. 현재 다음 서비스만 개체 프레임워크와 통합됩니다.

* 계정
* 커머스 주문
* 커머스 제품
* 커머스 상품 그룹
* 조직
* 우편 주소
* 사용자

```{note}
우편 주소 개체는 계정 주소를 저장합니다. 이러한 이유로 계정 개체와 관련된 사용자 정의 개체에만 연결할 수 있습니다. 자세한 내용은 [사용자 정의 개체와 함께 시스템 계정 사용](./using-system-objects-with-custom-objects.md)을 참조하세요.
```

![Extend system services integrated with the Objects Framework.](./extending-system-objects/images/01.png)

시스템 개체를 확장할 때 [fields](#adding-fields) , [relationships](#adding-relationships) , [actions](#adding-actions) 및 [validations](#adding-validations) 을 추가할 수 있습니다.

| 특징 | 시스템 개체 | 사용자 정의 개체 |
| :- | :----- | :-------- |
| 분야 | ✔      | ✔         |
| 관계 | ✔      | ✔         |
| 배치 |        | ✔         |
| 액션 | ✔      | ✔         |
| 전망 |        | ✔         |
| 검증 | ✔      | ✔         |

## 필드 추가

시스템 개체에 필드를 추가할 수 있습니다. 추가 데이터베이스 열은 '_x'가 추가된 서비스의 원래 테이블 이름(예: 'AccountEntry_x')을 사용하는 별도의 데이터베이스 테이블에 추가됩니다. 시스템 개체는 사용 가능한 모든 [필드 유형](./fields.md)을 지원합니다. 시스템 개체는 사용자 정의 레이아웃이나 보기를 지원하지 않으므로 Headless API를 통해서만 이러한 사용자 정의 필드에 액세스할 수 있습니다. 자세한 내용은 [객체에 필드 추가](./fields/adding-fields-to-objects.md)를 참조하세요.

```{note}
Liferay의 [사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 애플리케이션은 [Expando](../../data-frameworks/expando-framework/accessing-custom-fields-with-expando.md) 프레임워크. 개체는 Expando 기반 사용자 정의 필드를 지원하지 않으므로 개체 기능(예: [관계](#adding-relationships) , [작업](#adding-actions) 및 [유효성 검사](#adding-validations) )과 함께 사용할 수 없습니다.
```

## 관계 추가

시스템과 사용자 정의 개체 간의 관계를 추가하여 엔터티를 연결할 수 있습니다. 시스템 개체는 일대다 관계와 다대다 관계를 모두 지원합니다. 자세한 내용은 [객체 관계 정의](./relationships/defining-object-relationships.md)를 참조하세요.

```{important}
시스템 개체는 사용자 정의 [레이아웃](./layouts/designing-object-layouts.md) 및 [보기](./views/designing-object-views.md)를 지원하지 않으므로 UI에 관계를 추가할 수 없습니다. 시스템 개체. 헤드리스 API를 통해서만 상호작용할 수 있습니다.
```

### 관계 API

시스템 개체가 다대다 관계에 있거나 일대다 관계의 상위 측에 있는 경우 Liferay는 관계를 쿼리하고 관리하기 위해 [REST 끝점](../understanding-object-integrations/using-custom-object-apis.md#relationship-rest-apis) 을 생성합니다. 여기에는 관련 객체 항목을 반환하기 위한 GET 엔드포인트, 항목 관련 PUT 엔드포인트, 관련 항목 연결 해제를 위한 DELETE 엔드포인트가 포함됩니다.

시스템 개체가 다대다 관계에 있거나 일대다 관계의 상위 측에 있는 경우 Liferay는 관계를 쿼리하고 관리하기 위해 [REST 끝점](../understanding-object-integrations/using-custom-object-apis.md#relationship-rest-apis) 을 생성합니다. 여기에는 관련 객체 항목을 반환하기 위한 GET 엔드포인트, 항목 관련 PUT 엔드포인트, 관련 항목 연결 해제를 위한 DELETE 엔드포인트가 포함됩니다.

![Liferay generates REST endpoints for querying and managing the relationship.](./extending-system-objects/images/02.png)

소개 튜토리얼은 [관계 REST API 사용](../objects-tutorials/using-apis/using-relationship-rest-apis.md)을 참조하세요.

## 작업 추가

항목 추가, 업데이트 또는 제거와 같은 이벤트에서 트리거되는 작업을 시스템 개체에 추가할 수 있습니다. 아래 표에는 시스템 개체가 지원하는 작업이 나와 있습니다.

| 작업 유형                                                                     | 시스템 개체에서 지원되나요? |
| :------------------------------------------------------------------------ | :-------------- |
| [Webhook](./actions/defining-object-actions.md#webhook)                   | ✔               |
| [그루비 스크립트](./actions/defining-object-actions.md#groovy-script)            | ✔               |
| [Notification](./actions/defining-object-actions.md#notification)         | ✔               |
| [개체 항목 추가](./actions/defining-object-actions.md#add-an-object-entry)      | ✔               |
| [개체 항목 업데이트](./actions/defining-object-actions.md#update-an-object-entry) | ✔               |

자세한 내용은 [객체 작업 정의](./actions/defining-object-actions.md)를 참조하세요.

## 검증 추가

시스템 개체에 Groovy 및 Expression Builder 유효성 검사를 추가할 수 있습니다. 트리거되면 이러한 유효성 검사는 유효한 필드 항목을 확인하고 잘못된 항목에 대한 사용자 정의 오류 메시지를 표시합니다. 현재 개체는 시스템 개체의 기본 필드에 대한 유효성 검사만 지원하고 해당 사용자 정의 필드에 대한 유효성 검사는 지원하지 않습니다. 자세한 내용은 [필드 유효성 검사 추가](./validations/adding-field-validations.md)를 참조하세요.

## 추가 구성 옵션

시스템 개체를 편집할 때 **세부정보** 탭에서 다음 설정을 구성할 수도 있습니다.

| 분야               | 묘사                                   | 시스템 개체에서 지원됩니까? |
| :--------------- | :----------------------------------- | --------------- |
| 제목 필드            | 개체 항목의 제목으로 사용되는 필드를 결정합니다.          | ✔               |
| 패널 링크            | UI에서 애플리케이션이 표시되는 사이트를 결정합니다.         | ✖               |
| Page Builder의 위젯 | 개체의 페이지 위젯을 사이트에서 사용할 수 있는지 확인합니다.   | ✖               |
| 개체 항목 분류         | 개체 항목에 대해 분류 도구를 사용할 수 있는지 확인합니다.    | ✖               |
| 페이지 빌더의 설명       | 사용자가 개체 항목에 설명을 추가할 수 있는지 여부를 결정합니다. | ✖               |
| 감사 프레임워크의 입력 내역  | 감사 기록에 개체 이벤트가 표시되는지 여부를 결정합니다.      | ✖               |

## 관련 주제

* [객체에 필드 추가](./fields/adding-fields-to-objects.md)
* [객체 관계 정의](./relationships/defining-object-relationships.md)
* [객체 작업 정의](./actions/defining-object-actions.md)
