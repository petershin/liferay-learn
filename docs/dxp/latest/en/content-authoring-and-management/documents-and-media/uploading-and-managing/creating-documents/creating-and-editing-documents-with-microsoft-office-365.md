---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 14155784-a114-48f6-b28a-6efc9bf094c4
---

# Creating and Editing Documents with Microsoft Office 365

Use Office 365&trade; to create and edit text documents, spreadsheets, or presentations for storage in the Documents and Media library. After completing your Office 365&trade; editing session, check in the document to save changes in the Documents and Media library.

To begin, [connect your DXP installation with Microsoft Office 365&trade;.](../../devops/enabling-document-creation-and-editing-with-microsoft-office-365.md)

## Authentication

The first time you create or edit a Documents and Media file via Office 365&trade;, you must authenticate with your Microsoft account, which links OneDrive&trade; to your DXP account.

!!! important
    If you update your Microsoft account credentials, you must unlink your OneDrive&trade; account from DXP and re-link it to trigger the login prompt again.

### Unlinking the Account

1. Click your *User Profile* icon &rarr; *Account Settings*.

1. On the *General* tab, click *Apps*.

1. Click *Revoke* next to OneDrive&trade;.

   ![You can unlink your account from the portal.](./creating-and-editing-documents-with-microsoft-office-365/images/01.png)

OneDrive&trade; is unlinked.

## Creating Files

1. Open the *Site Menu* (![Product Menu](../../../../images/icon-menu.png)), click your site's name, and navigate to *Content & Data* &rarr; *Documents and Media*.

1. Click *Add* (![Add](../../../../images/icon-add.png)) and select the type of Office 365&trade; document to add to the Document Library:

   - Word&trade;
   - Excel&trade;
   - PowerPoint&trade;

   When you select one of these options, a new window opens for you to enter the document's name.

   ![Select the type of document you want to create.](./creating-and-editing-documents-with-microsoft-office-365/images/02.png)

1. Enter the document's name in the *Title* field, and click *Save*. When you click *Save*, DXP creates a temporary Documents and Media file and links it to the new Office 365&trade; file. Your browser then opens a new window with that Office 365&trade; file so you can create its content.

   ![When you create a document, you must give it a name.](./creating-and-editing-documents-with-microsoft-office-365/images/03.png)

1. Use the Office 365&trade; editor to create your document's content.

1. Save or discard your changes to DXP:

   **Check in:** Saves the Office 365&trade; file to Documents and Media, then deletes the file from Office 365&trade;. The saved file's format depends on the document type you selected in step two above.

   - Word: Microsoft Word&trade; (`.docx`)
   - PowerPoint: Microsoft PowerPoint&trade; (`.pptx`)
   - Excel: Microsoft Excel&trade; (`.xlsx`)

   **Cancel Checkout:** Deletes the Office 365&trade; file, discarding any changes.

## Editing Files

You can use Office 365&trade; to edit the following types of Documents and Media files:

- Text files (`.doc`, `.docx`, `.docm`, `.dot`, `.dotx`, `.dotm`, `.html`, `.txt`, `.rtf`, `.odt`)
- Presentation files (`.ppt`, `.pptx`, `.pptm`, `.pps`, `.ppsx`, `.ppsm`, `.pot`, `.potx`, `.potm`)
- Spreadsheet files (`.xls`, `.xlsx`, `.xlsm`, `.xlt`, `.xltx`, `.xltm`, `.ods`, `.csv`, `.tsv`, `.txt`, `.tab`)

!!! note
    To edit documents in Office 365&trade; within Liferay, ensure your files are in the current Microsoft Office&trade; formats (`.docx`, `.xlsx`, and .`pptx`). Convert older formats (e.g., `.doc`, `.xls`, and `.ppt`) to these formats for compatibility with Office 365&trade; editing.

To edit a Documents and Media file in Office 365&trade;,

1. Navigate to the file in the Documents and Media Library.

1. Click Actions (![Actions](../../../../images/icon-actions.png)) for the file you want to edit and select *Edit in Office 365*. This automatically [checks out](../../publishing-and-sharing/managing-document-access/managing-document-changes-with-checkout.md) the file, transfers its content to a new Office 365&trade; file, and redirects you to that file Office 365&trade;.

1. Edit the file in Office 365&trade;. The editing process is exactly the same as described above for creating files.

   ![To modify a document, select Edit in Office 365 from the file's Actions menu.](./creating-and-editing-documents-with-microsoft-office-365/images/04.png)

## Related Topics

- [Enabling Document Creation and Editing with Microsoft Office 365](../../devops/enabling-document-creation-and-editing-with-microsoft-office-365.md)
- [Creating and Editing Documents with Google Drive](./creating-and-editing-documents-with-google-drive.md)
