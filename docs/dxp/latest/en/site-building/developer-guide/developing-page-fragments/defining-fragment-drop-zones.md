# Defining Fragment Drop Zones

Drop zones are integral to building your Content Pages. With them, you can create unique Page layouts and dynamic displays by defining areas within Fragments where Users can drag and drop other Fragments and widgets.

Follow these steps to define a drop zone:

1. Go to *Site Administration* &rarr; *Design* &rarr; *Fragments*.

1. Under Fragment Sets, select the Set with the Fragment you want to edit.

1. Click the Fragment's *Actions* (![Action](./../../../images/icon-actions.png)) button and select *Edit* to open the [Fragments Editor](./using-the-fragments-editor.md).

1. In the HTML code area, add the `<lfr-drop-zone></lfr-drop-zone>` label to define a drop zone within a Fragment.

   ```{important}
   Drop zones cannot be added to editable elements within a fragment.
   ```

The following code excerpt shows how to use this label to define drop zones within a Tabs Fragment:

   ```html
      <div class="tab-panel">
         [#list 0..configuration.numberOfTabs-1 as i]
         <div aria-labelledby="tab${i+1}" class="tab-panel-item d-none" data-fragment-namespace="${fragmentEntryLinkNamespace}" id="tabPanel${i+1}" role="tabpanel" tabindex="0">
            <lfr-drop-zone></lfr-drop-zone>
         </div>
         [/#list]
      </div>
   ```

This image shows the result in the Content Page editor sidebar:

![The Tab Fragment shows four different drop zones in the Content Page editor.](./defining-fragment-drop-zones/images/04.png)

Once defined, you can drag and drop any Fragment or widget into the drop zone.

```{tip}
Drop zones do not have an ID. They are rendered in the order they are specified, and they cannot be moved manually. However, you can configure the order of [other elements in the Fragment](./setting-the-order-of-elements-in-a-fragment.md).
```

## Additional Information

- [Developing Fragments](./developing-fragments-intro.md)
- [Using the Fragments Editor](./using-the-fragments-editor.md)
- [Using the Fragments Toolkit](./using-the-fragments-toolkit.md)
- [Setting the Order of Elements in a Fragment](./setting-the-order-of-elements-in-a-fragment.md)
