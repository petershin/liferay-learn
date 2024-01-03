# 수식 필드

{bdg-secondary}`liferay 7.4 2023.Q4+/GA107+`

수식 필드는 개체 정의의 숫자 필드를 사용하여 계산된 읽기 전용 값을 저장합니다. 사용 사례의 예로는 보류 중인 요청을 뺀 후 직원의 사용 가능한 PTO 시간 계산, 주문 총액을 기준으로 상담원 커미션 계산 등이 있습니다.

필드를 생성하는 동안 필드 값이 정수로 저장되는지 아니면 소수로 저장되는지 결정할 수 있습니다. 필드를 만든 후에는 필드를 편집하여 해당 값을 계산하는 데 사용되는 수식을 정의해야 합니다. 사용 가능한 기능에는 더하기(`+`), 빼기(`-`), 곱하기(`*`) 및 나누기(`/`)가 포함됩니다. 개체의 모든 정수, 긴 정수, 소수 및 정밀도 소수 필드와 함께 이러한 함수를 사용할 수 있습니다.

![Determine the formula used for the field.](./formula-fields/images/01.png)

예를 들어 'totalRevenue'(정밀도 소수) 및 'totalExpenses'(정밀도 소수)라는 두 개의 숫자 필드가 있는 시나리오를 생각해 보세요. 이 표현식이 포함된 수식 필드를 추가하여 순이익을 계산할 수 있습니다.

```
totalRevenue - totalExpenses
```

![Calculate the net profit.](./formula-fields/images/02.png)

또한 이 표현식이 포함된 수식 필드를 추가하여 이익 마진을 계산할 수 있습니다.

```
(totalRevenue - totalExpenses) / totalRevenue * 100
```

![Calculate the profit margin.](./formula-fields/images/03.png)

수식 필드 값은 항목이 생성되거나 업데이트될 때마다 이러한 표현식을 사용하여 동적으로 설정됩니다.

![Formula field values are set dynamically.](./formula-fields/images/04.png)

## 관련 주제

* [객체에 필드 추가하기](./adding-fields-to-objects.md) 
* [집계 필드](./aggregation-fields.md) 
<!-- * [Numeric Fields](./numeric-fields.md) -->
