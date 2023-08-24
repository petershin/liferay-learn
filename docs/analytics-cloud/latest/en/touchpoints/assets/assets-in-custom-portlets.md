---
uuid: 9452a3b9-8325-49d5-a95f-94ba9a1e3d4d
---
# Assets in Custom Portlets

To get analytics data for assets displayed in custom portlets, include html tags in the assets. Follow the examples below for each type of asset.

## Blogs

Add the following tags within the asset's html:

| name | type | description |
|:--- |:--- |:--- |
| `data-analytics-asset-id` | string | Use a unique id for each asset. The string must not contain spaces. |
| `data-analytics-asset-title` | string | A title for the asset. |
| `data-analytics-asset-type` | string | Must be `blog`. |

For example,

```html
<div
  data-analytics-asset-id="myBlogId"
  data-analytics-asset-title="Blog Title"
  data-analytics-asset-type="blog"
>
  <h3>Foo</h3>

  <p>
    Foo bar.
  </p>
</div>
```

## Documents and Media

Add the following tags within the asset's html:

| name | type | description |
|:--- |:--- |:--- |
| `data-analytics-asset-action` | preview or download | Preview - used to send a preview event. Download - used to send a download event. |
| `data-analytics-asset-id` | string | Use a unique id for each asset. The string must not contain spaces. |
| `data-analytics-asset-title` | string | A title for the asset. |
| `data-analytics-asset-type` | string | Must be `document`. |

For example,

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
      <a data-analytics-asset-action="download" href="#">Document A</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentB"
      data-analytics-asset-title="Document B"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="#">Document B</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentC"
      data-analytics-asset-title="Document C"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="#">Document C</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentD"
      data-analytics-asset-title="Document D"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="#">Document D</a>
    </li>
  </ul>
</div>
```

## Forms

Add the following tags within the asset's html:

| name | type | description |
|:--- |:--- |:--- |
| `data-analytics-asset-id` | string | Use a unique id for each asset. The string must not contain spaces. |
| `data-analytics-asset-title` | string | A title for the asset. |
| `data-analytics-asset-type` | string | Must be `form`. |

For example,

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

## Web Content

Add the following tags within the asset's html:

| name | type | description |
|:--- |:--- |:--- |
| `data-analytics-asset-id` | string | Use a unique id for each asset. The string must not contain spaces. |
| `data-analytics-asset-title` | string | A title for the asset. |
| `data-analytics-asset-type` | string | Must be `webContent`. |

For example,

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

# Custom Assets

Add the following tags within the asset's html:

| name | type | description |
|:--- |:--- |:--- |
| `data-analytics-asset-action` | preview or download | Preview - used to send a preview event. Download - used to send a download event. |
| `data-analytics-asset-id` | string | Use a unique id for each asset. The string must not contain spaces. |
| `data-analytics-asset-title` | string | A title for the asset. |
| `data-analytics-asset-type` | string | Must be `custom`. |

For example,

```html
<div
  data-analytics-asset-id="myCustomId"
  data-analytics-asset-title="Custom Title"
  data-analytics-asset-type="custom"
>
  <h3>Bringing Ideas To Life: A Look Into Creative Writing</h3>

  <p>
    This custom asset explores the ways in which we can use creativity to bring
    our ideas to life.
  </p>

  <ul>
    <li>
      <a data-analytics-asset-action="download" href="#">Custom Document A</a>
    </li>
    <li>
      <a data-analytics-asset-action="download" href="#">Custom Document B</a>
    </li>
  </ul>

  <form>
    <h3>Create new user</h3>

    <div class="content">
      <label for="name">Name</label>
      <input id="name" type="text" />
    </div>

    <button type="submit">save</button>
  </form>
</div>
```
