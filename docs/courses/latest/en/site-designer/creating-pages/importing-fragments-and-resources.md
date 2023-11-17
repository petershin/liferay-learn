---
uuid: 4925291c-19c3-411d-9870-7f1768ad6df7
---
# Importing Fragments and Resources

Delectable Bonsai needs fragments and images in the site. With these the site creator has the resources required to create the site to meet the design and branding requirements.

## Downloading and Importing the Fragments

<!--This will be the site administrator user--maybe add a story about being handed these resources from the development team? -->

1. Download and unzip the fragment set:

   <!-- URL needs help -->
   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/site-designer/creating-pages/importing-fragments-and-resources/liferay-q9c4.zip -O
   ```

   ```bash
   unzip liferay-q9c4.zip
   ```

## Importing the Fragments and Compositions

1. Open the Site menu (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Add a fragment set for Delectable Bonsai's custom fragments and compositions. Click the Add button (![](../../images/icon-plus.png)) for Fragment Sets.

1. Name the fragment set _Delectable Bonsai Fragments_ and click _Save_.

1. Open the Actions menu (![Actions Button](../../images/icon-actions.png)) for the fragment set and select *Import*.

1. Select a zip file in `liferay-q9c4.zip/fragments` and click *Import*.

1. Repeat the procedure for the remaining zip files in `liferay-q9c4.zip/fragments`.

   When finished these fragments will appear in the fragment set:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `banner-composition.zip`
   - `footer-composition.zip`
   - `header-composition.zip`
   - `home-page-slider-fragment.zip`
   - `home-page-slider-composition.zip`
   - `sign-in-fragment.zip`
   - `user-nav-fragment.zip`

   There are fragment compositions and custom fragments in this folder.

   - Custom fragments are fragments that you develop, if none of the [out-of-the-box fragments](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference) suit your needs. Often you can start by [copying an existing fragment](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/duplicating-fragments) that contains some of the HTML, CSS, or JS you'll need to create your own fragment.
   - [Fragment compositions](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) are reusable fragment groups you've added to the content page editor and saved for repeated use.

Next, import some fragment resources.

<!-- using resources requires updates to the articles--the banner image needs to be available for manual configuration, but it's not if it's part of fragment resources (unless you set dl.show.hidden.mount.folders=true, then you can see them as part of docs and media) -->
## Importing Fragment Resources

1. While viewing the fragment set, click _Resources_. 

1. Click the Add button (![Add](./../../images/icon-add.png)).

1. Select one of the files in `liferay-q9c4.zip/images` and click *Add*.

1. Repeat the procedure for the remaining files in `liferay-q9c4.zip/images`.

These images will appear in Documents and Media:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `banner-image.png`
   - `db-green-1w.svg`
   - `db-green-3.svg`
   - `sign-in-image.png`


## Importing the Images

<!-- Documents and Media versus fragment resources? -->

1. Open the Site menu (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Documents and Media*.

1. Open the Add menu, (![Add](./../../images/icon-add.png)), then click *Multiple Files*.

1. Select all the files in `liferay-q9c4.zip/images` and click *Publish*.

These images will appear in Documents and Media:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `banner-image.png`
   - `db-green-1w.svg`
   - `db-green-3.svg`
   - `sign-in-image.png`


Now that you've imported the fragments and resources, you can use them to create the Delectable Bonsai site.
