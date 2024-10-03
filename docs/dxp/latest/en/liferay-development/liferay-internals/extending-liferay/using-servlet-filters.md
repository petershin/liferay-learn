---
uuid: 077d03b0-b1fc-4d14-8180-8acc0300b522
---

# Using Servlet Filters

Servlet filters can both pre-process requests as they arrive and post-process responses before they go to the client browser. They let you apply functionality to requests and responses for multiple servlets, without the servlets knowing. Here are some common filter use cases:

- Logging
- Auditing
- Transaction management
- Security

You can use patterns in descriptors to map the filters to servlet URLs. When requests arrive at these URLs, your filters process them. Filter chaining lets you apply filters in an order you want. Here are the steps for creating and deploying a servlet filter:

## Deploying a Servlet Filter

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to download, build, and deploy the sample Servlet Filter to the new docker container:

1. Download and unzip the example module.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-development/liferay-internals/extending-liferay/liferay-m9a3.zip -O
   ```

   ```bash
   unzip liferay-m9a3.zip
   ```

1. Run the following `gradlew` command to build the JAR file and deploy it to your new Docker container:

   ```bash
   cd liferay-m9a3
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Confirm the module was successfully deployed and started via the container console.

   ```
   STARTED com.acme.m9a3.impl_1.0.0 [1630]
   ```

1. Verify the portlet filter is working by visiting `localhost:8080`. Whenever a request is forwarded to the servlet, the container console shows a message stating that the method was successfully invoked.

   ```
   INFO  [http-nio-8080-exec-6][M9A3ServletFilter:37] Invoking #processFilter(HttpServletRequest, HttpServletResponse, FilterChain)
   ```

## Intercepting Requests with a Servlet Filter

Any time a request is made to the chosen servlets, the servlet filter intercepts the request and calls the `processFilter` method.

1. To make your own servlet filter, create a class that extends `com.liferay.portal.kernel.servlet.BaseFilter`.

   ```java
   public class M9A3ServletFilter extends BaseFilter {
   ```

1. Override the `processFilter` method to add the desired functionality. In this example, the filter outputs a message to the console to assert that it's been called.

   ```{literalinclude} ./using-servlet-filters/resources/liferay-m9a3.zip/m9a3-impl/src/main/java/com/acme/m9a3/internal/servlet/filter/M9A3ServletFilter.java
       :dedent: 1
       :language: java
       :lines: 30-48
   ```

1. In the `processFilter` method, make sure to also add a header to the HTTP response. You can use any text for the string as long as it's not already the name of an existing header. This works as a key.

   ```{literalinclude} ./using-servlet-filters/resources/liferay-m9a3.zip/m9a3-impl/src/main/java/com/acme/m9a3/internal/servlet/filter/M9A3ServletFilter.java
       :dedent: 2
       :language: java
       :lines: 42-43
   ```

1. After that, you generally want the HTTP request to go through the next filters and finish being processed. To continue processing the request, call `BaseFilter`'s `processFilter` method:

   ```{literalinclude} ./using-servlet-filters/resources/liferay-m9a3.zip/m9a3-impl/src/main/java/com/acme/m9a3/internal/servlet/filter/M9A3ServletFilter.java
       :dedent: 2
       :language: java
       :lines: 45-47
   ```

1. Annotate the class with `@Component`. You need two arguments: `service` and `property`. For a servlet filter, the `service` argument must be set to `Filter.class`. The `property` argument holds a list of URLs to be mapped to the servlet filter as well as other options specific to servlet filters.

   - `url-pattern`: URL patterns you want to filter requests and responses for (required)

   - `dispatcher`: Dispatcher enumerated constants to constrain how the filter is applied to requests (optional)

   !!! note
       You can add many dispatchers to one filter.

   - `servlet-filter-name`: Human readable name to identify the servlet filter (required)

   - `before-filter` and `after-filter`: The filter that should be run before the custom filter you're creating and the filter that should be run after, respectively (optional)

   !!! tip
       Whenever you alter the order of servlet filters, it's recommended to set the `after-filter` to `Absolute Redirects Filter`. This lowers the risk of various bugs.

   - `servlet-context-name`: (required)

   ```{literalinclude} ./using-servlet-filters/resources/liferay-m9a3.zip/m9a3-impl/src/main/java/com/acme/m9a3/internal/servlet/filter/M9A3ServletFilter.java
       :dedent: 2
       :language: java
       :lines: 14-23
   ```

## Related Topics

- [Servlets](../../core-frameworks/servlets.md)