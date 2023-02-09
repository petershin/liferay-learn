# 시스템 개체 확장

{bdg-secondary}`사용 가능한 Liferay 7.4 U46+/GA46+`

Liferay 개체를 사용하면 지원되는 시스템 서비스를 확장할 수 있습니다. 현재 계정, 상거래 주문, 상거래 제품, 상거래 제품 그룹, 우편 주소 및 사용자와 같은 서비스만 개체 프레임워크와 통합됩니다.

```{note}
우편 주소 개체는 계정 주소를 저장하는 데만 사용됩니다. 이러한 이유로 계정 개체와 관련된 사용자 정의 개체에만 연결할 수 있습니다. 자세한 내용은 [사용자 지정 개체에 계정 사용](./using-accounts-with-custom-objects.md)을 참조하세요.
```

![Objects Framework와 통합된 시스템 서비스를 확장합니다.](./extending-system-objects/images/01.png)

시스템 개체를 확장할 때 [개의 필드](#adding-fields), [관계](#adding-relationships), [작업](#adding-actions)및 [유효성 검사](#adding-validations) 을 추가할 수 있습니다.

| 특징 | 시스템 객체   | 사용자 지정 개체 |
|:-- |:-------- |:--------- |
| 분야 | &#10004; | &#10004;  |
| 관계 | &#10004; | &#10004;  |
| 배치 |          | &#10004;  |
| 액션 | &#10004; | &#10004;  |
| 전망 |          | &#10004;  |
| 검증 | &#10004; | &#10004;  |

## 필드 추가

시스템 개체에 필드를 추가할 수 있습니다. 추가 데이터베이스 열은 서비스의 원래 테이블 이름에 `_x` 이 추가된(예: `AccountEntry_x`) 사용하는 별도의 데이터베이스 테이블에 추가됩니다. 시스템 객체는 사용 가능한 모든 [필드 유형을 지원합니다](./fields.md). 시스템 개체는 사용자 지정 레이아웃 또는 보기를 지원하지 않으므로 Headless API를 통해서만 이러한 사용자 지정 필드에 액세스할 수 있습니다. 자세한 내용은 [개체에 필드 추가](./fields/adding-fields-to-objects.md) 을 참조하십시오.

```{note}
Liferay의 [Custom Fields](../../../system-administration/configuring-liferay/adding-custom-fields.md) 애플리케이션은 [Expando](../.. /data-frameworks/expando-framework/accessing-custom-fields-with-expando.md) 프레임워크. Objects는 Expando 기반 사용자 정의 필드를 지원하지 않으므로 Objects 기능(예: [relationships](#adding-relationships), [actions](#adding-actions) 및 [validations](#adding-validations))과 함께 사용할 수 없습니다.
```

## 관계 추가

시스템 개체와 사용자 지정 개체 간의 관계를 생성하여 해당 엔터티를 연결할 수 있습니다. System Object는 일대다 및 다대다 관계를 모두 지원합니다. 자세한 내용은 [객체 관계 정의](./relationships/defining-object-relationships.md) 을 참조하십시오.

```{important}
시스템 개체는 [사용자 정의 레이아웃](./layouts/designing-object-layouts.md)을 지원하지 않으므로 [레이아웃 탭](./layouts/designing-object-layouts.md#adding-layout-tabs)을 추가할 수 없습니다. )을 다대다 관계 또는 일대다 관계의 상위 측에 표시하기 위한 객체로.
```

## 작업 추가

항목이 추가, 업데이트 또는 제거될 때 트리거되는 시스템 개체에 사용자 지정 작업을 추가할 수 있습니다. 시스템 개체는 [Webhook](./actions/defining-object-actions.md#webhook-actions), [Groovy 스크립트](./actions/defining-object-actions.md#groovy-script-actions) 및 [ 알림](./actions/defining-object-actions.md#notification-actions) 작업. [개체 항목 추가](./actions/defining-object-actions.md#add-an-object-entry-actions) 작업은 시스템 개체에서 지원되지 않습니다. 자세한 내용은 [개체 작업 정의](./actions/defining-object-actions.md)를 참조하십시오. 


## 유효성 검사 추가

Groovy 및 Expression Builder 유효성 검사를 시스템 개체에 추가할 수 있습니다. 트리거되면 이러한 유효성 검사는 유효한 필드 항목을 확인하고 잘못된 항목에 대한 사용자 지정 오류 메시지를 표시합니다. 현재 개체는 시스템 개체의 기본 필드에 대한 유효성 검사만 지원하고 해당 사용자 정의 필드에 대한 유효성 검사는 지원하지 않습니다. 자세한 내용은 [사용자 정의 유효성 검사 추가](./validations/adding-custom-validations.md) 을 참조하십시오.

<!--TASK: Uncomment once supported.
## Additional Configuration Options

When editing a system object, you can also configure the following settings in the *Details* tab.

| Field | Description |
| :--- | :--- |
| Title Field | Determine the field used as the title for object entries. |
| Widget | Determine whether the object's Page widget is available in sites.| -->



## 추가 정보

* [개체에 필드 추가](./fields/adding-fields-to-objects.md)
* [개체 관계 정의](./relationships/defining-object-relationships.md)
* [개체 작업 정의](./actions/defining-object-actions.md)
