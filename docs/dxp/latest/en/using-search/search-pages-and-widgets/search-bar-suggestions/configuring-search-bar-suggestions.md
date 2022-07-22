# Configuring Search Bar Suggestions

{bdg-secondary}`7.4 Ux+ and GAX+`

Search Bar Suggestions adds _search as you type_ functionality to Liferay's Search Bar widget. 

![Select a result from the drop-down list or execute a search as usual.](./configuring-search-bar-suggestions/images/01.gif)

The user types search keywords into the Search Bar as usual. The keywords are ingested by Liferay and sent to Elasticsearch; results are returned in a drop-down list. Continuing to type causes additional queries to be made to Elasticsearch. You can click one of the results from the list or execute the search as usual, clicking the magnifying glass icon or the Enter key to execute the search and view the results in the Search Results Widget.

## Configuration Options

If Search Bar Suggestions is enabled in [System or Instance Settings](#search-bar-suggestions-configuration-scope), you can configure Search Suggestions at the Widget [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

![Use the Suggestions Configuration of the Search Bar widget's configuration screen.](./configuring-search-bar-suggestions/images/02.png)

**Enable Suggestions:** Suggestions are enabled by default. Uncheck the checkbox to turn off suggestions.

**Character Threshold for Displaying Suggestions:** Each time the configured number of characters is entered into the Search Bar, the query is re-processed and the results refreshed accordingly. Tune this setting to balance sending lots of requests to Elasticsearch (i.e., setting the threshold too low triggers many search requests) with being helpful to the user (i.e., setting the threshold too high means the user must type a lot to trigger the first suggestion query).

**Suggestions Contributor Configuration:** Configure the contributor(s) used to control the query sent to Elasticsearch. This setting is made up of three values:

* **Suggestions Contributor**: The default contributor, and the only one available out-of-the-box in Liferay CE, is `Basic`. If you are using Liferay DXP with Liferay Enterprise Search, you can choose to use one or more Blueprint contributors instead. See [Search Bar Suggestions Blueprints](./search-bar-suggestions-blueprints.md) for more information.

* **Display Group Name**: The default is `suggestions`. This value is a language key that resolves to Suggestions as the heading in the UI for the English language. You can change the language key or add your own: for example, make it `is-this-what-you're-looking-for`, then add the [translation](../../../system-administration/configuring-liferay/changing-language-translations.md#adding-a-language-key-and-translation). If you are using more than one Blueprint contributor, make sure each one has a unique Display Group Name value.

* **Size**: Set the maximum number of results to display in the Search Bar dropdown list. The default is `5`. Because display space is limited, there's no benefit to setting the size to a large number.

```{tip}
LES Blueprints users can choose to use a Blueprint to control the Search Bar Suggestions query. When _Blueprint_ is selected as the contributor, additional configuration options appear in the Search Bar widget configuration. See [Search Bar Suggestions Blueprints](./search-bar-suggestions-blueprints.md) for more information.
```

## Configuring Search Bar Suggestions in the Control Panel

/`contributorName`
/`displayGroupName`
/`size`

There are three Control Panel configuration entries that can affect Search Bar Suggestions:

1. Service Access Policies
1. Search Suggestions in System Settings
1. Search Bar in System and Instance Settings

### Configuring the Suggestions Service Access Policy

If you disable the SAP, guests will not see suggestions

### Configuring the Suggestions REST Endpoint 

### Configuring Suggestions with the Search Bar

You can configure Search Bar Suggestions defaults at the System and Instance [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

![Configure Search Bar Suggestions at the Instance or System scope.](./configuring-search-bar-suggestions/images/03.png)

Enable or disable Search Bar Suggestions at the System, Instance, or Widget [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md):

* If Search Bar Suggestions is disabled in System Settings, the default for all Instances is _disabled_. 
* If Search Bar Suggestions is disabled in Instance Settings, the Suggestions settings don't appear in the Search Bar widget configuration.
* If Search Bar Suggestions is enabled in Instance Settings, it can still be disabled in the Search Bar widget configuration.

The other settings work according to Liferay's [configuration scope paradigm](../../../system-administration/configuring-liferay/understanding-configuration-scope.md): settings at higher scopes like System and Instance set the defaults, whereas the more granular scope overrides those defaults (like the Widget scope).
