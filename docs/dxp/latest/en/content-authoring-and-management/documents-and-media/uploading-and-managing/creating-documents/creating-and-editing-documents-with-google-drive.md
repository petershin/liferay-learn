---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: af979474-02fa-4010-b25e-48a570d2ee06
---

# Creating and Editing Documents with Google Drive

You can use Google Docs&trade; to create and edit text documents, spreadsheets, or presentations for storage in the Docs and Media library. When you finish your Google Docs&trade; editing session, your changes are saved automatically in the Documents and Media library.

## Authentication

The first time you create or edit a Documents and Media file via Google Docs&trade;, you must authenticate to your Google account. This links Google Drive&trade; to your portal account, so you only do this once.

To unlink your account,

1. Click on *your profile* &rarr; *Account Settings*.

1. On the *General* tab, click *Apps*.

1. Click *Revoke* next to Google Drive&trade;.

![You can unlink your Google account from the portal.](./creating-and-editing-documents-with-google-drive/images/01.png)

Access to Google Drive&trade; has been unlinked.

## Creating Files

1. Open the *Site Menu* (![Product Menu](../../../../images/icon-menu.png)), click your site's name, and navigate to *Content & Data* &rarr; *Documents and Media*.

1. Click *Add* (![Add](../../../../images/icon-add.png)) and select the type of Google document to add to the Document Library.

   - Google Docs&trade;
   - Google Slides&trade;
   - Google Sheets&trade;

1. When you select one of these options, DXP creates a temporary Documents and Media file and links it to a new Google file. Your browser then redirects you to that Google file so you can create its content. Note that some actions on the temporary Documents and Media file can affect its linked Google file. For more information, see [multiple editing sessions](#multiple-editing-sessions).

   ![Select the type of Google document you want to create.](./creating-and-editing-documents-with-google-drive/images/02.png)

1. Use the Google Docs&trade; editor to create your document's content. All Google Docs&trade; features are available except for sharing.

1. Save or discard your changes by clicking one of these toolbar buttons in the Google Docs&trade; editor:

   **Save and Return to Liferay:** Saves your document as a new file in the Documents and Media library, deletes the Google file, and returns you to the portal. The saved file's format depends on the type of Google document you selected in step two above:

   - Google Docs&trade;: Microsoft Word (`.docx`)
   - Google Slides&trade;: Microsoft PowerPoint (`.pptx`)
   - Google Sheets&trade;: Microsoft Excel (`.xlsx`)

   **Discard Changes:** Returns you to the portal without saving your file in the Documents and Media library or Google Docs&trade;.

   Note that it's also possible to close the Google Docs&trade; window without clicking either button. In this case, the editing session remains open even though the window that displayed it is closed. For more information, see the section below on [multiple editing sessions](#multiple-editing-sessions).

   ![Save or discard your changes by using the toolbar in the editor.](./creating-and-editing-documents-with-google-drive/images/03.png)

## Editing Files

You can use Google Docs&trade; to edit the following types of Documents and Media files:

- Text files (`.docx`, `.html`, `.txt`, `.rtf`, `.odt`)
- Presentation files (`.pptx`, `.odp`)
- Spreadsheet files (`.xlsx`, `.ods`, `.csv`, `.tsv`)
- PDF files

!!! note
    Google Docs&trade; doesn't support older, non-XML-based Microsoft Office file types (`.doc`, `.ppt`, `.xls`).

To edit a Documents and Media file in Google Docs&trade;,

1. Navigate to the file in the Documents and Media library.

1. Click *Actions* (![Actions](../../../../images/icon-actions.png)) for the file you want to edit and select *Edit in Google Docs*. This automatically [checks out](../../publishing-and-sharing/managing-document-access/managing-document-changes-with-checkout.md) the file, transfers its content to a new Google Docs&trade; file, and redirects you to that Google Docs&trade; file.

   ![Select Edit in Google Docs from the file's Actions menu.](./creating-and-editing-documents-with-google-drive/images/04.png)

1. Edit the file in Google Docs&trade;. The editing process is exactly the same as described above for creating files.

## Multiple Editing Sessions

When you create or edit a Documents and Media file in Google Docs&trade;, you can save or discard your changes by clicking *Save and Return to Liferay* or *Discard Changes*, respectively. If you close the window without clicking either, the editing session still exists. You can access it via the original file in Documents and Media. If the file didn't exist before (e.g., you were creating a new file), it appears in Documents and Media as a temporary file.

When an editing session already exists for a Documents and Media file, the following actions are available via that file's Actions icon (![Actions](../../../../images/icon-actions.png)):

**Edit in Google Docs:** Resume editing the file in Google Docs&trade;.

**Check in:** Saves the Google file (including any changes) to the Documents and Media file, then deletes the Google file. This is equivalent to clicking *Save and Return to Liferay* in a Google Docs&trade; editing window.

**Cancel Checkout:** Deletes the Google file, discarding any changes. This is equivalent to clicking *Discard Changes* in a Google Docs&trade; editing window.

## Related Topics

- [Creating and Editing Documents with Microsoft Office 365](./creating-and-editing-documents-with-microsoft-office-365.md)
- [Linking to Files on Google Drive](../linking-to-files-on-google-drive.md)
