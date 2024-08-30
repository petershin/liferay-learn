---
uuid: 2fa3dbf3-29fb-47bc-82c0-81dde1b08003
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Attachment Fields

Attachment fields are for uploading files to your instance's [Document Library](../../../../system-administration/file-storage.md). When uploaded, the file is linked to the entry's attachment field, and each field can only be linked to one file at a time. A file inherits its scope from the object definition (i.e., company or site). Once attached, you can view an object entry to download the file or remove it from the field. Beginning with 7.4 U45/GA45, you can also download entry attachments from the [object's application page](../views/designing-object-views.md).

![Attach files to object entries.](./attachment-fields/images/01.png)

!!! important
    Assets are not deleted from the Document Library when they're removed from an object entry.

During field creation, you can use the Request Files field to determine how users upload files to the object's entries:

**Upload Directly from the User's Computer**: Users can upload a file to an entry using their operating system's file selector. By default, this method saves the file to a private hidden folder auto-generated for the object definition.

If you enable *Show Files in Documents and Media*, uploaded files are saved to a folder in Documents and Media. By default, this folder uses the object definition's name, but you can change it when configuring the field. Deleting an object entry does not delete its attachment files.

If you disable *Show Files in Documents and Media*, attachment files are associated only to the private folder, and deleting the object entry also deletes its attachments.

**Upload or Select from Documents and Media Item Selector**: Users can select from existing files in Documents and Media or upload a file using the item selector. Uploaded files are saved to the root folder in Documents and Media and can be managed like other files.

![The Request Files field determines how users add files to the object's entries.](./attachment-fields/images/02.png)

!!! note
    If desired, you can display hidden attachment field folders in Documents and Media by adding this [portal property](../../../../installation-and-upgrades/reference/portal-properties.md) to your server: `dl.show.hidden.mount.folders=true`. 

After creating an attachment field, you can configure it in these ways:

| Configuration | Description |
| :--- | :--- |
| Accepted File Extensions | Enter a list of accepted file extensions to determine the type of files users can upload to the field. Each extension must be separated by commas. Attachment fields support all file types accepted by [Documents and Media](../../../../content-authoring-and-management/documents-and-media.md). |
| Maximum File Size | Enter the maximum file size accepted by the field. The default value is 100 MB. If desired, you can set the value to 0 to use the server's Overall Maximum Upload Request Size property. |
| Storage Folder (*for Show Files in Documents and Media*) | Enter a folder name to determine where uploaded files are stored in Documents and Media. By default, the folder uses the object definition's name (e.g., `/Employee`, `/TimeOffRequest`). |

## Using Attachment Fields with APIs

!!! note 
    In Liferay versions before DXP 2024.Q2/Portal GA120, the attachment file must exist in Liferay before you can add it to an object entry's attachment field using the headless API. Use the [document library APIs](../../../../content-authoring-and-management/documents-and-media/developer-guide/document-api-basics.md) to upload the file and retrieve its ID.

    In Liferay DXP 2024.Q2+/Portal 7.4 GA120+, you can eliminate a step and include a Base64-encoded file in the request body. See [Using Object APIs With Base64 Encoded Files](../../understanding-object-integrations/using-custom-object-apis/using-object-apis-with-base64-encoded-files.md) for more information.

Pass the ID in the objects API call using this syntax: `"[attachmentField]": [FileEntryId]`.

### Example

The example below adds an entry to an object named `timeOffRequest`. It adds a file with the ID `12345` to the attachment field `document`.

```bash
curl -X "POST" "http://localhost:8080/o/c/timeOffRequest?restrictFields=actions" \
     -H "Content-Type: application/json" \
     -u 'test@liferay.com:test' \
     -d $'{
  "document": 12345
}'
```

## Related Topics

* [Fields](../fields.md)
* [Adding Fields to Objects](./adding-fields-to-objects.md)
* [File Storage](../../../../system-administration/file-storage.md)
