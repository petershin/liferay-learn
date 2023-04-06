# 3.0 주요 변경 사항

이것은 Commerce 3.0의 타사 Liferay Commerce 개발자 또는 사용자와의 기존 기능, API 또는 계약을 깨는 변경 사항의 시간순 목록입니다. 우리는 이러한 중단을 최소화하기 위해 최선을 다하지만 때로는 불가피한 경우도 있습니다.

다음은 이 파일에 기록된 몇 가지 변경 유형입니다.

* 제거되거나 대체되는 기능.

* API 비호환성: 공용 Java 또는 JavaScript API에 대한 변경 사항입니다.

* 템플릿에 사용할 수 있는 컨텍스트 변수 변경.

* Liferay 테마 및 포틀릿에 사용할 수 있는 CSS 클래스의 변경 사항.

* 구성 변경: `com.liferay.commerce.*.cfg`등과 같은 구성 파일의 변경

* 실행 요구 사항: Java 버전, J2EE 버전, 브라우저 버전 등

* 사용 중단 또는 지원 종료: 예를 들어 특정 기능 또는 API가 향후 버전에서 삭제될 것이라는 경고입니다.

* 권장 사항: 예를 들어 이전 API가 이전 버전과의 호환성을 위해 Liferay Portal에 유지되고 있음에도 불구하고 이전 API를 대체하는 새로 도입된 API를 사용하도록 권장합니다.

## 상거래 메뉴 변경 사항

* **날짜: 2020년 9월** 일 3일

* **JIRA 티켓:** [COMMERCE-4565](https://issues.liferay.com/browse/COMMERCE-4565)

### 무엇이 바뀌었나요?

상거래 메뉴 항목은 제어판에서 DXP 7.3의 새로운 전역 메뉴로 이동되었습니다. 새로운 **Commerce** 탭(응용 프로그램 및 제어판 탭과 동일한 수준)에는 이러한 메뉴 항목이 포함되어 있습니다.

`commerce-admin-api` 및 `commerce-admin-web` 모듈도 제거됩니다.

### 누가 영향을 받습니까?

이는 Commerce &rarr; 설정에 추가된 메뉴 항목에 영향을 미칩니다. 개발자는 더 이상 `CommerceAdminModule` 을 구현하여 Commerce &rarr; 설정에 메뉴 항목을 추가할 수 없습니다.

이것은 이제 글로벌 메뉴의 새로운 상거래 메뉴에서 상거래 관리 항목에 액세스하는 최종 사용자에게도 영향을 미칩니다.

### 이렇게 변경된 이유는 무엇입니까?

DXP 7.3 표준을 준수하면서 헤더 표시줄에 탐색 범위를 유지하도록 메뉴가 변경되었습니다. `commerce-admin-api` 및 `commerce-admin-web` 모듈은 이전 메뉴 사이트 제거와 함께 더 이상 사용되지 않으므로 제거되었습니다.

## 이동된 파일

* **날짜: 2020년 8월 20일**

* **JIRA 티켓:** [COMMERCE-4052](https://issues.liferay.com/browse/COMMERCE-4052)

### 무엇이 바뀌었나요?

다음 파일이 이동됩니다.

* `com.liferay.commerce.pricing.web.servlet.taglib.ui.CommerceDiscountScreenNavigationConstants`

* `com.liferay.commerce.pricing.web.servlet.taglib.ui.CommercePricingClassScreenNavigationConstants`

### 누가 영향을 받습니까?

이는 코드에서 이러한 파일을 참조하거나 사용하는 모든 개발자에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

이러한 파일에 대한 이전 참조를 새 경로로 바꿉니다.

파일은 이제 다음 경로에 있습니다.

* `com.liferay.commerce.pricing.web.internal.constants.CommerceDiscountScreenNavigationConstants`

* `com.liferay.commerce.pricing.web.internal.constants.CommercePricingClassScreenNavigationConstants`

### 이렇게 변경된 이유는 무엇입니까?

이러한 파일은 Liferay의 코딩 규칙을 따르도록 이동되었습니다.

## 대상 이름이 변경됨

* **날짜: 2020년 9월 10일**

* **JIRA 티켓:** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-4762)

### 무엇이 바뀌었나요?

접두사 `commerce_` 이 `com.liferay.commerce.constants.CommerceDestinationNames`에 정의된 상거래 대상에 추가되었습니다.

* `liferay/commerce_order_status`

* `liferay/commerce_payment_status`

* `liferay/commerce_shipment_status`

* `liferay/commerce_stock_quantity`

* `liferay/commerce_subscription_status`

### 누가 영향을 받습니까?

이 변경 사항은 코드에서 이러한 대상을 참조하거나 사용하는 모든 사람에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

접두사 `commerce_`을 사용하여 상거래 대상에 대한 모든 명시적 참조를 업데이트합니다.

### 이렇게 변경된 이유는 무엇입니까?

Liferay의 명명 규칙을 따르도록 대상 이름이 변경되었습니다.
