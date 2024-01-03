# REST API를 사용하여 선택 목록 만들기

'headless-admin-list-type' 서비스는 선택 목록에 대한 CRUD 작업을 수행하기 위한 REST API를 제공합니다. 이러한 API를 사용하는 것은 UI를 통해 수동으로 선택 목록을 생성하는 것보다 훨씬 더 효율적입니다. 사전 구성된 ERC와 현지화된 이름이 포함된 목록과 항목을 한 번에 모두 추가할 수 있기 때문입니다. 여기서는 이러한 API를 사용하여 Distributor Application 개체에 대한 나머지 선택 목록을 추가합니다.

1. [이 연습](./liferay-r5w2.zip) 에 대한 리소스를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-r5w2.zip -O
   ```

   ```bash
   unzip liferay-r5w2.zip
   ```

   이 .zip 파일에는 `headless-admin-list-type` REST API를 사용하여 나머지 선택 목록을 생성하기 위한 셸 스크립트가 포함되어 있습니다.

1. `liferay-r5w2` 폴더의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-r5w2/curl
   ```

1. 배포 지역 선택 목록을 생성하려면 다음 스크립트를 실행하세요.

   ```bash
   ./ListTypeDefinition_POST_DistributionRegions_ToInstance.sh
   ```

   **선택 목록**

   | 이름    | 외부 참조 코드                    |
   | :---- | :-------------------------- |
   | 유통 지역 | `LIST_DISTRIBUTION_REGIONS` |

   **선택 목록 항목**

   | 이름            | 열쇠               | 외부 참조 코드                  |
   | :------------ | :--------------- | :------------------------ |
   | 라틴 아메리카       | `latinAmerica`   | `REGION_LATIN_AMERICA`    |
   | 카리브해          | `caribbean`      | `REGION_CARIBBEAN`        |
   | 동유럽           | `easternEurope`  | `REGION_EASTERN_EUROPE`   |
   | 서유럽           | `westernEurope`  | `REGION_WESTERN_EUROPE`   |
   | 중동            | `middleEast`     | `REGION_MIDDLE_EAST`      |
   | 아프리카          | `africa`         | `REGION_AFRICA`           |
   | 중앙 아시아        | `centralAsia`    | `REGION_CENTRAL_ASIA`     |
   | 아시아 및 환태평양 지역 | `asiaPacificRim` | `REGION_ASIA_PACIFIC_RIM` |
   | 인도            | `india`          | `REGION_INDIA`            |
   | 북아메리카         | `northAmerica`   | `REGION_NORTH_AMERICA`    |

1. 배포 채널 선택 목록을 만듭니다.

   ```bash
   ./ListTypeDefinition_POST_DistributionChannels_ToInstance.sh
   ```

   **선택 목록**

   | 이름   | 외부 참조 코드                     |
   | :--- | :--------------------------- |
   | 유통채널 | `LIST_DISTRIBUTION_CHANNELS` |

   **선택 목록 항목**

   | 이름           | 열쇠               | 외부 참조 코드                  |
   | :----------- | :--------------- | :------------------------ |
   | 다른 소매업체에 배포  | `otherRetailers` | `CHANNEL_OTHER_RETAILERS` |
   | 자체 소매를 통해 판매 | `ownRetail`      | `CHANNEL_OWN_RETAIL`      |
   | 전자상거래        | `eCommerce`      | `CHANNEL_E_COMMERCE`      |

1. 주문 유형 선택 목록을 만듭니다.

   ```bash
   ./ListTypeDefinition_POST_OrderTypes_ToInstance.sh
   ```

   **선택 목록**

   | 이름        | 외부 참조 코드           |
   | :-------- | :----------------- |
   | 상거래 주문 유형 | `LIST_ORDER_TYPES` |

   **선택 목록 항목**

   | 이름      | 열쇠                | 외부 참조 코드                      |
   | :------ | :---------------- | :---------------------------- |
   | 모조리     | `wholesale`       | `ORDER_TYPE_WHOLESALE`        |
   | 개인 라벨링  | `privateLabeling` | `ORDER_TYPE_PRIVATE_LABELING` |
   | 대량 형식   | `bulkFormats`     | `ORDER_TYPE_BULK_FORMATS`     |
   | 확실하지 않다 | `notSure`         | `ORDER_TYPE_NOT_SURE`         |

