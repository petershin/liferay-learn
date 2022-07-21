# Configuring Search Bar Suggestions

{bdg-secondary}`Available Liferay Portal 7.4 GAX+/DXP 7.4 UX+`

Search Bar Suggestions adds _search as you type_ functionality to Liferay's Search Bar widget. 

![Select a result from the drop-down list or execute a search as usual.](./configuring-search-bar-suggestions/images/01.gif)

The user types search keywords into the Search Bar as usual. The keywords are ingested by Liferay and sent to Elasticsearch; results are returned in a drop-down list. Continuing to type causes additional queries to be made to Elasticsearch. You can click one of the results from the list or execute the search as usual, clicking the magnifying glass icon or the Enter key to execute the search and view the results in the Search Results Widget.

## Configuration Options

You can configure Search Bar Suggestions at the System and Instance [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

![Configure Search Bar Suggestions at the Instance or System scope.](./configuring-search-bar-suggestions/images/03.png)

If Search Bar Suggestions is enabled in System or Instance Settings, you can configure Search Suggestions at the Widget [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

![Use the Suggestions Configuration of the Search Bar widget's configuration screen.](./configuring-search-bar-suggestions/images/02.png)

Despite the difference in the UI appearance, the main settings at each scope are identical:

**Enable Suggestions:** Suggestions are enabled by default at all scopes. Uncheck the checkbox to turn off suggestions.

**Character Threshold for Displaying Suggestions:** Each time the configured number of characters is entered into the Search Bar, the query is re-processed and the results refreshed accordingly.

**Suggestions Contributor Configuration:** Configure the contributor(s) used to control the query sent to Elasticsearch. This setting is made up of three values:

<!-- I need more info on how to use the contributor configuration and what each of these sub-settings is for -->
<!-- Also, you can add more than one contributor--we should explain how this works and when you'd want to do it -->
* **Suggestions Contributor**/`contributorName`: The default contributor, and the only one available out-of-the-box in Liferay CE, is `basic`. If you are using Liferay DXP with Liferay Enterprise Search, you can choose to use a `blueprint` contributor instead, or even add additional contributors. See [Search Bar Suggestions Blueprints](./search-bar-suggestions-blueprints.md) for more information.
* **Display Group Name**/`displayGroupName`: The default is `suggestions`. <!-- what's it for? It looks like it just displays the heading in the dropdown list-->
<!--From Confluence page:
This is how the frontend can “grab” the group from the response array and that’s also used as a language key to localize and show it on the Suggestions Area UI as the name of the suggestion group.Help Text: Use built-in or custom language keys to name your suggestions group on the screen.
-->
* **Size**/`size`: Set the maximum number of results to display in the Search Bar dropdown list. The default is `5`. Increasing the size can cause performance issues. <!--is that last part true? -->

```{tip}
LES Blueprints users can choose to use a Blueprint to control the Search Bar Suggestions query. When _Blueprint_ is selected as the contributor, additional configuration options appear in the Search Bar widget configuration. See [Search Bar Suggestions Blueprints](./search-bar-suggestions-blueprints.md) for more information.
```

## Search Bar Suggestions Configuration Scope

Enable or disable Search Bar Suggestions at the System, Instance, or Widget [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md):

* If Search Bar Suggestions is disabled in System Settings, the default for all Instances is _disabled_. 
* If Search Bar Suggestions is disabled in Instance Settings, the Suggestions settings don't appear in the Search Bar widget configuration.
* If Search Bar Suggestions is enabled in Instance Settings, it can still be disabled in the Search Bar widget configuration.

The other settings work according to Liferay's [configuration scope paradigm](../../../system-administration/configuring-liferay/understanding-configuration-scope.md): settings at higher scopes like System and Instance set the defaults, whereas the more granular scope overrides those defaults (like the Widget scope).

<!-- Questions to SME -->
Questions/Feedback: 

1. Why is the contributor configuration field type different between System/Instance Settings and the Widget configuration? Best if possible to make them the same.
1. Why don't we have help text for Character Threshold for Displaying Suggestions, but we have it for the other 2?
1. If I change the System Settings `contributorName` to `blueprint`, it's not reflected as the default in the Search Bar Widget configuration. Why? 
