---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 1ec379d2-11e2-4123-8b53-2a6a2919fe21
---

# Setting the Order of Elements in a Fragment

{bdg-secondary}`Liferay 7.4+`

The [Slider](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) or [Tab](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) fragments are typically used to show different areas of information. Sliders present this information in a carousel of slides. Tabs have multiple tabs, each one containing different information.

When configuring Slider or Tab fragments in a page or template, their sub-elements appear in the *Selection* panel (![Selection](../../../images/icon-pages-tree.png)) in the sidebar menu. Before Liferay DXP 7.4, these elements were not presented in order. This made it difficult to identify how the Slider or Tab elements were grouped, especially for fragments with many elements.

![Liferay DXP 7.4+ shows the order of elements in a fragment in order.](./setting-the-order-of-elements-in-a-fragment/images/01.png)

Starting with Liferay DXP 7.4, the Slider and Tab fragments show their elements in order. Additionally, Liferay DXP 7.4 includes the new `data-lfr-priority` HTML attribute to set the order of elements in a fragment. Elements with a lower `data-lfr-priority` value have precedence in the selection list, independently of their order in the HTML code.

## Customizing the Order of Elements in the Slider Fragment

1. Go to *Site Administration* &rarr; *Design* &rarr; *Fragments*.

1. Under *Fragment Sets*, click the set with the fragment you want to customize.

1. Click on the Slider or Tab fragment's *Actions* (![Action](../../../images/icon-actions.png)) button and select *Edit* to open the [Fragments Editor](./using-the-fragments-editor.md).

   ![Edit the imported fragment to open the Fragment Editor.](./setting-the-order-of-elements-in-a-fragment/images/06.png)

1. In the HTML code area, you can edit the Slider fragment code. Add the `data-lfr-priority` attribute to the Editable or Drop Zone areas. This example configures the carousel elements to use this order:

   1. `First Slide Title`, with `data-lfr-priority="1"`
   1. `First Slide Subtitle`, with `data-lfr-priority="2"`
   1. `First Responsive Image`, with `data-lfr-priority="3"`

   ```html
   <div class="carousel-inner text-break" id="${fragmentEntryLinkNamespace}-carouselInner" role="group">
      <div class="carousel-item active">
         <img
            alt="First Responsive Image"
            class="w-100"
            data-lfr-editable-id="01-01-image"
            data-lfr-editable-type="image"
            data-lfr-priority="3"
            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAJCAYAAAA7KqwyAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAkSURBVHgB7cxBEQAACAIwtH8Pzw52kxD8OBZgNXsPQUOUwCIgAz0DHTyygaAAAAAASUVORK5CYII="
         />

         <div class="carousel-caption d-none d-md-block">
            <h2
               data-lfr-editable-id="01-02-title"
               data-lfr-editable-type="rich-text"
               data-lfr-priority="1"
            >
               First Slide Title
            </h2>

            <p
               data-lfr-editable-id="01-03-subtitle"
               data-lfr-editable-type="rich-text"
               data-lfr-priority="2"
            >
               First Slide Subtitle
            </p>
         </div>
      </div>
   </div>
   ```

   This is the result you see in the content page editor when you click *Selection* (![Selection](../../../images/icon-pages-tree.png)):

   ![Elements in the Slider fragment use the order you define in the HTML code.](./setting-the-order-of-elements-in-a-fragment/images/07.png)

   !!! note
       You don't need to edit other parts of the Fragment's code, like JavaScript, CSS, or configuration.

## Verifying the New Order of Elements in the Content Page Editor

1. Go to *Site Administration* &rarr; *Site Builder* &rarr; *Pages*.

1. Edit the content page where you want to add the Slider fragment sample (or [add a new page](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)).

1. From the content page sidebar, click *Fragments and Widgets* (![Fragments and Widgets](../../../images/icon-add-widget.png)).

1. Under the fragments column, find the Slider or Tab fragment you want to show.

1. Drag and drop the fragment onto the editing area.

1. In the content page Sidebar, click the *Selection* (![Selection](../../../images/icon-pages-tree.png)) button to show the list of elements in your fragment.

   !!! note
       Slider or Tab fragments that you import from a version prior to Liferay DXP 7.4 appear in order in the content page editor sidebar but don't include the `data-lfr-priority` HTML attribute. You must edit the HTML fragment code to include this attribute.

## Related Information

- [Using the Fragments Toolkit](./using-the-fragments-toolkit.md)
- [Using the Fragments Editor](./using-the-fragments-editor.md)
- [Developing Fragments](../developing-page-fragments.md)
