# 재고 부족 사용자 지정 활동 구현

이 자습서에서는 [CommerceLowStockActivity](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/stock/activity/CommerceLowStockActivity.java) 인터페이스를 구현하여 사용자 정의 낮은 재고 활동을 추가하는 방법을 보여줍니다.

재고 부족 활동은 제품이 구성된 최소 재고 수량 미만인 경우 자동으로 수행되는 조치입니다. Liferay Commerce는 제품 게시를 취소하는 하나의 [기본 재고 부족 활동](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/stock/activity/CommerceLowStockActivityImpl.java) 제공합니다.

![즉시 사용 가능한 낮은 재고 활동](./implementing-a-custom-low-stock-activity/images/01.png "즉시 사용 가능한 낮은 재고 활동")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 낮은 재고 활동을 시작하고 실행하는 예제를 얻을 것입니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. [Acme Commerce 낮은 재고 활동](./liferay-j1e4.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/managing-inventory/liferay-j1e4.zip -O
    ```

    ```bash
    unzip liferay-j1e4.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.j1e4.impl_1.0.0
    ```

1. 낮은 재고 활동 예시가 추가되었는지 확인합니다. 브라우저에서 `https://localhost:8080`로 엽니다. 응용 프로그램 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **Commerce** → **Products** 로 이동합니다. 그런 다음 제품의 메뉴에서 **편집** 클릭합니다. 필요한 경우 [제품](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)을 추가할 수 있습니다.

   여기에서 **구성** 로 이동합니다. 새 활동("경고 메시지 기록")은 **재고 부족 작업** 드롭다운 아래에 표시됩니다.

```{note}
Liferay Commerce 2.1 및 이전 버전에서는 *제어판* → *상거래* → *제품*으로 이동하여 제품 페이지를 찾습니다.
```

![새로운 재고 부족 활동](./implementing-a-custom-low-stock-activity/images/02.png "새로운 재고 부족 활동")

축하합니다. `CommerceLowStockActivity`을 구현하는 새로운 소량 활동을 성공적으로 구축 및 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CommerceLowStockActivity` 인터페이스를 검토합니다. 셋째, `CommerceLowStockActivity`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = {
        "commerce.low.stock.activity.key=j1e4",
        "commerce.low.stock.activity.priority:Integer=9"
    },
    service = CommerceLowStockActivity.class
)
public class J1E4CommerceLowStockActivity implements CommerceLowStockActivity {
```

> Liferay Commerce가 [저재고 활동 레지스트리](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/stock/activity/CommerceLowStockActivityRegistryImpl.java) 에서 새 활동을 다른 활동과 구별할 수 있도록 저재고 활동에 대한 고유 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 재사용하면 기존 관련 활동이 재정의됩니다.
> 
> `commerce.low.stock.activity.priority` 값은 우리의 활동이 UI에 나타날 저재고 활동 목록의 어느 정도까지를 나타냅니다. 예를 들어, ["게시되지 않은 것으로 설정" 활동](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/stock/activity/CommerceLowStockActivityImpl.java) 의 값은 10입니다. 재고가 적은 활동에 값을 9로 지정하면 "게시되지 않은 것으로 설정" 활동 바로 앞에 표시됩니다.

### `CommerceLowStockActivity` 인터페이스 검토

다음 방법을 구현합니다.

```java
public void execute(CPInstance cpInstance) throws PortalException;
```

> 이 메서드는 사용자 지정 활동에 대한 비즈니스 논리가 구현되는 사이트입니다.

```java
public String getKey();
```

> 이는 저재고 활동 레지스트리에서 저재고 활동에 대한 고유 식별자를 제공합니다. 키는 레지스트리에서 낮은 주식 활동을 가져오는 데 사용할 수 있습니다.

```java
public String getLabel(Locale locale);
```

> 낮은 재고 활동을 설명하는 텍스트 레이블을 반환합니다. 언어 키가 있는 레이블 검색에 대한 참조는 [J1E4CommerceLowStockActivity.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/managing-inventory/implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/java/com/acme/j1e4/internal/commerce/stock/activity/J1E4CommerceLowStockActivity.java) 의 구현을 참조하십시오.

### 재고 부족 활동 완료

저재고 활동은 활동 자체를 수행하기 위한 백엔드 로직으로 구성됩니다. 다음을 수행하십시오.

* [`execute`에 비즈니스 로직을 추가합니다.](#add-business-logic-to-execute)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-key-to-languageproperties)

#### `실행`에 비즈니스 로직 추가

```java
@Override
public void execute(CPInstance cpInstance) throws PortalException {
    if (_log.isWarnEnabled()) {
        _log.warn("SKU " + cpInstance.getSku());
    }
}
```

> 이 예에서는 Liferay의 로그에 추가되는 경고 메시지를 추가합니다.
> 
> `cpInstance` 개체에는 재고가 적은 항목에 대해 사용할 수 있는 정보가 포함되어 있습니다. 이 예에서는 경고 메시지에 추가할 항목의 SKU를 가져오는 데 사용합니다. [CPInstance](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstance.java) 및 [CPInstanceModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstanceModel.java) 참조하여 `CPInstance`와 함께 사용할 수 있는 더 많은 방법을 찾으십시오.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/managing-inventory/implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
j1e4-commerce-low-stock-activity=J1E4 Commerce Low Stock Activity
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 참조하십시오.

## 결론

축하해요! 이제 `CommerceLowStockActivity` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새로운 낮은 재고 활동을 추가했습니다.

## 관련 주제

* [간단한 제품 만들기](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
* [재고 부족 조치](../../inventory-management/low-stock-action.md)
