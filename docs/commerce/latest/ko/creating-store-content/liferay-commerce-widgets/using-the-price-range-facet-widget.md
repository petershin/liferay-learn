# 가격 범위 패싯 위젯 사용

Liferay Commerce에는 가격별로 제품 검색 결과를 빠르게 필터링하기 위한 **Price Range Facet** 위젯이 포함되어 있습니다. 이 위젯을 사용하려면 상거래 검색 결과 위젯도 원하는 페이지에 배포되어야 합니다.

```{note}
Liferay DXP 7.3 SP2부터 가격 범위 패싯 위젯은 제품의 최저 가격을 사용하여 결과를 필터링합니다.

이전 상거래 버전의 경우 위젯은 제품의 기본 가격을 사용하며 단일 SKU가 있는 제품에서만 작동합니다. SKU가 여러 개인 제품은 패싯이 활성 상태일 때 표시되지 않습니다.
```

![가격 범위 패싯 위젯을 사용하여 채널 제품을 가격별로 필터링합니다.](using-the-price-range-facet-widget/images/01.png)

가격 범위 패싯 위젯을 페이지에 추가하면 해당 필드를 구성할 수 있습니다.

1. 위젯 위에 마우스를 놓고 **작업** 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 **구성** 를 선택합니다.

   ![위젯을 구성합니다.](./using-the-price-range-facet-widget/images/02.png)

1. **설정** 탭에서 다음 필드를 구성합니다.

   **입력 범위 표시** : 위젯에서 고객이 사용자 지정 가격 범위를 입력할 수 있는지 여부를 결정합니다.

   **범위 JSON 배열** : 위젯에 대해 미리 정의된 가격 범위를 설정합니다.

   ![설정 탭에서 위젯의 필드를 구성합니다.](using-the-price-range-facet-widget/images/03.png)

1. **저장** 을 클릭합니다.

다른 상거래 위젯에 대해 알아보려면 [위젯 참조](../liferay-commerce-widgets/widget-reference.md) 을 참조하십시오.
