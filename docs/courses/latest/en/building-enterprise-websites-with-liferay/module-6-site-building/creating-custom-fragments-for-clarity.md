---
uuid: 0ee02e47-43d2-4ab8-bd30-10f4872e9022
---
# Creating Custom Fragments for Clarity

Liferay offers a wide range of out-of-the-box fragments and configurations to help streamline website development. However, when these options don't satisfy your design requirements, you can quickly create custom fragments using HTML, CSS, and JavaScript. In addition to these core web development languages, you can leverage Clay utilities<!--w/c? Styles?-->, define configuration options using JSON, and add Liferay-specific tags and attributes. These elements empower you to define editable sections, embed widgets, reuse available classes, and more.

<!--TASK: ![Create custom fragments to reuse in pages and templates.](./creating-custom-fragments-for-clarity/images/01.png) -->

Liferay DXP includes the fragments editor UI for creating and managing fragments in your site. You can also export fragment sets to work locally and them import them back into Liferay. You can also instantiate a React component in a fragment using static JS imports. Additionally, you can export fragment sets and work on them locally, using your preferred tools. Then, once your local work is complete, you can import the set back into Liferay. Furthermore, you can instantiate React components within your page fragments using static JavaScript imports, expanding the range of functionalities you can integrate into your custom fragments.

Here you'll use the Fragments Editor UI to create and import Clarity's custom fragments.

!!! tip “When to Use Custom Fragments”
    Liferay recommends using out-of-the-box fragments and configuration options whenever possible. When you do need custom fragments, Liferay recommends leveraging available style tokens to simplify fragment code, which promotes design consistency across your website elements and improved maintainability.

<!--TASK:
## Defining Fragment Configuration Options

## Using Liferay Tags and Attributes

## Updating Fragments

Propagation.

-->

## Exercise One: Creating the Clarity Fragment Set

Liferay organizes fragments into sets to improve management and create an additional level of resource control. These sets can group fragments by functionality, team, or any other relevant characteristic. You can also add resources to fragment sets, making them accessible only to fragments within that set.

Clarity wants a fragment set for storing custom master page fragments. While logged in as Walter Douglas,

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Click the *Add* button (![Add Button](../../images/icon-plus.png)).

1. For name, enter `Clarity Components`.

1. Click *Save*.

   ![Add the Clarity Components fragment set.](./creating-custom-fragments-for-clarity/images/02.png)

   <!--TASK: Update Image -->

Now that you have the Clarity fragment set, you can start adding custom fragments to it.

## Exercise Two: Creating Custom Fragments

When creating a fragment, you can copy and modify existing fragments or start from scratch. You can also create custom fragments by saving container compositions in the page editor. Saving container compositions offers a convenient way to recreate specific arrangements of fragments on other pages. However, you cannot edit compositions via the Fragments Editor UI.

Clarity needs two custom fragments for their master pages:

* Log In and User Menu
* Search Button

### Creating the Login and User Menu Fragment

To create the Login and User Menu fragment,

1. Click *New*, select Basic Fragment, and click *Next*.

1. Enter `Login and User Menu` and click *Add*.

1. Go to the *Configuration* tab and enter this code:

   ```json
   {
      "fieldSets": [
         {
            "fields": [
               {
                  "dataType": "string",
                  "defaultValue": "user",
                  "label": "icon-name",
                  "name": "iconName",
                  "type": "text"
               },
               {
                  "dataType": "string",
                  "defaultValue": "1rem",
                  "label": "icon-size",
                  "name": "iconSize",
                  "type": "select",
                  "typeOptions": {
                     "validValues": [
                        {
                           "value": "1rem"
                        },
                        {
                           "value": "1.5rem"
                        },
                        {
                           "value": "2rem"
                        },
                        {
                           "value": "2.5rem"
                        },
                        {
                           "value": "3rem"
                        }
                     ]
                  }
               }
            ]
         }
      ]
   }
   ```

   ![Copy and paste this code in the Configuration tab.](./creating-custom-fragments-for-clarity/images/03.png)

