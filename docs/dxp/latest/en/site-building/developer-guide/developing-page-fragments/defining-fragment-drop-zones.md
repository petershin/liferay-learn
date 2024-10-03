---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: ac5e5ddc-ee51-48a5-86ac-ac47e6a0ea0e
---

# Defining Fragment Drop Zones

Drop zones are integral to building your content pages. With them, you can create unique page layouts and dynamic displays by defining areas within fragments where users can drag and drop other fragments and widgets.

To define a drop zone,

1. Go to *Site Administration* &rarr; *Design* &rarr; *Fragments*.

1. Under Fragment Sets, select the set with the fragment you want to edit.

1. Click *Actions* (![Action](../../../images/icon-actions.png)) for the fragment you want to edit and select *Edit* to open the [Fragments Editor](./using-the-fragments-editor.md).

1. In the HTML code area, add the `<lfr-drop-zone></lfr-drop-zone>` label to define a drop zone within a fragment.

   !!! important
       Drop zones cannot be added to editable elements within a fragment.

The following code excerpt shows how to use this label to define drop zones within a Tabs fragment:

   ```html
      <div class="tab-panel">
         [#list 0..configuration.numberOfTabs-1 as i]
         <div aria-labelledby="tab${i+1}-${fragmentEntryLinkNamespace}" class="d-none tab-panel-item" data-fragment-namespace="${fragmentEntryLinkNamespace}" id="tabPanel${i+1}-${fragmentEntryLinkNamespace}" role="tabpanel" tabindex="0">
            <lfr-drop-zone data-lfr-drop-zone-id="${i+1}" data-lfr-priority="${i+1}"></lfr-drop-zone>
         </div>
         [/#list]
      </div>
   ```

Here's the result in the content page editor sidebar:

![The Tab fragment shows four different drop zones in the content page editor.](./defining-fragment-drop-zones/images/04.png)

Once defined, you can drag and drop any fragment or widget into the drop zone.

## Fragment Drop Zone IDs

To keep fragments in their designated drop zones, use the `data-lfr-drop-zone-id` attribute. Drop zone IDs ensure fragments stay in place when zones are reordered or new ones are inserted.

If you delete and propagate a drop zone with a unique ID, the zone and its content are removed. Adding a zone with the same ID restores content from unpublished drafts, but in published drafts, it's treated as a new zone.

Drop zone IDs are optional. Zones without IDs function in the specified order. Adding IDs to an existing fragment and propagating it applies the IDs starting from the initial propagation.

## Related Topics

- [Developing Fragments](../developing-page-fragments.md)
- [Using the Fragments Editor](./using-the-fragments-editor.md)
- [Using the Fragments Toolkit](./using-the-fragments-toolkit.md)
- [Setting the Order of Elements in a Fragment](./setting-the-order-of-elements-in-a-fragment.md)
