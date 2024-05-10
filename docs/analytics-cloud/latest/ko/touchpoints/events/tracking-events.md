# 추적 이벤트

Liferay DXP 사이트 페이지에 JavaScript 코드를 추가하여 분석을 위해 이벤트를 추적할 수 있습니다. 추가하는 코드는 Analytic Cloud의 API와 상호 작용하여 웹 사이트에서 사용자가 수행하는 작업을 캡처합니다. 이러한 이벤트는 [이벤트 분석](./events-analysis.md) 도구로 분석할 수 있습니다.

이렇게 하려면 JavaScript 코드에서 `Analytics.track` 을 사용하고 이벤트 이름과 속성을 정의하십시오.

| 분야   | 묘사                                                                                    |
|:---- |:------------------------------------------------------------------------------------- |
| `사건` | 이벤트의 이름입니다. 이벤트 분석을 수행할 때 쉽게 이해할 수 있는 사람이 읽을 수 있는 이름을 사용하는 것이 좋습니다(예: "장바구니에 추가 클릭"). |
| `속성` | 추적하려는 이벤트의 다양한 속성(예: 가격, 제품 이름, 수량 등)                                                 |

예를 들어 사용자가 장바구니에 항목을 추가하는 방법을 추적할 수 있습니다. 이러한 이벤트를 추적하려면 웹 사이트의 제품 페이지에 JavaScript 코드를 추가하십시오. 이벤트와 함께 추적할 가격, 제품 이름 및 수량과 같은 속성을 선택합니다. 다음은 간단한 예입니다.

```javascript

// Add some event listener logic for when a user clicks the Add to Cart button

Analytics.track("Add to Cart Click",{
    'price': productPrice(),
    'productName': productName(),
    'quantity': productQuantity(),
});
```

부울, 날짜, 기간, 숫자 및 문자열 속성에 대해 다음 데이터 유형 변환을 설정할 수 있습니다. Analytics Cloud는 해당 속성에 대해 수집된 첫 번째 데이터를 기반으로 데이터 유형을 자동으로 감지하고 캐스팅하려고 시도합니다. Analytics Cloud의 설정 페이지에 있는 이벤트 속성 정의 [에서 필요한 경우 typecast를 변경](../../workspace-data/definitions/definitions-for-event-attributes.md).

| 속성 유형    | 묘사                                           |
|:-------- |:-------------------------------------------- |
| `불리언`    | `참` 또는 `거짓`, 대소문자를 구분하지 않음                   |
| `날짜`     | ISO-8061 형식(yyyy-MM-dd'T'HH:mm:ss.SSSX)      |
| `내구`     | 밀리초 단위, 음수가 아님                               |
| `숫자`     | 천 단위 구분 기호가 없어도 소수 구분 기호는 괜찮습니다.             |
| `String` | 일치하는 다른 형식이 없으면 Analytics Cloud는 문자열을 가정합니다. |

지정한 속성 외에도 모든 이벤트와 자동으로 연결되는 [개의 전역 속성](../../workspace-data/definitions/definitions-for-event-attributes.md) 이 있습니다.

## 자바스크립트 코드 추가

추적 이벤트를 활성화하기 위해 JavaScript 코드를 추가할 수 있는 몇 가지 방법이 있습니다. 개별 페이지 수정, 페이지 조각 추가 또는 사용자 정의 구현 사용.

### 개별 페이지 수정

JavaScript 코드를 추가하는 가장 간단한 방법은 개별 페이지를 수정하는 것입니다. 페이지에 JavaScript 코드를 추가할 수 있는 기능이 있는 위젯 페이지를 사용해야 합니다.

1. 제품 메뉴(![Product Menu icon.](../../images/icon-product-menu.png))를 클릭하고 **Site Builder** &rarr; **Pages** 로 이동합니다.

1. 개별 페이지의 **작업** 아이콘(![Actions icon.](../../images/icon-actions.png))을 클릭하고 **구성을 클릭합니다.**

1. **JavaScript** 아래의 텍스트 상자 영역에 JavaScript 코드를 붙여넣습니다. 이는 고급 탭 아래에 있습니다.

    ![텍스트 상자에 JavaScript 코드를 붙여넣습니다.](./tracking-events/images/01.png)

1. **저장** 을 클릭하면 이제 페이지에서 이벤트를 추적할 준비가 되었습니다.

자세한 내용은 [개별 페이지 구성](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-settings/configuring-individual-pages) 을 참조하십시오.

### 페이지 조각 추가

Javascript 코드를 추가하는 또 다른 방법은 콘텐츠 페이지에 추가할 수 있는 페이지 조각을 만드는 것입니다. 웹 사이트의 모든 페이지에 프래그먼트를 빠르게 추가할 수 있으므로 확장성이 향상됩니다.

1. 제품 메뉴(![Product Menu icon.](../../images/icon-product-menu.png))를 클릭하고 **Design** &rarr; **Fragments** 로 이동합니다.

1. Fragment Sets의 **더하기** 아이콘(![Plus icon.](../../images/icon-plus.png))을 클릭합니다.

1. ** 추가 아이콘(![Add icon.](../../images/icon-add.png))을 클릭하여 새 조각을 만듭니다.

1. **Code** 탭을 클릭하고 JavaScript 코드를 JavaScript 필드에 붙여넣습니다.

    ![자바스크립트 코드를 자바스크립트 필드에 붙여넣습니다.](./tracking-events/images/02.png)

    `Analytics.track` 코드를 트리거하는 속성 값 또는 논리를 가져오는 추가 코드가 필요할 수 있습니다.

1. **저장** 을 클릭하면 이제 페이지 조각을 사용할 준비가 되었습니다.

1. 조각을 추가할 콘텐츠 페이지로 이동합니다. **편집** 아이콘(![Edit icon.](../../images/icon-edit.png))을 클릭하여 페이지 편집기를 엽니다. 방금 만든 조각을 찾아 페이지로 드래그합니다. **게시** 을 클릭합니다.

자세한 내용은 [조각 개발](https://learn.liferay.com/w/dxp/site-building/developer-guide/developing-page-fragments/developing-fragments-intro) 을 참조하십시오.

### 사용자 지정 구현 사용

마지막으로 자신의 개발 도구와 접근 방식을 사용하여 웹 사이트에 JavaScript 코드를 구현하도록 선택할 수 있습니다.
