---
uuid: 85d7e066-677f-4616-aca4-56555601a228
---
# Personalizing Search Experiences with Blueprints

As we saw in the previous lesson, using search facets is great in providing visitors a way to quickly filter search results. However, search results can be further customized and personalized with the use of search blueprints. In the future, Clarity wants to sell their products directly to consumers. And they want to have a way to customize and control what might be shown at the top of particular search results. For example, they want seasonal products to be boosted in the search results to try to increase sales.

## Exercise 1: Dynamic Collections with Search Blueprints

One simple way to utilize search blueprints is with collection providers. Every time you create a search blueprint, a collection provider is automatically generated. Then showing the results of the search blueprints is as easy as adding a collection display widget onto a site page. For example, Clarity wants to have a site page that automatically displays a list of upcoming events. A search blueprint can query upcoming events on their calendar to automatically fetch these upcoming events. Follow these steps below to see how this works.

1. Create a site page with a Clarity calendar.
   1. From the product menu, navigate to _Site Builder_ &rarr; _Pages_. 
   1. Click _New_ and select _Page_.
   1. Select _Blank_.
   1. Input _Calendar_ as the name and click _Add_.
   1. Select _Fragment and Widgets_ in the left menu and select the _Widgets_ tab. Scroll down to the collaboration section and drag a _Calendar_ widget onto the page.
   1. In the list of site pages, find the calendar page you just created, click the options icon and select _View_.
   1. Click on a date that is before the current date and input `Past Event 1` as the name and click _Save_.
   1. Click on a date that is after the current data and input `Future Event 1` as the name and click _Save_.
   1. Add one more event after the previous event and input `Future Event 2` as the name as click _Save_.

      ![The calendar has one past event and two future events.](./personalizing-search-experiences-with-blueprints/images/01.png)

1. Create a future events blueprint element.
   1. From the applications menu, navigate to _Applications_ &rarr; _Blueprints_.
   1. Click on the _Elements_ tab and click the add icon.
   1. Input _Future Events_ as the title and click _Save_.
   1. Delete the sample JSON and paste the following JSON snippet:
      ```JSON
      {
         "description_i18n": {
            "en_US": "Limit results to only future events, using the endTime field."
         },
         "elementDefinition": {
            "category": "filter",
            "configuration": {
               "queryConfiguration": {
                  "queryEntries": [
                     {
                        "clauses": [
                           {
                              "context": "query",
                              "occur": "filter",
                              "query": {
                                 "range": {
                                    "endTime": {
                                       "gt": "${time.current_date|date_format=timestamp}"
                                    }
                                 }
                              }
                           }
                        ]
                     }
                  ]
               }
            },
            "icon": "filter",
            "uiConfiguration": {}
         },
         "title_i18n": {
            "en_US": "Future Events"
         },
         "type": 0
      }
      ```
   1. Click _Save_.

1. Create a future events search blueprint.
   1. Still in the search blueprints application, click on the _Blueprints_ tab. 
   1. Click the add icon to create a new blueprint. Input _Future Events_ as the name and click _Create_.
   1. In the right menu of query elements, expand the _FILTER_ section and find the _Future Events_ element. Click _Add_ for the element.
   1. In the left navigation, click _Query Settings_. Change the searchable type to _Selected Types_. Click _Select Asset Types_ and check _Calendar Event_ and click _Done_.

      ![Change the asset type to calendar event.](./personalizing-search-experiences-with-blueprints/images/02.png)

   1. Click _Save_ for the blueprint.

1. Create a future events site page with a collection provider.
   1. From the product menu, navigate to _Site Builder_ &rarr; _Pages_. 
   1. Click _New_ and select _Page_.
   1. Select _Blank_.
   1. Input _Future Events_ as the name and click _Add_.
   1. Select _Fragment and Widgets_ in the left menu and select the _Widgets_ tab. In the search bar, search for `collection` and find the collection display widget. Drag the widget onto the page.
   1. In the configuration menu on the right, click the plus button to select a collect provider.
   1. In the new window select the _Collection Providers_ tab. Select the _Future Events_ collection provider.
   1. Under style display, select _Bulleted List_. 
   1. Click _Publish_.

      ![The collection display shows the future events.](./personalizing-search-experiences-with-blueprints/images/03.png)

      The search blueprint automatically provides a collection of future events.

## Exercise 2 - Search Blueprints with Custom Fields

Occasionally, businesses need to integrate with other web services. For example, the employee benefits system Clarity utilizes wants to reference Clarity employees based on the registration ID numbers they utilize. In Liferay, a custom field can be added to user accounts to add additional fields. Then Liferay's headless APIs can be used to query this custom field. Follow the steps below to see this in action. 

!!! note
The user account headless APIs cannot filter custom fields directly. Therefore, a search blueprint is leveraged to be able to query for this custom field.

1. From the applications menu, navigate to _Control Panel_ &rarr; _Custom Fields_.

1. Scroll down and click select _User_. Click _New_ to create a new custom field. 

1. Select _Input Field_. Give the field the name `RegistrationId`. Select _Integer_ as the data type. Click _Save_.

1. From the applications menu, navigate to _Control Panel_ &rarr; _Users & Organizations_.

1. Click on _Ian Miller_, the IT manager. Scroll down to the bottom and input `555777` for the registration ID. Click _Save_.

1. From the applications menu, navigate to _Applications_ &rarr; _Blueprints_. Click the add button to add a new search blueprint. Input `RegistrationId` as the title and click _Create_.

1. In the right menu of query elements, expand the _FILTER_ section and find the _Filter by Exact Terms Match_ element. Click _Add_ for the element.

1. In the _Field_ field, begin typing `RegistrationId` until the autosuggest shows a match for `expando__keyword__custom_fields__RegistrationId_long`. In the _Values_ field, input `${keywords}`. Click _Save_. Take note of ID number of the search blueprint (e.g. `32256`).

1. In the applications menu, navigate to _Control Panel_ &rarr; _Instance Settings_. Click _Feature Flags_ and select _Beta_ in the left navigation. Scroll down and enable `Search Headless API (LPS-179669)`. Note, beta features are usually not recommended for production use, but this feature will be available as a full feature Q3 2024.

1. Open a new browser window and navigate to Liferay's API explorer at `[server]:[port]/o/api` (e.g. http://localhost:8080/o/api). In the top menu, click _REST Applications_ and select _portal-search-rest/v1.0_.

1. Expand the _postSearchPage_ endpoint panel and scroll down to the request body section. Paste the following request:

   ```JSON
   {
      "attributes": {
         "search.experiences.blueprint.id":"{blueprint ID}"
      }
   }
   ```

   Replace `{blueprint ID}` with the ID number of your search blueprint. 

1. For the _nestedFields_ field input `embedded`. For the _search_ field input `555777`. Click _Execute_. See that Ian Miller's user account information is returned.

   ![The API response returns Ian Miller's user account.](./personalizing-search-experiences-with-blueprints/images/04.png)

## Conclusion

Congratulations! You've completed Module 9 - Search.

[Back to Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)
