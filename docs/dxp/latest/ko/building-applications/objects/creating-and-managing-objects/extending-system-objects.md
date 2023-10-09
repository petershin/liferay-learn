# 시스템 개체 확장

{bdg-secondary}`사용 가능 Liferay 7.4 U86+/GA86+`

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

![Objects Framework와 통합된 시스템 서비스를 확장합니다.](./extending-system-objects/images/01.png)

시스템 개체를 확장할 때 [필드](#adding-fields), [관계](#adding-relationships), [작업](#adding-actions)및 [유효성 검사](#adding-validations) 추가할 수 있습니다.

| 특징 | 시스템 개체   | 사용자 정의 개체 |
|:-- |:-------- |:--------- |
| 분야 | &#10004; | &#10004;  |
| 관계 | &#10004; | &#10004;  |
| 배치 |          | &#10004;  |
| 액션 | &#10004; | &#10004;  |
| 전망 |          | &#10004;  |
| 검증 | &#10004; | &#10004;  |

## 필드 추가

시스템 개체에 필드를 추가할 수 있습니다. 추가 데이터베이스 열은 서비스의 원래 테이블 이름에 `_x` 추가된(예: `AccountEntry_x`) 별도의 데이터베이스 테이블에 추가됩니다. 시스템 객체는 사용 가능한 [필드 유형을 지원합니다](./fields.md). 시스템 개체는 사용자 정의 레이아웃이나 보기를 지원하지 않으므로 Headless API를 통해서만 이러한 사용자 정의 필드에 액세스할 수 있습니다. 자세한 내용은 [개체에 필드 추가](./fields/adding-fields-to-objects.md) 참조하세요.

```{note}
Liferay의 [사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 애플리케이션은 [Expando](../.. /data-frameworks/expando-framework/accessing-custom-fields-with-expando.md) 프레임워크. 개체는 Expando 기반 사용자 정의 필드를 지원하지 않으므로 개체 기능(예: [relationships](#adding-relationships), [actions](#adding-actions) 및 [validations](#adding-validations))과 함께 사용할 수 없습니다.
```

## 관계 추가

시스템과 사용자 정의 개체 간의 관계를 추가하여 엔터티를 연결할 수 있습니다. 시스템 개체는 일대다 관계와 다대다 관계를 모두 지원합니다. 자세한 내용은 [개체 관계 정의](./relationships/defining-object-relationships.md) 참조하세요.

```{important}
시스템 개체는 사용자 지정 [layouts](./layouts/designing-object-layouts.md) 및 [views](./views/designing-object-views.md)을 지원하지 않으므로 시스템 개체의 UI에 관계를 추가할 수 없습니다. 헤드리스 API를 통해서만 상호작용할 수 있습니다. 
```

### 관계 API

시스템 개체가 다대다 관계에 있거나 일대다 관계의 상위 측에 있는 경우 Liferay는 관계를 쿼리하고 관리하기 위해 [REST 끝점](../understanding-object-integrations/headless-framework-integration.md#relationship-rest-apis) 생성합니다. 여기에는 관련 객체 항목을 반환하기 위한 GET 엔드포인트, 항목 관련 PUT 엔드포인트, 관련 항목 연결 해제를 위한 DELETE 엔드포인트가 포함됩니다.

이 예에서 사용자 시스템 객체는 사용자 정의 객체(`timeOffRequest`)와 일대다 관계(`userRequests`)에 있습니다. 이러한 엔드포인트는 [`headless-admin-user`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-user/v1.0/openapi.json) 서비스에 나타납니다.

![Liferay는 관계를 쿼리하고 관리하기 위한 REST 엔드포인트를 생성합니다.](./extending-system-objects/images/02.png)

소개 튜토리얼은 [관계 REST API 사용](../objects-tutorials/using-apis/using-relationship-rest-apis.md) 참조하세요.

## 작업 추가

항목 추가, 업데이트 또는 제거와 같은 이벤트에서 트리거되는 작업을 시스템 개체에 추가할 수 있습니다. 아래 표에는 시스템 개체가 지원하는 작업이 나와 있습니다.

| 작업 유형                                                                     | 시스템 개체에서 지원됩니까? |
|:------------------------------------------------------------------------- |:--------------- |
| [Webhook](./actions/defining-object-actions.md#webhook)                   | &#10004;        |
| [Groovy 스크립트](./actions/defining-object-actions.md#groovy-script)         | &#10004;        |
| [알림](./actions/defining-object-actions.md#notification)                   | &#10004;        |
| [객체 항목 추가](./actions/defining-object-actions.md#add-an-object-entry)      | &#10004;        |
| [개체 항목 업데이트](./actions/defining-object-actions.md#update-an-object-entry) | &#10004;        |

자세한 내용은 [개체 작업 정의](./actions/defining-object-actions.md) 참조하세요.

## 검증 추가

시스템 개체에 Groovy 및 Expression Builder 유효성 검사를 추가할 수 있습니다. 트리거되면 이러한 유효성 검사는 유효한 필드 항목을 확인하고 잘못된 항목에 대한 사용자 정의 오류 메시지를 표시합니다. 현재 개체는 시스템 개체의 기본 필드에 대한 유효성 검사만 지원하고 해당 사용자 정의 필드에 대한 유효성 검사는 지원하지 않습니다. 자세한 내용은 [사용자 정의 유효성 검사 추가](./validations/adding-custom-validations.md) 참조하세요.

## 추가 구성 옵션

시스템 개체를 편집할 때 *세부 정보* 탭에서 다음 설정을 구성할 수도 있습니다.

| 분야               | 묘사                                   | 시스템 개체에서 지원되나요? |
|:---------------- |:------------------------------------ | --------------- |
| 제목 필드            | 개체 항목의 제목으로 사용되는 필드를 결정합니다.          | &#10004;        |
| 패널 링크            | UI에서 애플리케이션이 표시되는 사이트를 결정합니다.         | &#10006;        |
| Page Builder의 위젯 | 개체의 페이지 위젯을 사이트에서 사용할 수 있는지 확인합니다.   | &#10006;        |
| 개체 항목 분류         | 개체 항목에 대해 분류 도구를 사용할 수 있는지 확인합니다.    | &#10006;        |
| 페이지 빌더의 설명       | 사용자가 개체 항목에 설명을 추가할 수 있는지 여부를 결정합니다. | &#10006;        |
| 감사 프레임워크의 입력 내역  | 감사 기록에 개체 이벤트가 표시되는지 여부를 결정합니다.      | &#10006;        |

## 관련 주제

* [객체에 필드 추가](./fields/adding-fields-to-objects.md)
* [개체 관계 정의](./relationships/defining-object-relationships.md)
* [개체 작업 정의](./actions/defining-object-actions.md)
