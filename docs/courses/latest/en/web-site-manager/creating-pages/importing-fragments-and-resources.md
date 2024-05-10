---
uuid: 4925291c-19c3-411d-9870-7f1768ad6df7
---
# Importing Fragments and Resources

First, you'll import fragments and images created by their designers to aid in building out their pages. With these, the site creators have the resources required to create the site while meeting Clarity's design and branding requirements. Log in as Preston Palmer, the site administrator user, for this exercise.

## Downloading the Images

1. Download and unzip the images:

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/creating-pages/importing-fragments-and-resources/liferay-q9c4.zip -O
   ```

   ```bash
   unzip liferay-q9c4.zip
   ```

## Importing the Images

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Documents and Media*.

1. Click *Add*, (![Add](./../../images/icon-add.png)), then click *Multiple Files*.

1. Select all the files in `liferay-q9c4.zip/images` and click *Publish*.

These images appear in Documents and Media:

- `clarity_banner.jpg`
- `clarity_logo.png`
- `clarity-testimonials.jpg`

## Downloading the Fragment Set

1. Download the fragment set:

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/creating-pages/importing-fragments-and-resources/liferay-j2b6.zip -O
   ```

## Importing the Fragment Set

1. In Liferay, open the Site menu (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Click *Actions* next to the fragment set (![Actions Button](../../images/icon-actions.png)) and select *Import*.

1. Select `liferay-j2b6.zip` and click *Import*.

   When finished these fragments appear in the fragment set:

   - `banner-composition`
   - `footer-composition`
   - `header-composition`
   - `home-page-slider-composition`
   - `home-page-slider-fragment`
   - `sign-in-fragment`
   - `user-nav-fragment`

   There are fragment compositions and custom fragments in this folder. In addition, `sign-in-image.png` was included as a fragment resource. See the fragment set's Resources tab to confirm.

   - Custom fragments are developed by you, if none of the [out-of-the-box fragments](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference) suit your needs. Often you can start by [copying an existing fragment](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/duplicating-fragments) that contains some of the HTML, CSS, or JavaScript you'll need to create your own fragment.
   - [Fragment compositions](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) are reusable fragment groups you've added to the content page editor and saved for repeated use.

Next: [add the home page](./adding-the-home-page.md) using these fragments.

## Relevant Concepts

* [Default Fragments Reference](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference)
* [Managing Fragments](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments)
* [Including Default Resources with Fragments](https://learn.liferay.com/w/dxp/site-building/developer-guide/developing-page-fragments/including-default-resources-with-fragments)
