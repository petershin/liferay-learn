---
taxonomy-category-names:
- Content Management System
- Asset Analytics
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
uuid: 8f1f6a94-0db3-4a8a-9f6c-57783ca8ac0e
---
# Tracking Custom Assets

!!! note
    Using [event tracking](../events/tracking-events.md) is the recommended way to track your custom assets.

Liferay Analytics Cloud can detect and analyze built-in Liferay DXP assets like blogs, documents and media, forms, and web content. If you have custom assets on your site and want Analytics Cloud to track them, use HTML attributes. Analytics Cloud's JavaScript plugin detects these HTML attributes, tracks user interaction, and shows the data in their respective asset type dashboards.

## Asset Events

The Analytics Cloud JavaScript plugin contains the following events that you can track:

`AssetClicked`: User clicks the asset area. Also carries information about the tag clicked.

`AssetDepthReached`: Scroll event in the asset area. Also carries information about the content depth the user reached (e.g., how far down a blog post the user scrolled).

`AssetViewed`: User views the asset.

`AssetDownloaded`: User clicks a link that downloads the asset.

`AssetSubmitted`: Form submission in the asset area. This requires an input type of submit to be placed under an HTML form element.

## Required Metadata

You must specify the following HTML attributes to enable tracking for your custom assets.

| Name                          | Type                | Description                                                                                                                                 |
|:----------------------------- |:------------------- |:------------------------------------------------------------------------------------------------------------------------------------------- |
| `data-analytics-asset-action` | preview or download | Preview - sends a preview event. Download - sends a download event. Note, this applies only for documents and media or custom assets.       |
| `data-analytics-asset-id`     | string              | A unique identifier for each custom asset. The string must not contain spaces.                                                              |
| `data-analytics-asset-title`  | string              | A title for the custom asset.                                                                                                               |
| `data-analytics-asset-type`   | string              | The type of asset you wish for Analytics Cloud to track your custom asset as (i.e. `blog`, `document`, `form`, `web-content`, or `custom`). |

!!! note
  You must add these attributes to each individual asset that you want Analytics Cloud to track. You can, however, use a script to populate the attributes’ values, automating this process for each asset.

## Example for Blogs Type

If you want your custom asset to be tracked as a blogs type asset, use `data-analytics-asset-type="blog"` along with the other required HTML tags:

```html
<div
  data-analytics-asset-id="myBlogId"
  data-analytics-asset-title="Blog Title"
  data-analytics-asset-type="blog"
>
  <h3>Bringing Ideas To Life: A Look Into Creative Writing</h3>

  <p>
    This blog explores the ways in which we can use creativity to bring our
    ideas to life. We will be looking at techniques for how to inspire, generate
    and develop characters and plot lines for compelling stories. We will also
    look at real-life examples and discuss practical use cases to apply
    knowledge to real writing.
  </p>
</div>
```

## Example for Documents and Media Type

If you want your custom asset to be tracked as a documents and media type asset, use `data-analytics-asset-type="document"` along with the other required HTML tags:

```html
<div>
  <h3>List of the documents related to Analytics Cloud</h3>

  <ul>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentA"
      data-analytics-asset-title="Document A"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="/document-a.pdf">Document A</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentB"
      data-analytics-asset-title="Document B"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="document-b.pdf">Document B</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentC"
      data-analytics-asset-title="Document C"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="document-c.pdf">Document C</a>
    </li>
  </ul>
</div>
```

## Example for Forms Type

If you want your custom asset to be tracked as a forms type asset, use `data-analytics-asset-type="form"` along with the other required HTML tags: 

```html
<form
  data-analytics-asset-id="myFormId"
  data-analytics-asset-title="Form Title"
  data-analytics-asset-type="form"
>
  <h3>Create new user</h3>

  <div class="content">
    <label for="name">Name</label>
    <input id="name" type="text" />
  </div>

  <div class="content">
    <label for="city">City</label>
    <input id="city" type="text" />
  </div>

  <div class="content">
    <label for="age">Age</label>
    <input id="age" type="text" />
  </div>
  
  <button type="submit">save</button>
</form>
```

## Example for Web Content Type

If you want your custom asset to be tracked as a web content type asset, use `data-analytics-asset-type="web-content"` along with the other required HTML tags:

```html
<div
  data-analytics-asset-id="myWebContentId"
  data-analytics-asset-title="Web Content Title"
  data-analytics-asset-type="web-content"
>
  <h3>Bringing Ideas To Life: A Look Into Creative Writing</h3>

  <p>
    This blog explores the ways in which we can use creativity to bring our
    ideas to life. We will be looking at techniques for how to inspire, generate
    and develop characters and plotlines for compelling stories. We will also
    look at real-life examples and discuss practical use cases to apply
    knowledge to real writing.
  </p>
</div>
```

## Example for Custom Type

The examples above provide [asset analytic reports](../assets.md) according to their asset types (e.g. a blog type asset shows blog-related metrics in the dashboard). If you require more flexibility, use the custom type asset. Use `data-analytics-asset-type="custom"` along with the other required HTML tags.

For example, if you want to track a poll in a custom Polls portlet, you might use HTML like this:

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-title="What is your favorite food Poll">

<h1> What's your favorite food? </h1>
<form action="/submit.php">
<div>
  <input type="radio" id="sushi" name="food" value="Sushi"
     checked>
  <label for="sushi">Sushi</label>
</div>
<div>
  <input type="radio" id="pizza" name="food" value="Pizza">
  <label for="pizza">Pizza</label>
</div>
<input type="submit" value="Submit" />
</form>
</div>
```

To track downloads, you must tag the element that triggers the action with `data-analytics-asset-action="download"`.

For example, here’s the above poll with a download link for a PDF file that contains the poll’s instructions:

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-title="What is your favorite food Poll">

<a href="/poll-instructions.pdf" data-analytics-asset-action="download">Download the Poll Instructions </a>

<h1> What's your favorite food? </h1>
...
</div>
```
