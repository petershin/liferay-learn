---
toc:
  - ./client-extensions/working-with-client-extensions.md
  - ./client-extensions/front-end-client-extensions.md
  - ./client-extensions/microservice-client-extensions.md
  - ./client-extensions/configuration-client-extensions.md
---

# 원격 앱

```{toctree}
:maxdepth: 4

client-extensions/working-with-client-extensions.md
client-extensions/front-end-client-extensions.md
client-extensions/microservice-client-extensions.md
client-extensions/configuration-client-extensions.md
```

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

클라이언트 확장은 OSGi 모듈을 사용하지 않고 Liferay를 확장합니다. 직접 호스팅하든 Liferay Experience Cloud에서 호스팅하든 관계없이 모든 Liferay 환경에 클라이언트 확장을 배포할 수 있습니다. 또한 [Liferay 객체](./objects.md)과 같은 내장 구성과 함께 Liferay Experience Cloud로 Liferay를 사용자 지정하는 기본 방법이기도 합니다.

[OSGi 모듈](../liferay-internals/fundamentals/module-projects.md) 또는 [테마](../site-building/site-appearance/themes/introduction-to-themes.md) 과 같은 다른 Liferay 확장은 Liferay 자체에 기능을 수정하거나 추가하는 반면 클라이언트 확장은 Liferay의 API와만 인터페이스합니다. 이 느슨한 결합은 클라이언트 확장이 버전 간에 거의 변경되지 않는 API에만 의존하기 때문에 업그레이드 후 환경에 더 유연하고 쉽게 적용할 수 있도록 합니다. 클라이언트 확장은 Liferay 외부에서 실행되고 연결하는 데 필요한 추가 코드 없이 개체와 통합되기 때문에 원하는 프로그래밍 언어나 기술을 사용하여 클라이언트 확장을 만들 수도 있습니다.

![클라이언트 확장은 Liferay 자체를 수정하지 않고 특정 비즈니스 요구 사항을 충족하는 데 필요한 주요 사용자 지정 기능을 제공합니다.](./client-extensions/images/01.png)

클라이언트 확장을 사용하면 다음을 수행할 수 있습니다.

* Liferay 코드에 대한 종속성을 피하면서 [맞춤형 JavaScript 또는 CSS](#front-end-client-extensions) 적용
* Liferay 페이지의 [사용자 정의 요소](./client-extensions/front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 에 원격으로 호스팅되는 애플리케이션 포함
* 동일한 구성 또는 개체를 여러 환경에 적용하여 [클라이언트 확장으로 변환](#configuration-client-extensions)
* 선택한 프로그래밍 언어 또는 기술을 사용하여 Liferay 외부(예: REST 끝점)에서 실행되는 사용자 지정 서비스 또는 [기능](#microservice-client-extensions) 호출

## 클라이언트 확장의 유형

[Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md) 사용하여 클라이언트 확장을 개발하고 배포합니다. 클라이언트 확장은 [헤드리스 API](../headless-delivery/using-liferay-as-a-headless-platform.md)을 통해 Liferay와 통신합니다.

다음은 클라이언트 확장의 분류입니다.

* [프런트 엔드 클라이언트 확장](#front-end-client-extensions)
* [마이크로서비스 클라이언트 확장](#microservice-client-extensions)
* [구성 클라이언트 확장](#configuration-client-extensions)

### 프런트 엔드 클라이언트 확장

프런트 엔드 클라이언트 확장은 특정 페이지에 표시할 리소스를 제공합니다. 이제 테마 리소스 또는 사용자 지정 HTML 요소를 클라이언트 확장에서 제공할 수 있습니다. 대부분의 프런트 엔드 클라이언트 확장은 Liferay 인스턴스에 *정적 리소스* 제공합니다.

특정 유형에 대한 자세한 내용은 [프런트 엔드 클라이언트 확장](./client-extensions/front-end-client-extensions.md) 참조하십시오.

### 마이크로서비스 클라이언트 확장

마이크로서비스 클라이언트 확장은 Liferay 내에서 트리거할 API 엔드포인트를 제공합니다(예: 개체 또는 워크플로 작업). 해당 작업 이벤트가 API를 호출하면 Liferay 외부에서 별도의 *마이크로 서비스*로 원하는 모든 기능을 실행할 수 있습니다.

특정 유형에 대한 자세한 내용은 [마이크로서비스 클라이언트 확장](./client-extensions/microservice-client-extensions.md) 을 참조하세요.

### 구성 클라이언트 확장

구성 클라이언트 확장은 Liferay 인스턴스 내에서 기능을 변경하기 위한 특정 구성을 제공합니다.

[microservice client extensions](#microservice-client-extensions) 과 같은 다른 클라이언트 확장과 함께 사용할 수 있습니다. 예를 들어 OAuth 사용자 에이전트 클라이언트 확장을 사용하여 사용자 트리거 작업 이벤트와 함께 작동하는 클라이언트 확장을 인증할 수 있습니다.

특정 유형에 대한 자세한 내용은 [구성 클라이언트 확장](./client-extensions/configuration-client-extensions.md) 을 참조하십시오.

## 추가 정보

* [클라이언트 확장 작업](./client-extensions/working-with-client-extensions.md)
* [프런트 엔드 클라이언트 확장](./client-extensions/front-end-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
