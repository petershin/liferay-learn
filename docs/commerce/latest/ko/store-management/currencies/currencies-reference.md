# 통화 참조

Liferay Commerce에는 사전 구성되어 사용할 준비가 된 여러 통화가 있습니다. 주문을 처리하려면 각 상점에서 기본 통화를 활성화해야 합니다. 이 문서는 각 통화와 관련된 메타데이터에 대한 참조 역할을 합니다.

통화를 관리하려면 **제어판** → **상거래** → **설정** 로 이동한 다음 **통화** 탭을 클릭합니다.

![새 통화 추가](./currencies-reference/images/01.png)

| 필드 | 설명 |
| :--- | :--- |
| 이름 | 통화명 |
| 코드 | 통화의 3글자 [ISO 코드](https://www.currency-iso.org/en/home/tables/table-a1.html) |
| 형식 패턴 | 통화 기호, 쉼표 사이의 자릿수 및 표시되는 사이트. 예를 들어, 미국 달러의 경우 $###,##0.00 형식에서 **0** 이 보유한 장소는 항상 표시되는 반면(다른 숫자가 없으면 0으로 표시됨)**#** 이 보유한 장소는 사용 중인 경우에만 표시됩니다. 위 형식의 0.01 값은 $0.01로 표시됩니다. |
| 최대 소수 자릿수 | 허용되는 소수점 오른쪽의 최대 자릿수 |
| 최소 소수 자릿수 | 허용되는 소수점 오른쪽의 최소 자릿수 |
| 반올림 모드 | 드롭다운 메뉴에서 [반올림 모드](https://en.wikipedia.org/wiki/Rounding#Directed_rounding_to_an_integer) 유형 |
| 기본 | 이 통화가 상점의 기본 통화인지 지정하려면 토글 |
| 미국 달러 환율 | 상점의 기본 통화와 비교한 통화의 환율입니다. 기본적으로 USD는 기본 통화로 지정되지만 [UI에서 수정](../configuring-payment-methods/mercanet.md#set-eur-as-the-primary-store-currency) 될 수 있습니다. |
| 우선순위 | 통화가 테이블에 표시되는 순서입니다. 숫자가 높을수록 더 아래로 표시됩니다. |
| 활성 | 이 통화를 활성화하려면 토글 | 

## 추가 정보

* [새 통화 추가](./adding-a-new-currency.md)
* [Mercanet](../configuring-payment-methods/mercanet.md)
