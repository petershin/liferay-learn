# Configuring Document URLs

{bdg-secondary}`Available Liferay 7.4 U27+/GA27+`

When a document is uploaded, Liferay automatically generates a friendly URL for accessing it. This URL uses the following structure: `server-address/documents/d/sites-friendly-url/documents-friendly-URL`. Unless specified during upload, Liferay uses the document's title for the friendly URL, but you can manually change this value at any time. Once set, you can access the latest version of the file at its friendly URL.

```{note}
For Liferay 7.4 U26/GA26 and earlier versions, Liferay generates document URLs using the following structure: `server-address/documents/site-id/folder-id/file-name/UUID` (e.g., `http://server-address/documents/20121/0/file-name.txt/c4c06cfa-a655-c796-fdf2-0ea38ef8d8a5`). If you're updating to U27+/GA27+, your existing documents can continue to use their old URLs based on this pattern. However, whenever one of these documents is first updated by a user, Liferay will convert its URL to use the new structure. Until updated, you can continue to access your documents using their old URLs. 
```

## Setting Friendly URLs for Documents

You can manually configure a document's friendly URL during [file upload](./uploading-files.md) or whenever editing the file.

```{note}
When uploading multiple documents, each document's friendly URL is automatically generated using the document's name. 
```

Follow these steps to change a document's friendly URL:

1. Begin editing the desired document.

1. Enter the desired value into the *Friendly URL* field.

   Each URL value must be unique per site. If a value is already in use, automatically resolves the conflict by adding a numeric value to the end of the URL (e.g., `my-file`, `my-file-1`, `my-file-2`).

   ![]()

1. Click *Save*.

Once saved, you can access the document at the designated URL (e.g., `http://server-address/documents/d/site-friendly-url/document-friendly-URL`).

## Friendly URL History

When you change a document's friendly URL, Liferay automatically retains a history of the previous URLs. While retained, you can continue to use previous URLs to access the latest version of the document. If desired, you can remove old friendly URL entries.

```{note}
While saved in the friendly URL history, old document URLs cannot be used for other documents in the same site. To reuse the URL for another document, you must first remove it from a document's friendly URL history.
```

Follow these steps to view and manage retained URLs for a document:

1. Begin editing the desired document.

1. Click the *History* button ( ![History Button](../../../images/icon-history.png) ) in the Friendly URL field.

   ![]()

1. Click the *Restore* button ( ![Restore Button](../../../images/icon-restore2.png) ) to replace the current friendly URL with the selected URL.

1. Click the *Forget URL* button ( ![Forget URL Button](../../../images/icon-times-circle.png) ) to remove a the selected URL from the document's history. Once removed, the file can no longer

   ![]()

Changes to the friendly URL history are automatically saved.

## Document Version URLs

A document's friendly URL leads to the document's latest version. If you want to access a previous version, you have to access the version history of the document and copy the download URL for the desired version. Previous file versions continue to use the `server-address/documents/site-id/folder-id/file-name/UUID` structure.

![]()

## Additional Information

* [Documents and Media Overview](../documents-and-media-overview.md)
* [Uploading Files](./uploading-files.md)
* [Configuring Your Site's Friendly URL](../../../site-building/site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [Configuring Your Page's Friendly URL](../creating-pages/page-settings/configuring-your-pages-friendly-url.md)
