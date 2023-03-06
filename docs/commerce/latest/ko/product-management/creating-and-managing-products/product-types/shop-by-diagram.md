# 다이어그램으로 쇼핑하기

{bdg-primary}`구독`

Shop by Diagram을 사용하면 다이어그램을 통해 시각적으로 더 큰 장비의 부품을 쉽게 찾을 수 있습니다. 이는 자동차 예비 부품, 전자 부품 또는 중장비 예비 부품일 수 있습니다.

제품의 분해도를 탐색하고 부품과 수량을 선택한 다음 장바구니에 추가할 수 있습니다. Shop by Diagram을 사용하면 제품 이름이나 모델 번호가 없을 때 올바른 구성 요소를 쉽게 찾을 수 있습니다.

```{note}
Shop by Diagram은 Liferay DXP 7.4+/Commerce 4.0+에서 사용할 수 있으며 *BOM(Bill of Materials)* 기능을 보다 강력하게 대체합니다.
```

## 다이어그램 제품 만들기

다이어그램은 Liferay Commerce([단순](./creating-a-simple-product.md), [그룹화](./creating-a-grouped-product.md), [가상](./creating-a-virtual-product.md))의 다른 제품 유형과 같지만 몇 가지 중요한 차이점이 있습니다. 다이어그램 자체는 배송할 수 없으며 재고, 가격 또는 세금이 없으며 구독 또는 [제품 옵션](../products/using-product-options.md)을 허용하지 않습니다. 그러나 그것을 만드는 단계는 다른 제품 유형과 동일합니다.

1. **글로벌 메뉴 열기** , **상거래** &rarr; **제품** 을 클릭합니다.
1. **Add**(![Add](../../../images/icon-add.png)) 버튼을 클릭하고 **Diagram** 를 선택합니다.

   ![옵션 목록에서 다이어그램을 선택합니다.](./shop-by-diagram/images/01.png)

1. 다음 정보를 입력합니다.

   **이름:** 엔진 다이어그램

   **카탈로그:** 최소

1. **제출** 을 클릭합니다.

## 다이어그램 제품 구성

이렇게 하면 새 다이어그램 제품이 생성되고 구성 보기가 열립니다. 이제 제품의 분해도가 포함된 이미지를 업로드해야 합니다. 카탈로그의 SKU 또는 기타 다이어그램을 이미지 내의 구성 요소에 매핑할 수 있습니다.

1. **다이어그램** 탭을 클릭합니다.

   ![Diagram 탭을 클릭하여 다이어그램을 업로드하고 구성합니다.](./shop-by-diagram/images/03.png)

1. **Diagram Settings** 에서 SVG 이미지를 업로드하는 경우 **SVG** 을 선택하고 그렇지 않으면 **Default** 로 설정합니다.
1. **Diagram File** 아래에서 이미지를 드래그 앤 드롭하거나 원하는 이미지를 업로드할 수 있습니다.
1. **파일** 선택을 클릭하고 이미지를 업로드합니다.

업로드가 완료되면 **Diagram Mapping** 섹션이 활성화됩니다.

![업로드가 완료되면 Diagram Mapping 섹션이 활성화됩니다.](./shop-by-diagram/images/04.gif)

