# 사용자 지정 알림 유형 구현

상점의 다양한 이벤트 트리거에 대한 이메일 알림을 보내도록 Liferay Commerce를 구성할 수 있습니다. 필요에 맞는 즉시 사용 가능한 알림 트리거가 없는 경우 직접 구현할 수 있습니다.

새 알림 유형을 추가하려면 `CommerceNotificationType` 인터페이스를 구현해야 합니다. 알림 템플릿을 설정하고 사용 가능한 OOTB 유형을 보는 방법을 알아보려면 [이메일 보내기](../../store-management/sending-emails.md) 을 참조하십시오.

## 알림 유형 개요

알림 범위는 채널로 지정됩니다. 채널 설정에서 새 알림 템플릿을 만들 수 있으며 알림 유형에 따라 트리거됩니다.

![알림 템플릿은 이벤트 흐름을 정의합니다.](./implementing-a-custom-notification-type/images/01.png)

위의 다이어그램은 유형 **G2F3 Shipment Created** 의 알림 템플릿을 보여줍니다. 이것은 새로운 선적 생성을 위해 트리거됩니다. 배송을 생성하는 동안 알림 템플릿에 언급된 대로 수취인에게 알림이 전송됩니다. 템플릿의 받는 사람, 제목 및 본문 필드에 와일드카드를 사용할 수 있으며 보내기 전에 해결됩니다.

