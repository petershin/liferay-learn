---
uuid: 1fad3ffb-9d93-4a8b-baad-20382b53a17d
---
# Generating Content Using AI Creator

Liferay offers a way to integrate Open AI's ChatGPT engine with the [Web Content](adding-a-basic-web-content-article.md) app through a  powerful tool called AI Creator. With an Open AI API key configured for your instance or site, you can use the AI Creator feature straight in your Web Content editor and generate content with a few clicks.

## Enabling AI Creator

```important
ChatGPT Integration for Web Content is currently behind a release feature flag. Read [Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md) for more information.
```

You must add an API key to authenticate your access to ChatGPT:

1. Open the *Global Menu*( ![Global Menu](../../../images/icon-applications-menu.png) ) and navigate to the *Control Panel* tab &rarr; select *Instance Settings* under *Configuration*.

1. Click *AI Creator* under *Content and Data*.

1. Paste your *API Key* and click *Save*.

```note
You can enable or disable the AI Creator button by checking the Enable OpenAI to Create Content box. If you choose to disable the feature, the button does not show in the Web Content editor.
```

## Using AI Creator

After [enabling the feature flag and configuring the API Key](#enabling-ai-creator), you can use AI Creator in your web content editor:


1. Open the *Global Menu*( ![Global Menu icon](../../../images/icon-applications-menu.png) ) and select your site on the right.
   
1. Open the *Product Menu* ( ![Product Menu Icon](../../../images/icon-product-menu.png) ) and select the *Web Content* app under Content & Data.
  
1. Click *Add* ( ![Add icon](../../../images/icon-add.png) ) to create a Basic Web Content article.
  
1. Click *AI Creator*.

    ![After enabling the feature flag, you can see the AI Creator button in the Web Content editor.](./generating-content-using-ai-creator/images/01.png)

1. In the AI Creator modal window, fill in these three fields:

    * **Description**: The desired content (e.g. "A blog post about the sleeping habits of cats").
    * **Tone**: The tone for your text. There are five options available: Neutral, Casual, Friendly, Formal, and Academic.
    * **Word Count**: An approximate word count for your text.

1. Click *Create*.

1. (Optional) If you don't like the AI-generated content, you can click *Try Again* to regenerate the content.

    ![You can choose the content, the tone, and the approximate number of words in your content. You can also ask the AI Creator to regenerate the content if you don't like it.](./generating-content-using-ai-creator/images/02.png)

1. Click *Add* to insert the content into your web content article.

You can now publish your web content article.