1. Return to the *Code* tab and enter copy this into the HTML window:

   ```html
   [#if !themeDisplay.isSignedIn()]
   <div class="component-button text-break">
      <a
         class="btn"
         data-lfr-editable-id="link"
         data-lfr-editable-type="link"
         href=""
         id="fragment-${fragmentEntryLinkNamespace}-link"
      >
         <span style="font-size: ${configuration.iconSize}">
            [@clay["icon"] symbol="${configuration.iconName}" /] Log In
         </span>
      </a>
   </div>
   [#else]
      <div class="user-menu">
         [@liferay.user_personal_bar /]
      </div>
   [/#if]
   ```

   ![Copy and paste this code into the HTML window.](./creating-custom-fragments-for-clarity/images/04.png)

1. Click *Publish*.

### Creating the Search Button

1. Click *New*, select Basic Fragment, and click *Next*.

1. Enter `Search Button` and click *Add*.

1. Go to the *Configuration* tab and enter this code:

   ```json
   {
      "fieldSets": [
         {
            "fields": [
               {
                  "dataType": "string",
                  "defaultValue": "search",
                  "label": "icon-name",
                  "name": "iconName",
                  "type": "text"
               },
               {
                  "dataType": "string",
                  "defaultValue": "1rem",
                  "label": "icon-size",
                  "name": "iconSize",
                  "type": "select",
                  "typeOptions": {
                     "validValues": [
                        {
                           "value": "1rem"
                        },
                        {
                           "value": "1.5rem"
                        },
                        {
                           "value": "2rem"
                        },
                        {
                           "value": "2.5rem"
                        },
                        {
                           "value": "3rem"
                        }
                     ]
                  }
               }
            ]
         }
      ]
   }
   ```

1. Return to the *Code* tab and enter copy this into the HTML window:

   ```html
   <div class="component-button text-break">
      <a
         class="btn"
         data-lfr-editable-id="link"
         data-lfr-editable-type="link"
         href="#"
         id="fragment-${fragmentEntryLinkNamespace}-link"
      >
         <span style="font-size: ${configuration.iconSize}">
            [@clay["icon"] symbol="${configuration.iconName}" /]
         </span>
      </a>
   </div>
   ```

1. Click *Publish*.

You can now add these fragments to Clarity's master pages. But before you do this, let's import some additional fragments that you'll use throughout the following exercises.

## Exercise Three: Importing Fragments

Clarity's team has provided some additional fragments and compositions to help us wireframe the rest of their pages.

To use these fragments, you must first import them to your site:

1. Click the *Actions* button (![Actions Button](../../images/icon-actions.png)) for the Clarity Components fragment set and select *Import*.

   ![Click the Actions button for the fragment set and select Import.](./creating-custom-fragments-for-clarity/images/05.png)

1. Click *Select File* and select the `clarity-components.zip` file in the Module 6 exercise resources folder (i.e., `enablement-bootcamp-clarity/exercises/module-6-site-building/clarity-components.zip`).

1. Select *Overwrite Existing Items* and click *Import*.

1. Click *Done* once finished.

1. Click the *Actions* button (![Actions Button](../../images/icon-actions.png)) for Fragment Sets and repeat the above steps to import these zip files from the exercise resources folder:

   * `clarity-page-compositions.zip`
   * `clarity-display-compositions.zip`

   ![Click the Actions button for the Fragment Sets and select Import.](./creating-custom-fragments-for-clarity/images/06.png)

## Exercise Four: Adding Custom Fragments to Master Pages

Now that you've added Clarity's custom fragments, you can add them to Clarity's master page templates.

1. Begin editing the *Primary Master Page*.

1. Add these custom fragments:

   | Container           | Fragments                          |
   |:--------------------|:-----------------------------------|
   | Header User Actions | Search Button, Login and User Menu |

1. Click *Publish*.

1. Repeat these steps for the *Secondary Master Page* template.

## Conclusion

Congratulations! You've created and imported custom fragments and compositions for Clarity's pages. You've also completed wireframing Clarity's master pages.

Next, you’ll use the fragment compositions to wireframe the content area for each page (content, display, and utility).

Next Up: [Wireframing Clarity’s Pages](./wireframing-claritys-pages.md)
