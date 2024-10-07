---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 32fcc00c-b05e-47f5-ac3e-e7631817c4f3
---

# Migrating Documents and Media Thumbnails to Adaptive Media

DXP automatically generates image thumbnails in Documents and Media using Adaptive Media, which is included by default starting with DXP 7.1+. If you're upgrading from an older version that didn't support Adaptive Media and want to manage your thumbnails using this feature, follow the steps bellow to learn how to migrate.

!!! note
    You must be a Portal Administrator to perform the actions described here.

## Adding the Replacement Image Resolutions

To migrate the existing thumbnails, you must add new image resolutions in Adaptive Media that have maximum height and maximum width values that match the values specified in the following portal properties:

- `dl.file.entry.thumbnail.max.height`
- `dl.file.entry.thumbnail.max.width`
- `dl.file.entry.thumbnail.custom1.max.height`
- `dl.file.entry.thumbnail.custom1.max.width`
- `dl.file.entry.thumbnail.custom2.max.height`
- `dl.file.entry.thumbnail.custom2.max.width`

Some of these properties may not be enabled. You need only create image resolutions in Adaptive Media for the enabled properties.

To create the new Image Resolutions, see [Adding Image Resolutions](./adding-image-resolutions.md).

## Creating the Adaptive Media Images

Once the required image resolutions exist, you can convert the thumbnails to Adaptive Media images.

There are two different ways to migrate the thumbnails to Adaptive Media:

- Adapt images for the thumbnail resolution: This scales the existing thumbnails to match the Adaptive Media image resolution settings. Depending on the number of images, this process can take time. It's recommended only if you have a small number of images or prefer to regenerate the thumbnails from scratch. For more details, see [Generating Missing Adapted Images](./managing-image-resolutions.md#generating-missing-adapted-images).

- Migrate existing thumbnails: This process copies the current thumbnails to Adaptive Media, providing better performance by avoiding the time-consuming scaling operation.

### Running the Migration Process

The migration process is a set of [Gogo console commands](../../../../liferay-development/liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.md).

1. Navigate to the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Gogo Shell*.

   ![Navigate to the Gogo Shell to run the migration process.](./migrating-documents-and-media-thumbnails/images/01.png)

1. Run the `thumbnails:check` command to list how many thumbnails are pending migration for each instance.

1. Run the `thumbnails:migrate` command to start the migration process. This can take some time, depending on the number of images.

1. After migration, run the `thumbnails:cleanUp` command to delete the original thumbnails and update the count returned by `thumbnails:check`.

   Only use `thumbnails:cleanUp` once the migration has successuflly completed and no images are pending.

## Troubleshooting

If you undeploy Adaptive Media at some point after running the migration process, you must regenerate the thumbnails:

1. Navigate to the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Server Administration*.

1. Click *Execute* next to *Reset preview and thumbnail files for Documents and Media*.

   ![Navigate to the Gogo Shell to regenerate the thumbnails.](./migrating-documents-and-media-thumbnails/images/02.png)

## Related Topics

- [Managing Image Resolutions](./managing-image-resolutions.md)
- [Adaptive Media Configuration Reference](./adaptive-media-configuration-reference.md)
