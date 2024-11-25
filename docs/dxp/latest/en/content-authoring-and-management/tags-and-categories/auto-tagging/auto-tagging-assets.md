---
taxonomy-category-names:
- Content Management System
- Categories and Tags
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 665b7f45-4148-469f-8f93-571c38d4f168
---

# Auto-Tagging Assets

You can manually tag most assets, such as Message Boards, Blogs, Documents, Images, and Web Content Articles. You can tag certain assets, however, automatically when they are created. Tags applied automatically are in only English.

Auto-tagging is only available for text-based documents, text-based web content, and blog entries, as well as [images](./auto-tagging-images.md).

Text auto-tagging is disabled by default. You must [enable auto-tagging](./configuring-asset-auto-tagging.md) in DXP and then enable a text auto-tagging provider. Finally, you must choose the asset to auto-tag. There are two text auto-tagging providers available for DXP:

- **Google Cloud Natural Language Text Auto-Tagging**: Uses the [Google Cloud Natural Language API](https://cloud.google.com/natural-language/) to analyze and automatically tag content.

- **OpenNLP Text Auto-Tagging**: Uses the open source [Apache OpenNLP](https://opennlp.apache.org/) library to analyze and automatically tag portal content. Three models are used: location name finder, organization finder, and person name finder.

!!! tip
    Use this provider with caution because its accuracy may be limited.

## Configuring Google Cloud Natural Language Text Auto-Tagging

1. Click the *Global Menu* &rarr; *Control Panel*. 
 
1. Click *System Settings*.

   ![Navigate to the System Settings.](./auto-tagging-assets/images/01.png)

1. Click *Assets* under *Content and Data*.

   ![Click on Assets.](./auto-tagging-assets/images/02.png)

1. Under *VIRTUAL INSTANCE SCOPE*, click *Google Cloud Natural Language Text Auto-Tagging*.
 
1. Fill out the form.
 
1. Click *Save* when finished.

The form asks for this information:

**API Key:** The API key to use for the Google Cloud Natural Language API. For more information, see [Google's documentation on API keys](https://cloud.google.com/docs/authentication/api-keys).

**Classification Endpoint Enabled:** Whether to enable auto-tagging of text using the Google Cloud Natural Language API Classification endpoint.

**Confidence:** Set the classifier's confidence of the category. This number represents how certain the classifier is that this category represents the given text.

**Entity Endpoint Enabled:** Whether to enable auto-tagging of text using the Google Cloud Natural Language API Entity endpoint.

**Salience:** The salience score for an entity provides information about the importance or centrality of that entity to the entire text.

**Enable Google Cloud Natural Language Text Auto-Tagging For:** Choose the asset types to be auto-tagged. Select *Document*, *Blogs Entry*, or *Web Content Article*. To add multiple asset types, click the *Add* icon (![Add](../../../images/icon-add.png)) and select the asset type from the menu. You can delete any additional asset types by clicking the Trash icon (![Trash](../../../images/icon-trash.png)).

![Enter your settings.](./auto-tagging-assets/images/03.png)

The Google Cloud Natural Language provider has been configured.

If there are multiple virtual instances on the server, you can override these settings for each instance from *Control Panel* &rarr; *Instance Settings* &rarr; *Assets*.

## Configuring OpenNLP Text Auto-Tagging

1. Click the *Global Menu* &rarr; *Control Panel*

1. Click *System Settings*.

1. Click *Assets* under *Content and Data*.

1. Under *VIRTUAL INSTANCE SCOPE*, click *OpenNLP Text Auto-Tagging*.

1. Fill out the form.

1. Click *Save* when finished.

The form asks for this information:

**Confidence Threshold:** Set the minimum confidence threshold (from 0 to 1, where 1 is the highest confidence). Higher values yield fewer tags because the provider needs more confidence before it applies a tag. Lower values yield more tags.

**Enable OpenNLP Text Auto-Tagging For:** Choose the asset types to be auto-tagged. Use the menu to select *Document*, *Blogs Entry*, or *Web Content Article*. To add multiple asset types, click the *Add* icon (![Add](../../../images/icon-add.png)) and select the asset type from the menu. You can delete any additional asset types by clicking the Trash icon (![Trash](../../../images/icon-trash.png)).

![Enter your settings.](./auto-tagging-assets/images/04.png)

The OpenNLP provider has been configured.

If there are multiple virtual instances on the server, you can override these settings for each instance from *Control Panel* &rarr; *Instance Settings* &rarr; *Assets*.

After changing an asset, you can see the tags displayed while editing it. An example for this is *Blogs Entry*.

1. Follow the previous steps on See [Configuring OpenNLP Text Auto Tagging](#configuring-opennlp-text-auto-tagging) and proceed to the *OpenNLP Text Auto-Tagging* page under *VIRTUAL INSTANCE SCOPE*.

1. Set your *Confidence Threshold* value to `0.01`.

1. In Enable OpenNLP Text Auto-Tagging For, select *Blogs Entry*.

   ![Filling out the form for OpenNLP](./auto-tagging-assets/images/05.png)

1. Click *Update*

1. Go to your Home Page and click the *Product Menu* &rarr; *Content and Data* &rarr; *Blogs*.

1. Click *New* and enter your new blog. The more text you have, the more tags can be generated. 

1. Click *Publish* when finished.

1. Click the Options icon (![Click on the options icon to access the Edit button.](../../../images/icon-options.png)) and click Edit.

1. Select the *Categorization* field and under *Other Metadata*, your tags appear.

   ![Seeing auto-tagging on Blogs](./auto-tagging-assets/images/06.png)

## Related Topics

- [Auto-Tagging Images](./auto-tagging-images.md)
