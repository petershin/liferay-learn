---
uuid: 0c05d38b-009b-4ecf-b240-0ca2b7c8eaca
taxonomy-category-names:
- Development and Tooling
- Liferay Self-Hosted
- Liferay PaaS
---

# Developing Glowroot Plugins

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA100+`

Glowroot provides various [out-of-the-box plugins](https://github.com/glowroot/glowroot/tree/main/agent/plugins). You can also build your own with the use of their plugin API. Here are some tips for developing your own Glowroot plugin for Liferay. See [Glowroot instrumentation](https://glowroot.org/instrumentation.html) for more information. 

The [Glowroot FreeMarker plugin](https://github.com/liferay/liferay-portal/tree/master/modules/apps/glowroot/glowroot-plugin-freemarker) is a custom plugin developed by Liferay to monitor FreeMarker templates.

## Add Module Files

The plugin module's [`bnd.bnd`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/glowroot/glowroot-plugin-freemarker/bnd.bnd) file declares the bundle name, bundle symbolic name, and bundle version. 

The plugin module's [`build.gradle`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/glowroot/glowroot-plugin-freemarker/build.gradle) file declares dependencies. The following configuration is also added to the file:

```gradle
deployGlowroot {
    finalizedBy deploy
}

liferay {
    deployDir = file("${liferayHome}/glowroot/plugins")
}
```

## Add a`Glowroot Plugin JSON File

In the module's `src/main/resources/META-INF/` folder, the [`glowroot.plugin.json`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/glowroot/glowroot-plugin-freemarker/src/main/resources/META-INF/glowroot.plugin.json) file defines the plugin properties, including any configuration options. For the Liferay FreeMarker plugin, there is an option to set instrumentation level (i.e. INFO, DEBUG, TRACE).

## Add Your Java Class Files

The [`TemplatesAspect.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/glowroot/glowroot-plugin-freemarker/src/main/java/com/liferay/glowroot/plugin/freemarker/TemplatesAspect.java) class contains the following annotations:

* `@Shim`: Creates interfaces for the target Liferay classes and methods. Note that this is used instead of adding any Liferay classes as dependencies.
* `@Pointcut`: Declares the Liferay classes and methods to be tracked.
* `@OnBefore`: Annotations and methods that run just before the Liferay method is executed. Note that the shim interfaces are utilized.
* `@OnReturn`: Annotations and methods that run just after the Liferay method is executed.
* `@OnThrow`: Annotations and methods that run if there are any exceptions after the Liferay method is executed.

See the [org.glowroot.agent.plugin.api.weaving](https://glowroot.org/javadoc/agent-plugin-api/0.14.0/org/glowroot/agent/plugin/api/weaving/package-summary.html) package to learn more.

Other available interfaces:

* The `Timer` interface returns the time spent at a point cut. 
* The `TraceEntry` interface returns details of slow transactions or errors at a point cut.
* The `Transaction` interface returns an aggregate to capture timers, thread profiles and trace entries at a point cut.

See the [`org.glowroot.agent.api`](https://glowroot.org/javadoc/agent-api/0.14.0/org/glowroot/agent/api/package-summary.html) package to learn more.

Note that this `TemplateAspect.java` contains three `@Pointcut` declarations; one for each Liferay class to be tracked.

This plugin module contains an additional [`TemplatesPluginProperties.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/glowroot/glowroot-plugin-freemarker/src/main/java/com/liferay/glowroot/plugin/freemarker/TemplatesPluginProperties.java) file that listens for instrumentation level configuration changes in the UI.

## Deploying the Custom Plugin

To deploy a custom plugin, drop it into your `$LIFERAY_HOME/glowroot/plugins` folder. Make sure to use the package `com.liferay.glowroot.plugin.<plugin name>` when creating a new plugin.

Note, if your plugin needs custom packages, declare them in your `portal-ext.properties` file under the `module.framework.properties.org.osgi.framework.bootdelegation` property. For example,

```properties
module.framework.properties.org.osgi.framework.bootdelegation=\
  __redirected,\
  com.liferay.expando.kernel.model,\
  com.liferay.glowroot.plugin.*,\
  com.liferay.portal.servlet.delegate,\
  com.liferay.portal.servlet.delegate*,\
  com.sun.ccpp,\
  com.sun.ccpp.*,\
  com.sun.crypto.*,\
  com.sun.image.*,\
  com.sun.imageio.plugins.*,\
  com.sun.jmx.*,\
  com.sun.jndi.*,\
  com.sun.mail.*,\
  com.sun.management.*,\
  com.sun.media.*,\
  com.sun.msv.*,\
  com.sun.org.*,\
  com.sun.tools.*,\
  com.sun.xml.*,\
  com.yourkit.*,\
  jdk.*,\
  org.glowroot.agent,\
  org.glowroot.agent.*,\
  sun.*,\
  weblogic.jndi,\
  weblogic.jndi.*
```

Once deployed, in Glowroot, navigate to _Configuration_ &rarr; _Plugins_ to see your plugins.
