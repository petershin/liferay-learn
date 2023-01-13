# 소스 구성

버그를 수정하거나 제품에 새로운 기능을 추가할 때 Liferay 소스가 어떻게 구성되어 있는지 확실히 이해하는 것이 중요합니다. Liferay 소스는 플랫폼에서 제공하는 다양한 프레임워크의 완전한 구현을 제공하기 때문에 맞춤형 프로젝트를 구축할 때 훌륭한 참조 소스가 될 수도 있습니다.

Liferay Source는 이제 두 가지 주요 영역을 사용하여 구성됩니다.

* **Portal Core** - 아직 모듈로 추출되지 않은 원래 플랫폼의 일부입니다. 그들은 Portal-impl, Portal-service 및 Portal-web과 같은 Liferay 6.2의 친숙한 이름을 가지고 있습니다.
* **모듈** - 이제 많은 기능이 모듈로 추출되어 *liferay-portal/modules* 디렉토리에 상주합니다. 많은 모듈이 Liferay MVC 패턴을 따르고 관련 .api, .service 및 .web 모듈로 구성됩니다.

## 추가 정보

Liferay 소스에서 사용되는 일부 패턴을 더 깊이 이해하려면 공식 Liferay 문서에서 웹 애플리케이션 개발 튜토리얼을 읽어보세요.

## 블로그 위젯

다음 예제에서는 즉시 사용 가능한 블로그 위젯을 사용하고 해당 애플리케이션에서 더 관련성이 높은 패턴 중 일부를 강조 표시하고 코드의 특정 섹션에 대한 문서로 다시 연결되는 링크를 제공합니다.

## 블로그Portlet

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/portlet/BlogsPortlet.java`

*BlogsPortlet* 은 Liferay MVC 패턴을 따르며 Blogs Widget의 기본 진입점입니다. 한 가지 유의할 점은 BlogsPortlet 클래스가 뷰 템플릿 초기화 매개변수를 나열하지 않는다는 것입니다. 다음에 더 자세히 설명합니다.

자세한 내용은 [Liferay MVC 문서](https://help.liferay.com/hc/en-us/articles/360029028191-Liferay-MVC-Portlet)을 참조하십시오.

## 블로그ViewMVCRenderCommand

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/portlet/BlogsViewMVCRenderCommand.java`

포틀릿 구성 요소가 *보기 템플릿*을 나열하지 않는 경우 이는 일반적으로 MVCRenderCommand가 항목 .jsp 파일에 디스패치하는 것임을 의미합니다. *BlogsViewMVCRenderCommand* 은 / 및 /blogs/view 모두에 대해 */blogs/view.jsp* 에 대한 디스패치를 처리합니다.

## view.jsp

`liferay-portal/modules/apps/blogs/blogs-web/src/main/resources
/META-INF/resources/blogs/view.jsp`

블로그 위젯의 UI에 대한 기본 진입점을 제공합니다. 웹 응용 프로그램 개발 자습서에는 일부 엔트리 레벨 JSP 개발에 대한 좋은 예가 있습니다.

## 자산 렌더러

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/asset/model`

자산 렌더러는 자산 프레임워크의 일부이며 자산 게시를 사용하여 자산을 렌더링하는 데 사용됩니다.

## 패널 엔트리

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/application/list/BlogsPanelApp.java`

패널 항목을 사용하면 제품 메뉴에 위젯을 추가하여 프로젝트가 관리 보기를 가질 수 있습니다.

## 설정

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/configuration/BlogsPortletInstanceConfiguration.java`

구성 요소를 사용하여 구성 가능한 매개변수를 시스템 설정에 추가합니다. 이를 통해 즉시 사용 가능한 기능을 사용하여 프로젝트를 쉽게 구성할 수 있습니다.

## 일정잡이

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/messaging/CheckEntryMessageListener.java`

모든 애플리케이션에 예약된 작업을 추가합니다. 애플리케이션 내에서 주기적으로 실행해야 하는 것이 있는 경우에 유용합니다.

## 친절한 URL

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/portlet/route/BlogsFriendlyURLMapper.java`

친숙한 URL을 사용하면 애플리케이션이 렌더링 및 작업 URL에 보다 SEO 친화적인 URL을 사용할 수 있습니다.

## 동적 포함

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/servlet/taglib/BlogsPortletHeaderJSPDynamicInclude.java`

동적 포함은 Fragment 번들 없이도 UI 사용자 정의를 허용하므로 업그레이드하기가 더 쉽습니다.

## Widget Templates

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/template/BlogsPortletDisplayTemplateHandler.java`

애플리케이션 표시 템플릿을 사용하면 표준 JSP를 사용하는 대신 Freemarker 템플릿을 사용할 수 있습니다. 이렇게 하면 ADT가 JSP를 직접 사용자 지정하는 것보다 업그레이드하기 쉽습니다.

## 애플리케이션 디스플레이 템플릿 샘플

`/Users/jamie/Repos/liferay-portal/modules/apps/blogs/blogs-web/src/main/resources/
com/liferay/blogs/web/template/dependencies/portlet_display_template_basic.ftl`

즉시 사용할 수 있는 많은 응용 프로그램은 기본 응용 프로그램 표시 템플릿과 함께 제공되므로 사용을 훨씬 쉽게 시작할 수 있습니다. 예를 들어 블로그 위젯은 블로그 항목을 나열하는 기본 템플릿과 함께 제공되며 JSP와 유사합니다.

이들은 블로그 위젯에서 사용 중인 몇 가지 프레임워크에 불과합니다. 코드 전체에 더 많은 것이 있습니다. 모듈 아래에 있는 대부분의 다른 위젯도 이와 동일한 패턴을 사용합니다. 따라서 하나의 위젯이 구성되는 방식을 배우면 누구나 저장소에서 대부분의 코드가 구성되는 방식을 이해할 수 있습니다.