## 알림 유형 배포 및 언어 키 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. Acme Commerce 알림 유형을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/order-management/liferay-g2f3.zip

    unzip liferay-g2f3.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.g2f3.impl_1.0.0
    ```

2. 관리자로 로그인하고 **전역 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 연 다음 **제어판** &rarr; **언어 재정의** 클릭합니다. **추가** 버튼(![Add icon](../../images/icon-add.png))을 클릭하고 다음 키를 추가합니다.

    | 언어 키                                       | 값                |
    |:------------------------------------------ |:---------------- |
    | g2f3-배송-생성                                 | G2F3 배송 생성됨      |
    | g2f3-shipment-creator-name-definition-term | 주문을 생성한 계정의 이름   |
    | g2f3-주문-배송-주소-정의-기간                        | 배송 주소            |
    | g2f3-선적-id-정의-기간                           | 배송 ID            |
    | g2f3-배송-작성자-이메일-정의-기간                      | 배송을 생성한 사용자의 이메일 |

    !!! important
        Liferay DXP 7.4 U4+ 또는 Liferay Portal 7.4 GA8+용 언어 재정의 도구에서 언어 키를 추가할 수 있습니다. 이전 버전의 경우 빌드 및 배포하기 전에 `/src/main/resources/content/` 아래에 `Language.properties` 파일을 키와 함께 추가해야 합니다.

3. **글로벌 메뉴**(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **채널** 을 클릭한 다음 **알림 템플릿** 을 선택합니다.

4. **추가** 버튼을 사용하여 새 템플릿을 만듭니다(![추가 아이콘](../../images/icon-add.png)):

    **이름:** 생성된 G2F3 배송 테스트

    **유형:** G2F3 배송 생성됨

    **받는 사람:**[%SHIPMENT_CREATOR_EMAIL%]

    **발송 주소:** test@liferay.com

    **발송자 이름:** 관리자

    **제목:** 새 배송 생성됨 - 배송 ID: [%SHIPMENT_ID%]

    **Body:**

    **Hi,**

    * [%SHIPMENT_CREATOR_NAME%]*

    **Shipping Address:**
    [**%ORDER_SHIPPING_ADDRESS%**]

    **Thanks,**

    **Admin**

5에 의해 새로운 배송이 생성되었습니다. **저장** 을 클릭합니다.

6. **글로벌 메뉴**(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **사이트** 를 클릭한 다음 새 Minium 데모 사이트를 추가합니다. .

7. 구매자로 로그인하고 상점에서 새로 주문하십시오.

8. 로그아웃했다가 관리자로 다시 로그인하고 **Global Menu** 를 열고 **Commerce** &rarr; **Orders** 를 클릭합니다.

9. 주문을 선택하고 **주문 수락** 을 클릭합니다. 그런 다음 **발송물 생성** 을 클릭합니다.

10. 수신된 알림에 대한 받은 편지함을 확인하십시오.

!!! important
    MockMock(https://github.com/tweakers/MockMock)과 같은 가짜 SMTP 서버를 사용하여 로컬 개발 환경에서 이러한 알림을 테스트할 수 있습니다. `portal-ext.properties` 파일에 `mail.send.blacklist=noreply@liferay.com, noreply@domain.invalid, test@domain.invalid` 행을 추가하십시오. `java -jar MockMock.jar`를 사용하여 jar를 실행하고 수신된 이메일에 대해 `localhost:8282`를 확인하십시오.

## 사용자 지정 알림 유형의 작동 방식

이 예제는 7개의 주요 단계로 구성됩니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달아야 합니다. 다음으로 [CommerceNotificationType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-notification-api/src/main/java/com/liferay/commerce/notification/type/CommerceNotificationType.java) 인터페이스를 검토하십시오. 그런 다음 사용자 정의 `CommerceNotificationType`구현을 완료하십시오.

그런 다음 `CommerceShipment` 클래스에 대해 `ModelListener` 생성합니다. 다음으로 `CommerceDefinitionTermContributor` 인터페이스를 검토합니다. 마지막으로 용어 기여자를 구현하여 새 알림에 대한 와일드카드를 확인합니다.

- [OSGi 등록을 위해 클래스에 주석 달기](#annotate-the-class-for-osgi-registration)
- [CommerceNotificationType 인터페이스 검토](#review-the-commercenotificationtype-interface)
- [통지 유형을 작성하십시오](#complete-the-notification-type)
- [CommerceShipment용 ModelListener 생성](#create-a-modellistener-for-commerceshipment)
- [CommerceDefinitionTermContributor 인터페이스 검토](#review-the-commercedefinitiontermcontributor-interface)
- [기고자 기간을 완료하십시오.](#complete-the-term-contributors)

### OSGi 등록을 위해 클래스에 주석 달기

Liferay Commerce가 알림 상태 레지스트리에서 다른 알림 유형과 구분할 수 있도록 알림 유형에 대한 고유 키를 제공해야 합니다. 이미 사용 중인 키를 지정하면 기존 연결된 유형이 재정의됩니다. 순서는 드롭다운에서 정렬 순서를 결정합니다. 이 경우 **배송 대기 중인 주문** 알림 유형은 주문이 50개이고 **개의 주문 부분 배송** 알림 유형은 주문이 60개입니다. 둘 사이에 상태를 표시하려면 주문이 두 숫자 사이에 있어야 합니다(이 경우 51).

### CommerceNotificationType 인터페이스 검토

다음 방법을 구현합니다.

```java
public String getClassName(Object object);
```

이 메서드는 알림 유형이 구현된 클래스의 이름을 반환합니다.

```java
public long getClassPK(Object object);
```

이 메서드는 개체의 기본 키를 반환합니다.

```java
public String getKey();
```

이 메서드는 알림 유형의 고유 키를 반환합니다. 기존 키를 사용하면 해당 알림 유형이 재정의됩니다.

```java
public String getLabel(Locale locale);
```

이 메서드는 UI에 표시되는 알림 유형의 이름을 반환합니다. 이 이름은 언어 키 또는 문자열일 수 있습니다.

### 통지 유형을 작성하십시오

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/notification/type/G2F3ShipmentCreatedNotificationTypeImpl.java
    :dedent: 1
    :language: java
    :lines: 21-49
```

