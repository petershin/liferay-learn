# 포틀릿 필터로 포틀릿 활동 감사

포틀릿 필터는 각 [포틀릿 요청 처리 단계](../../../building-applications/developing-a-java-web-application/reference/portlets.md#portlet-phases) 이 시작될 때 요청과 응답을 가로채므로 거기에 기능을 추가할 수 있습니다. 따라서 렌더링, 작업, 이벤트 및 리소스 제공 단계 동안 포틀릿 활동을 감사하는 데 유용합니다.

포틀릿 활동 감사를 위한 포틀릿 필터를 생성하려면 다음 단계를 따르십시오.

1. 전체 이름으로 대상 포틀릿을 식별합니다(예: `com_liferay_blogs_web_portlet_BlogsPortlet`).

1. [`javax.portlet.filter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/package-summary.html) 패키지에서 해당 포틀릿 필터 인터페이스를 감사하고 구현하려는 포틀릿 단계를 결정합니다.

   * 동작 단계 - [`ActionFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/ActionFilter.html)
   * 이벤트 단계 - [`EventFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/EventFilter.html)
   * 렌더링 단계 - [`RenderFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/RenderFilter.html)
   * 리소스 제공 단계 - [`ResourceFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/ResourceFilter.html)

   각 포틀릿 단계에 대한 자세한 내용은 [포틀릿](../../../building-applications/developing-a-java-web-application/reference/portlets.md#portlet-phases) 을 참조하십시오.

1. `@Component` 주석을 사용하여 포틀릿 필터를 OSGi 프레임워크 내의 구성 요소로 선언하고 이를 `PortletFilter.class` 서비스로 식별합니다.

   ```{note}
   포틀릿 필터는 [OSGi 선언적 서비스(DS) 구성 요소](https://enroute.osgi.org/FAQ/300-declarative-services.html)입니다. 필터는 `portlet.xml` 설명자 또는 `@PortletLifecycleFilter` 주석을 사용하여 포틀릿에 적용할 수도 있습니다. 자세한 내용은 Portlet 3.0 사양을 참조하십시오.
   ```

1. `@Component` 선언에 다음 속성을 입력합니다.

   * `"javax.portlet.name=[portlet_Name]"`: 이 속성은 필터의 대상 포틀릿을 설정합니다.
   * `"service.ranking:Integer=100"`: 이 속성은 더 높은 정수가 먼저 실행되는 필터의 순위를 설정합니다. 가장 높은 순위를 할당하여 필터 체인의 시작 부분에서 필터가 시작되도록 합니다.

1. 필터의 `doFilter` 메소드를 재정의하여 포틀릿 단계의 원하는 측면을 감사합니다.

다음 예제에서는 `RenderFilter` 을 사용하여 블로그 포틀릿의 렌더링 단계를 감사합니다.

## 샘플 포틀릿 필터 배포
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these step to download, build, and deploy the sample Portlet Filter to the new docker container:

1. Download and unzip the example module.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-b4k8.zip -O
   ```

   ```bash
   unzip liferay-b4k8.zip
   ```

1. 다음 `gradlew` 명령을 실행하여 JAR 파일을 빌드하고 새 Docker 컨테이너에 배포합니다.

   ```bash
   cd liferay-b4k8
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   JAR은 `build/libs` 폴더(예: `b4k8-impl/build/libs/com.acme.b4k8.impl-1.0.0.jar`)에 생성됩니다.

1. 컨테이너 콘솔을 통해 모듈이 성공적으로 배포되고 시작되었는지 확인합니다.

   ```
   Processing com.acme.b4k8.impl-1.0.0.jar
   STARTED com.acme.b4k8.impl_1.0.0 [1656]
   ```

1. 블로그 위젯을 사이트 페이지에 추가하여 포틀릿 필터가 작동하는지 확인하십시오.

   Blogs 포틀릿에 대한 렌더링 요청이 있을 때마다 컨테이너 콘솔은 렌더링 시간, 평균 렌더링 시간 및 총 렌더링 수에 대한 감사와 함께 경고 메시지를 표시합니다.

   ```
   WARN [http-nio-8080-exec-2][B4K8PortletFilter:54] Blogs portlet rendered in 3 ms with an average of 3 ms out of 1 renders.
   WARN [http-nio-8080-exec-10][B4K8PortletFilter:54] Blogs portlet rendered in 0 ms with an average of 1 ms out of 2 renders.
   ```

## 샘플 렌더 필터 코드

제공된 샘플 필터는 Blogs 포틀릿을 대상으로 하고 `RenderFilter` 인터페이스를 사용하여 렌더링 단계를 감사합니다.

```java
@Component(
   property = {
      "javax.portlet.name=com_liferay_blogs_web_portlet_BlogsPortlet",
      "service.ranking:Integer=100"
   },
   service = PortletFilter.class
)
public class B4K8PortletFilter implements RenderFilter {

   @Override
   public void destroy() {
   }

   @Override
   public void doFilter(
         RenderRequest renderRequest, RenderResponse renderResponse,
         FilterChain filterChain)
      throws IOException, PortletException {

      long startTime = System.currentTimeMillis();

      filterChain.doFilter(renderRequest, renderResponse);

      long renderTime = (System.currentTimeMillis() - startTime) / 1000;

      _totalTime.add(renderTime);

      _count.increment();

      if (_log.isWarnEnabled()) {
         long count = _count.longValue();

         long averageRenderTime = _totalTime.longValue() / count;

         _log.warn(
            "Blogs portlet rendered in " + renderTime +
               " ms with an average of " + averageRenderTime +
                  " ms out of " + count + " renders.");
      }
   }

   @Override
   public void init(FilterConfig filterConfig) throws PortletException {
   }

   private static final Log _log = LogFactoryUtil.getLog(
      B4K8PortletFilter.class);

   private final LongAdder _count = new LongAdder();
   private final LongAdder _totalTime = new LongAdder();

}
```

이 코드에서 필터는 먼저 OSGi DS 구성 요소로 선언되고 `PortletFilter.class` 서비스로 식별됩니다. 이 선언의 일부로 두 가지 속성도 설정합니다. 첫 번째 속성은 `BlogsPortlet`을 대상으로 하고 두 번째 속성은 우선 순위를 `100`으로 설정합니다.

포틀릿 필터는 [`PortletFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/PortletFilter.html) 인터페이스를 확장하는 [`RenderFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/RenderFilter.html) 인터페이스 구현을 진행합니다. 이 인터페이스에는 세 가지 메소드(예: `init`, `destroy`, `doFilter`)가 포함되어 있으며 Blogs 포틀릿에 대한 렌더링 요청과 해당 응답 모두에서 필터링 작업을 수행합니다.

* `init`: 포틀릿 필터가 Liferay에 처음 배포되고 포틀릿 컨테이너 내에서 초기화될 때 호출됩니다.

* `destroy`: 서비스에서 포틀릿 필터를 제거하기 위해 호출됩니다.

* `doFilter`: 렌더링 요청/응답 쌍이 클라이언트 요청으로 인해 체인을 통해 전달될 때마다 포틀릿 컨테이너에 의해 호출됩니다.

   이 예에서 `doFilter` 은 다음과 같은 방법으로 블로그 포틀릿을 감사합니다.

   1. 렌더링 단계 시작 시간을 기록합니다.

      ```java
      long startTime = System.currentTimeMillis();
      ```

   1. `FilterChain` 에 대해 `doFilter` 메서드를 실행하여 체인에서 모든 `RenderFilter` 를 호출합니다.

      ```java
      filterChain.doFilter(renderRequest, renderResponse);
      ```

   1. 블로그 포틀릿이 렌더링 단계를 완료하는 데 걸리는 시간을 계산합니다.

      ```java
      long renderTime = (System.currentTimeMillis() - startTime) / 1000;
      ```

   1. 모든 렌더링의 총 시간에 현재 렌더링 시간을 더합니다.

      ```java
      _totalTime.add(renderTime);
      ```

   1. 총 포틀릿 렌더링 수를 늘립니다.

      ```java
      _count.increment();
      ```

   1. `LongAdder` 유틸리티를 사용하여 포틀릿의 평균 렌더링 시간과 총 렌더링 수를 저장한 다음 로그 유틸리티를 사용하여 포틀릿의 현재 렌더링 시간과 함께 이러한 값을 표시합니다.

      ```java
      if (_log.isWarnEnabled()) {
         long count = _count.longValue();

         long averageRenderTime = _totalTime.longValue() / count;

         _log.warn(
            "Blogs portlet rendered in " + renderTime +
               " ms with an average of " + averageRenderTime +
                  " ms out of " + count + " renders.");
      }
      ```

   렌더링 요청이 있을 때마다 이 `doFilter` 이 호출됩니다.

## 추가 정보

* [포틀릿](../../../building-applications/developing-a-java-web-application/reference/portlets.md)
<!--TASK: Add link to Using Portlet Filters article when finished -->
