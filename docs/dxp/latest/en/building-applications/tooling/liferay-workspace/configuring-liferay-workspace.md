---
uuid: 7ef2146d-569b-4f6a-9f59-0553602c825b
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Configuring Liferay Workspace

```{warning}
Liferay Workspace is simple to use, and you can learn the basics by starting [at the beginning](./what-is-liferay-workspace.md). If you're happily [creating projects](./creating-code-with-liferay-workspace.md), [deploying code](./creating-code-with-liferay-workspace.md#deploying-code-via-liferay-workspace), or [using a Docker container](./configuring-a-liferay-docker-container.md), you may not need the information here. If, however, you want to do a deep dive and learn about all the things Workspace can do, this is the place for you. 
```

Here are the topics covered: 

- Updating Liferay Workspace and Bundled Plugins
- Using Development, UAT, and production environments
- Managing the Target Platform

## Updating Liferay Workspace and Bundled Plugins

Liferay Workspace is constantly updated to help developers be more productive, and bringing your Workspace up to date is a painless process. 

1. [Go to Workspace's releases](https://repository-cdn.liferay.com/nexus/content/repositories/liferay-public-releases/com/liferay/com.liferay.gradle.plugins.workspace) on Liferay's repository. The versions appear in a list; take note of the version number you need. 
1. Open the `settings.gradle` file in your Workspace's root folder. 
1. In the `dependencies` block, update the version with the version you found in the repository. If you want to stay on the latest release, supply the text `latest.release` instead of the version number.

   ```groovy
    dependencies {
        classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "[WORKSPACE_VERSION]"
    }
    ```

1. Save and close the file. To run the upgrade, execute any Gradle command, such as `tasks`: 

   ```bash
   ./gradlew tasks
   ```

Congratulations! Your Workspace is now upgraded. 

## Updating Your Liferay Version

You may want to update the version of Liferay that Workspace compiles for. This is handled by a single property: 

```properties
liferay.workspace.product=[$LIFERAY_LEARN_PORTAL_WORKSPACE$]
```

Update the property's value to the version of Liferay for which you're developing code. Your workspace's dependencies are then automatically updated to the new version. 

## Using JDK 11

```{note}
If you compile under JDK 11, you must run under JDK 11. Make sure your app servers are running JDK 11 before making any changes to Workspace. Note that Liferay's Docker images use JDK 8 by default. To override this, create your Docker image using the `-e JAVA_VERSION=zulu11` environment variable.
```

**Prerequisite:** If you're using an older version of Workspace, you must upgrade two things: 

1. Update Gradle to at least version 6.6.1
1. Update your Workspace version to at least 3.4.2 (see above for upgrade procedure). 

To upgrade Gradle, edit the `gradle/wrapper/gradle-wrapper.properties` file in your Workspace: 

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-6.6.1-all.zip
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStorePath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
```

If you upgraded your Workspace too, make sure you have the `liferay.workspace.product` property set. Remember, you can always get a current list for this property using Blade CLI by typing `blade init -l`.

If you upgraded an older workspace, make sure the Liferay CDN is declared in your Workspace's `settings.gradle` file: 

```groovy
maven {
	url "http://repository.liferay.com/nexus/content/groups/public"
}
```
Great! You're now ready to use JDK 11 with your Liferay projects. If you have existing projects, there are additional steps you may need to take. 

### Service Builder Projects

If you upgraded an older Workspace with Service Builder projects, add this configuration to the `build.gradle` file in the Service Builder `-service` module: 

```groovy
tasks.withType(JavaCompile) {

	// Generated classes using Jodd library are unable to be read when compiled against JDK 11

	sourceCompatibility = JavaVersion.VERSION_1_8
	targetCompatibility = JavaVersion.VERSION_1_8
}
```
### JAX-WS Projects

If you have any JAX-WS projects, they require classes from `javax.xml.soap` which were removed from JDK 11. Now you must specify them as a dependency manually: 


```groovy
compile 'com.sun.xml.ws:jaxws-ri:2.3.2'
```

## Managing the Target Platform

Normally when defining Gradle dependencies, you must provide versions of those dependencies, like this: 

```groovy
dependencies {
   compileOnly group: "javax.portlet", name: "portlet-api", version: "3.0.1"
   compileOnly group: "javax.servlet", name: "javax.servlet-api", version: "4.0.1"
}
```

Since any application written on Liferay's platform targets that platform, Liferay has made it easy for you to specify all dependencies in one shot by declaring the version of Liferay and then inheriting other dependencies from Liferay. That way, you don't have the mess shown above. 

Target platform is enabled by default; you don't have to do anything extra to use it. Here's what most dependencies look like now: 

```groovy
dependencies {
	compileOnly group: "com.liferay.portal", name: "release.portal.api"
}
```

This brings in all the dependencies that come with Liferay. If for some reason you must specify a particular dependency, you still can: 

```groovy
dependencies {
        compileOnly group: "com.liferay.portal", name: "release.portal.api"
        cssBuilder group: "com.liferay", name: "com.liferay.css.builder", version: "3.0.2"
}
```
