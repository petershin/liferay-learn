---
toc:
  - ./using-adaptive-media/adding-image-resolutions.md
  - ./using-adaptive-media/managing-image-resolutions.md
  - ./using-adaptive-media/using-adapted-images-in-site-content.md
  - ./using-adaptive-media/migrating-documents-and-media-thumbnails.md
  - ./using-adaptive-media/adaptive-media-configuration-reference.md
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: bd2ce0e7-dc9c-40c0-b323-d0a3ca2440d0
---

# Using Adaptive Media

{bdg-secondary}`Liferay 7.4+`

Liferay Adaptive Media processes images stored in the document library to produce copies at different resolutions. Once generated, you can [use the adapted images](./using-adaptive-media/using-adapted-images-in-site-content.md) in the Documents and Media application, blogs, web content, and content pages to serve the optimal image resolution for the end user's device. In most cases, this reduces page size, improves load times, and saves bandwidth.

!!! warning
    Adaptive Media generally improves performance by adapting images to optimal sizes. However, when adapting certain formats like webP or AVIF, the adapted images may increase in size or be converted to PNG for broader browser compatibility. This may result in larger file sizes than the original images in some cases.

By default, Adaptive Media includes preview (1000px auto) and thumbnail (300px/300px) resolutions, but you can [define additional resolutions](./using-adaptive-media/adding-image-resolutions.md). Adaptive Media then listens for when users upload [supported media types](./using-adaptive-media/adaptive-media-configuration-reference.md#images) and begins parallel, asynchronous processes for generating the alternative image sizes. The new images are linked to the original image and scaled to fit your set resolutions while maintaining the same aspect ratio.

!!! note
    Adaptive Media supports these Commerce widgets: [Search Results](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/search), [Product Details, Product Publisher](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/product-details), [Mini Cart](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-widgets/using-the-mini-cart-widget) and component, and [Checkout](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/checkout).

If you have upgraded to the latest DXP version from a legacy version that did not support Adaptive Media, you can migrate existing Documents and Media thumbnails to new Adaptive Media defined Image Resolutions; see [Migrating Documents and Media Thumbnails](./using-adaptive-media/migrating-documents-and-media-thumbnails.md).
