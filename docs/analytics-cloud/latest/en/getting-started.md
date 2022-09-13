---
toc:
   - ./getting-started/connecting-liferay-dxp-to-analytics-cloud.md
   - ./getting-started/syncing-sites-and-contacts.md
   - ./getting-started/understanding-your-sites-data.md
   - ./getting-started/paths-and-pages.md
   - ./getting-started/assets-and-events.md
   - ./getting-started/understanding-your-audience.md
   - ./getting-started/individuals.md
   - ./getting-started/segments.md
---
# Getting Started

```{toctree}
:maxdepth: 3

getting-started/connecting-liferay-dxp-to-analytics-cloud.md
getting-started/syncing-sites-and-contacts.md
getting-started/understanding-your-sites-data.md
getting-started/paths-and-pages.md
getting-started/assets-and-events.md
getting-started/understanding-your-audience.md
getting-started/individuals.md
./getting-started/segments.md
```

Welcome to Liferay Analytics Cloud. This learning path will take you on a journey to learn how to setup and start using Analytics Cloud to get the most out of its different features. Delivering an awesome digital experience is important to you. But knowing how to craft your site and make future improvements only comes from understanding who your users are and knowing how they interact with your site. 

<!-- Hey Makoto, The above paragraph needs a different approach, for these reasons: 

   1. We don't want to talk about "meta" information, like "this is a learning path." We just want to talk about the content. 

   2. We want to approach the topic of AC from the _outside_. The reader isn't approaching this to "learn how to set up and use AC to get the most out of its different features," because the reader doesn't know what those features are. The reader is approaching this to be convinced he/she needs the AC features you'll describe in this intro. What does AC offer that the reader can't get as easily or conveniently anywhere else? How will the AC features help the reader do something that's difficult without it? By the end, the reader should be convinced, "I need this! How do I install it?" 

   3. Don't project what the reader is thinking/feeling ("Delivering an awesome digital experience is important to you."). 

-Rich -->

Why is the integration of Analytics Cloud and Liferay DXP so awesome? Because straight out-of-the-box, Analytics Cloud has access to the full range of data on a Liferay DXP's database. No other analytics product can easily accomplish this. All the hosted content and a site's various users are ready to be tracked and analyzed. You can both measure what's happening on your site and easily put the data into action through site improvements.

<!-- The above paragraph is good! Maybe we should start with this. The sentence that starts "All the hosted content...", however, sounds a little creepy. People don't want to be tracked and analyzed; is there a better way to put this so it sounds more like the reader would be serving his/her users better because of the analytics rather than tracking and analyzing their every move? -Rich -->

Here are some key differences between Liferay Analytics Cloud versus other analytics solutions:

| Liferay Analytics Cloud | Other analytics products |
| :--- | :--- |
| Quick setup and out-of-the-box integration | Potentially lengthy setup process and manual integration |
| Full range of data integration options | Limited tracking options |
| Both site-level and individual page analytics | Analytics mostly focused on individual pages |
| Insights into both known and anonymous visitors | Only anonymous visitor data (depending on site setup) |

