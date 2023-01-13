---
toc:
- ./client-extensions/browser-based-client-extensions.md
---
# 원격 앱

```{toctree}
:maxdepth: 4

client-extensions/browser-based-client-extensions.md
```

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

클라이언트 확장은 OSGi 모듈을 사용하지 않고 Liferay를 확장하는 방법입니다. 직접 호스팅하든 Liferay Experience Cloud에서 호스팅하든 관계없이 모든 Liferay 환경에 클라이언트 확장을 배포할 수 있습니다. 또한 [Liferay objects](./objects.md)와 같은 내장 구성과 함께 Liferay Experience Cloud로 Liferay를 사용자 정의하는 기본 방법이기도 합니다.

[OSGi 모듈](../liferay-internals/fundamentals/module-projects.md) 또는 [테마](../site-building/site-appearance/themes/introduction-to-themes.md)와 같은 다른 유형의 Liferay 확장은 Liferay 자체를 사용자 지정하기 위한 강력한 도구인 반면 클라이언트 확장은 Liferay 코드를 직접 사용하거나 사용자 지정하지 않습니다. 따라서 클라이언트 확장은 특정 버전의 Liferay에 의존하지 않기 때문에 업그레이드 후 환경에 더 강력하고 쉽게 적용할 수 있습니다. 또한 클라이언트 확장이 Liferay 외부에서 실행되고 연결하는 데 필요한 추가 코드 없이 개체와 통합되기 때문에 가장 친숙한 프로그래밍 언어 또는 기술을 사용하여 개발할 수 있습니다.

![클라이언트 확장은 Liferay 자체를 수정할 필요 없이 특정 비즈니스 요구 사항을 충족하는 데 필요한 주요 사용자 지정 기능을 제공합니다.](./client-extensions/images/01.png)

클라이언트 확장을 사용하면 다음을 수행할 수 있습니다.

