---
uuid: 81a1b13c-c5c4-4f62-a50c-8462ea8b38e3
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Defining a Custom Data Schema

The ticketing application requires custom data fields and selections. You use Liferay [objects](../../objects.md) and [picklists](../../objects/picklists.md) to define a custom data schema.

## Creating Custom Picklists

A picklist is a predetermined list of values users can select. Picklists are needed for custom fields such as ticket status, ticket type, and ticket priority.

### Deploy the Custom Picklists

Deploy the `liferay-ticket-batch-list-type-definition` client extension with the following command:

```bash
./gradlew :client-extensions:liferay-ticket-batch-list-type-definition:deploy
```

Navigate to _Control Panel_ &rarr; _Picklists_. See that five new picklists have been created.

![Five new picklists have been created.](./defining-a-custom-data-schema/images/01.png)

### Examining the Custom Picklists Code

Each client extension project is defined by the `client-extension.yaml` file. The first section defines the `assemble` block that specifies the files included in the deployable `.zip` file. The `assemble` block for this client extension looks like this:

```yaml
assemble:
    - from: batch
      into: batch
```

See [Assembling Client Extensions](../../client-extensions/working-with-client-extensions.md#assembling-client-extensions) to learn more.

This `list-type-batch` client extension is a [batch type](../../importing-exporting-data.md) client extension. It is defined as follows:

```yaml
liferay-ticket-batch-list-type-definition:
    name: Liferay Ticket Batch List Type Definition
    oAuthApplicationHeadlessServer: liferay-ticket-batch-list-type-definition-oauth-application-headless-server
    type: batch
```

See [Batch YAML Configuration Reference](../../importing-exporting-data/batch-yaml-configuration-reference.md) for an explanation of each property.

The client extension makes use of the [batch engine headless API](../../../headless-delivery/consuming-apis/batch-engine-api-basics-importing-data.md) and the [picklists headless API](../../objects/picklists/picklists-api-basics.md). To make secure API requests, the client extension is configured to use OAuth2 authorization. It is defined as follows:

```yaml
liferay-ticket-batch-list-type-definition-oauth-application-headless-server:
    .serviceAddress: localhost:8080
    .serviceScheme: http
    name: Liferay Ticket Batch List Type Definition OAuth Application Headless Server
    scopes:
        - Liferay.Headless.Admin.List.Type.everything
        - Liferay.Headless.Batch.Engine.everything
    type: oAuthApplicationHeadlessServer
```

Note that the `Liferay.Headless.Admin.List.Type` resource and `Liferay.Headless.Batch.Engine` resource are given full CRUD access.

See [`client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-list-type-definition/client-extension.yaml) for the full definition.

The five picklists and their selection items are defined in the JSON file located in the `/batch/` folder of the client extension. See the [`list-type-definition.batch-engine-data.json`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-list-type-definition/batch/list-type-definition.batch-engine-data.json) file for the full definitions.

## Creating Custom Objects

Once the picklists are defined, the application's custom object can be created.

### Deploy the Custom Object

Deploy the `liferay-ticket-batch-object-definition` client extension with the following command:

```bash
./gradlew :client-extensions:liferay-ticket-batch-object-definition:deploy
```

In Liferay, navigate to _Control Panel_ &rarr; _Objects_. See that a new ticket object has been created.

![A new ticket object has been created.](./defining-a-custom-data-schema/images/02.png)

### Examining the Custom Object Code

This `liferay-ticket-batch-object-definition` client extension is also a [batch type](../../importing-exporting-data.md) client extension. The client extension's YAML file is defined in the same way as the 
`liferay-ticket-batch-list-type-definition` client extension. See [batch YAML Configuration Reference](../../importing-exporting-data/batch-yaml-configuration-reference.md) for an explanation of each property.

See [client-extension.yaml](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-object-definition/client-extension.yaml) for the full definition.

The custom ticket object is defined in the JSON file located in the `/batch/` folder of the client extension. See the [`object-definition.batch-engine-data.json`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-object-definition/batch/object-definition.batch-engine-data.json) file for the full definition.

## Generating Ticket Data through APIs

With the custom ticket object finished, new ticket entries can be created within Liferay. They can also be imported through the use of the object's REST APIs.

Run the command below to generate a ticket entry:

```bash
./gradlew :client-extensions:liferay-ticket-batch-object-entry:deploy
```

In Liferay, navigate to _Control Panel_ &rarr; _Tickets_. See that a new ticket entry has been created.

![A new ticket entry has been created.](./defining-a-custom-data-schema/images/03.png)

Next: [Apply a Custom Theme](./applying-a-custom-theme.md) to the ticketing system.

## Relevant Concepts

* [Creating and Managing Objects](../../objects/creating-and-managing-objects.md)
* [Creating Picklists](../../objects/picklists/creating-picklists.md)
* [Batch Client Extensions](../../importing-exporting-data.md)
