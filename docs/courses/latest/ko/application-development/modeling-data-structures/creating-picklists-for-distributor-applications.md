# 배포자 응용 프로그램에 대한 선택 목록 만들기

Delectable Bonsai는 각 비즈니스 기회의 상대적 가치를 평가하는 데 도움이 되는 정보를 수집하려고 합니다. 이 경우 지원자가 미리 정의된 옵션 중에서 선택하기를 원합니다. Liferay 선택 목록을 사용하여 이를 달성할 수 있습니다.

선택 목록은 단일 선택 및 다중 선택 필드의 옵션을 결정하는 사전 정의된 문자열 값 목록입니다. Delectable Bonsai에는 배포자 응용 프로그램 개체에 대해 다음 목록이 필요합니다.

* 사업 유형
* 유통 지역
* 유통채널
* 상거래 주문 유형
* 제품 유형
* 연간 구매량
* 제품 라벨

여기에서는 Liferay UI를 통해 첫 번째 선택 목록을 만듭니다.

1. **전역 메뉴**( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 **제어판** 탭으로 이동한 다음 **선택 목록** 클릭합니다.

1. **추가**( ![Add Button](../../images/icon-add.png) )을 클릭하고 이름에 비즈니스 유형을 입력한 후 **저장** 클릭합니다.

   ![비즈니스 유형 선택 목록을 만듭니다.](creating-picklists-for-distributor-applications/images/01.png)

1. 선택 목록 편집을 시작합니다.

1. ** 추가( ![Add Button](../../images/icon-add.png) )를 클릭하고 선택 목록에 다음 항목을 추가합니다.

   | 이름     | 열쇠                    |
   |:------ |:--------------------- |
   | 독립사업   | `independentBusiness` |
   | 독점 판매권 | `franchise`           |
   | 기타     | `other`               |

1. 각 항목을 편집하고 ERC를 다음 값으로 설정합니다.

   | 외부 참조 코드                             |
   |:------------------------------------ |
   | `BUSINESS_TYPE_INDEPENDENT_BUSINESS` |
   | `BUSINESS_TYPE_FRANCHISE`            |
   | `BUSINESS_TYPE_OTHER`                |

   ![선택 목록에 세 가지 항목을 추가하고 해당 ERC를 업데이트합니다.](./creating-picklists-for-distributor-applications/images/02.png)

1. 선택 목록의 ERC를 `LIST_BUSINESS_TYPES`로 변경합니다.

   ![선택 목록의 ERC를 업데이트합니다.](./creating-picklists-for-distributor-applications/images/03.png)

1. **저장** 클릭하세요.

저장한 후에는 이 선택 목록을 배포자 응용 프로그램 개체의 필드로 사용할 수 있습니다.

그렇게 하기 전에 Delectable Bonsai에는 6개의 선택 목록이 더 필요합니다. 그러나 이러한 목록을 수동으로 생성하는 대신 `headless-admin-list-type` REST API를 사용하여 프로그래밍 방식으로 생성하게 됩니다.

다음: [REST API를 사용하여 선택 목록 만들기](./creating-picklists-using-rest-apis.md)

## 관련 개념

* [선택목록](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists)
