---
uuid: 1c3db0c7-93ae-47c7-abbd-ae2e3e278cb0
---
# Creating Service Wrappers

With Service Wrappers, you can override default service methods to add extra functionality. For example, you may want the value of a field you've added to Liferay's `User` object to be saved whenever the Liferay API's `addUser` or `updateUser` methods are called. Liferay's service wrappers provide easy-to-use extension points for customizing Liferay's services.

## Deploying a Service Wrapper

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to deploy the example:

1. Download and unzip the `liferay-j1c2.zip` example project.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-development/liferay-internals/extending-liferay/liferay-j1c2.zip -O
   ```

   ```bash
   unzip liferay-j1c2.zip
   ```

1. Build and deploy the project module.

   ```bash
   cd liferay-j1c2
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

   ```bash
   STARTED com.acme.j1c2.impl_1.0.0 [1439]
   ```

1. To verify the example module's customization, open your browser to `https://localhost:8080`.

1. Log out of Liferay and log back in. The service wrapper prints this message to the Liferay Docker container console:

   ```
   INFO  [http-nio-8080-exec-6][J1C2UserLocalServiceWrapper:25] Invoking #authenticateByEmailAddress(long, String, String, Map, Map, Map)
   ```

This example prints a message to the console whenever the `authenticateByEmailAddress` method is called.

## Creating a Service Wrapper Class

1. Choose the service you want to wrap. This example creates a service wrapper for `UserLocalService`, so it extends `UserLocalServiceWrapper`:

   ```{literalinclude} creating-service-wrappers/resources/liferay-j1c2.zip/j1c2-impl/src/main/java/com/acme/j1c2/internal/service/J1C2UserLocalServiceWrapper.java
       :language: java
       :lines: 15
   ```

1. Annotate the class so Liferay knows this is a service wrapper component.

   ```{literalinclude} creating-service-wrappers/resources/liferay-j1c2.zip/j1c2-impl/src/main/java/com/acme/j1c2/internal/service/J1C2UserLocalServiceWrapper.java
       :language: java
       :lines: 14
   ```

1. Choose the method you want to override and add your own implementation.

   ```{literalinclude} creating-service-wrappers/resources/liferay-j1c2.zip/j1c2-impl/src/main/java/com/acme/j1c2/internal/service/J1C2UserLocalServiceWrapper.java
       :dedent: 1
       :language: java
       :lines: 17-33
   ```

## Overriding a Method

1. Open the `J1C2UserLocalServiceWrapper` class in your text editor or IDE.

1. Inside the class, create a public method called `getUser`. This overrides `UserLocalService`'s `getUser` method. As such, it must pass a `long` as an argument and return a `User`. This method should also throw a `PortalException`. Make sure to add the `@Override` annotation.

   ```java
   @Override
   public User getUser(long userId) throws PortalException {
   }
   ```

1. Since this method returns the `User` object, import it at the top of the file.

   ```java
   import com.liferay.portal.kernel.model.User;
   ```

1. Create a similar method to the one in the example so that every time the `getUser` method is called, it prints a message to the console.

   ```java
   if (_log.isInfoEnabled()) {
       _log.info(
           "Invoking #getUser(long)");
   }
   ```

1. You still want `getUser` to be called, so make the method return the results of calling `getUser`'s super method.

   ```java
   return super.getUser(userId);
   ```

1. In the end, your method should look like this:

   ```java
   @Override
   public User getUser(long userId) throws PortalException {
       if (_log.isInfoEnabled()) {
           _log.info(
               "Invoking #getUser(long)");
       }

       return super.getUser(userId);
   }
   ```

1. Build and deploy your module.

   ```bash
   ./gradlew build deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

## Testing Your Service Wrapper

1. Go back to `https://localhost:8080`.

1. Click *My Profile* in the User menu. This takes you to your profile page.

1. When you open your profile page, Liferay calls the `getUser` method a couple times. Check your console for the following message:

```
INFO  [http-nio-8080-exec-4][J1C2UserLocalServiceWrapper:39] Invoking #getUser(long)
```

Congratulations! You've customized a service's methods using a Liferay service wrapper.

## Related Topics

- [Using an OSGi Service](../fundamentals/using-an-osgi-service.md)
- [Using Job Scheduler](../../core-frameworks/job-scheduler-framework/using-job-scheduler.md)
- [Users](../../../users-and-permissions/users.md)
