# 4.0 주요 변경 사항

이 문서는 Commerce 4.0의 타사 Liferay Commerce 개발자 또는 사용자와의 기존 기능, API 또는 계약을 깨는 변경 사항의 시간순 목록을 제공합니다. 우리는 이러한 중단을 최소화하기 위해 최선을 다하지만 때로는 불가피한 경우도 있습니다.

다음은 이 파일에 기록된 몇 가지 변경 유형입니다.

* 제거되거나 대체되는 기능

* API 비호환성: 공용 Java 또는 JavaScript API에 대한 변경 사항

* 템플릿에 사용할 수 있는 컨텍스트 변수 변경

* Liferay 테마 및 포틀릿에 사용할 수 있는 CSS 클래스의 변경 사항

* 구성 변경: `com.liferay.commerce.*.cfg` 등과 같은 구성 파일의 변경

* 실행 요구 사항: Java 버전, JEE 버전, 브라우저 버전 등

* 사용 중단 또는 지원 종료: 예를 들어 특정 기능 또는 API가 향후 버전에서 삭제될 것이라는 경고입니다.

* 권장 사항: 예를 들어 이전 API가 이전 버전과의 호환성을 위해 Liferay Portal에 유지되고 있음에도 불구하고 이전 API를 대체하는 새로 도입된 API를 사용하도록 권장합니다.

## 대상 이름이 변경됨

* **날짜:** 2020-9-10

* **JIRA 티켓:** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-4762)

### 무엇이 바뀌었나요?

접두사 `commerce_` 이 `com.liferay.commerce.constants.CommerceDestinationNames`에 정의된 상거래 대상에 추가되었습니다.

* `liferay/commerce_order_status`;

* `liferay/commerce_payment_status`;

* `liferay/commerce_order_status`;

* `liferay/commerce_payment_status`;

* `liferay/commerce_subscription_status`.

### 누가 영향을 받습니까?

이러한 대상을 참조하거나 사용하는 사람.

### 내 코드를 어떻게 업데이트해야 합니까?

상거래 대상에 대한 모든 명시적 참조를 새 이름으로 업데이트합니다.

### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 상거래 대상에 대한 Liferay의 명명 패턴을 도입합니다.

## 대상 이름이 변경됨

* **날짜: 2021년 2월** 일-2월 22일

* **JIRA 티켓:** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-5788)

### 무엇이 바뀌었나요?

`externalReferenceCode`을 참조하는 메서드 재배열.

업데이트된 메서드가 있는 클래스:

* `com.liferay.commerce.inventory.service.CommerceInventoryWarehouseLocalService`

* `com.liferay.commerce.inventory.service.CommerceInventoryWarehouseService`

* `com.liferay.commerce.price.list.service.CommercePriceEntryLocalService`

* `com.liferay.commerce.price.list.service.CommercePriceEntryService`

* `com.liferay.commerce.price.list.service.CommercePriceListLocalService`

* `com.liferay.commerce.price.list.service.CommercePriceListService`

* `com.liferay.commerce.price.list.service.CommerceTierPriceEntryLocalService`

* `com.liferay.commerce.price.list.service.CommerceTierPriceEntryService`

* `com.liferay.commerce.pricing.service.CommercePriceModifierLocalService`

* `com.liferay.commerce.pricing.service.CommercePriceModifierService`

* `com.liferay.commerce.pricing.service.CommercePricingClassLocalService`

* `com.liferay.commerce.pricing.service.CommercePricingClassService`

* `com.liferay.commerce.product.service.CommerceCatalogLocalService`

* `com.liferay.commerce.product.service.CommerceCatalogService`

* `com.liferay.commerce.product.service.CommerceChannelLocalService`

* `com.liferay.commerce.product.service.CommerceChannelService`

* `com.liferay.commerce.product.service.CPAttachmentFileEntryLocalService`

* `com.liferay.commerce.product.service.CPAttachmentFileEntryService`

* `com.liferay.commerce.product.service.CPDefinitionLocalService`

* `com.liferay.commerce.product.service.CPDefinitionService`

* `com.liferay.commerce.product.service.CPInstanceLocalService`

* `com.liferay.commerce.product.service.CPInstanceService`

* `com.liferay.commerce.product.service.CPOptionLocalService`

* `com.liferay.commerce.product.service.CPOptionService`

* `com.liferay.commerce.product.service.CPOptionValueLocalService`

* `com.liferay.commerce.product.service.CPOptionValueService`

* `com.liferay.commerce.product.service.CProductLocalService`

