# Creating and Managing Experiences

{bdg-secondary}`Some experiences functionality is available in Liferay 7.4+, 7.3 Fix Pack 1+, and 7.2 Fix Pack 11+ only`

You can customize your content page to different groups of users using *Experiences*. To learn about Liferay DXP Experiences, see [Content Page Personalization](./content-page-personalization.md).

## Creating a New Content Page Experience

1. Go to *Site Administration* &rarr; *Site Builder* &rarr; *Pages*.

1. Click the *Actions* (![Actions](../../../images/icon-actions.png)) menu and select *Edit*, or [create a new content page](../../creating-pages/using-content-pages.md).

1. At the top of the page, for the *Experience* click on *Default* to open the experience selection dialog.

1. Click the Actions (![Actions](../../../images/icon-actions.png)) menu and select *Edit*, or [create a new Content Page](../../creating-pages/adding-pages/adding-a-page-to-a-site.md).

1. At the top of the page, for the Experience click *Default* to open the experience selection dialog.

    ![Click on Experience to select your experience or click New Experience to create a new one.](./creating-and-managing-experiences/images/01.png)

1. Click *New Experience*.

1. Enter a name for the Experience and select the Segment for the audience you want to target, or [create a New Segment](../segmentation/creating-and-managing-user-segments.md) {bdg-secondary}`Available in Liferay DXP 7.2 Fix Pack 1+ and Liferay Portal 7.2 CE GA2+.`

    ```{note}
    New experiences are assigned to the *Anyone* Segment by default and target all website visitors.
    ```

1. Edit your content page with the information and layout you want to show to the selected segment.

1. Using the Up (![Up](../../../images/icon-angle-up.png)) and Down (![Down](../../../images/icon-angle-down.png)) controls, move the Experience in the list to set its precedence (see [Understanding How Experiences Work](./content-page-personalization.md#understanding-how-experiences-work) for more information).

1. Click *Publish*.

The default version of the page appears for everyone except for members of the selected segment, who see a version of the site for their defined segment.

## Managing Content Page Experiences

When you edit a content page, you can click on the experience to manage the options for that page.

![You can add, edit, delete, or change priority for Experiences.](./creating-and-managing-experiences/images/03.png)

1. Go to *Site Administration* &rarr; *Site Builder* &rarr; *Pages*.

1. Click the *Actions* (![Actions](../../../images/icon-actions.png)) menu and select *Edit*.

1. Click on the experience you want to manage. From here you can

   - Set the experience priority, using the Up (![Up](../../../images/icon-angle-up.png)) and Down (![Down](../../../images/icon-angle-down.png)) controls.
   - Edit (![Edit](../../../images/icon-edit.png)) the experience's name or the selected segment.
   - Duplicate (![Duplicate](../../../images/icon-copy.png)) the experience {bdg-secondary}`Available in Liferay DXP 7.4+, 7.3 Fix Pack 1+, and 7.2 Fix Pack 11+.`
   - Delete (![Delete](../../../images/icon-delete.png)) the Experience.

    ```{important}
    The order of your Experiences in the Experience selector determines the Experience precedence. See *Understanding How Experiences Work* in [Content Page Personalization](./content-page-personalization.md) for more information.
    ```

## Related Information

- [Content Page Personalization](./content-page-personalization.md)
- [Personalizing Collections](./personalizing-collections.md)
- [Creating and Managing User Segments](../segmentation/creating-and-managing-user-segments.md)
