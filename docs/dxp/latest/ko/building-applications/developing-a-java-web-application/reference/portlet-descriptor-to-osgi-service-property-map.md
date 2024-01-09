# OSGi 서비스 속성 맵에 대한 포틀릿 설명자

다음은 OSGi 포틀릿을 게시하기 위한 OSGi 서비스 속성에 대한 포틀릿 XML 설명자 값의 맵입니다. 속성은 포틀릿 구성을 중앙 집중화하고 단순화합니다. 일반적으로 키-값 쌍으로 표시되거나 더 일반적으로 지도와 같은 객체로 표시됩니다.

속성 키는 본질적으로 XML 설명자를 평면화하지만 설명자 이름과 유사합니다.

매핑은 설명자 유형별로 구성됩니다.

* [표준 포틀릿 설명자](#portlet-descriptor-mappings) . 속성 키는 다음 접두사를 사용합니다. `javax.portlet.`

* [Liferay 설명자 설명자](#liferay-descriptor-mappings) . 속성 키는 다음 접두사를 사용합니다. `com.liferay.portlet.` Liferay 설명자는 설명자 파일 이름별로 추가로 그룹화됩니다.

    * `liferay-display.xml`
    * `liferay-portlet.xml`

표준 포틀릿 설명자 매핑이 첫 번째입니다.

## 포틀릿 설명자 매핑

**참고: 단순성을 위해** Portlet XSD [**4](#four) 에서 파생된** XPath 표기법이 사용됩니다.

| portlet.xml XPath                                                                                             | OSGi 포틀릿 서비스 속성                                                                                                                                                    |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `/portlet-app/container-runtime-option`                                                                       | portlet-app 범위에 대해 지원되지 않음                                                                                                                                         |
| `/portlet-app/custom-portlet-mode`                                                                            | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/custom-window-state`                                                                            | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/default-namespace`                                                                              | `javax.portlet.default-namespace=<String>`                                                                                                                   |
| `/portlet-app/event-definition`                                                                               | `javax.portlet.event-definition=<QNameLocalPart>;<QNameURI>[;<PayloadType>][,<AliasQNameLocalPart>;<AliasQNameURI>]` [2](#two)       |
| `/portlet-app/filter`<br/>`/portlet-app/filter/init-param/name`<br/>`/portlet-app/filter-mapping` | [3](#three) <br/>`javax.portlet.init-param.<name>=<value>` [3](#three) , [9](#nine) <br/> [3](#three)                                          |
| `/portlet-app/public-render-parameter`                                                                        | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/resource-bundle`                                                                                | portlet-app 범위에 대해 지원되지 않음                                                                                                                                         |
| `/portlet-app/security-constraint`                                                                            | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/user-attribute`                                                                                 | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/version`                                                                                        | `javax.portlet.version=<value>`                                                                                                                              |
| `/portlet-app/portlet/async-supported`                                                                        | `javax.portlet.async-supported=<boolean>`                                                                                                                    |
| `/portlet-app/portlet/cache-scope`                                                                            | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/portlet/container-runtime-option`                                                               | `javax.portlet.container-runtime-option.<name>=<value>` [2](#two)                                                                                      |
| `/portlet-app/portlet/dependency`                                                                             | `javax.portlet.dependency=<name>;<scope>;<version>` [2](#two) , [6](#six)                                                                         |
| `/portlet-app/portlet/description`                                                                            | `javax.portlet.description=<String>`                                                                                                                         |
| `/portlet-app/portlet/display-name`                                                                           | `javax.portlet.display-name=<String>`                                                                                                                        |
| `/portlet-app/portlet/expiration-cache`                                                                       | `javax.portlet.expiration-cache=<int>`                                                                                                                       |
| `/portlet-app/portlet/init-param/name`                                                                        | `javax.portlet.init-param.<name>=<value>`                                                                                                              |
| `/portlet-app/portlet/listener`                                                                               | `javax.portlet.listener=<listener-class>;<ordinal>` [2](#two) , [8](#eight)                                                                              |
| `/portlet-app/portlet/multipart-config/file-size-threshold`                                                   | `javax.portlet.multipart.file-size-threshold=<Integer>`                                                                                                      |
| `/portlet-app/portlet/multipart-config/location`                                                              | `javax.portlet.multipart.location=<String>`                                                                                                                  |
| `/portlet-app/portlet/multipart-config/max-file-size`                                                         | `javax.portlet.multipart.max-file-size=<Long>`                                                                                                               |
| `/portlet-app/portlet/multipart-config/max-request-size`                                                      | `javax.portlet.multipart.max-request-size=<Long>`                                                                                                            |
| `/portlet-app/portlet/portlet-class`                                                                          | [1](#one)                                                                                                                                                          |
| `/portlet-app/portlet/portlet-info/keywords`                                                                  | `javax.portlet.info.keywords=<String>`                                                                                                                       |
| `/portlet-app/portlet/portlet-info/short-title`                                                               | `javax.portlet.info.short-title=<String>`                                                                                                                    |
| `/portlet-app/portlet/portlet-info/title`                                                                     | `javax.portlet.info.title=<String>`                                                                                                                          |
| `/portlet-app/portlet/portlet-이름` [10](#ten)                                                                  | `javax.portlet.name=<String>` [10](#ten)                                                                                                                     |
| `/portlet-app/portlet/portlet-preferences`                                                                    | `javax.portlet.preferences=<String>`<br/>OR<br/>`javax.portlet.preferences=classpath:<path_to_file_in_jar>`                                |
| `/portlet-app/portlet/portlet-preferences/preferences-validator`                                              | `javax.portlet.preferences-validator=<String>` [1](#one)                                                                                                     |
| `/portlet-app/portlet/resource-bundle`                                                                        | `javax.portlet.resource-bundle=<String>`                                                                                                                     |
| `/portlet-app/portlet/security-role-ref`                                                                      | `javax.portlet.security-role-ref=<String>[,<String>]` [2](#two)                                                                                         |
| `/portlet-app/portlet/supported-locale`                                                                       | `javax.portlet.supported-locale=<String>` [2](#two)                                                                                                          |
| `/portlet-app/portlet/supported-processing-event`                                                             | `javax.portlet.supported-processing-event=<QNameLocalPart>` 또는 `javax.portlet.supported-processing-event=<QNameLocalPart>;<QNameURI>`  [2](#two) |
| `/portlet-app/portlet/supported-public-render-parameter`                                                      | `javax.portlet.supported-public-render-parameter=<String>` [2](#two)                                                                                          |
| `/portlet-app/portlet/supported-publishing-event`                                                             | `javax.portlet.supported-publishing-event=<QNameLocalPart>` OR `javax.portlet.supported-publishing-event=<QNameLocalPart>;<QNameURI>` [2](#two)  |
| `/portlet-app/portlet/supports/mime-type`                                                                     | 지원되지 않음                                                                                                                                                            |
| `/portlet-app/portlet/supports/portlet-mode`                                                                  | `javax.portlet.portlet-mode=<mime-type>;<portlet-mode>[,<portlet-mode>]*`                                                                        |
| `/portlet-app/portlet/supports/window-state`                                                                  | `javax.portlet.window-state=<mime-type>;<window-state>[,<window-state>]*`                                                                        |

## Liferay 설명자 매핑

### 라이프레이 디스플레이

| liferay-display.xml XPath  | OSGi 포틀릿 서비스 속성                                      |
| -------------------------- | ---------------------------------------------------- |
| `/display/category[@name]` | `com.liferay.portlet.display-category=<value>` |

### 라이프레이 포틀릿

**참고: 단순화를 위해** Liferay Portlet [**5](#five) 에서 파생된** XPath 표기법이 사용됩니다.

| liferay-portlet.xml XPath                                            | OSGi Liferay 포틀릿 서비스 속성                                                                                                |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `/liferay-portlet-app/portlet/action-timeout`                        | `com.liferay.portlet.action-timeout=<int>`                                                                       |
| `/liferay-portlet-app/portlet/action-url-redirect`                   | `com.liferay.portlet.action-url-redirect=<boolean>`                                                              |
| `/liferay-portlet-app/portlet/active`                                | `com.liferay.portlet.active=<boolean>`                                                                           |
| `/liferay-portlet-app/portlet/add-default-resource`                  | `com.liferay.portlet.add-default-resource=<boolean>`                                                             |
| `/liferay-portlet-app/portlet/ajaxable`                              | `com.liferay.portlet.ajaxable=<boolean>`                                                                         |
| `/liferay-portlet-app/portlet/application-type`                      | `com.liferay.portlet.application-type=full-page-application` 또는 `com.liferay.portlet.application-type=widget` [2](#two) |
| `/liferay-portlet-app/portlet/asset-renderer-factory`                | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/atom-collection-adapter`               | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/autopropagated-parameters`             | `com.liferay.portlet.autopropagated-parameters=<String>` [2](#two)                                                |
| `/liferay-portlet-app/portlet/configuration-action-class`            | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/configuration-path`                    | 지원되지 않음                                                                                                                |
| `/liferay-portlet-app/portlet/control-panel-entry-category`          | `com.liferay.portlet.control-panel-entry-category=<String>`                                                      |
| `/liferay-portlet-app/portlet/control-panel-entry-class`             | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/control-panel-entry-weight`            | `com.liferay.portlet.control-panel-entry-weight=<double>`                                                        |
| `/liferay-portlet-app/portlet/css-class-wrapper`                     | `com.liferay.portlet.css-class-wrapper=<String>`                                                                 |
| `/liferay-portlet-app/portlet/custom-attributes-display`             | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/ddm-display`                           | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/facebook-integration`                  | 지원되지 않음                                                                                                                |
| `/liferay-portlet-app/portlet/footer-portal-css`                     | `com.liferay.portlet.footer-portal-css=<String>` [2](#two)                                                        |
| `/liferay-portlet-app/portlet/footer-portal-javascript`              | `com.liferay.portlet.footer-portal-javascript=<String>` [2](#two)                                                 |
| `/liferay-portlet-app/portlet/footer-portlet-css`                    | `com.liferay.portlet.footer-portlet-css=<String>` [2](#two)                                                       |
| `/liferay-portlet-app/portlet/footer-portlet-javascript`             | `com.liferay.portlet.footer-portlet-javascript=<String>` [2](#two)                                                |
| `/liferay-portlet-app/portlet/friendly-url-mapper-class`             | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/friendly-url-mapping`                  | `com.liferay.portlet.friendly-url-mapping=<String>`                                                              |
| `/liferay-portlet-app/portlet/friendly-url-routes`                   | `com.liferay.portlet.friendly-url-routes=<String>`                                                               |
| `/liferay-portlet-app/portlet/header-portal-css`                     | `com.liferay.portlet.header-portal-css=<String>` [2](#two)                                                        |
| `/liferay-portlet-app/portlet/header-portal-javascript`              | `com.liferay.portlet.header-portal-javascript=<String>` [2](#two)                                                 |
| `/liferay-portlet-app/portlet/header-portlet-css`                    | `com.liferay.portlet.header-portlet-css=<String>` [2](#two)                                                       |
| `/liferay-portlet-app/portlet/header-portlet-javascript`             | `com.liferay.portlet.header-portlet-javascript=<String>` [2](#two)                                                |
| `/liferay-portlet-app/portlet/header-request-attribute-prefix`       | `com.liferay.portlet.header-request-attribute-prefix=<String>` [7](#seven)                                       |
| `/liferay-portlet-app/portlet/header-timeout`                        | `header-timeout=<int>`                                                                                           |
| `/liferay-portlet-app/portlet/icon`                                  | `com.liferay.portlet.icon=<String>`                                                                              |
| `/liferay-portlet-app/portlet/include`                               | `com.liferay.portlet.include=<boolean>`                                                                          |
| `/liferay-portlet-app/portlet/indexer-class`                         | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/instanceable`                          | `com.liferay.portlet.instanceable=<boolean>`                                                                     |
| `/liferay-portlet-app/portlet/layout-cacheable`                      | `com.liferay.portlet.layout-cacheable=<boolean>`                                                                 |
| `/liferay-portlet-app/portlet/maximize-edit`                         | `com.liferay.portlet.maximize-edit=<boolean>`                                                                    |
| `/liferay-portlet-app/portlet/maximize-help`                         | `com.liferay.portlet.maximize-help=<boolean>`                                                                    |
| `/liferay-portlet-app/portlet/open-search-class`                     | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/parent-struts-path`                    | `com.liferay.portlet.parent-struts-path=<String>`                                                                |
| `/liferay-portlet-app/portlet/partial-action-serve-resource`         | `com.liferay.portlet.partial-action-serve-resource=<boolean>`                                                    |
| `/liferay-portlet-app/portlet/permission-propagator`                 | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/poller-processor-class`                | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/pop-message-listener-class`            | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/pop-up-print`                          | `com.liferay.portlet.pop-up-print=<boolean>`                                                                     |
| `/liferay-portlet-app/portlet/portlet-data-handler-class`            | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/portlet-dependency-css-enabled`        | `com.liferay.portlet.portlet-dependency-css-enabled=<boolean>`                                                   |
| `/liferay-portlet-app/portlet/portlet-dependency-javascript-enabled` | `com.liferay.portlet.dependency-javascript-enabled=<boolean>`                                                    |
| `/liferay-portlet-app/portlet/portlet-layout-listener-class`         | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/portlet-name`                          | 지원되지 않음                                                                                                                |
| `/liferay-portlet-app/portlet/portlet-url-class`                     | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/preferences-company-wide`              | `com.liferay.portlet.preferences-company-wide=<boolean>`                                                         |
| `/liferay-portlet-app/portlet/preferences-owned-by-group`            | `com.liferay.portlet.preferences-owned-by-group=<boolean>`                                                       |
| `/liferay-portlet-app/portlet/preferences-unique-per-layout`         | `com.liferay.portlet.preferences-unique-per-layout=<boolean>`                                                    |
| `/liferay-portlet-app/portlet/private-request-attributes`            | `com.liferay.portlet.private-request-attributes=<boolean>`                                                       |
| `/liferay-portlet-app/portlet/private-session-attributes`            | `com.liferay.portlet.private-session-attributes=<boolean>`                                                       |
| `/liferay-portlet-app/portlet/remoteable`                            | 지원되지 않음                                                                                                                |
| `/liferay-portlet-app/portlet/render-timeout`                        | `com.liferay.portlet.render-timeout=<int>`                                                                       |
| `/liferay-portlet-app/portlet/render-weight`                         | `com.liferay.portlet.render-weight=<int>`                                                                        |
| `/liferay-portlet-app/portlet/requires-namespaced-parameters`        | `com.liferay.portlet.requires-namespaced-parameters=<boolean>`                                                   |
| `/liferay-portlet-app/portlet/restore-current-view`                  | `com.liferay.portlet.restore-current-view=<boolean>`                                                             |
| `/liferay-portlet-app/portlet/scheduler-entry`                       | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/scopeable`                             | `com.liferay.portlet.scopeable=<boolean>`                                                                        |
| `/liferay-portlet-app/portlet/show-portlet-access-denied`            | `com.liferay.portlet.show-portlet-access-denied=<boolean>`                                                       |
| `/liferay-portlet-app/portlet/show-portlet-inactive`                 | `com.liferay.portlet.show-portlet-inactive=<boolean>`                                                            |
| `/liferay-portlet-app/portlet/single-page-application`               | `com.liferay.portlet.single-page-application=<boolean>`                                                          |
| `/liferay-portlet-app/portlet/social-activity-interpreter-class`     | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/social-request-interpreter-class`      | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/social-interactions-configuration`     | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/staged-model-data-handler-class`       | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/struts-path`                           | `com.liferay.portlet.struts-path=<String>`                                                                       |
| `/liferay-portlet-app/portlet/system`                                | `com.liferay.portlet.system=<boolean>`                                                                           |
| `/liferay-portlet-app/portlet/template-handler`                      | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/trash-handler`                         | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/url-encoder-class`                     | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/use-default-template`                  | `com.liferay.portlet.use-default-template=<boolean>`                                                             |
| `/liferay-portlet-app/portlet/user-notification-definitions`         | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/user-notification-handler-class`       | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/user-principal-strategy`               | `com.liferay.portlet.user-principal-strategy=<String>`                                                           |
| `/liferay-portlet-app/portlet/virtual-path`                          | `com.liferay.portlet.virtual-path=<String>`                                                                      |
| `/liferay-portlet-app/portlet/webdav-storage-class`                  | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/webdav-storage-token`                  | `webdav-storage-token=<string>` WebDavStorage OSGi 서비스 속성에 선언됨                                                   |
| `/liferay-portlet-app/portlet/workflow-handler`                      | [삼](#three)                                                                                                            |
| `/liferay-portlet-app/portlet/xml-rpc-method-class`                  | [삼](#three)                                                                                                            |

* [<a name="one">1</a>] 포틀릿은 구체적인 객체로 등록됩니다.
* [<a name="two">2</a>] 이러한 속성의 배수를 사용할 수 있습니다. 그 결과 값의 배열이 생성됩니다.
* [<a name="three">3</a>] 이 유형은 OSGi 서비스로 등록됩니다.
* [<a name="four">4</a>] [https://xmlns.jcp.org/xml/ns/portlet/portlet-app_3_0.xsd](https://xmlns.jcp.org/xml/ns/portlet/portlet-app_3_0.xsd)
* [<a name="five">5</a>] [`liferay-portlet-app_ [version].dtd`](https://resources.learn.liferay.com/reference/latest/en/dxp/definitions/index.html)
* [<a name="six">6</a>] 다음은 여러 개의 `javax.portlet.dependency` 속성을 사용하는 예입니다.

    **낡은:**

    ```xml
    <portlet>
        ...
        <dependency>
            <name>jquery</name>
            <scope>com.jquery</scope>
            <version>2.1.1</version>
        </dependency>
        <dependency>
            <name>jsutil</name>
            <scope>com.mycompany</scope>
            <version>1.0.0</version>
        </dependency>
        ...
    </portlet>
    ```

    **새로운:**

    ```java
    @Component(
        ...
        property = {
            ...
            "javax.portlet.dependency=jquery;com.jquery;2.1.1",
            "javax.portlet.dependency=jsutil;com.mycompany;1.0.0",
            ...
        }, service = Portlet.class
    )
    public class MyPortlet extends GenericPortlet {
        ...
    } 
    ```


* [<a name="seven">7</a>] 다음은 `com.liferay.portlet.header-request-attribute-prefix` 속성의 예입니다.

    **낡은:**

    ```xml
    <portlet>
        ...
        <header-request-attribute-prefix>com.mycompany</header-request-attribute-prefix>
        ...
    </portlet>
    ```

    **새로운:**

    ```java
    @Component(
        property = {
            ...
            "javax.portlet.dependency=jsutil;com.mycompany;1.0.0",
            "com.liferay.portlet.header-request-attribute-prefix=com.mycompany",
            ...
        }, service = Portlet.class
    )
    public class MyPortlet extends GenericPortlet {
        ...
    } 
    ```

* [<a name="eight">8</a>] 다음은 `javax.portlet.listener` 속성에 대한 예입니다.

    **낡은:**

    ```xml
    <portlet>
        ...
        <listener>
            <listener-class>com.mycompany.MyPortletURLGenerationListener</listener-class>
            <ordinal>1</ordinal>
        </listener>
        ...
    </portlet>
    ```

    **새로운:**

    ```java
    @Component(
        속성 = {
...
            "javax.portlet.listener=com.mycompany.MyPortletURLGenerationListener;1",
            ...
        }, service = Portlet.class
    )
    public class MyPortlet extends GenericPortlet {
        ...
    } 
    ```

* [<a name="nine">9</a>] `javax.portlet.init-param` 속성은 다음과 같이 선언할 수 있습니다.

    ```java
    @Component(
        ...
        property = {
            ...
            "javax.portlet.init-param.myInitParam=1234",
            ...
        }, service = PortletFilter.class
    )
    public class MyFilter implements RenderFilter {
        ...
    }
    ```

* [<a name="ten">10</a>] Liferay는 포틀릿의 이름(예: `liferay-portlet.xml` 또는 `javax.portlet.name` OSGi 서비스 속성의 `portlet-name` 설명자)을 기반으로 각 포틀릿의 ID를 생성합니다. 포틀릿 이름에 대시, 마침표 및 공백이 허용되지만 이들과 다른 모든 JavaScript 안전하지 않은 문자는 포틀릿 ID에 사용되는 이름 값에서 제거됩니다. 따라서 제거되는 문자를 고려하여 포틀릿 이름을 고유하게 만드십시오. 그렇지 않고 ID가 이미 배포된 포틀릿과 동일한 포틀릿을 배포하려고 하면 포틀릿 배포가 실패하고 Liferay가 다음 메시지를 기록합니다.

    ```
    Portlet id [portletId] is already in use
    ```
