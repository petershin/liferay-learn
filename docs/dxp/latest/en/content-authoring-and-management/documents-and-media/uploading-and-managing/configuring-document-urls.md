# Configuring Document URLs

{bdg-secondary}`Available Liferay 7.4 U27+/GA27+`

When a file is uploaded, Liferay automatically generates a friendly URL for accessing it. This URL uses the following structure: `server-address/documents/d/sites-friendly-url/file-friendly-URL`. Unless specified during upload, Liferay uses the file's name for the friendly URL, but you can manually change this value at any time. Once set, you can access the latest version of the file at its friendly URL.

```{note}
For Liferay 7.4 U26/GA26 and earlier versions, Liferay generates file URLs using the following structure: `server-address/documents/site-id/folder-id/file-name/UUID` (e.g., `http://server-address/documents/20121/0/file-name.txt/c4c06cfa-a655-c796-fdf2-0ea38ef8d8a5`). If you're updating to U27+/GA27+, your existing files can continue to use their old URLs based on this pattern. However, whenever one of these files is first updated by a user, Liferay will convert its URL to use the new structure. Until updated, you can continue to access your files using their old URLs. 
```

## Setting Friendly URLs for Documents

You can manually configure a file's friendly URL during [file upload](./uploading-files.md) or whenever editing the file.

```{note}
When uploading multiple files, each file's friendly URL is automatically generated using its name. 
```

Follow these steps to change a file's friendly URL:

1. Begin uploading or editing the desired file.

1. Edit the *Friendly URL* field.

   Each URL value must be unique per site. If a value is already in use, Liferay automatically resolves the conflict by adding a numeric value to the end of the URL (e.g., `my-file`, `my-file-1`, `my-file-2`).

   ![When uploading or editing a file, you can change its friendly URL.](./configuring-document-urls/images/01.png)

1. Click *Publish*.

Once saved, you can access the file at the designated URL (e.g., `http://server-address/documents/d/site-friendly-url/file-friendly-URL`).

## Friendly URL History

When you change a file's friendly URL, Liferay automatically retains a history of the previous URLs. While retained, you can continue to use previous URLs to access the latest version of the file. If desired, you can remove old friendly URL entries.

```{note}
While saved in the friendly URL history, old file URLs cannot be used for other files in the same site. To reuse the URL for another file, you must first remove it from the file's friendly URL history.
```

Follow these steps to view and manage retained URLs for a file:

1. Begin editing the desired file.

1. Click the *History* button ( ![History Button](../../../images/icon-history.png) ) in the Friendly URL field.

   ![Click the History button for the Friendly URL field.](./configuring-document-urls/images/02.png)

1. Click the *Restore* button ( ![Restore Button](../../../images/icon-restore2.png) ) to replace the current friendly URL with the selected URL.

1. Click the *Forget URL* button ( ![Forget URL Button](../../../images/icon-times-circle.png) ) to remove the selected URL from the file's history. Once removed, you can no longer use the URL to access the file.

   ![Click the Restore or Forget URL buttons.](./configuring-document-urls/images/03.png)

Changes to the friendly URL history are automatically saved.

## Document Version URLs

All file friendly URLs lead to latest version of the file. If you want to access the URL for previous file versions, navigate to the file's version history and copy the *download* URL for the desired version.

![Copy the download URL for the desired version.](./configuring-document-urls/images/04.png)

## Additional Information

* [Documents and Media Overview](../documents-and-media-overview.md)
* [Uploading Files](./uploading-files.md)
* [Configuring Your Site's Friendly URL](../../../site-building/site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [Configuring Your Page's Friendly URL](../creating-pages/page-settings/configuring-your-pages-friendly-url.md)