| | <div style="margin-left:35px"><b>다이어그램 매핑 참조</b> |
| :--- | :--- |
| **필드** | <div style="width:400px"><b>목적</b> |
| 위치 | 핀에 부여된 레이블을 나타냅니다. 숫자 또는 문자일 수 있습니다. 분해되지 않은 다이어그램의 경우 핀을 레이블로 사용할 수 있습니다. 동일한 위치에 하나 이상의 구성 요소가 있을 수 있습니다. 예를 들어, 장비는 다른 영역에서 동일한 장비를 사용할 수 있습니다. 다이어그램에서 모든 기어는 동일한 위치를 사용하여 동일한 구성 요소이지만 장비의 다른 위치에 있음을 나타냅니다. |
| 유형 | **SKU에 연결됨** , **다이어그램에 연결됨** 또는 **카탈로그에 연결되지 않음** 을 선택합니다.<ul><li>SKU에 연결됨 - 다이어그램의 핀을 카탈로그의 SKU에 연결합니다.</li ><li>다이어그램에 연결 - 다이어그램의 핀을 카탈로그의 다른 다이어그램에 연결합니다.</li><li>카탈로그에 연결되지 않음 - 다이어그램의 핀을 레이블에 연결합니다. 판매자는 정보 제공 목적으로 온라인 카탈로그에서 판매하지 않는 부품 또는 구성 요소의 이름을 다이어그램에 표시할 수 있습니다. 이 제품들은 라벨을 사용합니다.</li></ul>|
| SKU | 유형이 **SKU에 연결됨** 인 경우 활성화됩니다. 검색창에 SKU를 입력하고 적절한 것을 선택할 수 있습니다. |
| 다이어그램 | Type이 **Linked to a Diagram** 인 경우 활성화됩니다. 검색 창을 사용하여 Diagram을 검색하고 적절한 것을 선택할 수 있습니다. |
| 라벨 | 유형이 **카탈로그에 연결되지 않음** 인 경우 활성화됩니다. 레이블은 판매자가 정보 제공 목적으로 온라인 카탈로그에서 판매하지 않는 부품 또는 구성 요소의 이름을 다이어그램에 표시하려는 경우에 사용됩니다. |
| 수량 | 장비를 완성하는 데 필요한 구성 요소의 수량을 나타냅니다. |

## 다이어그램에 SKU 매핑

이미지의 포인트를 카탈로그의 SKU 또는 기타 다이어그램에 매핑해야 합니다.

1. SKU 또는 다른 다이어그램에 매핑해야 하는 다이어그램의 부품을 클릭합니다.
1. 검색 창에서 SKU 또는 다이어그램을 검색하고 수량을 설정한 다음 대화 상자에서 사이트를 할당합니다.
1. **저장** 을 클릭합니다.
   
   ![검색창에서 SKU 또는 다이어그램을 검색합니다.](./shop-by-diagram/images/05.gif)

1. 완료되면 **게시** 을 클릭합니다.

오른쪽에서 사이트 및 수량과 함께 SKU를 볼 수 있습니다. 제품을 게시한 후 스토어프론트에서 볼 수 있습니다.

![대화형 핀이 있는 상점 전면에서 다이어그램을 볼 수 있습니다.](./shop-by-diagram/images/06.gif)

```{note}
다이어그램은 제품 세부 정보 위젯, 제품 게시자 위젯 및 검색 결과에서 Liferay Commerce의 다른 제품과 동일한 방식으로 나타납니다. 다른 제품과 마찬가지로 다이어그램에서도 태그와 카테고리를 사용할 수 있습니다.
```

```{note}
이미지: “ [Bultaco 엔진 분해도](https://flickr.com/photos/tom-margie/1253798184/in/photolist-4XXvtu-2mn7DP8-NmN3U5-aq4SCB-H8ZMN9-dzT17o-pZgiwZ-2kLJEjC-bRALa6-9xjArz- aNgnMn-pjF6jp-NNVRDe-2jCWou9-niHeTv-2UN3w5-2mD79VN-bz84rF-7HSLu4-yQe2wr-9ptWiW-CY6AP-bzmZP9-9jRWia-chdwUu-Mp16Ah-8pHHKM-2mwEAZi-2kUCwFf-u4fJFj-aQS5mv-2iWwYAU-2iQKbJz-kHQyfH-2jE3t4n- 3BBRmw-deC9th-25aFqYT-imHEdi-imH7SU-imH5gS-imGVyn-imGT5W-imHzii-imGNMX-imHxLR-UepKvn-4V5F4T-a48scN-4V5Fjp) ” 작성자: [Tom Margie](https://flickr.com/photos/tom-margie) /) / [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/)
```

## 추가 정보

* [간단한 제품 만들기](./creating-a-simple-product.md)
* [그룹화된 제품 만들기](./creating-a-grouped-product.md)
* [가상 제품 만들기](./creating-a-virtual-product.md)
