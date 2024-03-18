---
uuid: 44bf360f-45e5-4320-a131-0d70d4ec2b59
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Deploying a Custom Application

You can use a [custom element client extension](../../../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions) to render a JavaScript application as a widget on a Liferay site page. The application is served by Liferay and interacts with Liferay through [headless APIs](../../../headless-delivery/using-liferay-as-a-headless-platform.md).

Deploy the `liferay-ticket-custom-element` client extension.

1. Run the following command:

   ```bash
   ./gradlew :client-extensions:liferay-ticket-custom-element:deploy
   ```

1. In Liferay, select the _Product Menu_ (![Product Menu](../../../images/icon-product-menu.png)) and navigate to _Site Builder_ &rarr; _Pages_.

1. Click _Add_ (![Add icon](../../../images/icon-add.png)) and select _Page_. 

1. Select the _Blank_ type page. Give the page a name (e.g. `ticketing system`). Click _Add_.

1. In the left navigation under fragments and widgets, click the _Widgets_ tab.

1. Scroll down to the client extension type widget. Drag the _Liferay Ticket Custom Element_ widget to the page.

1. Click _Publish_.

The custom ticketing system application is now running on the site page.

![The custom ticketing system application is now running.](./deploying-a-custom-application/images/01.png)

Note, clicking the _Generate a New Ticket_ button generates additional random ticket entries. You can also create your own ticket object entries from _Control Panel_ &rarr; _Tickets_.

## Examine the Custom Element Code

The `assemble` block section of the `client-extension.yaml` file looks like this:

```yaml
assemble:
    - from: build/assets
      into: static
```

Note, the `.js` and `.css` build files of the JavaScript application are copied from the `build/assets` folder and placed into the deployable client extension `.zip` file.

This `liferay-ticket-custom-element` is a [custom element](../../../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions) type client extension. It is defined as follows in the `client-extension.yaml` file:

```yaml
liferay-ticket-custom-element:
   cssURLs:
      - "*.css"
   friendlyURLMapping: current-tickets-custom-element
   htmlElementName: current-tickets-custom-element
   instanceable: false
   name: Current Tickets Custom Element
   portletCategoryName: category.client-extensions
   type: customElement
   urls:
      - "*.js"
   useESM: true
```

See [Custom Element YAML Configuration Reference](../../../building-applications/client-extensions/frontend-client-extensions/custom-element-yaml-configuration-reference.md) for an explanation of each property.

The relevant JavaScript files for the application are contained in the `/src` folder. A full explanation of the JavaScript code is beyond the scope of this tutorial, but there are a few things to note:

* The `/src/pages/TicketApp.tsx` file defines the overall layout of the ticketing system page.
* In the `/src/services/tickets.ts` file, tickets are created and fetched through the use of the `j3y7ticket` object that was created when the [data schema](./defining-a-custom-data-schema.md) was defined. Note the `generateNewTicket()` function in the `/src/ticket.js` file generates additional ticket entries with random field entries.
* In the `/src/services/tickets.ts` file, the object's headless API calls are authorized with the `Liferay.authToken` object. This object is available when a web component is running on Liferay and simplifies OAuth2 authorization.
* The `package.json` file includes a `scripts{ build: }` element that handles the initializing and building of the JavaScript application.

Next: [Implement a Documentation Referral System](./implementing-a-documentation-referral-system.md).

## Relevant Concepts

* [Creating a Basic Custom Element](../../../building-applications/client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md)
* [Understanding Custom Element and Iframe Client Extensions](../../../building-applications/client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
