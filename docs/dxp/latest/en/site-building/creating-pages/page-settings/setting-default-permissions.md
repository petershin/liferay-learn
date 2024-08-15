---
taxonomy-category-names:
- Sites
- Pages and Composition
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 70d28ba5-ecfe-492f-aeaf-e50fc8c69645
---

# Setting Default Permissions

{bdg-secondary}`Liferay DXP 2024.Q3+/Portal 7.4 GA132+`

You can define a set of default permissions for Liferay pages. The default permissions setting is available at both instance and site scopes. Use the instance scope to configure defaults for all sites in your instance. To affect a single site, set defaults at the site scope.

To configure permissions at the instance level,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* *&rarr; *Instance Settings*.

1. Scroll down to Content and Data and select *Default Permissions*.

   ![Select the new setting to configure default permissions.](./setting-default-permissions/images/01.png)

1. Click *Edit* next to the Page asset type.

1. A new modal opens with a list of permissions for various roles. Check the permissions required and click *Save*.

   ![Check the permissions you require.](./setting-default-permissions/images/02.png)

   !!! note
       The selected permissions aren't auto-saved. Ensure you click *Save* after selecting the required permissions.

1. Go to your site, open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), and go to *Site Builder* &rarr; *Pages*.

1. Click *New* and select *Page*.

1. Select the Basic template and enter a name.

1. Click *Add*. This opens the page in edit mode.

1. Click *Publish*.

1. Click *Actions* (![Actions](../../../images/icon-actions.png)) next to the newly created page and select *Permissions*.

1. Verify that the permissions configured at the instance level appear here.

![Verify that the permissions configured at the instance level appear here.](./setting-default-permissions/images/03.png)

## Setting Default Permissions at the Site Level 

Default permissions at the site level take precedence over default permissions at the instance level. 

1. Go to the appropriate site, open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), and go to *Configuration* &rarr; *Site Settings*.

1. Scroll down to Content and Data and select *Default Permissions*.

1. Click *Edit* next to the Page asset type.

1. A new modal opens with a list of permissions for various roles. Check the permissions required and click *Save*.

   ![Check the permissions you require at the site level.](./setting-default-permissions/images/04.png)

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), and go to *Site Builder* &rarr; *Pages*.

1. Click *New* and select *Page*.

1. Select the Basic template and enter a name.

1. Click *Add*. This opens the page in edit mode.

1. Click *Publish*.

1. Click *Actions* (![Actions](../../../images/icon-actions.png)) next to the newly created page and select *Permissions*.

1. Verify that the permissions configured at the site level overrides the defaults configured at the instance level.

![Verify that the permissions configured at the site level appear here.](./setting-default-permissions/images/05.png)

!!! important
    Currently, this feature is behind a release feature flag (LPD-21265). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.