In Analytics Cloud, all your analytics data is easily accessed through the navigation menu on the left of the screen. [Touchpoints](#touchpoints) report on what's happening with your website, your individual pages, and different assets. [People](#people) shows how individuals interact with your website and can be divided into segment data on groups of individuals.

![The left navigation has the Touchpoints section and People section.](./getting-started/images/01.png)

<!-- Below, you jump right into the interface. The reader doesn't yet care. Again, try to think reader-centric, like somebody who has never seen Analytics Cloud before. What are the things at a higher level beyond the AC UI that AC solves? For example, above you mention segments almost as an aside, but segments are actually extremely important as a concept. Provide screenshots of the UI, but only as they illustrate these concepts that are important. You don't want a tour of the UI in the intro; you want to be reader-centric, not Liferay-centric. -Rich -->


## Touchpoints

From the moment you sync your DXP site, Analytics Cloud automatically begins collecting data across all your pages and assets. There's no need for additional configuration. 

<!-- Not sure what the above paragraph has to do with the heading (Touchpoints). What's a touchpoint? You haven't defined it. -Rich -->

### Sites

The [Sites Dashboard](./touchpoints/sites-dashboard.md) is a site-wide report that aggregates analytics data across your entire site in one comprehensive dashboard.

<!-- Link sites to Liferay sites. What does AC bring to sites that sites in regular DXP don't already have? What specific things can the reader see? Describe them, then illustrate them with the screenshot. Do not assume the screenshot tells the whole story. --Rich -->

![The Sites Dashboard gives high level analytics of your website.](./getting-started/images/02.png)

View analytics such as visitor data across time, most visited pages, and traffic sources.

Click the _Pages_ tab to see detailed analytics of every page on your site. Click any page to drill down on the specific analytics of that page.

<!-- What are these analytics? Describe them. How are they useful to the reader? --Rich -->

![Click any page to see its specific analytics.](./getting-started/images/03.png)

Get actionable data such as how long visitors stay on a page or what percent of visitors leave a page. As you make improvements to your pages or promote them through marketing, use Analytics Cloud to track their performance over time.

From a page's analytics, click the _Path_ tab to see where the page's traffic is coming from (i.e. organic or referral traffic). This is especially useful if you are paying for ad traffic and want to know whether your marketing efforts are working.

<!-- Maybe your reader isn't up on all the analytics lingo, so define organic and referral traffic. How can the reader use this data to improve his/her site? -->

### Assets

An _asset_ refers to any type of content that exists in a Liferay instance. This could be a blog post, a document, a file, a form, or other web content. Analytics Cloud tracks how visitors interact with these assets on your site. Click _Assets_ in the navigation menu to see analytics data of the various assets of your site.

<!-- How does it track how visitors interact with assets? Explain it, then illustrate it. People aren't going to squint at a screenshot to try to figure this out. --> 

![Click Assets on the left navigation to see asset analytics.](./getting-started/images/04.png)

The assets are organized by different types. Click on the different tabs at the top to see analytics for each type of asset.

### Events

An _event_ refers to various user interactions that are tracked by Analytics Cloud, such as page views, interactions with assets, and various other user actions. The [Events Analysis](./touchpoints/events/events-analysis.md) tool is a powerful tool to help break down and filter these events in ways that are meaningful to your business. 

<!-- Don't worry about the tool at this point; it's important to let the reader know at a high level that AC tracks all kinds of events. Spark the readers imagination about what events he/she might want to track. Explain that there are out-of-the-box events and that you can create custom events. There's plenty of time to learn exactly how the tool works later. It's either in the LP or we can link to it. --> 

For example, use the tool to compare the monthly page views of specific pages. 

![Use the Events Analysis tool to compare monthly page views.](./getting-started/images/08.png)

The Events Analysis tool can become even more powerful if you [Define Custom Events](./workspace-data/definitions/definitions-for-events.md#custom-events) that are tailored to your site. See [Tracking Events](./touchpoints/events/tracking-events.md) to learn more.

## People

After syncing your Liferay DXP contacts, Analytics Cloud begins tracking visitor data for you to analyze.

### Segments

<!-- This explanation of segments is too far away from when you first mentioned the topic in the first or second paragraph above. Think of this intro more like an essay than a tour of an interface. Start by introducing what AC is and does, why it's better than other solutions for Liferay installations, and then describe the features not from the point of view of the interface, but from the point of view of their concepts. Are people naturally going to think of analytics in terms of people hitting the site first? Probably. So this section should likely come before the Touchpoints section, which is a foreign concept that has to be explained anyway. Drill down from the common/easy to understand concepts to the more difficult concepts. Use the UI to illustrate, not to guide how the article is organized. -->

Use the [Segments](./people/segments/segments.md) tool to group individuals based on common attributes. The segmentation can be set up dynamically by attributes you select, or set up statically with the individuals you specifically choose. For example, you could create a dynamic segment of managers by filtering any users on your site with a job title that contains the word "manager".

![Overview page of dynamic segment of managers.](./getting-started/images/06.png)

The overview tab gives you a quick view of the number of people in the segment and their top interests.

### Individuals

The [Individuals Dashboard](./people/individuals/individuals-dashboard.md) gives an overview of all your visitors. See which portion of your visitors are known users who are logged in to your site and which visitors are unknown. Click the _Known Individuals_ tab to drill down on a particular individual.

![See analytics data on any of your known individuals.](./getting-started/images/07.png)

These [Individual Profiles](./people/individuals/individual-profiles.md) provide detailed analytics on how each user is interacting with your site. Understanding individual behavior and interests can help you make better decisions when improving your site to tailor user experience.

<!-- All of the above is a tour of the interface. Describe what you can do, not how it's done in the UI. -->

## Setting Up Your Analytics Cloud

Now that you've seen some of the capabilities of Analytics Cloud, it's time to get your workspace set up. The first step is to connect your Liferay DXP instance to Analytics Cloud. This is, in essence, giving Analytics Cloud permission to view what's happening on your Liferay instance.

See [Connecting Liferay DXP to Analytics Cloud](./getting-started/connecting-liferay-dxp-to-analytics-cloud.md) and follow the steps.

<!-- Don't link to videos like this. Videos will be embedded, not linked. I would've just taken the sentence above out, but I wanted to mention that. :-) -->

The contents of the article are also covered in this video tutorial [What is Analytics Cloud?](https://youtu.be/RGGvIG3YPyg).
