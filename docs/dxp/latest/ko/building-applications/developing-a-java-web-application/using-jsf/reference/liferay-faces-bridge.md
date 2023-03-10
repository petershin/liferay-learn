# 라이프레이 페이스 브리지

Liferay Faces Bridge를 사용하면 포틀릿 관련 코드를 작성하지 않고도 JSF 웹 앱을 포틀릿으로 배포할 수 있습니다. 또한 포틀릿 애플리케이션 내에서 JSF 2.x의 기능을 활용할 수 있게 해주는 혁신적인 기능도 포함되어 있습니다.

Liferay Faces Bridge는 `.jar` 파일로 배포됩니다. Liferay Portal 5.2, 6.0, 6.1, 6.2 및 7.0과 같은 JSR 286(Portlet 2.0) 호환 포틀릿 컨테이너 내에서 JSF 웹 애플리케이션을 포틀릿으로 배포하기 위해 포틀릿 프로젝트에 대한 종속성으로 Liferay Faces Bridge를 추가할 수 있습니다.

Liferay Faces Bridge 프로젝트 홈페이지는 [여기](https://community.liferay.com/-/faces) 에서 찾을 수 있습니다.

Liferay Faces Bridge를 완전히 이해하려면 먼저 포틀릿 브리지 표준을 이해해야 합니다. Portlet 1.0 및 JSF 1.0 사양이 본질적으로 동시에 작성되었기 때문에 JSF 사양의 전문가 그룹(EG)은 JSF 프레임워크를 포틀릿과 호환되도록 구성했습니다. 예를 들어 [ExternalContext.getRequest()](https://javaee.github.io/javaee-spec/javadocs/javax/faces/context/ExternalContext.html#getRequest--) 메서드는 대신 'Object'를 반환합니다. [javax.servlet.http.HttpServletRequest](https://javaee.github.io/javaee-spec/javadocs/javax/servlet/http/HttpServletRequest.html) . 포털에서 이 메서드를 사용하면 '객체'를 [javax.portlet.PortletRequest](http://portals.apache.org/pluto/portlet-2.0-apidocs/javax/portlet/PortletRequest) 로 캐스팅할 수 있습니다. HTML). EG는 JSF 설계 내에서 포틀릿 호환성에 대한 인식에도 불구하고 포틀릿과 JSF 수명 주기 사이의 간격을 메워야 했습니다.

포틀릿 브리지 표준 및 구현은 시간이 지남에 따라 발전했습니다.

2004년부터 JSF 개발자에게 JSF 웹 앱을 포틀릿으로 배포할 수 있는 기능을 제공하기 위해 여러 가지 JSF 포틀릿 브리지 구현이 개발되었습니다. 2006년에 JCP는 표준 브리지 API와 브리지 구현을 위한 세부 요구 사항을 정의하기 위해 Portlet Bridge 1.0( [JSR 301](http://www.jcp.org/en/jsr/detail?id=301) ) EG를 구성했습니다. JSR 301은 2010년에 출시되었으며 Portlet 1.0 및 JSF를 대상으로 합니다.
1. 2.

2008년 Portlet 2.0( [JSR 286](http://www.jcp.org/en/jsr/detail?id=286) ) 표준이 발표되면서 JCP는 Portlet Bridge 2.0( [JSR 329](http://www.jcp.org/en/jsr/detail?id=329) ) EG를 구성해야 했습니다. JSR
1. 2010년에는 Portlet 2.0 및 JSF 1.2를 대상으로 릴리스되었습니다.

[JSR 314](http://www.jcp.org/en/jsr/detail?id=314) EG가 2009년에 JSF 2.0을, 2010년에 JSF 2.1을 출시한 후 Portlet Bridge 3.0 표준이 도움이 될 것이 분명해졌습니다. 2015년에 JCP는 Portlet 3.0 및 JSF 2.2용 브리지를 정의하는 [JSR 378](http://www.jcp.org/en/jsr/detail?id=378) )을 구성했습니다. Portlet 2.0 및 JSF 1.2/2.1/2.2를 지원하는 **Liferay Faces Bridge** 의 변형도 있습니다.

Liferay Faces Bridge는 Portlet Bridge Standard의 참조 구현(RI)입니다. 또한 포틀릿 애플리케이션 내에서 JSF 2.x의 기능을 활용할 수 있게 해주는 혁신적인 기능도 포함되어 있습니다.

JSF 포틀릿 브리지는 JSF 수명 주기의 올바른 단계를 포틀릿 수명 주기의 각 단계와 맞춥니다. 예를 들어 브라우저가 JSF 포틀릿이 있는 포털 페이지에 HTTP GET 요청을 보내는 경우 포틀릿의 수명 주기에서 `RENDER_PHASE` 이 수행됩니다. 그런 다음 JSF 포틀릿 브리지는 JSF 수명 주기에서 `RESTORE_VIEW` 및 `RENDER_RESPONSE` 단계를 시작합니다. 마찬가지로 HTTP POST가 포틀릿에서 실행되고 포틀릿이 `ACTION_PHASE`에 진입하면 전체 JSF 수명 주기가 브리지에 의해 시작됩니다.

![JSF 라이프사이클의 다른 단계는 실행 중인 포틀릿 라이프사이클의 단계에 따라 실행됩니다.](./liferay-faces-bridge/images/01.png)


<!-- Neil stated the following about the JSF Lifecycle image above:

"In the following image, we talk about JSR 286 (Portlet 2.0), but once we're
done with Portlet 3.0 in Liferay 7.1 (very soon) and JSR 378 (Portlet 3.0 Bridge for JSF 2.2, not until the end of Q2 2019), we will need to change that to JSR
1. and also add the HEADER_PHASE."

We'll need to update the image once this is available. -Cody -->

두 라이프사이클이 올바르게 연결되는지 확인하는 것 외에도 JSF 포틀릿 브리지는 포털 URL 생성기와 JSF 탐색 규칙 간의 중재자 역할도 합니다. JSF 포틀릿 브리지는 JSF 포틀릿이 다른 보기로 전환할 수 있도록 포털에서 생성된 URL이 JSF 탐색 규칙을 준수하는지 확인합니다.

JSR 329/378 표준은 `javax.portlet.faces` 네임스페이스가 접두어로 붙은 여러 구성 옵션을 정의합니다. Liferay Faces Bridge는 `com.liferay.faces.bridge` 네임스페이스가 접두사로 붙은 추가 구현별 옵션을 정의합니다.

Liferay Faces Bridge는 Liferay DXP/Portal용 JSF 개발 프로세스의 필수 부분입니다. 자세한 내용은 [JSF 포틀릿 애플리케이션 개발 \(도움말 센터\)](https://help.liferay.com/hc/ko/articles/360029069451-Developing-a-JSF-Portlet-Application) 을 참조하십시오.

## 추가 정보

* [Liferay 얼굴 합금](./liferay-faces-alloy.md)
* [Liferay 얼굴 포털](./liferay-faces-portal.md)
* [서비스 빌더](../../../data-frameworks/service-builder.md)