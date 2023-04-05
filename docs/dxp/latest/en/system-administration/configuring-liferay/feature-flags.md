# Feature Flags

{bdg-secondary}`DXP 7.4 U69+/GA69+`

Liferay now includes *Feature Flags* for release and beta features. The goal is to provide more control over the functionality onboarded into Liferay DXP, and get new and experimental features adopted and validated more effectively.

To access and manage feature flags, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings*. Click *Feature Flags* under *Platform*. There are two types of feature flags available here: 

* Beta
* Release

![You can use feature flags to control the visibility of features and get better adoption and validation.](./feature-flags/images/01.png)

<!--  Add image for badge used to denote beta features in product
Liferay DXP uses a badge to highlight beta features. See below: -->

The documentation for a beta feature includes a badge. See below: 

![The documentation for a beta feature includes a badge.](./feature-flags/images/02.png)

There're dev feature flags used internally for features/capabilities in active development. See [Dev Feature Flags](#dev-feature-flags).

## Beta Feature Flags

Beta features are functional features or capabilities undergoing business validation. These are experimental and require careful consideration before usage. Beta features may be deprecated after a limited time period or converted into a release feature. You can give your valuable feedback on beta features through Liferay's [Community Slack](https://liferay.dev/chat).

To enable a beta feature, 

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings*. 

1. Click *Feature Flags* under *Platform*, then click *Beta*. 

1. You can find a list of all beta features listed. Use the toggle to enable or disable a feature. 

You can also use the search bar to find beta features quickly, sort them using the Sort (![Sort](../../images/icon-sort2.png)) button, or filter them based on their status. 

![You can also use the search bar to find beta features quickly, sort them using the Sort button, or filter them based on their status.](./feature-flags/images/03.png)

## Release Feature Flags

Release features are fully functional features baked into the product but under a flag for a limited time period. This flag allows you to control the visibility of a feature and enable it once your organization or team has learned more about it. 

To enable a release feature, 

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings*. 

1. Click *Feature Flags* under *Platform*, then click *Release*. 

1. You can find a list of all release features listed. Use the toggle to enable or disable a feature. 

You can also use the search bar to find beta features quickly, sort them using the Sort (![Sort](../../images/icon-sort2.png)) button, or filter them based on their status. After a limited time period, release features are included in Liferay DXP out-of-the-box.

![You can also use the search bar to find beta features quickly, sort them using the Sort button, or filter them based on their status.](./feature-flags/images/04.png)

## Dev Feature Flags

Dev feature flags are used for features/capabilities in active development. It is not recommended to use these flags to enable a feature/capability in production. It is only meant for testing. 

To enable a dev feature flag (`XXX-000000`) using a portal property, add this to `portal-ext.properties`: 

```
feature.flag.XXX-000000=true
```

To enable a dev feature flag (`XXX-000000`) using an environment variable, add this to your configuration: 

```
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEX__UPPERCASEX__UPPERCASEX__MINUS__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0_=true
```

```{warning}
Using a dev flag to enable a feature is strictly not recommended and can cause instabilities in the product. 
```

## Additional Information

* [Semantic Search](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)
* [Beta Features](https://help.liferay.com/hc/en-us/articles/12917247551757-Beta-Features)