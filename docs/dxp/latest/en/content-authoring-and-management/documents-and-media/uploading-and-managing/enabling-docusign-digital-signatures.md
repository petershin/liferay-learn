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

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Instance Settings* &rarr; *Digital Signature*.

   ![The Digital Signature link appears in either Instance Settings or Site Settings.](./enabling-docusign-digital-signatures/images/01.png)

1. Switch the Digital Signature Configuration toggle to *Enabled*.

   ![Enable the Digital Signature in your instance.](./enabling-docusign-digital-signatures/images/02.png)

1. Choose a *Site Settings Strategy*.

   **Always Inherit:** All sites are linked to these settings.

   **Always Override:** Every site must provide its own configuration.

   **Inherit or Override:** You can define settings in both Instance Settings and Site Settings. If defined in both, Site settings take precedence over Instance settings.

   ![Your Site Settings Strategy defines the scope of your digital signatures.](./enabling-docusign-digital-signatures/images/03.png)

1. Click *Save*.

!!! warning
    Disabling the Digital Signature Configuration removes all reference to DocuSign, including the Digital Signature module in the Control Panel. If you disable the feature in Liferay, all envelopes are still visible in DocuSign. If you re-enable digital signatures, the list reappears.

You must now add your digital keys from DocuSign at the appropriate scope in Liferay.

## Adding Digital Keys

Depending on what you chose for your Site Settings Strategy, add your digital keys at the [appropriate scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md):

- For *Always Inherit*, add the keys in Instance Settings.
- For *Always Override*, add the keys in Site Settings.
- For *Inherit* or *Override*, add the keys in either place.

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Digital Signature*.

   For Site Settings, open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) &rarr; *Configuration* &rarr; *Site Settings* &rarr; *Digital Signature*.

1. Switch the toggle to *Enabled* if it isn't already.

1. Enter the *User ID*, *API Account ID*, *Account's Base URI*, *Integration Key*, and the *RSA Private Key* you previously retrieved from the DocuSign website.

!!! important
    Add the entire RSA Private Key including the key headers (i.e., `-----BEGIN RSA PRIVATE KEY-----` and `-----END RSA PRIVATE KEY-----`).

1. Click *Save* to enable digital signatures.

## Authorizing DocuSign and Obtaining Consent

Before you can send or manage documents using DocuSign in Liferay, you must authorize the integration and grant individual consent, allowing Liferay to access DocuSign's services on your behalf.

Learn more about obtaining individual consent in [How to obtain individual consent](https://developers.docusign.com/platform/auth/consent/obtaining-individual-consent/).

1. Create the Authorization URL.

   Use your integration key and redirect URI to construct the authorization URL. Replace the placeholders in the base URL below:

   `https://account-d.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation&client_id=YOUR_INTEGRATION_KEY&redirect_uri=YOUR_REDIRECT_URI`

   Example: `https://account-d.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation&client_id=7c2b8d7e-xxxx-xxxx-xxxx-cda8a50dd73f&redirect_uri=http://example.com/callback/`.

1. Access the Authorization URL in your browser. When prompted, grant consent for Liferay to access your DocuSign account.

After obtaining consent, you should be able to use the integration as intended.

## Collecting Document Signatures in Documents and Media

1. Find the document where you want to collect the digital signatures and click *Actions* &rarr; *Collect Digital Signature*.

   ![The Collect Digital Signatures button is available once you enable the digital signature configuration.](./enabling-docusign-digital-signatures/images/04.png)

1. For multiple documents, select the documents where you want to collect the signatures and click *Collect Digital Signature* (![Collect Digital Signature](../../../images/icon-digital-signature.png)).

   ![Select multiple files to collect signatures for all of them.](./enabling-docusign-digital-signatures/images/05.png)

1. Fill in the *Envelope*'s information and click *Send*.

   !!! note
       DocuSign uses the term *envelope* to denote a document or collection of documents to be signed.

   ![Fill in the envelope's information.](./enabling-docusign-digital-signatures/images/06.png)

1. When the envelope is sent, Recipients must go through [DocuSign's process](https://www.docusign.com/products/electronic-signature/how-docusign-works) to sign the document.

## Tracking an Envelope's Status

Once an envelope is sent, you can track its status from within Liferay.

!!! tip
    You can check the different status labels on the [DocuSign website](https://support.docusign.com/en/guides/ndse-user-guide-document-status).

To see a list of created envelopes, open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)) &rarr; *Content & Data* &rarr; *Digital Signature*.

You can also create an envelope directly from this screen by clicking *Add* (![Add Button](../../../images/icon-add.png)) and entering the envelope's information.

Use *Filter and Order* or type keywords in the search bar to filter and sort the list of available envelopes.

![Organize documents through Filter and Order, or the Search Bar.](./enabling-docusign-digital-signatures/images/07.png)

## Downloading Documents

1. Click the envelope's name to see its details.

1. Click *Download* or by click *Actions* (![Actions button])(../../../images/icon-actions.png) from the Digital Signature screen.

   !!! important
       Clicking *Download* retrieves the document from DocuSign, as Liferay does not store signed documents. The download button fetches the latest version, regardless of whether the document is partially or fully signed.

   ![You can view the details of your envelopes from inside Liferay.](./enabling-docusign-digital-signatures/images/08.png)

## Related Topics

- [Understanding Configuration Scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)
