# 개체 관계 정의

{bdg-secondary}`라이프레이 7.4+`

관계는 항목을 서로 연결하기 위해 개체 정의에 필드와 테이블을 추가합니다. 개체 정의에 관계를 추가하려면 다음 단계를 따르세요.

1. **전역 메뉴**( ![전역 메뉴](../../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. 원하는 객체 정의 편집을 시작합니다.

1. **관계** 탭으로 이동하여 **추가**( ![추가 버튼](../../../../images/icon-add.png) )를 클릭합니다.

1. **라벨** 과 **이름** 을 입력하세요.

   **레이블** : 개체 UI에서 관계를 식별하고 관계가 생성된 후 현지화될 수 있습니다.

   **이름** : 백엔드에서 관계 이름을 결정하고 카멜 표기법을 사용합니다. 관계가 게시되면 이 값을 변경할 수 없습니다.

1. 관계 유형을 선택합니다: **일대다** 또는 **다대다** .

   **일대다** : 하나의 개체 항목을 여러 개체 항목과 연결합니다. 이 유형은 관계의 상위 측 항목(즉, '일' 측)에 관계 테이블을 추가하고 하위 측 항목(즉, '다' 측)에 관계 필드를 추가합니다.

   **다대다** : 여러 개체 항목을 여러 개체 항목과 연결합니다. 이렇게 하면 관계 양쪽의 항목에 관계 테이블이 추가됩니다.

   ```{note}
   개체 UI에서 관계 필드는 정의의 필드 탭에 표시되고 테이블은 관계 탭에 표시됩니다.
   ```

1. 현재 개체와 관련된 **개체** 를 선택하세요. 개체를 자체 또는 다른 개체 정의와 연결할 수 있습니다.

   ![Enter a label and name, and select both a relationship type and the desired object.](./defining-object-relationships/images/01.png)

1. **저장** 을 클릭하세요.

   ![View the relationship in the Relationships tab.](./defining-object-relationships/images/02.png)

저장한 후에는 관계를 사용하여 항목을 연관시킬 수 있습니다.

관계를 편집하여 [삭제 유형](#configuring-deletion-type) 을 구성하거나 [mandatory]으로 만들 수 있습니다(#making-relationship-fields-mandatory).

```{important}
관계 필드는 객체의 기본 레이아웃에 자동으로 표시됩니다. 관계 테이블을 표시하려면 [관계 탭](../layouts/designing-object-layouts.md#adding-relationships-tabs) 이 있는 사용자 지정 레이아웃이 필요합니다. 이 탭에는 현재 항목과 관련된 모든 항목이 나열됩니다. 시스템 객체는 사용자 지정 레이아웃을 지원하지 않으므로 관계 필드나 테이블을 표시할 수 없습니다. REST API를 통해서만 해당 관계 필드에 액세스할 수 있습니다. 자세한 내용은 [객체 레이아웃 디자인하기](../layouts/designing-object-layouts.md)를 참조하세요.
```

## 삭제 유형 구성

관계를 정의한 후 삭제 유형을 구성할 수 있습니다. 이 설정은 항목이 다른 항목과 관련될 때 항목 삭제가 처리되는 방법을 결정합니다.

![After creating a relationship, you can configure its deletion type.](./defining-object-relationships/images/03.png)

사용 가능한 옵션에는 **방지** , **연결 해제** 및 **계단식** 이 포함됩니다.

**방지**(기본값): 하위 항목과 관련된 경우 상위 항목의 삭제를 방지합니다.

**연결 해제** : 사용자가 하위 항목과 관련된 상위 항목을 삭제할 수 있도록 허용합니다. 상위 항목을 삭제해도 관련 항목에는 영향을 주지 않습니다.

**계단식** : 사용자가 하위 항목과 관련된 상위 항목을 삭제할 수 있도록 허용합니다. 사용자에게 하위 개체의 항목을 삭제할 수 있는 권한이 있는 경우 상위 항목을 삭제하면 관련 항목도 삭제됩니다.

## 관계 필드를 필수로 만들기

{bdg-secondary}`라이프레이 7.4 U47+/GA47+`

일대다 관계의 하위 측 개체는 관계 필드를 상속합니다. 일부 시나리오에서는 이러한 필드를 필수로 설정할 수 있습니다. 예를 들어 티켓 개체를 만드는 경우 '담당자'를 선택하기 위한 필수 관계 필드를 정의할 수 있습니다. 또는 계정별로 [객체 데이터에 대한 액세스를 제한](../using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md)하려면 다음을 수행해야 합니다. 개체와 계정 개체의 관계는 필수입니다.

관계 필드를 필수로 설정하려면 다음 단계를 따르세요.

1. 원하는 관계 필드가 포함된 **개체** 편집을 시작합니다.

1. **필드** 탭으로 이동하여 **관계 필드** 편집을 시작하세요.

   ![Go to the Field tab and begin editing the relationships field](./defining-object-relationships/images/04.png)

1. **필수** 스사이트를 전환합니다.

   ![Toggle the Mandatory switch.](./defining-object-relationships/images/05.png)

1. **저장** 을 클릭하세요.

## 관련 주제

* [오브젝트 생성](../creating-objects.md)
* [객체 레이아웃 디자인](../layouts/designing-object-layouts.md)
* [관계 제거](./removing-relationships.md)
