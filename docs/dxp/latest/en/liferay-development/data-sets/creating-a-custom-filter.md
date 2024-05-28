---
uuid: a9100c30-4da4-4a14-9a34-27fecd61590e
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---

# Creating a Custom Filter

{bdg-secondary}`Liferay 7.4+`

Custom filter client extensions define JavaScript functions for [filtering data sets](./data-set-views/data-set-view-filters.md) on a frontend application.

## Prerequisites

To start developing client extensions,

1. Install Java (JDK 8 or JDK 11).

   !!! note
       Check the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for supported JDKs, databases, and environments. See [JVM Configuration](../../installation-and-upgrades/reference/jvm-configuration.md) for recommended JVM settings.

1. Download and unzip the sample workspace:

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

Now you have the tools to deploy your first Custom Filter client extension.

## Examine and Modify the Custom Filter Client Extension

The Custom Filter client extension is in the sample workspace's `client-extensions/liferay-sample-fds-filter/` folder. It's defined in the `client-extension.yaml` file:

```yaml
liferay-sample-fds-filter:
    name: Liferay Sample FDS Filter
    type: fdsFilter
    url: index.*.js
```

The client extension has the ID `liferay-sample-fds-filter` and contains the key configurations for a Custom Element client extension, including the `type` and the `url` property that defines the JavaScript resource file's location.

It also contains the `assemble` block:

```yaml
assemble:
    - from: build/static
      into: static
```

This specifies that everything in the `build/static` folder should be included as a static resource in the built client extension `.zip` file. The JavaScript files in a client extension are used as static resources in Liferay.

The `src/index.ts` file defines custom JavaScript functions that customize a [data set view's filter](./data-set-views/data-set-view-filters.md). The filter conforms to the `FDSFilter` interface provided by `@liferay/js-api/data-set`.

```javascript
import type {
	FDSFilter,
	FDSFilterHTMLElementBuilderArgs,
} from '@liferay/js-api/data-set';

type FilterData = string;

function descriptionBuilder(selectedData: FilterData): string {
	return selectedData;
}

function htmlElementBuilder({
	filter,
	setFilter,
}: FDSFilterHTMLElementBuilderArgs<FilterData>): HTMLElement {
	const input = document.createElement('input');

	if (filter.selectedData) {
		input.value = filter.selectedData;
	}

	input.className = 'form-control';
	input.placeholder = 'Search with Odata';

	const button = document.createElement('button');

	button.className = 'btn btn-block btn-secondary btn-sm mt-2';
	button.innerText = 'Submit';
	button.onclick = () =>
		setFilter({
			selectedData: input.value,
		});

	const div = document.createElement('div');

	div.className = 'dropdown-item';

	div.appendChild(input);
	div.appendChild(button);

	return div;
}

function oDataQueryBuilder(selectedData: FilterData): string {
	return selectedData;
}

const fdsFilter: FDSFilter<FilterData> = {
	descriptionBuilder,
	htmlElementBuilder,
	oDataQueryBuilder,
};

export default fdsFilter;
```

Now, deploy the client extension.

## Deploy the Custom Element Client Extension to Liferay

```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

This builds your client extension and deploys the zip to Liferay's `deploy/` folder.

!!! note
    To deploy your client extension to Liferay SaaS, use the Liferay Cloud [Command-Line Tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) to run [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment).

!!! tip
    To deploy all client extensions in the workspace simultaneously, run the command from the `client-extensions/` folder.

Confirm the deployment in your Liferay instance's console:

```
STARTED liferaysamplecustomelement1_7.4.13
```

Now that your client extension is deployed, check if the filter is working properly.

## Add the Custom Filter Client Extension to a Data Set View

1. feature flag
1. data sets
1. create one use headless-admin-address/v1.0?
1. create a view
1. it's going to be harder than I thought
<!-- 1. add reference to data set view filters! -->

1. Click *Edit* (![Edit](../../images/icon-edit-pencil.png)) at the top of any page.

1. Add the widget to the page. In the Fragments and Widgets sidebar (![Fragments and Widgets](../../images/icon-plus.png)), click *Widgets*.

1. Find the Client Extensions &rarr; Liferay Sample Custom Element 1 widget and drag it onto the page. Click *Publish*.

   ![Drag the Liferay Sample Custom Element 1 onto a page.](./creating-a-basic-custom-element/images/01.png)

Confirm the widget app is working by using the buttons to increase/decrease the counter.

You have successfully used a Custom Element client extension in Liferay. Next, try working with the [routes](./using-routes-with-custom-elements.md) in a React custom element.

## Related Topics

- [Custom Element YAML Configuration Reference](./creating-a-basic-custom-element/custom-element-yaml-configuration-reference.md)
- [Integrating External Applications](../integrating-external-applications.md)
- [Using an Editor Config Contributor Client Extension](../customizing-liferays-look-and-feel/using-an-editor-config-contributor-client-extension.md)
- [Client Extensions UI Reference](../customizing-liferays-look-and-feel/client-extensions-ui-reference.md)
