---
uuid: 4925291c-19c3-411d-9870-7f1768ad6df7
---
# Importing Fragments and Resources

Clarity needs fragments and images in the site to aid in building out their pages. With these the site creators have the resources required to create the site while meeting design and branding requirements. Log in as Preston Palmer, the site administrator user, for this exercise.

## Downloading the Fragments and Images

1. Download and unzip the fragment set:

   <!-- URL needs help -->
   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/creating-pages/importing-fragments-and-resources/liferay-q9c4.zip -O
   ```

   ```bash
   unzip liferay-q9c4.zip
   ```

## Importing the Images

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Documents and Media*.

1. Open the *Add* menu, (![Add](./../../images/icon-add.png)), then click *Multiple Files*.

1. Select all the files in `liferay-q9c4.zip/images` and click *Publish*.

These images appear in Documents and Media:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `clarity-banner-image.png`
   - `clarity-logo.png`
   - `clarity-sign-in-image.png`

## Importing the Fragments and Compositions

First zip up the fragment set that was included in the `liferay-q9c4.zip` folder, then import the fragments, compositions, and resources into Liferay.

1. Go to `liferay-q9c4.zip` and enter

   ```bash
   zip clarity-fragments.zip clarity-fragments -r
   ```

1. In Liferay, open the Site menu (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Open the fragment set *Actions* menu (![Actions Button](../../images/icon-actions.png)) and select *Import*.

1. Select `clarity-fragments.zip` and click *Import*.

1. Repeat the procedure for the remaining zip files in `liferay-q9c4.zip/fragments`.

   When finished these fragments appear in the fragment set:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `banner-composition`
   - `footer-composition`
   - `header-composition`
   - `home-page-slider-composition`
   - `home-page-slider-fragment`
   - `sign-in-fragment`
   - `user-nav-fragment`

   There are fragment compositions and custom fragments in this folder. In addition, `sign-in-image.png` was included as a fragment resource. See the Resources tab of the fragment set to confirm.

   - Custom fragments are developed by you, if none of the [out-of-the-box fragments](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference) suit your needs. Often you can start by [copying an existing fragment](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/duplicating-fragments) that contains some of the HTML, CSS, or JavaScript you'll need to create your own fragment.
   - [Fragment compositions](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) are reusable fragment groups you've added to the content page editor and saved for repeated use.

Now that you've imported the required fragments and resources, you can use them to [create the Clarity site](./adding-the-home-page.md).

## Relevant Concepts

* [Default Fragments Reference](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference)
* [Managing Fragments](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments)
* [Including Default Resources with Fragments](https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/including-default-resources-with-fragments.html)
