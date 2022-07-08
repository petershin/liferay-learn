# Configuring Search Bar Suggestions

{bdg-secondary}`Available DXP 7.4 Update X+`

Search Bar Suggestions adds _search as you type_ functionality to Liferay's Search Bar widget. 

![Select a result from the drop-down list or execute a search as usual.](./configuring-search-bar-suggestions/images/01.gif)

The user types search keywords into the Search Bar as usual. The keywords are ingested by Liferay and sent to Elasticsearch; results are returned in a drop-down list. Continuing to type causes additional queries to be made to Elasticsearch. You can click one of the results from the list or execute the search as usual, clicking the magnifying glass icon or the Enter key to execute the search and view the results in the Search Results Widget.

## Configuration Options

You can configure Search Suggestions at the System, Instance, or Widget [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md).

### Widget Configuration

![Use the Suggestions Configuration of the Search Bar widget's configuration screen.](./configuring-search-bar-suggestions/images/02.png)

Enable Suggestions

Suggestions Contributor Configuration

Character Threshold for Displaying Suggestions

### System and Instance Configuration

Identical configuration interfaces are provided in Liferay's [System](../../../system-administration/configuring-liferay/system-settings.md) and [Instance Settings](../../../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) consoles.

Regardless if you're in System or Instance Settings, go to the Search category and find the Search Bar entry.

![Configure Search Bar Suggestions at the Instance or System scope.](./configuring-search-bar-suggestions/images/03.png)

Enable Suggestions

Suggestions Contributor Configuration

Character Threshold for Displaying Suggestions

Feedback: 

1. Why are the configuration field types different between System/Instance Settings and the Widget config. Best if possible to make them the same.
1. Why don't we have help text for Character Threshold for Displaying Suggestions, but we have it for the other 2?
