---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 6accf706-b809-4189-b014-2a90d4362f04
---
# Search Results Widget Display Templates

The Search Results widget's out-of-the-box view is useful, but you can choose a different view or create your own if needed. See [Styling Widgets with Widget Templates](../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) to learn about creating templates for a widget's display.

From the [Search Results widget's configuration](./configuring-the-search-results-widget.md) screen, you can choose an available template for the Search Results widget.

## Out-of-the-Box Templates

The default template, _List Layout_, displays results in a paginated list.

Use the _Card Layout_ to display results in rows of cards.

Use the _Compact Layout_ to display just a list of titles.

## Creating a Search Results Widget Template

To create a widget template for the Search Results widget,

1. Go to the site where you want to use the template.

   !!! note
       The out-pf-the-box widget templates are all added to the Global site. You can do the same or add yours to a specific site.

1. Open _Site_ &rarr; _Design_ &rarr; _Templates_.

1. Click the _Widget Templates_ tab.

1. Click _New_ &rarr; _More_.

1. Choose the first _Search Results Template_ from the list. The second one is for the Commerce Search Results widget.

1. Using the editors predefined variables, create your template using FreeMarker.

Once you save the template, you can select it from the Search Results widget.

Rather than writing a widget template from scratch, you can accelerate the template development process by copying an existing template and modify it.

To copy an existing template,

1. Go to the Global site. Click _Select Site_ (![Go to Site](../../../images/icon-compass.png)) &rarr; _My Sites_ &rarr; _Global_.

1. Open _Site_ &rarr; _Design_ &rarr; _Templates_.

1. Click the _Widget Templates_ tab.

1. Search for the title of the template you want to copy. For example, search for _compact_ if you're hoping to start with the FreeMarker for the Compact Layout template. Click _Actions_ (![Actions](../../../images/ison-actions.png)) for the result with the Type value _Search Results Template_.

   SCREENSHOT

1. Using the editor's predefined variables and your own FreeMarker.

   SCREENSHOT

## Example: Extending the Compact Layout Template

In this example, extend the Compact Layout template to include the last modified date of the result:

1. In the Global site's menu, open _Site_ &rarr; _Design_ &rarr; _Templates_ and click the _Widget Templates_ tab.

1. Search for _compact_, then click _Actions_ (![Actions](../../../images/ison-actions.png)) &rarr; _Make a Copy_ for the Search Results Template.

1. Name it _Compact with Modified Date_.

1. Your copy appears in the list with the others, so click _Compact with Modified Date_ to begin editing.

1. Replace the list item with this code:

   ```html
   <li class="c-mb-3 c-mt-3">
      <a class="link-primary single-link" href="${entry.getViewURL()}">
         ${entry.getHighlightedTitle()}
      </a>
      <details class="text-2">
         <summary>Details...</summary>
         <p class ="c-mb-0 c-mt-0">
            Last modified:<em>${entry.getModifiedDateString()?keep_before(",")}</em>
         </p>
         <p class ="c-mb-0 c-mt-0">
            Edited by: <em>${entry.getModifiedByUserName()}</em>
         </p>
      </details>
   </li>
   ```
1. Click _Save_.


## Related Topics
