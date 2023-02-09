---
toc:
- ./relationships/defining-object-relationships.md
- ./relationships/removing-relationships.md
---
# 관계

```{toctree}
:maxdepth: 3

relationships/defining-object-relationships.md
relationships/removing-relationships.md
```

{bdg-secondary}`라이프레이 7.4 U47+/GA47+`

관계는 항목을 서로 연결하기 위해 개체 정의에 필드와 테이블을 추가합니다. 이를 통해 다양한 애플리케이션 컨텍스트에서 항목 데이터에 액세스할 수 있습니다. 이 데이터를 다양한 방식으로 사용할 수 있습니다. 예를 들어 여러 비즈니스 계정이 있는 시나리오에서 계정 시스템 개체와의 관계를 사용하여 [계정별로 사용자 정의 개체 데이터에 대한 액세스를 제한](../creating-and-managing-objects/using-system-objects-with- custom-objects/restricting-access-to-object-data-by-account.md). 또는 관계와 함께 [집계 필드](../creating-and-managing-objects/fields/aggregation-fields.md)를 사용하여 기본 계산을 수행할 수 있습니다.

![개체에 관계를 추가합니다.](./relationships/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 개체 관계 정의
:link: ./relationships/defining-object-relationships.md
:::  

:::{grid-item-card} 관계 제거
:link: ./relationships/removing-relationships.md
:::
::::
