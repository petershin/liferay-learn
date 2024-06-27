---
uuid: d304bf82-c70f-4470-ac61-8d41bf737851
---
# Creating Clarity's Web Content

As we mentioned in the module introduction, *Content Management* is a broad term that can apply to a range of feature sets in the data lifecycle. We're going to focus specifically on the bread-and-butter Liferay features used to create content for web pages.

## Web Content

Liferay’s web content interface is a core part of the platform’s functionality. Using structures and templates, you can build and display articles of web content through content pages, display pages, widgets, or fragments, which you learned about in the previous module. Web content articles are dynamic, versatile assets, in large part because they are made up of web content structures. 

### Structures

Web content structures are the building blocks of Liferay content. They determine what kinds of information you need to provide for a given web content article. Structures allow you to enforce a format for your content using a straightforward drag-and-drop interface with several types of fields. A single structure can be reused in multiple places, reducing effort for writers, editors, and designers alike. Liferay includes a Basic Web Content structure out of the box, but you can tailor your own structures to your specific needs.

### Templates

Web content templates provide an extra layer of configuration and customization to web content. Templates use the FreeMarker Template Language (FTL) to determine how content is rendered on a page. A template can be linked to a web content structure or even embedded in other templates.

<!--Exercise 10a-->
## Exercise: Creating Web Content Structures

The training workspace already includes most of the custom web content structures Clarity needs. In this exercise, you'll add the Announcements structure as Christian Carter.

To do this,

1. Sign in as Christian Carter.

   * Email: `christian.carter@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and select *Web Content*.

1. Go to the *Structures* tab and click *New*.

1. Enter `Announcements` for the title.

1. From the *Builder* sidebar, drag and drop a *Text* field into the structure.

1. Select the *Text* field and configure these options:

   | Tab      | Field           | Value       |
   |:---------|:----------------|:------------|
   | Basic    | Label           | `Message`   |
   | Basic    | Required Field  | Yes         |
   | Advanced | Field Reference | `message`   |

1. Click the *back arrow* (![Back Arrow](../../images/icon-angle-left.png)) to return to the Builder sidebar menu.

1. Drag and drop another *Text* field just below the first one.

1. Select the *Text* field and configure these options:

   | Tab      | Field           | Value       |
   |:---------|:----------------|:------------|
   | Basic    | Label           | `Link Text` |
   | Basic    | Required Field  | Yes         |
   | Advanced | Field Reference | `linkText`  |

1. Return to the Builder sidebar menu.

1. Drag and drop a *Link to Page* field on top of the *Link Text* field.

   This creates a *Fields Group* that contains both *Link Text* and *Link to Page*.

1. Select the *Link to Page* field and configure these options:

   | Tab      | Field           | Value       |
   |:---------|:----------------|:------------|
   | Advanced | Field Reference | `linkPage`  |

1. Click *Save*.

![Creating the Announcements web content structure.](./creating-claritys-web-content/images/01.png)

Users can now create web content articles using the Announcements structure. You should now have eight web content structures implemented in Clarity’s website. Next, you'll create some web content articles.

<!--Exercise 10b-->
## Exercise: Creating Web Content Articles

The training workspace already includes some web content articles. However, Clarity also needs some FAQ and announcement articles. Here you'll create them as Christian Carter.

To do this,

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and select *Web Content*.

1. Click *New*, select *Folder*.

1. Enter these values:

   | Field       | Value                                               |
   |:------------|:----------------------------------------------------|
   | Name        | `Announcements`                                     |
   | Description | `Stores announcement articles for the page header.` |

   **Tip**: It's best practice to organize your web content into folders instead of adding it to the home folder.

1. Click Save.

1. Click the *Announcements* folder.

1. Click *New* and select *Announcements*.

1. Enter these values:

   | Field        | Value                                       |
   |:-------------|:--------------------------------------------|
   | Title        | `Product Innovations`                       |
   | Message      | `See Clarity's latest eyewear innovations!` |
   | Link Text    | `Learn more`                                |
   | Link to Page | `Products`                                  |

   ![Create Product Innovations web content article.](./creating-claritys-web-content/images/02.png)

1. Click *Publish*.

   Next, you'll add some missing web content articles.

1. Go to the *Home* web content folder.

1. Go to *FAQ* &rarr; *Retail Partners*.

1. Create these FAQ articles:

   | Title (Question)                                             | Answer                                                                                                                                                                                  |
   |:-------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Can I become a retail partner?                               | Yes, we are always looking to expand our network of retail partners. If you are interested in stocking our eyewear, please contact our sales team for more information.                 |
   | Do you have retail partners where I can try on your eyewear? | Yes, we have partnered with various optical shops where you can try on our eyewear. Please visit our website to find the nearest location.                                              |
   | What types of eyewear do you offer?                          | We offer a wide range of eyewear including prescription glasses, sunglasses, and contact lenses. We also have a collection of designer frames to suit different styles and preferences. |

![Create three FAQ web content article.](./creating-claritys-web-content/images/03.png)

Great! You should have all the web content Clarity needs for their pages. In later exercises, you'll map some of this content to fragments on Clarity's pages. Next, let's explore how you can create content in Liferay with ChatGPT.

<!--Exercise 11a-->
## Exercise: Generating Content with ChatGPT

You may have noticed that web content articles include the *AI Creator* button for generating content using ChatGPT. Using this feature requires a valid API key.

Here you'll add a temporary API key to your instance as the Clarity Admin user.

To do this,

1. Sign in as the Clarity Admin user.

   * Username: `admin@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Instance Settings*.

1. Click *AI Creator*.

1. Enter the API key provided for this training.

   **Note**: This key is temporary.

1. Ensure *Enable ChatGPT to Create Content* is checked.

1. Click *Save*.

1. Return to Clarity's site, begin creating a web content article, and click the *AI Creator* button to generate content.

![Use the AI Creator tool to generate content.](./creating-claritys-web-content/images/04.png)

Great! You've used ChatGPT to generate web content articles.

## Conclusion

This concludes *Creating Clarity’s Web Content*. Now let’s take a look at how you can organize your content in Liferay.

Next Up: [Organizing Clarity’s Content](./organizing-claritys-content.md)

<!-- TODO: Add Additional Resources section. -->
