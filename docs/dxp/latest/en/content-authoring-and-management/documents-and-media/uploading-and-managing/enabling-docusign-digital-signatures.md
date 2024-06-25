---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0eada971-da6d-4bd2-9b62-a5a1f472c30b
---

# Enabling DocuSign Digital Signatures

{bdg-secondary}`Liferay Portal 7.4 GA3+`

You can now integrate [DocuSign](https://www.docusign.com/) digital signatures into your Liferay documents. DocuSign is a service that manages documents to be signed electronically. With this integration, you can manage and collect signatures on your documents.

Before you enable digital signatures in Liferay, make sure you've generated and retrieved your User ID key, API Account key, Account Base URI, Integration key, and RSA Private key. Instructions for doing this can be found on [DocuSign's website](https://support.docusign.com/en/guides/ndse-admin-guide-api-and-keys).

## Enabling Digital Signatures

1. Open the *Global Menu* in the top right corner. (![Global Menu](../../../images/icon-applications-menu.png))

1. Click *Control Panel* &rarr; *Instance Settings* &rarr; *Digital Signature*.

   ![The Digital Signature link appears in either Instance Settings or Site Settings.](./enabling-docusign-digital-signatures/images/01.png)

1. Switch the toggle to *Enabled*.

   ![Switch the toggle.](./enabling-docusign-digital-signatures/images/02.png)

1. Choose a *Site Settings Strategy*.

   You have three options for your site settings strategy:

   **Always Inherit:** All sites are linked to these settings.

   **Always Override:** Every site must provide its own configuration.

   **Inherit or Override:** Can be defined in both Instance Settings and Site Settings. If defined in both, Site settings take precedence over Instance settings.

   ![Your Site Settings Strategy defines the scope of your digital signatures.](./enabling-docusign-digital-signatures/images/03.png)

1. Click *Save*.

You must now add your digital keys from DocuSign at the appropriate scope in Liferay.

## Adding Digital Keys

Depending on what you chose for your Site Settings Strategy, add your digital keys at the [appropriate scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md):

- If you chose *Always Inherit*, add the keys in Instance Settings.
- If you chose *Always Override*, add the keys in Site Settings.
- If you chose *Inherit* or *Override*, add the keys in either place.

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Digital Signature*.

   For Site Settings, open to the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png.png)) &rarr; *Configuration* &rarr; *Site Settings* &rarr; *Digital Signature*.

1. If it's not switched already, switch the toggle to *Enabled*.

1. Enter the *User ID*, *API Account ID*, *Account's Base URI*, *Integration Key*, and the *RSA Private Key* you previously retrieved from the DocuSign website.

1. Click *Save* to enable digital signatures.

## Collecting Document Signatures in Documents and Media

1. Find the document where you want to collect the digital signatures and click *Actions* &rarr; *Collect Digital Signature*.

   ![You can see the Actions and Collect Digital Signatures buttons.](./enabling-docusign-digital-signatures/images/04.png)

1. For multiple documents, select the documents where you want to collect the signatures and click *Collect Digital Signature* (![Collect Digital Signature](../../../images/icon-digital-signature.png)).

   ![You can see multiple selected files and the Collect Digital Signature button.](./enabling-docusign-digital-signatures/images/05.png)

1. Fill in the *Envelope*'s information and click *Send*.

   ![Fill in the envelope's information.](./enabling-docusign-digital-signatures/images/06.png)

1. When the envelope is sent, Recipients must go through [DocuSign's process](https://www.docusign.com/products/electronic-signature/how-docusign-works) to sign the document.

## Tracking an Envelope's Status

DocuSign uses the term *envelope* to denote a document or collection of documents to be signed. Once sent, you can track your envelope status from within Liferay.

!!! tip
    You can check the different status labels on the [DocuSign website](https://support.docusign.com/en/guides/ndse-user-guide-document-status).

1. Open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)) &rarr; *Content & Data* &rarr; *Digital Signature* to see a list of created envelopes.

1. You can also create an envelope directly from this screen by clicking *Add* (![Add Button](../../../images/icon-add.png)). You're shown the envelope's screen to enter its information.

1. Use *Filter and Order* or type keywords in the search bar to filter and sort the list of available envelopes.

   ![Organize documents through Filter and Order, or the Search Bar.](./enabling-docusign-digital-signatures/images/07.png)

## Downloading Documents

1. Click the envelope's name to see its details. You can download the document by clicking *Download* or by clicking *Actions* (![Actions button])(../../../images/icon-actions.png) from the Digital Signature screen.

   !!! important
       Clicking *Download* fetches the document from DocuSign not from Liferay, since Liferay does not store signed documents. Whether a document is partially or fully signed, the download button retrieves the latest state.

   ![You can view the details of your envelopes from inside Liferay.](./enabling-docusign-digital-signatures/images/08.png)

!!! warning
    Disabling the Digital Signature Configuration removes all reference to DocuSign, including the Digital Signature module in the Control Panel. If you disable the feature in Liferay, all envelopes are still visible in DocuSign. If you re-enable digital signatures, the list appears again.

## Related Topics

- [Understanding Configuration Scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)