* Liferay의 특정 코드에 의존할 필요 없이 사용자 정의 JavaScript 또는 CSS [을 페이지에 적용](#browser-based-client-extensions).
* Liferay 페이지의 [사용자 정의 요소](./client-extensions/browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 에 원격으로 호스팅되는 응용 프로그램 포함
* 동일한 구성 또는 개체를 클라이언트 확장으로 변환하여 여러 환경에 [방식으로 적용하는 프로세스를 단순화](#configuration-as-code).
* 선택한 프로그래밍 언어 또는 기술을 사용하여 외부 피드 또는 사용자 정의 인증 서버와 같은 Liferay 외부에서 실행되는 [사용자 지정 서비스](#custom-service-client-extensions) 또는 [기능](#lambda-client-extensions) 호출

## 클라이언트 확장의 유형

클라이언트 확장 기능은 [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)과 통합되므로 사용 가능한 도구를 사용하여 신속하게 개발하고 배포할 수 있습니다. 클라이언트 확장은 [헤드리스 API](../headless-delivery/using-liferay-as-a-headless-platform.md)을 통해 Liferay와 통신합니다.

이러한 유형의 클라이언트 확장은 Liferay의 모양과 기능을 확장하는 데 사용할 수 있습니다.

* [브라우저 기반 클라이언트 확장](#browser-based-client-extensions)
* [코드로 구성](#configuration-as-code)
* [스케줄러 클라이언트 확장](#scheduler-client-extensions)
* [데이터 커넥터 클라이언트 확장](#data-connector-client-extensions)
* [Lambda 클라이언트 확장](#lambda-client-extensions)
* [맞춤형 서비스 클라이언트 확장](#custom-service-client-extensions)

### 브라우저 기반 클라이언트 확장

브라우저 기반 클라이언트 확장은 배포될 때 CDN에서 호스팅됩니다. 브라우저 기반 클라이언트 확장의 예로는 특정 CSS 레이아웃, 클릭 투 채팅 기능 또는 사용자 정의 장바구니 표시가 있습니다.

* **JavaScript**: JavaScript 클라이언트 확장은 전역적으로 또는 특정 테마 내에서 적용될 수 있습니다.

* **CSS**: CSS 클라이언트 확장은 전역적으로 또는 특정 테마 내에서 적용될 수 있습니다.

* **파비콘**: 클라이언트 확장은 특정 테마에 대한 파비콘을 배포할 수 있습니다.

* **사용자 정의 요소**: 사용자 정의 요소 클라이언트 확장은 애플리케이션을 페이지에 통합할 수 있습니다.

* **IFrame**: IFrame 클라이언트 확장은 사용자 정의 요소와 유사하게 작동하지만 별도의 `<iframe>` HTML 요소를 사용하여 원격 애플리케이션과의 제한된 상호 작용을 허용합니다.

자세한 내용은 [브라우저 기반 클라이언트 확장](./client-extensions/browser-based-client-extensions.md) 을 참조하십시오.

### 코드로 구성

```{warning}
구성 클라이언트 확장은 현재 Liferay 7.4의 **베타 기능**입니다. 사용 가능한 기능이 일시적으로 제한됩니다.
```

Liferay 7.4에서는 구성을 클라이언트 확장 유형으로 사용할 수도 있습니다. 구성(사용자 지정 개체 및 데이터 모델 포함)을 클라이언트 확장으로 다른 환경으로 쉽게 내보내고 가져올 수 있습니다. 이렇게 하면 변경 사항을 푸시하기 위한 스크립트나 사용자 정의 코드가 필요 없이 여러 환경을 한 번에 구성하고 이를 클라이언트 확장으로 구현하고 간소화된 워크플로우에서 적용 가능한 모든 환경에 배포하는 프로세스가 간소화됩니다.

### 스케줄러 클라이언트 확장

```{warning}
스케줄러 클라이언트 확장은 현재 Liferay 7.4의 **베타 기능**입니다. 사용 가능한 기능이 일시적으로 제한됩니다.
```

스케줄러 클라이언트 확장은 잘 알려진 Cron 표현식으로 구성할 수 있는 예약된 간격으로 실행할 작업을 생성하기 위한 것입니다. 이들과 함께 코드를 배포하여 이러한 간격으로 실행하거나 [데이터 커넥터 클라이언트 확장](#data-connector-client-extensions) 또는 외부 API(예: [Salesforce](https://www.salesforce.com))를 사용하여 Liferay와 데이터를 동기화할 수 있습니다.

### 데이터 커넥터 클라이언트 확장

```{warning}
데이터 커넥터 클라이언트 확장은 현재 Liferay 7.4의 **베타 기능**입니다. 사용 가능한 기능이 일시적으로 제한됩니다.
```

데이터 커넥터 클라이언트 확장을 사용하여 [Liferay 객체](./objects.md)형식으로 데이터를 Liferay로 가져옵니다. 이들은 정기적으로 예약된 간격으로 데이터를 동기화하기 위해 [스케줄러 클라이언트 확장](#scheduler-client-extensions) 과 함께 사용됩니다.

### Lambda 클라이언트 확장

```{warning}
Lambda 클라이언트 확장은 현재 Liferay 7.4의 **베타 기능**입니다. 사용 가능한 기능이 일시적으로 제한됩니다.
```

이러한 클라이언트 확장은 Liferay 외부의 별도 컨테이너에서 코드를 실행합니다. OSGi 모듈 또는 모델 리스너를 구현하지 않고도 특수 기능에 대한 사용자 정의 솔루션을 구현할 수 있습니다.

Liferay는 [객체](./objects.md)을 통해 이 코드의 실행을 트리거합니다. Lambda 클라이언트 확장이 배포되면 클라이언트 확장 기능을 사용 가능한 작업으로 호출하는 개체를 생성하고 필요에 따라 트리거를 사용자 지정할 수 있습니다. Liferay Experience Cloud에서는 코드가 Liferay 외부에서 실행되지만 동일한 환경에서 Liferay와 함께 코드가 실행되므로 자체 서버에서 코드를 호스팅할 필요가 없습니다.

### 맞춤형 서비스 클라이언트 확장

```{warning}
사용자 지정 서비스 클라이언트 확장은 현재 Liferay 7.4의 **베타 기능**입니다. 사용 가능한 기능이 일시적으로 제한됩니다.
```

보다 복잡한 사용 사례의 경우 Liferay Experience Cloud에서 자체 서비스로 작동하는 클라이언트 확장을 사용할 수 있습니다. 자체 코드를 제공한 다음 할당된 자체 가상 서버와 함께 클라우드 네트워크 내에서 작동하는 서비스로 실행되도록 배포합니다. 동일한 클라우드 네트워크에서 호스팅되므로 자체 서비스가 다른 서비스에 액세스하는 동시에 클라우드의 기본 제공 보안 기능을 활용할 수 있습니다.

사용자 지정 서비스를 배포하면 별도의 서비스로 작동하는 이점이 있는 사용자 지정을 구현할 수 있는 훨씬 더 많은 기능을 제공합니다. 예를 들어 자체 인증 서버 또는 헤드리스 API [를 사용하여](../headless-delivery/using-liferay-as-a-headless-platform.md)와 인터페이스하는 애플리케이션을 구현할 수 있습니다. 맞춤형 서비스는 사용자와 인터페이스하는 별도의 애플리케이션을 통합하는 데에도 유용합니다.

## 추가 정보

* [첫 번째 클라이언트 확장 만들기](./client-extensions/browser-based-client-extensions/tutorials/creating-your-first-javascript-client-extension.md)
* [브라우저 기반 클라이언트 확장](./client-extensions/browser-based-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
