---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
uuid: ea5a94dc-2b89-487d-bc51-6a6eaa6f2938
---

# Including Default Resources in Fragments

You can include images files (e.g. `.gif`, `.jpg`, `.jpeg`, or `.png`) direct in your fragment sets. Keeping images with your fragments, rather than in other applications like [Documents and Media](../../../content-authoring-and-management/documents-and-media.md), is a convenience.Learn how to include and use image resources in your fragment sets.

!!! note
    For Liferay DXP 7.4+, Fragment Collections are called Fragment Sets in the Liferay UI.

## Import a Fragment Set with Resources

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to import an example fragment set to see how fragment resources work:

1. Download and unzip the [example resources Fragment Set](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-i6r3.zip):

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-i6r3.zip -O
    ```

    ```bash
    unzip liferay-i6r3.zip
    ```

<!-- As the fragments toolkit was deprecated, I am removing this reference. Eric. -->

<!-- 1. Setup up the Fragments Toolkit:

    ```bash
    cd liferay-i6r3
    ```

    ```bash
    ./setup_tutorial.sh
    ```

    Resolve all unmet requirements reported by the script and rerun the script until it reports that your environment is ready.

1. Import the Fragment Set in the Docker container with the Fragments Toolkit using the `yarn run import` command below.

    ```bash
    yarn run import

    ...
    ? Liferay host & port http://localhost:8080
    ? Username test@liferay.com
    ? Password [hidden]

    Checking connection...
    Connection successful

    ? Company ID liferay.com
    ? Group ID Liferay DXP

    Building project...
    Importing project...

    ✔ Fragment I6R3 Card imported

    Project Imported
    ``` -->

1. [Import the fragment set manually](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md).

1. Verify the fragment set is available. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*. The set should appear in the list.

1. Click on the *I6R3 Set*.

1. Select the *Resources* tab. The `books.png` image appears in the resource list.

   ![The resource is available in the fragment set.](./including-default-resources-with-fragments/images/01.png)

## Fragment Set Structure with Resources

Fragment sets with resources use the following structure:

- `collection.json`: a text file which describes your Set with the format `{"name":"Set Name","description":"Set description"}`.
- `[fragment-name]/`: contains all of a fragment's files.
- `resources/`: contains files available to all the set's fragments.

!!! tip
    Alternatively, you can upload the image through the *Resources* tab in the [Fragments Editor](./using-the-fragments-editor.md).

Image files are referenced in a fragment's HTML with the syntax `[resources:image-name.extension]`. The example fragment HTML has this `img` element:

```html
<img
   class="card-img-top"
   src="[resources:books.png]"
/>
```

![Embed image resources in fragments.](./including-default-resources-with-fragments/images/02.png)

!!! note
    The resource name is case-sensitive and must match the name and case exactly in the reference.

!!! tip
    You can style the image resource in your CSS with the syntax `img[src="[resources:image-name.extension]"]`.

## Include a New Resource

Now that you know how to include a resource and reference it in a fragment, you can use a new resource in the example fragment set.

1. Copy an image, such as an image from <https://www.freeimages.com/>, to the `liferay-i6r3.zip/src/i6r3-set/resources/` folder and zip the folder.

1. Import the fragment set manually as you did above.

<!-- removed as it refers to the fragments toolkit. Eric. -->
<!-- 1. Import the Fragment Set in the Docker container again as you did above:

    ```bash
    yarn run import
    ``` -->

1. Verify that the fragment set includes the resource. In the *Fragments* page in the UI, select the *I6R3 Set* and click the *Resources* tab. The new image should appear in the resource listing.

   ![Verify the new image appears in the set's resource list.](./including-default-resources-with-fragments/images/03.png)

1. Open the *I6R3 Card* fragment by selecting the set's *Fragments* tab and clicking the *I6R3 Card* fragment. The fragment source appears in the Fragments Editor.

1. Update the fragment to use the new image resource. Delete `books.png` from the `img` element's `src="[resources:books.png]"` attribute and start typing the new image file's name after `src="[resources:`. An attribute value with the image file name appears under the cursor. Select that attribute value.

   ![The Fragments Editor lists the matching resources.](./including-default-resources-with-fragments/images/04.png)

1. Verify that the Fragment renders the new image.

   ![The Fragment should use the new resource image.](./including-default-resources-with-fragments/images/05.png)

!!! note
    Any fragment in a fragment set has access to the set's resources.

Great! Now you know how to use image resources fragment sets.

## Related Information

- [Adding Configuration Options to Fragments](./adding-configuration-options-to-fragments.md)
- [Auto-deploying Fragments](./auto-deploying-fragments.md)
- [Using the Fragments Editor](./using-the-fragments-editor.md)
