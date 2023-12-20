---
uuid: 0c05d38b-009b-4ecf-b240-0ca2b7c8eaca
---

# Developing Glowroot Plugins

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA100+`

Glowroot provides various [out-of-the-box plugins](https://github.com/glowroot/glowroot/tree/main/agent/plugins). You can also build your own with the use of their plugin API. Here are some tips for developing your own Glowroot plugin for Liferay. See [Glowroot instrumentation](https://glowroot.org/instrumentation.html) for more information. 

## Examine a Sample Plugin

The [Glowroot FreeMarker plugin](https://github.com/liferay/liferay-portal/tree/master/modules/apps/glowroot/glowroot-plugin-freemarker) is developed by Liferay to be a custom plugin to monitor FreeMarker templates.

### Add Module Files

The plugin module's `bnd.bnd` file declares the bundle name, bundle symbolic name, and bundle version. 

The plugin module's `build.gradle`file declares any dependencies. The following is also added to the file:

```gradle
deployGlowroot {
	finalizedBy deploy
}

liferay {
	deployDir = file("${liferayHome}/glowroot/plugins")
}
```

### Add a`Glowroot Plugin JSON File

The `glowroot.plugin.json` file, located in the module's `src/main/resources/META-INF/` folder define the plugin properties, including any configuration options. For this Liferay FreeMarker plugin, there is an option to set instrumentation level (i.e. INFO, DEBUG, TRACE).

### Add Your Java Class Files

The `TemplatesAspect.java` class contains the following:

* A `@Pointcut` declaration that names the Liferay class and method to be tracked.
* An `OnBefore` annotation and method that runs just before the Liferay method is executed.
* An `OnReturn` annotation and method that runs just after the Liferay method is executed.
* An `OnThrow` annotation and method that runs if there are any thrown exceptions after the Liferay method is executed.

Note that this `TemplateAspect.java` contains three `@Pointcut` declarations. One for each Liferay method to be tracked.

This plugin module contains an additional `TemplatesPluginProperties.java` file that listens for instrumentation level configuration changes in the UI.

## Deploying the Custom Plugin

To deploy a custom plugin, drop it into your `$LIFERAY_HOME/glowroot/plugins` folder. Make sure to use the package `com.liferay.glowroot.plugin.<plugin name>` when creating a new plugin.

Note, if your plugin needs any custom packages, declare them in your `portal-ext.properties` file under the `module.framework.properties.org.osgi.framework.bootdelegation` property. For example,

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
