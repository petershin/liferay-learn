---
uuid: 4925291c-19c3-411d-9870-7f1768ad6df7
---
# Importing Fragments and Resources

Clarity needs fragments and images in the site to aid in building out their pages. With these the site creators have the resources required to create the site while meeting design and branding requirements. Log in as Preston Palmer, the site administrator user, for this exercise.

<!-- You haven't explained what a fragment is or what students will do with it. That needs to go into the intro article. -Rich -->

## Downloading and Importing the Fragments

<!--This will be the site administrator user--maybe add a story about being handed these resources from the development team? -->

<!-- Sounds good to me. Students should also understand why that is: because fragments are HTML, CSS, and JavaScript, and you explained this in the intro. -Rich -->

1. Download and unzip the fragment set:

   <!-- URL needs help -->
   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/creating-pages/importing-fragments-and-resources/liferay-q9c4.zip -O
   ```

   ```bash
   unzip liferay-q9c4.zip
   ```

## Importing the Fragments and Compositions

1. Open the Site menu (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Add a fragment set for Clarity's custom fragments and compositions. Click *Add* (![Add](../../images/icon-plus.png)) for Fragment Sets.

1. Name the fragment set _Clarity Fragments_ and click _Save_.

1. Open the fragment set's *Actions* menu (![Actions Button](../../images/icon-actions.png)) and select *Import*.

1. Select a zip file in `liferay-q9c4.zip/fragments` and click *Import*.

1. Repeat the procedure for the remaining zip files in `liferay-q9c4.zip/fragments`.

   When finished these fragments appear in the fragment set:

   <!-- This list will need to be finalized at the end of drafting the module-->
   <!-- Find out how to import the whole set instead of one-by-one -->
   - `banner-composition.zip`
   - `footer-composition.zip`
   - `header-composition.zip`
   - `home-page-slider-composition.zip`
   - `home-page-slider-fragment.zip`
   - `sign-in-fragment.zip`
   - `user-nav-fragment.zip`

   There are fragment compositions and custom fragments in this folder.

   - Custom fragments are developed by you, if none of the [out-of-the-box fragments](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference) suit your needs. Often you can start by [copying an existing fragment](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/duplicating-fragments) that contains some of the HTML, CSS, or JavaScript you'll need to create your own fragment.
   - [Fragment compositions](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) are reusable fragment groups you've added to the content page editor and saved for repeated use.

Next, import some fragment resources.

<!-- using resources requires updates to the articles--the banner image needs to be available for manual configuration, but it's not if it's part of fragment resources (unless you set dl.show.hidden.mount.folders=true, then you can see them as part of docs and media) -->
## Importing Fragment Resources

1. While viewing the fragment set, click _Resources_. 

1. Click *Add* (![Add](./../../images/icon-add.png)).

1. Select one of the files in `liferay-q9c4.zip/images` and click *Add*.

1. Repeat the procedure for the remaining files in `liferay-q9c4.zip/images`.

These images appear in Documents and Media:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `banner-image.png`
   - `db-green-1w.svg`
   - `db-green-3w.png`
   - `db-green-3.svg`
   - `marketing-slider-1.png`
   - `marketing-slider-2.png`
   - `marketing-slider-3.png`
   - `sign-in-image.png`

## Importing the Images

<!-- Documents and Media versus fragment resources? -->

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Documents and Media*.

1. Open the *Add* menu, (![Add](./../../images/icon-add.png)), then click *Multiple Files*.

1. Select all the files in `liferay-q9c4.zip/images` and click *Publish*.

These images appear in Documents and Media:

   <!-- This list will need to be finalized at the end of drafting the module-->
   - `banner-image.png`
   - `db-green-1w.svg`
   - `db-green-3.svg`
   - `sign-in-image.png`


Now that you've imported the fragments and resources, you can use them to create the Clarity site.

<!-- Add Relevant Concepts from the docs here. This is an important part of the courses. Since we don't explain every feature (only the ones we'll use), you want to link to the full documentation for that feature at the bottom. -Rich -->
