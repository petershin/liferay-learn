---
uuid: 5c79adbb-9deb-459b-9615-71e2941f5cd8
---
# Search Headless APIs

{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

{bdg-secondary}`Available Liferay 7.4 U87+ and GA87+`

You can [search for content](../../using-search/getting-started/searching-for-content.md) from within Liferay, but you can also use Liferay's REST APIs. 

## Enabling Search Headless APIs

```{include} /_snippets/run-liferay-dxp.md
```

To enable the search headless APIs using a [portal property](../../installation-and-upgrades/reference/portal-properties.md), add this to `portal-ext.properties`:

```properties
feature.flag.LPS-179669=true
```

To enable the search headless APIs using an [environment variable](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables), add this to your configuration:

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER7__NUMBER9__NUMBER6__NUMBER6__NUMBER9_=true
```

## Searching for Sample Content

Follow these steps to generate and search for sample content.

1. Download and unzip [liferay-b9f3.zip](./liferay-b9f3.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/using-search/developer-guide/liferay-b9f3.zip -O
   ```

   ```bash
   unzip liferay-b9f3.zip
   ```

   Navigate into the `/liferay-b9f3/` folder.

1. Locate the [site ID](../../site-building/site-settings/site-settings-ui-reference.md#site-configuration) for your default site and your global site.

1. Run the `populate_b9f3.sh` script. Replace `1234` with your default site ID and `5678` with your global site ID.

   ```bash
   ./curl/populate_b9f3.sh 1234 5677
   ```