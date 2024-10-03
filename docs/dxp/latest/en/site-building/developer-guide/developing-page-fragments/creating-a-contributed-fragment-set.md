---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
uuid: 1e8a26fa-4f14-4dec-ab42-c4b5e2121e6c
---

# Creating a Contributed Fragment Set

Contributed fragment sets are deployable modules containing page fragments. Fragments in a contributed set can be used like regular fragments, but aren't contained in the database and can't be modified directly through the UI.

If you're running Liferay 7.3+, it's better to use [automatically deployed fragments](./auto-deploying-fragments.md) created in compressed ZIP sets. You can create these sets [using your own tools](./using-the-fragments-toolkit.md#fragment-set-structure) or the [Liferay Fragments Toolkit](./using-the-fragments-toolkit.md). They can also be modified through the UI and include image resources.

This example runs on Liferay 7.3+.

!!! note
    All fragments added through a contributed fragment set are available globally to all sites.

To add a contributed fragment set, extend the [`BaseFragmentCollectionContributor` Class](https://docs.liferay.com/dxp/apps/fragment/latest/javadocs/com/liferay/fragment/contributor/BaseFragmentCollectionContributor.html), which itself implements the [`FragmentCollectionContributor` interface](https://docs.liferay.com/dxp/apps/fragment/latest/javadocs/com/liferay/fragment/contributor/FragmentCollectionContributor.html).

!!! note
    For Liferay DXP 7.4+, fragment collections are called fragment sets in the Liferay UI.

## Deploy a Contributed Fragment Set

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to deploy an example to see what a contributed fragment set looks like:

1. Download and unzip the [example](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip):

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip -O
   ```

   ```bash
   unzip liferay-l3m9.zip
   ```

1. From the module root, build and deploy the contributed Set's JAR.

   ```bash
   cd liferay-l3m9
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       If testing on Windows, you may need to build the module first with `./gradlew build` and then manually copy the JAR to `docker cp docker-container-name:/opt/liferay/osgi/modules` directly if deployment fails.

1. Confirm the deployment to the Liferay Docker container console. The log message below should appear in the Docker console:

   ```bash
   INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.acme.l3m9.impl_1.0.0 [1824]
   ```

1. Verify the contributed fragment set is available. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*. The set should appear in the Default Sets list.

   ![Verify the contributed Fragment Set appears in the Default Sets list.](./creating-a-contributed-fragment-set/images/01.png)

Great! You successfully deployed a contributed fragment set.

As you can see, the contributed fragment set appears with the default fragment sets, and the fragments can't be modified from the UI. The only way to modify the set is to update the module they came from or [copy the fragment to another set](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md#managing-individual-page-fragments) and modify the fragment copy.

## Contributed Fragment Set Logic and metadata

The fragment set contributor overrides two methods in the `FragmentCollectionContributor` class to provide information about the set.

The `getFragmentCollectionKey()` method returns the key/name of the fragment set where these fragments are contributed:

```java
@Override
public String getFragmentCollectionKey() {
   return "l3m9";
}
```

The `getServletContext()` method returns the servlet context for the contributed Fragment Set module:

```java
@Override
public ServletContext getServletContext() {
   return _servletContext;
}
```

The `ServletContext` points to the bundle's symbolic name so it can find the Fragment resources:

```java
@Reference(
  target = "(osgi.web.symbolicname=com.liferay.learn.fragments)"
)
private ServletContext _servletContext;
```

The `bnd.bnd` file includes a few properties that must be defined for the Set:

- The `osgi.web.symbolicname` matches the `Bundle-SymbolicName` in the `bnd.bnd` file.
- The `Web-ContextPath` header indicates the module folder that contains the set, so the `ServletContext` is correctly generated.
- The `-dsannotations-options` enables the declarative service annotations found in the class hierarchy of the component class.

See the example project's [`bnd.bnd`](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip) for a reference of these values.

Now, modify the project to include another fragment in the contributed set.

## Add Fragment Resources

1. Move the example's `l3m9-impl/l3m9-jumbotron` folder into the `l3m9-impl/src/main/resources/com/acme/l3m9/internal/fragment/contributor/l3m9/dependencies` folder.

   ```bash
   cp -r l3m9-impl/l3m9-jumbotron l3m9-impl/src/main/resources/com/acme/l3m9/internal/fragment/contributor/l3m9/dependencies/
   ```

   !!! note
       Packaged fragments go in the `dependencies` folder, and the class package name and resources package name must match (e.g. `[class.package.path].dependencies`).

   !!! note
       Contributed fragment sets do not support [included resources](./including-default-resources-with-fragments.md).

1. Build the updated contributed Set's JAR.

   ```bash
   cd liferay-l3m9
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       If deployment fails on Windows, you may need to [bind mount Liferay in the container](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md), build the module JAR with `.\gradlew jar`, and copy the JAR to the appropriate bind-mounted folder.

1. Verify that the updated fragment is included in the contributed set. Point your browser to `https://localhost:8080`, and under the Site Menu on the left side of the screen, go to *Design* &rarr; *Fragments*. The L3M9 Jumbotron Fragment appears in the L3M9 Set.

    ![The custom Jumbotron fragment is included in the contributed set.](./creating-a-contributed-fragment-set/images/02.png)

Congratulations! You now know how to create a contributed fragment set, and have added a new contributed fragment set to Liferay.

## Related Information

- [Using the Fragments Toolkit](./using-the-fragments-toolkit.md)
- [Using the Fragments Editor](./using-the-fragments-editor.md)
