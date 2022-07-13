# Configuring Search Bar Suggestions

{bdg-secondary}`Available DXP 7.4 Update X+`

Search Bar Suggestions adds _search as you type_ functionality to Liferay's Search Bar widget. 

![Select a result from the drop-down list or execute a search as usual.](./configuring-search-bar-suggestions/images/01.gif)

The user types search keywords into the Search Bar as usual. The keywords are ingested by Liferay and sent to Elasticsearch; results are returned in a drop-down list. Continuing to type causes additional queries to be made to Elasticsearch. You can click one of the results from the list or execute the search as usual, clicking the magnifying glass icon or the Enter key to execute the search and view the results in the Search Results Widget.

## Configuration Options

You can configure Search Suggestions at the Widget [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

![Use the Suggestions Configuration of the Search Bar widget's configuration screen.](./configuring-search-bar-suggestions/images/02.png)

You can also configure Search Bar Suggestions at the System and Instance [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

![Configure Search Bar Suggestions at the Instance or System scope.](./configuring-search-bar-suggestions/images/03.png)

Despite the difference in the UI appearance, the settings at each scope are identical:

**Enable Suggestions:** Suggestions are enabled by default at all scopes. Uncheck the checkbox to turn off suggestions.

<!-- I need more info on how to use  the contributor configuration and what each of these sub-settings is for -->
**Suggestions Contributor Configuration:** Choose the contributor used to control the query sent to Elasticsearch. This setting is made up of three values:

** **Suggestions Contributor**/`contributorName`: The default is `basic`.
** **Display Group Name**/`displayGroupName`: The default is `suggestions`.
** **Size**/`size`: The default is `5`.

**Character Threshold for Displaying Suggestions:** Each time the configured number of characters is entered into the Search Bar, the query is re-processed and the results refreshed accordingly.

## Search Bar Suggestions Configuration Scope

The configuration of Search Bar Suggestions is intended to work hierarchically:

* If Search Bar Suggestions is disabled in System Settings, the default for all Instances is _disabled_, and the Suggestions settings don't appear in the Search Bar widget configuration.
* If Search Bar Suggestions is disabled in Instance Settings, the Suggestions settings don't appear in the Search Bar widget configuration.

The other settings work according to Liferay's [configuration scope paradigm](../../../system-administration/configuring-liferay/understanding-configuration-scope.md): settings at higher scopes like System and Instance set the defaults, whereas the more granular scope overrides those defaults (like the Widget scope).

<!-- Questions to SME -->
Questions/Feedback: 

1. Why is the contributor configuration field type different between System/Instance Settings and the Widget configuration? Best if possible to make them the same.
1. Why don't we have help text for Character Threshold for Displaying Suggestions, but we have it for the other 2?
