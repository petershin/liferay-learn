---
uuid: 012a0e1d-613e-4c2a-9412-572a69030d8e
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Clay Buttons

Buttons come in several types and variations. This tutorial covers the different styles and variations of buttons you can create with the Clay taglibs.

## Types

**Primary button:** Used for the most important actions. Two primary buttons should not be together or near each other.

Primary button with label:

```jsp
<clay:button label="Primary" />
```

![A primary button is bright blue, grabbing the user's attention.](./clay-buttons/images/01.png)

**Secondary button:** Used for secondary actions. There can be multiple secondary buttons together or near each other.

```jsp
<div class="col">
    <clay:button displayType="secondary" label="Secondary" />
</div>
<div class="col">
    <clay:button ariaLabel="Wiki" displayType="secondary" icon="wiki" />
</div>
```

![A secondary button draws less attention than a primary button and is meant for secondary actions.](./clay-buttons/images/02.png)

**Borderless button:** Used in cases such as toolbars where the secondary button would be too heavy for the design. This keeps the design clean.

```jsp
<div class="col">
    <clay:button displayType="borderless" label="Borderless" />
</div>
<div class="col">
    <clay:button ariaLabel="Page Template" displayType="borderless" icon="page-template" />
</div>
```

![Borderless buttons remove the dark outline from the button.](./clay-buttons/images/03.png)

**Link button:** Used for Cancel actions.

```jsp
<div class="col">
    <clay:button displayType="link" label="Link" />
</div>
<div class="col">
    <clay:button ariaLabel="Add Role" displayType="link" icon="add-role" />
</div>
```

![You can also turn buttons into links.](./clay-buttons/images/04.png)

You can use labels or icons for your buttons. Below is an example of a Primary button with an icon:

```jsp
<clay:button ariaLabel="Workflow" icon="workflow" />
```

![Buttons can also display icons.](./clay-buttons/images/05.png)

You can disable a button by adding the `disabled` attribute:

```jsp
<div class="col">
    <clay:button disabled="<%= true %>" label="Primary" />
</div>
<div class="col">
    <clay:button ariaLabel="Workflow" disabled="<%= true %>" icon="workflow" />
</div>
```

![Buttons can be disabled if you don't want the user to interact with them.](./clay-buttons/images/06.png)

## Variations

Button with icon and text:

```jsp
<clay:button icon="share" label="Share" />
```

![Buttons can display both icons and text.](./clay-buttons/images/07.png)

Button with monospaced text:

```jsp
<clay:button displayType="secondary" icon="indent-less" monospaced="<%= true %>" />
```

![Buttons can display monospaced text.](./clay-buttons/images/08.png)

Block level button:

```jsp
<clay:button block="<%= true %>" label="Button" />
 ```
 
![Block level buttons span the entire width of the container.](./clay-buttons/images/09.png)

Plus button:

```jsp
<clay:button displayType="secondary" icon="plus" monospaced="<%= true %>" />
```

![A plus button is used for add actions in an app.](./clay-buttons/images/10.png)

Action button:

```jsp
<clay:button displayType="borderless" icon="ellipsis-v" monospaced="<%= true %>" />
 ```
 
![An action button is used to display actions menus.](./clay-buttons/images/11.png)

## Related Topics

* [Clay Alerts](./clay-alerts.md)
* [Clay Buttons](./clay-buttons.md)
* [Clay Labels and Links](./clay-links-and-labels.md)