알림 유형 구현을 완료하려면 위의 메소드를 구현해야 합니다. 첫 번째 방법에서는 개체가 `CommerceShipment` 유형인지 확인하고 true인 경우 해당 클래스 이름을 반환합니다. 두 번째 방법에서는 이를 다시 확인하고 참이면 배송의 기본 키를 반환합니다. 세 번째 메서드는 고유 키를 반환하고 마지막 메서드는 UI에 표시되는 레이블을 반환합니다.

### CommerceShipment용 ModelListener 생성

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/notification/model/listener/G2F3CommerceShipmentModelListener.java
    :language: java
    :lines: 15-41
```

배송이 생성될 때마다 알림을 트리거하려면 [`ModelListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/model/ModelListener.java) 인터페이스를 구현하는 [`BaseModelListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/model/BaseModelListener.java) 클래스를 확장해야 합니다. 이 인터페이스에는 만들기, 업데이트, 삭제 등과 같은 이벤트에 대해 트리거되는 엔터티에 대한 메서드가 있습니다. `onAfterCreate(T 모델)` 메서드를 사용하여 배송 생성 시 알림을 트리거할 수 있습니다.

### CommerceDefinitionTermContributor 인터페이스 검토

다음 방법을 구현합니다.

```java
public String getFilledTerm(String term, Object object, Locale locale) throws PortalException;
```

이 메서드는 와일드카드를 적절한 값으로 바꾸고 문자열로 반환합니다.

```java
public String getLabel(String term, Locale locale);
```

이 메서드는 UI에 표시되는 기여자라는 용어의 이름을 반환합니다. 이 이름은 언어 키 또는 문자열일 수 있습니다.

```java
public List<String> getTerms();
```

이 메서드는 알림 유형에 사용할 수 있는 모든 용어 기여자를 반환합니다.

### 기고자 기간을 완료하십시오.

용어 기여자는 받는 사람, 제목 및 본문 필드에 있는 와일드카드를 확인합니다. 이 예제에는 두 개의 용어 기여자가 구현되어 있습니다. 하나는 제목 및 본문 필드용이고 다른 하나는 받는 사람 필드용입니다.

#### Body 및 Subject에 대한 getFilledTerm 메소드 구현

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 32-71
```

와일드카드를 확인하기 전에 개체가 null인지 또는 `CommerceShipment`유형인지 확인하는 검사가 있습니다. 그런 다음 용어에 와일드카드가 포함된 경우 와일드카드는 배송 작성자의 이름, 배송 주소 또는 배송 ID로 대체됩니다. 배송 작성자 이름의 경우 배송의 계정 이름이 반환됩니다. 배송 주소는 거리 주소, 도시 및 우편번호가 연결된 문자열로 반환됩니다. 배송 ID는 배송 개체에서 직접 반환됩니다.

#### 수신자에 대한 getFilledTerm 메소드 구현

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentRecipientCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 31-58
```

와일드카드를 확인하기 전에 개체가 null인지 또는 `CommerceShipment`유형인지 확인하는 검사가 있습니다. 그런 다음 용어에 와일드카드가 포함된 경우 와일드카드는 계정의 사용자 ID로 대체됩니다. 알림이 전송되면 이 ID를 사용하여 사용자의 이메일을 찾습니다.

#### getLabel 및 getTerms 메소드 구현

`getLabel` 메소드는 UI에 표시되는 용어의 이름을 반환합니다. 이를 위해 언어 키를 사용하거나 문자열을 직접 반환할 수 있습니다.

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 73-76
```

이 메서드는 알림 유형에 사용할 수 있는 모든 용어 기여자를 반환합니다. 이를 위해 언어 키를 사용하거나 UI에 용어를 표시하는 하드 코딩된 문자열을 직접 반환할 수 있습니다.

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 78-81
```

## 결론

축하해요! 이제 `CommerceNotificationType` 인터페이스를 구현하기 위한 기본 사항을 알게 되었습니다. 또한 알림 작동 방식의 기본 사항과 `MessageListener` 사용하여 고유한 알림 유형을 보내는 방법도 알고 있습니다.