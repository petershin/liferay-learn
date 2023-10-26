---
uuid: 7ff35121-6281-42cc-873d-c0a1c94d4eae
---
# Building Responsive Layouts with the Grid Fragment
<!--TASK: Reconsider article.-->
> Availability: Liferay DXP 7.3+.

Liferay DXP [uses responsive design](./building-a-responsive-site.md) by default, but there are situations where you want additional and more granular control of the content layout. By using the [Grid Fragment](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) in your Content Page, you gain precise control of the content layout for the different screen sizes in desktop and mobile devices. When you [edit a Content Page](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md), you can use the Grid Fragment (1) to outline your content and define customized layout styles (2) for the different target devices in the Device Display section (3). For example, you can customize the number of modules per row or the grid padding options for smartphone-size screens only.

![Using the Grid Fragment you can customize the layout options for different screen sizes.](./building-responsive-layouts-with-the-grid-fragment/images/04.png) 

Consider the following example. The Services section of your insurance company website provides potential customers an overview of the services you offer. This section uses a series of Card Fragments inside a three-modules Grid Fragment, with information for three different services.

![You can customize your content layout combining the Grid Fragments with other Fragments.](./building-responsive-layouts-with-the-grid-fragment/images/01.png) 

When you access this 'Services' Content Page from your computer, the grid layout shows the expected result. However, when you access the page from your smartphone, the result is not optimal because of the amount of text and the width of each Card Fragment. Using the Grid Fragment Styles, you can customize the number of cards to show on each module and modify styles for the best viewing experience on different screen sizes.

![The default grid layout style is not optimized for a smartphone-sized screen.](./building-responsive-layouts-with-the-grid-fragment/images/02.png)

## Modifying the Layout of the Grid Fragment

1. [Configure the Grid Fragment](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) on the Content Page.
1. In the Editing sidebar, click the *Browser* (![Simulation](../../../images/icon-hierarchy.png)) button and click the Grid Fragment you want to customize.
1. In the Device Display section of the Editing Toolbar, select the screen size you want to optimize.

    ![Select the screen size you want to customize in the Device Display section.](./building-responsive-layouts-with-the-grid-fragment/images/06.png)

1. In the Configuration Sidebar, under the *General* tab, select the preferred layout options for the screen size. For example, one module per row works much better for the *Portrait Phone* layout option.
1. Select the image to configure its *Resolution* for the target screen size (available in Liferay DXP 7.4+), or leave the default *Auto* option to use [Adaptive Media](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/using-adaptive-media.md).

    ![Select the image resolution for the target screen size or leave the Auto option to use Adaptive Media.](./building-responsive-layouts-with-the-grid-fragment/images/05.png) 

1. Click *Publish*.
1. Optionally, click the *Simulation* (![Simulation](../../../images/icon-simulation.png)) button on the main toolbar to see your changes on the target device.

```{tip}
You can save and reuse the Grid Fragment configuration of your choice in other Content Pages. For more information, see [Saving Fragment Compositions](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md).
```

## Related Topics

- [Building a Responsive Site Overview](./building-a-responsive-site.md)
- [Saving Fragment Compositions](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md)
- [Using Layout Elements](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)
