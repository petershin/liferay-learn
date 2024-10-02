---
uuid: a8dd9eb8-f44a-4cc3-8425-1685472c0119
---
# Using Portlet Filters

Portlet filters intercept requests and responses at the start of each [portlet request processing phase](../../building-applications/developing-a-java-web-application/reference/portlets.md#portlet-phases) so you can add functionality there. This makes them useful for auditing portlet activities, transforming content, adding or modifying request and response attributes, suspending portlet phases to get user inputs, and more.

Follow these steps to create portlet filters:

1. Identify the target portlet by its full name (e.g., `com_liferay_blogs_web_portlet_BlogsPortlet`).

1. Determine the portlet phase you want to intercept and implement the corresponding portlet filter interface from the [`javax.portlet.filter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/package-summary.html) package.

   - Action Phase - [`ActionFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/ActionFilter.html)
   - Event Phase - [`EventFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/EventFilter.html)
   - Render Phase - [`RenderFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/RenderFilter.html)
   - Resource Serving Phase - [`ResourceFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/ResourceFilter.html)

   See [Portlets](../../building-applications/developing-a-java-web-application/reference/portlets.md#portlet-phases) for more information about each portlet phase.

1. Declare the portlet filter a Component within the OSGi framework using the `@Component` annotation and identify it as a `PortletFilter.class` service.

   !!! note
       Portlet filters are [OSGi Declarative Service (DS) Components](https://enroute.osgi.org/FAQ/300-declarative-services.html). Filters can also be applied to a portlet using a `portlet.xml` descriptor or a `@PortletLifecycleFilter` annotation.

1. Enter the following properties into the `@Component` declaration.

   - `"javax.portlet.name=[portlet_name]"`: This property sets the filter's target portlet.
   - `"service.ranking:Integer=[priority]"`: This property sets the filter's ranking, with the higher integers executing first. Ensure the filter starts up at the beginning of the filter chain by assigning it the highest ranking.

1. Override the filter's `doFilter` method to add the desired functionality.

The following example uses a `RenderFilter` to audit the render phase for the Blogs portlet.

## Deploying the Sample Portlet Filter

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to download, build, and deploy the sample Portlet Filter to the new docker container:

1. Download and unzip the example module.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-development/liferay-internals/extending-liferay/liferay-b4k8.zip -O
   ```

   ```bash
   unzip liferay-b4k8.zip
   ```

1. Run the following `gradlew` command to build the JAR file and deploy it to your new Docker container:

   ```bash
   cd liferay-b4k8
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   The JAR is generated in the `build/libs` folder (i.e., `b4k8-impl/build/libs/com.acme.b4k8.impl-1.0.0.jar`).

1. Confirm the module was successfully deployed and started via the container console.

   ```
   Processing com.acme.b4k8.impl-1.0.0.jar
   STARTED com.acme.b4k8.impl_1.0.0 [1656]
   ```

1. Verify the portlet filter is working by adding the Blogs widget to a Site Page.

   Whenever a render request is made to the Blogs portlet, the container console shows a warning message with an audit of its render time, average render time, and total number of renders.

   ```
   WARN [http-nio-8080-exec-2][B4K8PortletFilter:54] Blogs portlet rendered in 3 ms with an average of 3 ms out of 1 renders.
   WARN [http-nio-8080-exec-10][B4K8PortletFilter:54] Blogs portlet rendered in 0 ms with an average of 1 ms out of 2 renders.
   ```

## Auditing a Portlet's Render Phase with a Portlet Filter

The provided sample filter targets the Blogs portlet and audits its render phase using the `RenderFilter` interface.

```{literalinclude} ./using-portlet-filters/resources/liferay-b4k8.zip/b4k8-impl/src/main/java/com/acme/b4k8/internal/portlet/filter/B4K8PortletFilter.java
    :language: java
    :lines: 20-71
```

In this code, the filter is first declared an OSGi DS Component and identified as a `PortletFilter.class` service. As part of this declaration, it also sets two properties: the first property targets the `BlogsPortlet`, and the second property sets its priority to `100`.

The portlet filter proceeds to implement the [`RenderFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/RenderFilter.html) interface, which extends the [`PortletFilter`](http://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/filter/PortletFilter.html) interface. This interface includes three methods (i.e., `init`, `destroy`, `doFilter`) and performs its filtering tasks on both the render request to the Blogs portlet and its response.

- `init`: Called when the portlet filter is first deployed to Liferay and initialized within the portlet container.

- `destroy`: Called to remove the portlet filter from service.

- `doFilter`: Called by the portlet container each time a render request/response pair is passed through the chain due to a client request.

   In this example, `doFilter` audits the Blogs portlet in the following ways:

   1. Notes the render phase start time.

      ```java
      long startTime = System.currentTimeMillis();
      ```

   1. Executes the `doFilter` method for the `FilterChain` to invoke every `RenderFilter` in the chain.

      ```java
      filterChain.doFilter(renderRequest, renderResponse);
      ```

   1. Calculates the time it takes for the Blogs portlet to complete the render phase.

      ```java
      long renderTime = (System.currentTimeMillis() - startTime) / 1000;
      ```

   1. Adds the current render time to the total time of all renders.

      ```java
      _totalTime.add(renderTime);
      ```

   1. Increments the total number of portlet renders.

      ```java
      _count.increment();
      ```

   1. Uses the `LongAdder` utility to store the portlet's average render time and total number of renders, and then uses the Log utility to display these values along with the portlet's current render time.

      ```{literalinclude} ./using-portlet-filters/resources/liferay-b4k8.zip/b4k8-impl/src/main/java/com/acme/b4k8/internal/portlet/filter/B4K8PortletFilter.java
          :dedent: 2
          :language: java
          :lines: 49-58
      ```

   Whenever a render request is made, this `doFilter` is called.

## Related Topics

- [Portlets](../../building-applications/developing-a-java-web-application/reference/portlets.md)
