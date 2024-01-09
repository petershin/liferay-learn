# 재고 부족 조치

SKU 재고가 특정 임계값 아래로 떨어지면 재고 부족 조치가 트리거됩니다. 기본적으로 Liferay에는 재고가 임계값 아래로 떨어지면 매장에서 제품을 제거하는 **미공개로 설정** 재고 부족 작업이 포함되어 있습니다. 맞춤형 재고 부족 작업을 생성할 수도 있습니다. 자세한 내용은 맞춤형 [저재고 활동 구현](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md) 참조하세요.

제품에 대한 재고 부족 조치를 설정하려면,

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **제품** 으로 이동합니다.

1. 제품을 선택하고 **구성** 탭으로 이동합니다.

1. 재고 섹션 아래 드롭다운 메뉴에서 **재고 부족 조치** 를 선택합니다.

1. **낮은 재고 임계값** 을 입력하여 작업을 실행하는 수량을 결정하세요.

   ![Select a low stock action and set the quantity that triggers the action.](./low-stock-action/images/01.png)

1. **게시** 를 클릭하세요.

구성된 후에는 제품 재고가 설정된 임계값 아래로 떨어질 때마다 재고 부족 작업이 실행됩니다.

## 커머스 2.1 이하

재고 부족 작업을 구성하려면

1. **제어판** &rarr; **상거래** &rarr; **제품** 으로 이동합니다.

1. 제품을 클릭하고 **구성** 탭을 선택하세요.

1. 재고 섹션 아래 드롭다운 메뉴에서 **재고 부족 조치** 를 선택합니다.

1. 해당 작업의 트리거 수량을 결정하려면 **낮은 재고 임계값** 을 입력하세요.

1. **게시** 를 클릭하세요.

일단 구성되면 제품 재고가 설정된 임계값 아래로 떨어질 때마다 선택된 재고 부족 조치가 트리거됩니다.

## 관련 주제

* [제품 인벤토리 구성 참조](./product-inventory-configuration-reference-guide.md)
* [맞춤형 재고 부족 조치 구현](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)
