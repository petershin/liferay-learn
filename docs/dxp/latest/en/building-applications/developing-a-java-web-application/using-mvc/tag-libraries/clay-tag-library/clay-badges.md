---
uuid: df175a66-7f33-40e4-9e81-ffe60649e0db
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Clay Badges

Badges help highlight important information such as notifications or new and unread messages. Badges have circular borders and are only used to specify a number. This covers the different types of Clay badges you can add to your app.

## Badge Types

The following badge styles are available:

Primary badge:

```jsp
<div class="col-md-1">
    <clay:badge label="8" />

    <div>Primary</div>
</div>
```

![A primary badge is bright blue, commanding attention like the primary button of a form.](./clay-badges/images/01.png)

Secondary badge:

```jsp
<div class="col-md-1">
    <clay:badge displayType="secondary" label="87" />

    <div>Secondary</div>
</div>
```

![A secondary badge is light-grey and draws less focus than a primary button.](./clay-badges/images/02.png)

Info badge:

```jsp
<div class="col-md-1">
    <clay:badge displayType="info" label="91" />

    <div>Info</div>
</div>
```

![A info badge is dark blue and meant for numbers related to general information.](./clay-badges/images/03.png)

Error badge:

```jsp
<div class="col-md-1">
    <clay:badge displayType="danger" label="130" />

    <div>Error</div>
</div>
```

![An error badge displays numbers related to an error.](./clay-badges/images/04.png)

Success badge:

```jsp
<div class="col-md-1">
    <clay:badge displayType="success" label="1111" />

    <div>Success</div>
</div>
```

![A success badge displays numbers related to a successful action.](./clay-badges/images/05.png)

Warning badge:

```jsp
<div class="col-md-1">
    <clay:badge displayType="warning" label="21" />

    <div>Warning</div>
</div>
```

![A warning badge displays numbers related to warnings that should be addressed.](./clay-badges/images/06.png)

Now you know how to use badges to keep track of values in your app.

## Related Topics

* [Clay Labels and Links](./clay-links-and-labels.md)
* [Clay Cards](./clay-cards.md)
* [Clay Stickers](./clay-stickers.md)
