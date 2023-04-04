# Feature Flags

{bdg-secondary}`DXP 7.4 U69+/GA69+`

Liferay now includes *Feature Flags* for release and beta features. The goal is to provide more control over the functionality onboarded into Liferay DXP, and get new and experimental features adopted and validated more effectively.

To access and manage feature flags, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings*. Click *Feature Flags* under *Platform*. There are two types of feature flags: 

* Beta
* Release

![You can use feature flags to control the visibility of features and get better adoption and validation.](./feature-flags/images/01.png)

## Beta Feature Flags

Beta features are functional features undergoing business validation. These are experimental and require careful consideration before usage. Beta features may be deprecated after a limited time period or converted into a release feature. You can give your valuable feedback on beta features through one of the following channels:

* [Community Slack](https://liferay.dev/chat)

* Create a JIRA Ticket

To enable a beta feature, 

1. Click *Beta* on the left menu. 

1. You can find a list of all beta features listed. Use the toggle to enable or disable a feature. 

You can also use the search bar to find beta features quickly, sort them using the Sort (![Sort](../../images/icon-sort2.png)) button, or filter them based on their status. 

![You can also use the search bar to find beta features quickly, sort them using the Sort button, or filter them based on their status.](./feature-flags/images/02.png)

## Release Feature Flags

Release features are fully functional features baked into the product but under a flag for a limited time period. This flag allows you to control the visibility of a feature and enable it once your organization or team has learned more about it. 

To enable a release feature, 

1. Click *Release* on the left menu. 

1. You can find a list of all release features listed. Use the toggle to enable or disable a feature. 

You can also use the search bar to find beta features quickly, sort them using the Sort (![Sort](../../images/icon-sort2.png)) button, or filter them based on their status. After a limited time period, release features are included in Liferay DXP out-of-the-box.

## Additional Information

* [Semantic Search](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)

<!-- The intention of keeping new features behind a Release flags is to provide a more "stable" user interface for a limited period of time (originally, a Quarter, but this might evolve so that we keep the release flags longer). 

We want to prevent users from finding out that the UI just changed or a new feature that they are not aware of just popped out. 

Our goal for 2023 is to improve the criteria to remove the Release flags beyond just a time frame, probably aligned with having public documentation available. 

So maybe it's a good idea to align the messaging of Release flags to providing users and customers with time to get awareness and information about the new features before they just find them spontaneously in the product. 

What do you think?

Important to remark the fact that Release flags are time-bound. 

If we ever decide a feature should always be opt-in for customers, we will design it differently, in order to create a configuration for it. 

For Release flags, I think what you mention is enough. Maybe mention the different sources of information they can have for new features: public documentation, articles, etc, so that they can reach it to learn about the new features. 

For Beta features, I would not mention the 6 months period as it's an internal reference for PMs to focus on the validation. 

It could be less or even more if the PM thinks that he needs more time. 

I would mention our feedback channels for Beta features: community slack, PTRs, and also we will enable a Liferay Ask section for that purpose as well. (I will update you on this point soon). -->