1. 제품 유형 선택 목록을 만듭니다.

   ```bash
   ./ListTypeDefinition_POST_ProductTypes_ToInstance.sh
   ```

   **선택 목록**

   | 이름    | 외부 참조 코드             |
   | :---- | :------------------- |
   | 제품 유형 | `LIST_PRODUCT_TYPES` |

   **선택 목록 항목**

   | 이름         | 열쇠                   | 외부 참조 코드                           |
   | :--------- | :------------------- | :--------------------------------- |
   | 메이플 시럽     | `mapleSyrup`         | `PRODUCT_TYPE_MAPLE_SYRUP`         |
   | 유기농 메이플 시럽 | `organicMapleSyrup`  | `PRODUCT_TYPE_ORGANIC_MAPLE_SYRUP` |
   | 메이플 버터     | `mapleButter`        | `PRODUCT_TYPE_MAPLE_BUTTER`        |
   | 메이플 설탕     | `mapleSugar`         | `PRODUCT_TYPE_MAPLE_SUGAR`         |
   | 메이플 퐁당     | `mapleFondant`       | `PRODUCT_TYPE_MAPLE_FONDANT`       |
   | 메이플 젤리     | `mapleJelly`         | `PRODUCT_TYPE_MAPLE_JELLY`         |
   | 나무         | `trees`              | `PRODUCT_TYPE_TREES`               |
   | 묘목         | `saplings`           | `PRODUCT_TYPE_SAPLINGS`            |
   | 교육 콘텐츠     | `educationalContent` | `PRODUCT_TYPE_EDUCATIONAL_CONTENT` |
   | 기타         | `other`              | `PRODUCT_TYPE_OTHER`               |

1. 연간 구매량 선택 목록을 만듭니다.

   ```bash
   ./ListTypeDefinition_POST_AnnualPurchaseVolumes_ToInstance.sh
   ```

   **선택 목록**

   | 이름     | 외부 참조 코드                       |
   | :----- | :----------------------------- |
   | 연간 구매량 | `LIST_ANNUAL_PURCHASE_VOLUMES` |

   **선택 목록 항목**

   | 이름                   | 열쇠           | 외부 참조 코드             |
   | :------------------- | :----------- | :------------------- |
   | $50,000 - 100,000달러  | `firstTier`  | `VOLUME_FIRST_TIER`  |
   | $200,000 - 500,000달러 | `secondTier` | `VOLUME_SECOND_TIER` |
   | $500,000 - 100만 달러   | `thirdTier`  | `VOLUME_THIRD_TIER`  |
   | 100만 달러 이상           | `fourthTier` | `VOLUME_FOURTH_TIER` |

1. 제품 라벨 선택 목록을 만듭니다.

   ```bash
   ./ListTypeDefinition_POST_ProductLabels_ToInstance.sh
   ```

   **선택 목록**

   | 이름    | 외부 참조 코드              |
   | :---- | :-------------------- |
   | 제품 라벨 | `LIST_PRODUCT_LABELS` |

   **선택 목록 항목**

   | 이름    | 열쇠           | 외부 참조 코드            |
   | :---- | :----------- | :------------------ |
   | 미국 표준 | `standardUS` | `LABEL_STANDARD_US` |
   | 지방화하는 | `localized`  | `LABEL_LOCALIZED`   |

완료되면 7개의 선택 목록이 있어야 합니다.

![Create these picklists for use in the Distributor Application object.](./creating-picklists-using-rest-apis/images/01.png)

이제 이를 사용하여 배포자 응용 프로그램 개체에서 단일 선택 및 다중 선택 필드를 만들 수 있습니다.

다음: [개체에 선택 목록 필드 추가](./adding-picklist-fields-to-the-object.md) 

## 관련 개념

* [선택 목록 API 기본 사항](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists/picklists-api-basics) 
