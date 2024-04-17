---
taxonomy-category-names:
- Content Management System
- Categories and Tags
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 231895b7-3e9b-42d4-a89f-91d2e8e9f3ac
---

# Auto Tagging Images

Once [asset auto tagging has been enabled](./configuring-asset-auto-tagging.md), you can also enable image auto tagging. Image auto tagging tags images uploaded to the Documents and Media Library.

!!! tip
    Currently, tags applied automatically are English only.

By default, Image Auto Tagging is disabled by default. In addition to enabling Auto Tagging in DXP, you must also configure an image tagging provider. Four providers are available:

1. [**TensorFlow:**](#configuring-tensorflow-image-auto-tagging) An open-source library that provides machine learning capabilities. TensorFlow image auto-tagging in DXP is based on [TensorFlow's `LabelImage` sample for Java](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/java/src/main/java/org/tensorflow/examples/LabelImage.java), and uses the Inception5h model. Use this with caution, since its accuracy is limited.

1. [**Google Cloud Vision:**](#configuring-google-cloud-vision) Uses the [Google Cloud Vision API](https://cloud.google.com/vision/) to automatically tag images.

1. [**Microsoft Cognitive Services:**](#configuring-microsoft-cognitive-services) Uses [Microsoft Cognitive Services](https://azure.microsoft.com/en-us/services/cognitive-services/) to automatically tag images.

1. [**OpenNLP:**](#configuring-opennlp-text-auto-tagging) [OpenNLP](https://opennlp.apache.org/) is an open-source library used for natural language processing tasks like tokenization, part-of-speech tagging, and named entity recognition.

![The tags freight car and electric locomotive were automatically applied to this image.](./auto-tagging-images/images/01.png)

## Configuring TensorFlow Image Auto Tagging

1. Click the *Global Menu* &rarr; *Control Panel*
1. Click *System Settings*.

    ![Navigate to the System Settings.](./auto-tagging-images/images/02.png)

1. Click *Assets* under *Content and Data*.

    ![Click on Assets.](./auto-tagging-images/images/03.png)

1. Under *VIRTUAL INSTANCE SCOPE*, click *TensorFlow Image Auto Tagging*.
1. Fill out the form.
1. Click *Save* when finished.

The form asks for this information:

**Enable TensorFlow Image Auto Tagging:** Check this box to select whether image auto-tagging is enabled by default in any instance that has asset auto tagging enabled.

**Confidence Threshold:** TensorFlow assigns a confidence level between 0 and 1 for each tag, where 1 is the highest confidence and 0 is the lowest. This field sets the minimum confidence level that TensorFlow needs to apply a tag. Higher values yield fewer tags because TensorFlow needs more confidence before it applies a tag. Lower values yield more tags.

![Configure TensorFlow image auto-tagging for your portal instances.](./auto-tagging-images/images/04.png)

### Optimizing TensorFlow Auto Tagging Performance

1. Click the *Global Menu* &rarr; *Control Panel*
1. Click *System Settings*.
1. Click *Assets*.
1. Under *SYSTEM SCOPE*, click *TensorFlow Image Auto Tagging Process*.
1. Fill out the form.
1. Click *Save* to apply the settings.

The form asks for this information:

**Maximum Number of Relaunches:** The maximum number of times the process is allowed to crash before it is permanently disabled.

**Maximum Number of Relaunches Time Interval:** The time in seconds after which the counter is reset.

![You can fine tune the process that runs the TensorFlow image auto tagging in the portal.](./auto-tagging-images/images/05.png)

The TensorFlow provider has been configured.

## Configuring Google Cloud Vision

1. Click the *Global Menu* &rarr; *Control Panel*
1. Click *System Settings*.
1. Click *Assets*.
1. Under *VIRTUAL INSTANCE SCOPE*, click *Google Cloud Vision Image Auto Tagging*.
1. Enter your Google Cloud Vision API Key. For more information, see [Google's documentation on API keys](https://cloud.google.com/docs/authentication/api-keys).
1. Check the *Enabled* box to enable Google Cloud Vision.

   ![The Google Cloud Vision provider requires an API key.](./auto-tagging-images/images/06.png)

1. Click *Save* when finished.

## Configuring Microsoft Cognitive Services

1. Click the *Global Menu* &rarr; *Control Panel*
1. Click *System Settings*.
1. Click *Assets*
1. Under *VIRTUAL INSTANCE SCOPE*, click *Microsoft Cognitive Services Image Auto Tagging*.
1. Fill out the form.
1. Check the *Enabled* box.

    ![The Microsoft Cognitive Services provider requires an API key and an endpoint.](./auto-tagging-images/images/07.png)

1. Click *Save* when finished.

The form asks for this information:

**API Key:** Your [API key](https://azure.microsoft.com/en-us/try/cognitive-services/my-apis/?apiSlug=computer-services) for the Computer Vision API V2.

**API Endpoint:** The endpoint for the [Computer Vision API V2](https://westcentralus.api.cognitive.microsoft.com/vision/v2.0).

The Microsoft Cognitive Services provider has been configured. For more information, see the [Microsoft Cognitive Services documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/).

If you have more than one virtual instance, you can configure each instance individually. Navigate to the *Control Panel* &rarr; *Instance Settings*. Click *Assets* then configure the provider there.

<!-- Where is OpenNLP? It was added to the list above, but there's no section for it. -Rich --> 

## Related Topics

- [Configuring Asset Auto Tagging](./configuring-asset-auto-tagging.md)
- [Auto Tagging Assets](./auto-tagging-assets.md)
