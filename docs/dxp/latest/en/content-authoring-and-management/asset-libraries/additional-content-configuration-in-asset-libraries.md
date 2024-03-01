---
taxonomy-category-names:
- Digital Asset Management
- Asset Libraries
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: eab61f93-ede9-48d8-adb8-4fa10438a5c9
---

# Additional Content Configuration in Asset Libraries

Although creating content in asset libraries is essentially the same as creating it in a site, the differences being mainly its scope and default theme settings, some content requires additional configuration when set within an asset library's context.

These are the contents that require additional configuration:

- [Categories and Vocabulary](#categories-and-vocabulary)

## Categories and Vocabulary

Besides the regular configurations for [categories and vocabularies](../tags-and-categories/defining-categories-and-vocabularies-for-content.md), while creating a vocabulary within an asset library, some additional configurations are available.

To add a vocabulary to an asset library,

1. Open the *Global Menu* (![Applications Menu](../../images/icon-applications-menu.png)), go to the *Applications* tab, and select *Asset Libraries* under Content.

1. Click on the name of the asset library where you want to add your vocabulary.

1. Under categorization, click *Categories*.

1. Click *Add* (![Add icon](../../images/icon-add-widget.png)) next to Vocabularies.

1. In the page that opens, configure whether or not that vocabulary is required and where it's required. You can find the configuration under Associated Asset Types with three options:

   ![Determine whether the vocabulary is required and set where it's required.](./additional-content-configuration-in-asset-libraries/images/01.png)

   | Option                                                 | Description                                                                                      |
   |:-------------------------------------------------------|:-------------------------------------------------------------------------------------------------|
   | Not Required                                           | The vocabulary field is not required.                                                            |
   | Only Required in This Asset Library                    | The vocabulary field is only required in content created in that asset library.                  |
   | Required in This Asset Library and Its Connected Sites | The vocabulary field is required in content created in the asset library and in connected sites. |

   !!! note
      When the vocabulary is marked as required, an asterisk marks the vocabulary field and content can only be saved if the vocabulary field is filled. Trying to save content without the required vocabulary causes a message error to appear.

   ![Determine whether the vocabulary is required and set where it's required.](./additional-content-configuration-in-asset-libraries/images/02.png)

Note that when using the Required in This Asset Library and Its Connected Sites option, if a [site gets disconnected](./creating-and-managing-asset-libraries.md#sites) from the asset library, the vocabulary stops being shown on the content created at a site level. Without the required vocabulary, you can publish content without filling in the vocabulary field.

On the other hand, if a site gets connected to an asset library with a required vocabulary, the vocabulary becomes required for the content on that site which makes filling in the vocabulary field mandatory and saving the content impossible without filling the required vocabulary field first.

## Related Topics

- [Asset Library Content](./asset-library-content.md)
- [Creating and Managing Asset Libraries](./creating-and-managing-asset-libraries.md)