* `com.liferay.commerce.product.service.CProductService`

* `com.liferay.commerce.service.CommerceAddressLocalService`

* `com.liferay.commerce.service.CommerceAddressService`

* `com.liferay.commerce.service.CommerceOrderItemLocalService`

* `com.liferay.commerce.service.CommerceOrderItemService`

* `com.liferay.commerce.service.CommerceOrderLocalService`

* `com.liferay.commerce.service.CommerceOrderNoteLocalService`

* `com.liferay.commerce.service.CommerceOrderNoteService`

* `com.liferay.commerce.service.CommerceOrderService`

### 누가 영향을 받습니까?

이 클래스의 메서드를 참조하거나 사용하는 사람.

### 내 코드를 어떻게 업데이트해야 합니까?

새로운 해당 메서드를 사용하도록 메서드를 업데이트합니다.

### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 Liferay 소스 형식을 따르기 위해 도입되었습니다.

## MiniCart 구성 요소 확장성

* **날짜: 2021년 2월** 일-12일

* **JIRA 티켓:** [COMMERCE-4974](https://issues.liferay.com/browse/COMMERCE-4974)

### 무엇이 바뀌었나요?

* `MiniCart` Tag 및 FE React Component는 구성 요소 보기 및 레이블의 부분 및 전체 교체를 지원하도록 확장되었으며 표준 태그 속성을 통해 또는 JS 구현의 직접 가져오기를 통해 일부 기능을 구성할 수 있습니다.

  * 노출된 `MiniCartTag` 속성이 변경되었습니다.

  * `commerce-frontend-js` 모듈은 이제 콘텐츠(특히 `MiniCart` 통합에 필요한 `MiniCartContext` )의 제어된 액세스 및 노출을 허용하는 적절한 인터페이스와 함께 노출됩니다.

  * </a>

되어 있습니다.</p></li> </ul></li> </ul> 
    
    

### 영향을 받는 사람은 누구입니까?

이전 `MiniCartTag`에 의존하거나 확장하는 개발자.



### 이렇게 변경된 이유는 무엇입니까?

구성 요소 확장성을 지원하기 위해 Liferay DXP 표준과 일치합니다.



## CommerceCountry 및 CommerceRegion 제거됨

* **날짜:** 2021-Mar-02

* **JIRA 티켓:** [LPS-125991](https://issues.liferay.com/browse/LPS-125991)



### 무엇이 바뀌었나요?

* `CommerceCountry` 및 `CommerceRegion` 테이블이 데이터베이스에서 제거되었습니다.

* `CommerceCountry` 및 `CommerceRegion` 에 대한 서비스 및 지속성 클래스가 제거되었습니다.

* `com.liferay.commerce.model.CommerceCountry` 및 `com.liferay.commerce.model.CommerceRegion` 에 대한 참조가 `com.liferay.portal.kernel.model.Country` 및 `com.liferay.portal로 대체되었습니다. kernel.model.Region`.

* `CommerceCountry` 및 `CommerceRegion` 을 참조하는 외래 키는 각각 `commerceCountryId` 및 `commerceRegionId` 에서 `countryId` 및 `regionId` 로 이름이 변경되었습니다. 업데이트된 열이 있는 테이블은
  
    * `CommerceAddress`

  * `CommerceAddressRestriction`

  * `CommerceShippingFixedOptionRel`

  * `CommerceTaxFixedRateAddressRel`

  * `com.liferay.commerce.country.CommerceCountryManager` 이 상거래 관련 국가를 검색하기 위해 추가되었습니다. 사용 가능한 방법은 다음과 같습니다.

  * `getBillingCountries`

  * `getBillingCountriesByChannelId`

  * `getShippingCountries`

  * `getShippingCountriesByChannelId`

  * `getWarehouseCountries`



### 누가 영향을 받습니까?

이러한 모델 및 서비스를 참조하거나 사용하는 사람.



### 내 코드를 어떻게 업데이트해야 합니까?

`CommerceCountry` 및/또는 `CommerceRegion` 에 대한 모든 명시적 참조를 새 해당 모델 및 서비스로 업데이트하십시오.



### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 Liferay Portal에서 중복 모델 및 서비스를 제거합니다.



## 미니 비교 위젯 + 미니 비교 구성 요소

* **날짜:** 2021-Mar-26

* **JIRA 티켓:** [COMMERCE-2909](https://issues.liferay.com/browse/COMMERCE-2909)



### 무엇이 바뀌었나요?

* `MiniCompare` FE 구현을 JSP/vanilla JavaScript에서 React로 마이그레이션(in `commerce-frontend-js`). `commerce-product-content-web`의 동일한 JSP 소스에서 직접 로드됩니다.

* CP 정의 ID는 이제 세션을 사용하는 대신 쿠키에 저장되고 궁극적으로 쿠키에서 읽힙니다.

* JSP를 통해 렌더링하도록 `CompareCheckboxTag` 을 리팩토링했습니다. JSP는 차례로 `CompareCheckbox` React 구성 요소를 렌더링합니다.
  
    * **사용되지 않음** 및 **는</code> commerce-frontend-taglib `<code>` ** 이전 Soy/MetalJS 구현을 제거했습니다.



### 누가 영향을 받습니까?

MiniCompare 구성 요소/위젯의 이전 구현을 의존하거나 확장하는 개발자.



### 이렇게 변경된 이유는 무엇입니까?

* Soy/MetalJS 지원 중단으로 인해

* Liferay DXP와 일치하여 상거래에서 Liferay 클래식 테마를 지원하여 향후 DXP WEM 통합을 위한 길을 닦습니다.



## 개선된 계정 선택기

* **날짜: 2021년 4월** 일-27일

* **JIRA 티켓:** [COMMERCE-5888](https://issues.liferay.com/browse/COMMERCE-6315)



### 무엇이 바뀌었나요?

* JSP를 통해 렌더링하고 `IncludeTag`에서 확장하도록 `AccountSelectorTag` 을 리팩토링했습니다. JSP는 Soy/MetalJS에서 마이그레이션된 `AccountSelector` React 구성 요소를 수화하고 렌더링합니다.

* Commerce Headless API를 통해 런타임 수명 주기 동안 전달된 계정/주문 변경 사항에 대해 다른 구성 요소에 알리기 위해 이벤트 이름을 변경했습니다.



### 영향을 받는 사람은 누구입니까?

관련 태그로 이전 Soy/MetalJS 구성 요소를 사용하거나 확장하는 개발자.



### 이렇게 변경된 이유는 무엇입니까?

* Soy/MetalJS 지원 중단으로 인해

* Liferay DXP와 일치하여 상거래에서 Liferay 클래식 테마를 지원하여 향후 DXP WEM 통합을 위한 길을 닦습니다.



## Storefront의 제품 카드 및 제품 렌더링 전략

* **날짜:** 2021-Apr-27

* **JIRA 티켓:** [COMMERCE-5889](https://issues.liferay.com/browse/COMMERCE-5889)



### 무엇이 바뀌었나요?

* 제품 카드 구성 요소는 이제 JSP 템플릿으로 포팅되어 제품 정보를 표시합니다. `CPContentListRenderer` &rarr; `CPContentListEntryRenderer`를 통해 수분을 공급하고 렌더링합니다.
  
    * 제품 게시자, 검색 결과, 비교 위젯은 이제 이러한 렌더링 전략을 사용합니다.

  * Commerce Theme Minium Site Initializer는 이제 이러한 렌더링 전략을 사용하도록 구성되었습니다.

  * 구현은 이제 `commerce-product-content-web` 모듈에 있으며 `CPContentRenderer` 재정의, JSP 재정의 또는 Liferay Dynamic Include를 통해 확장 가능합니다.

  * **사용되지 않음** 및 **제거됨** commerce-frontend-taglib 모듈에서 `제품 카드의 이전 Soy/</strong>구현이` 사용되지 않음</strong> 및 **제거되었습니다 **.</p></li> 
    
      * `commerce-theme-minium-impl` 모듈에 있는 이전 Minium 관련 `</strong>`은 **사용되지 않고** 제거되었습니다 **.</p></li> </ul></li> 
    
    * JSP를 통해 렌더링하도록 `AddToCartTag` 을 리팩터링했으며 이제 `IncludeTag`에서 확장합니다. JSP는 차례로 `QuantitySelector` React 구성 요소를 포함하여 `AddToCart` React 구성 요소를 렌더링합니다.
  
    * **Deprecated** 및 **는 `commerce-frontend-taglib` 모듈에서 `` ** 의 이전 Soy/MetalJS 구현을 제거했습니다.

  * **Deprecated** 및 **는 `commerce-frontend-taglib` 모듈에서 `QuantitySelector` 의 이전 Soy/MetalJS 구현을** 제거했습니다.

  * **Deprecated** 및 **는 `commerce-frontend-taglib` ** ``.

* `PriceTag` 은 JSP를 통해 렌더링하도록 리팩터링되었으며 이제 `IncludeTag`에서 확장됩니다. JSP는 올바르게 구조화된 템플릿(SEO용)을 렌더링하고 최종적으로 `Price` React 구성 요소(사용자 페이지 랜딩용)를 렌더링합니다.
  
    * **사용되지 않음** 및 **는 `commerce-frontend-taglib` 모듈에서 `Price</strong> 의 이전 Soy/` 구현을 제거했습니다.</li> </ul></li> </ul> 
    
    

### 영향을 받는 사람은 누구입니까?

의존하거나 확장하는 개발자:

* `commerce-theme-minium-impl`의 Miniium 관련 CP 콘텐츠 렌더러

* Soy/MetalJS `AddToCartTag` 및 `AddToCartButton*`.

* Soy/MetalJS `QuantitySelectorTag` 및 `QuantitySelector*`.

* Soy/MetalJS `PriceTag` 및 `Price*`.



### 이렇게 변경된 이유는 무엇입니까?

* Soy/MetalJS 지원 중단으로 인해

* Liferay DXP와 일치하여 상거래에서 Liferay 클래식 테마를 지원하여 향후 DXP WEM 통합을 위한 길을 닦습니다.



## *ServiceImpl 클래스에서 AddOrUpdate와 Upsert를 사용하도록 메서드 이름 표준화

* **날짜: 2021년 6월** 일-4일

* **JIRA 티켓:** [COMMERCE-6095](https://issues.liferay.com/browse/COMMERCE-6095)



### 무엇이 바뀌었나요?

이름이 `upsert*` 인 Commerce `*ServiceImpl` 클래스의 모든 메소드는 이제 `addOrUpdate*`로 이름이 변경되었습니다.



### 영향을 받는 사람은 누구입니까?

`*ServiceImpl` `upsert*` 방법을 사용하는 개발자는 해당 방법 `addOrUpdate*`를 사용해야 합니다.



### 이렇게 변경된 이유는 무엇입니까?

이 변경으로 Liferay의 소스 형식이 위의 방법에 도입되었습니다.



## BOM 기능이 Shop by Diagram 기능으로 대체됨

* **날짜: 2021년** 월 14일

* **JIRA 티켓:** [COMMERCE-3030](https://issues.liferay.com/browse/COMMERCE-3030)



### 무엇이 바뀌었나요?

Shop by Diagram은 BOM 기능을 대체합니다. 이는 폴더 및 BOM 항목 항목이 존재하지 않고 다이어그램이라는 새 제품 유형이 있음을 의미합니다.



### 영향을 받는 사람은 누구입니까?

상점에 대한 다이어그램을 작성해야 하는 제품 전문가는 다이어그램 제품 유형으로 제품을 작성할 필요가 없습니다.



### 이렇게 변경된 이유는 무엇입니까?

이 변경으로 BOM 문제가 수정되고 예비 부품 사용 사례가 더 잘 충족됩니다.



## 계정 위젯을 제거하여 더 이상 Liferay Commerce의 모듈이 아닙니다.

* **날짜:** 2021-11-21

* **JIRA 티켓:** [COMMERCE-7288](https://issues.liferay.com/browse/COMMERCE-7288)



### 무엇이 바뀌었나요?

계정 위젯은 상거래 계정 위젯을 대체합니다. 실행 중인 기존 시스템의 모든 인스턴스가 업데이트되었습니다.



### 영향을 받는 사람은 누구입니까?

* 상거래 계정 위젯을 사용자 지정했거나 사이트 이니셜라이저와 함께 사용한 개발자.

* 다른 위젯을 사용하여 계정을 관리할 최종 사용자(계정 관리자).



### 이렇게 변경된 이유는 무엇입니까?

이 변경은 상거래 계정에서 계정으로의 마이그레이션을 준수하기 위해 필요했습니다.



## 리팩토링 CommerceOrderLocalServiceImpl

* **날짜:** 2022-2-16

* **JIRA 티켓:** [COMMERCE-8440](https://issues.liferay.com/browse/COMMERCE-8440)



### 무엇이 바뀌었나요?

* 이제 `updateCommerceOrder` 메서드의 인스턴스는 4개가 아니라 3개뿐입니다.

* `updateCustomFields` 메서드를 제거했습니다.

* `updateOrderStatus` 메서드를 제거했습니다.

* `updateTransactionId` 메서드를 제거했습니다.

* `updateUser` 메서드를 제거했습니다.



### 영향을 받는 사람은 누구입니까?

코드에서 이러한 메서드를 호출하는 개발자.



### 내 코드를 어떻게 업데이트해야 합니까?

* 나머지 3 `개의 updateCommerceOrder` 메서드를 직접 교체로 사용하십시오.

* `commerceOrder.setExpandoBridgeAttributes(ServiceContext serviceContext)` 로 `expandoBridgeAttributes` 을 설정한 후 `updateCommerceOrder(CommerceOrder commerceOrder)` 메서드를 사용하여 `customFields`을 업데이트합니다.

* `orderStatus` 을 `commerceOrder.setOrderStatus(int orderStatus)` 로 설정한 후 `updateCommerceOrder(CommerceOrder commerceOrder)` 메서드를 사용하여 `orderStatus`을 업데이트합니다.

* `commerceOrder.setTransactionId(String transactionId)` 로 `transactionId` 을 설정한 후 `updateCommerceOrder(CommerceOrder commerceOrder)` 메소드를 사용하여 `transactionId`을 업데이트합니다.

* `userId` , `userName` 를 `commerceOrder.setUserId(long userId)` , `commerceOrder.setUserName(String userName)` 로 설정한 후 `updateCommerceOrder(CommerceOrder commerceOrder)` 메소드를 사용하여 사용자 정보를 업데이트합니다.



### 이렇게 변경된 이유는 무엇입니까?

이 변경은 클래스 `CommerceOrderLocalServiceImpl`을 정리하기 위해 도입되었습니다.



## commerce-service service.xml에서 CommerceOrder 구체화

* **날짜:** 2022년 4월 13일

* **JIRA 티켓:** [COMMERCE-8408](https://issues.liferay.com/browse/COMMERCE-8408)



### 무엇이 바뀌었나요?

* `CommerceOrderLocalService` 및 `CommerceOrderService`의 `addCommerceOrder` 메소드에 대한 매개변수 재배열.

* `CommerceOrderLocalService` 및 `CommerceOrderService`의 `addOrUpdateCommerceOrder` 메소드에 대한 매개변수 재배열.

* `CommerceOrderLocalService` 및 `CommerceOrderService`의 `updateCommerceOrder` 메서드에 대한 매개변수 재정렬.

* `CommerceOrderLocalService` 및 `CommerceOrderService`에서 `updateCommerceOrderPrices` 메서드에 대한 매개변수 재정렬.



### 누가 영향을 받습니까?

코드에서 이러한 메서드를 호출하는 개발자.



### 내 코드를 어떻게 업데이트해야 합니까?

* 매개변수가 새로운 `addCommerceOrder` 메서드와 올바르게 정렬되었는지 확인합니다.

* 매개 변수가 새 `addOrUpdateCommerceOrder` 메서드와 올바르게 정렬되었는지 확인합니다.

* 매개변수가 새로운 `updateCommerceOrder` 메서드와 올바르게 정렬되었는지 확인합니다.

* 매개 변수가 새로운 `updateCommerceOrderPrices` 메서드와 올바르게 정렬되었는지 확인합니다.



### 이렇게 변경된 이유는 무엇입니까?

이 변경으로 엔티티 `CommerceOrder` in `commerce-service` `service.xml`가 정리됩니다.



## CPContentHelper 및 CPContentHelperImpl 리팩터링

* **날짜: 2021년 12월 16일**

* **JIRA 티켓:** [COMMERCE-7830](https://issues.liferay.com/browse/COMMERCE-7830)



### 무엇이 바뀌었나요?

* `CPContentHelper.java` 및 `CPContentHelperImpl.java`에서 메소드 서명 변경: 
    * `getReplacementCommerceProductFriendlyURL(long cProductId, String cpIntanceUuid, ThemeDisplay themeDisplay)` to `getReplacementCommerceProductFriendlyURL(CPSku cpSku, ThemeDisplay themeDisplay)`
* `CPContentHelper.java` 및 `CPContentHelperImpl.java` 에서 `getCPAttachmentFileEntries()` 메서드의 이름을 `getCPMedias()`로 변경했습니다.



### 영향을 받는 사람은 누구입니까?

이는 코드에서 이러한 메서드를 참조하거나 사용하는 모든 개발자에게 영향을 미칩니다.



### 내 코드를 어떻게 업데이트해야 합니까?

위 방법의 모든 참조 및 사용법을 새 방법으로 바꿉니다.



### 이렇게 변경된 이유는 무엇입니까?

더 나은 가독성, 일관성 및 유지 관리를 위해 메서드를 리팩토링했습니다.
