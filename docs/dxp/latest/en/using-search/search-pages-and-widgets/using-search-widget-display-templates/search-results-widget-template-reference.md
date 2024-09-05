---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: b1d411bc-c88e-4659-b779-91676fcf194f
---
# Search Results Widget Template Reference

| Editor Field Name | Description | Type | Usage Example | Comments & Suggestions |
| :---------------- | :---------- | :--- | :------------ | :--------------------- |
| Documents | The collection of the search result entries. See Search Result Entry Fields | List< SearchResultSummaryDisplayContext> |  | Rename to Search Results in the panel. Documents is ambiguous and refers to search engine documents, which they are not. |
| Search Container | The search Container. Contains information about the search and can be used to build a grid for displaying a list of results and their properties. | Search Container | <@liferay_ui["search-container"] searchContainer=searchContainer> <@liferay_ui["search-container-results"] results=searchContainer.results> <@liferay_ui["search-container-row"]  className="com.liferay.portal.kernel.search.Document" keyProperty="UID" modelVar="document"> <@liferay_ui["search-container-column-text"]  href="" name="Title"  value=document.get("title_en_US") /> </@> </@> <@liferay_ui["search-iterator"] /> </@> | Create Javadocs, document the methods in the code. Provide  a more full fledged code example  As a general note: SearchContainer isn't required for anything in the OOTB search result widget templates. The few properties, currently used, are available from other variables. |
|  |  | String | `${searchContainer.getClassName()}` |  |
|  |  | String | `${searchContainer.getCssClass()}` |  |
|  | Results page number | int | `${searchContainer.getCur()}` |  |
|  | Page number  parameter name | String | `${searchContainer.getCurParam()}` |  |
|  | Delta / number of entries to display per page | int | `${searchContainer.getDelta()}` |  |
|  | Delta parameter name | String | `${searchContainer.getDeltaParam()}` |  |
|  |  | DisplayTerms | `${searchContainer.getDisplayTerms()}` |  |
|  |  | String | `${searchContainer.getEmptyResultsMessage()}` |  |
|  |  | String | `${searchContainer.getEmptyResultsMessageCssClass()}` |  |
|  | The index of the last result to show | Integer | `${searchContainer.getEnd()}` |  |
|  |  | List<String> | `${searchContainer.getHeaderNames()}` |  |
|  |  | Map<String, String> | `${searchContainer.getHelpMessages()}` |  |
|  | An ID for the component instance | String | `${searchContainer.getId(request, nameSpace)}` |  |
|  | The page URL for pagination | PortletURL | `${searchContainer.getIteratorURL()}` |  |
|  |  | List<String>  | `${searchContainer.getNormalizedHeaderNames()}` |  |
|  |  | Map<String, String> | `${searchContainer.getOrderableHeaders()}` |  |
|  | Sort column | String | `${searchContainer.getOrderByCol()}` |  |
|  | Sort column parameter name | String | `${searchContainer.getOrderByColParam() }` |  |
|  |  | OrderByComparator | `${searchContainer.getOrderByComparator() }` |  |
|  |  | String | `${searchContainer.getOrderByJS()}` |  |
|  | An order type for the columns, either ascending or descending | String | `${searchContainer.getOrderByType()}` |  |
|  | Order by param | String | `${searchContainer.getOrderByTypeParam()}` |  |
|  | Portlet request | PortletRequest | `${searchContainer.getPortletRequest()}` |  |
|  | The index of the last hit to show | Integer | `${searchContainer.getResultEnd()}` |  |
|  |  | List<ResultRow> | `${searchContainer.getResultRows()}` |  |
|  | Result documents | List<Document> | `${searchContainer.getResults()}` |  |
|  |  | RowChecker | `${searchContainer.getRowChecker()}` |  |
|  |  | RowMover | `${searchContainer.getRowMover()}` |  |
|  |  | DisplayTerms | `${searchContainer.getSearchTerms()}` |  |
|  | Number of hits to skip from the beginning | Integer | `${searchContainer.getStart()}` |  |
|  |  | String | `${searchContainer.getSummary()}` |  |
|  | Total number of hits | Integer | `${searchContainer.getTotal()}` |  |
|  |  | String | `${searchContainer.getTotalVar()}` |  |
|  |  |  |  |  |
|  | Has results | Boolean | `${searchContainer.hasResults()}` |  |
|  | Whether the user can choose the number of items displayed per page | Boolean | `${searchContainer.isDeltaConfigurable()}` |  |
|  |  | Boolean | `${searchContainer.isForcePost()}` |  |
|  | Whether to use hover effects | Boolean | `${searchContainer.isHover()}` |  |
|  |  | Boolean | `${searchContainer.isRecalculateCur()}` |  |
|  |  | Boolean | `${searchContainer.isSearch()}` |  |
| Search Results Display Context | Contains information about the current search and widget configuration | Search Results Display Context |  | Create Javadocs |
|  | The Site ID where the widget template is located | long | `${searchResultsPortletDisplayContext.getDisplayStyleGroupId()}` |  |
|  | The retrieved search engine documents | List<Document> | `${searchResultsPortletDisplayContext.getDocuments()}` | Expose in the editor panel. The name needs consideration, because of  Documents being currently reserved with different semantics. |
|  | Current search keywords | String | `${searchResultsPortletDisplayContext.getKeywords()}` | Expose in the editor panel: Keywords |
|  | The search container | Search Container | `${searchResultsPortletDisplayContext.getSearchContainer()}` |  |
|  | The search results portlet instance configuration | SearchResultsPortletInstanceConfiguration | `${searchResultsPortletDisplayContext.getSearchResultsPortletInstanceConfiguration()}` |  |
|  | The search result summary context for the search engine document. See Search Result Entry Fields | SearchResultSummaryDisplayContext | `${searchResultsPortletDisplayContext.getSearchResultSummaryDisplayContext(document)}` | Create Javadocsj00 |
|  | The search result summary contexts. See Search Result Entry Fields | List<SearchResultSummaryDisplayContext> | `${searchResultsPortletDisplayContext.getSearchResultSummaryDisplayContexts()}` |  |
|  | Total number of hits | int | `${searchResultsPortletDisplayContext.getTotalHits()}` | Expose in the editor panel: Total Hits |
|  | Is the widget visible | boolean | `${searchResultsPortletDisplayContext.isRenderNothing()}` |  |
|  | Is empty results message set visible in the widget configuration | boolean | `${searchResultsPortletDisplayContext.isShowEmptyResultMessage()}` |  |
|  | Is pagination set visible in the widget configuration | boolean | `${searchResultsPortletDisplayContext.isShowPagination()}` |  |

 
Search Result Entry Variables:

| Field Name in the Editor | Description | Type | Usage Example | Comments & Suggestions |
| :----------------------- | :---------- | :--- | :------------ | :--------------------- |
|  | Asset's user ID. If the entry represents the User model the value will be the user ID of the model. Otherwise it will the user ID of the asset entry | long  | `${entry.getAssetEntryUserId()} | Not knowing the history, could this just return the userID of the asset entry instead of having ambiguous semantics? When it comes to retrieving userId in case of User model, {entry.getClassPK()}`  gives it anyways. |
|  | Asset Download URL. Download link for a for a downloadable model like File Entry | String | `${entry.getAssetRendererURLDownload()}` | Expose in the editor panel: Download URL? |
|  | The class name of the model represented by the entry  | String | `${entry.getClassName()} | Deprecate in favor of ${entry.getEntryClassName()}`. See *) below |
|  | The primary key of the model represented by the entry  | long | `${entry.getClassPK()}` | Expose in the editor panel: Entry Class Primary Key? |
| Content | Highlighted search result summary content | String | `${entry.getContent()} | Change the behavior to produce the not highlighted version of the summary content (breaking change). Introduce  ${entry.getHighlightedContent()}` to get the highlighted one. Rename in the editor panel to maybe Summary Content? |
| Creation Date | Creation date | String | `${entry.getCreationDateString()}` |  |
| Created by User Name | Full name of the creator | String | `${entry.getCreatorUserName()}` | See \*\*\* |
| Created by User Portrait | URL to creator’s portrait / avatar | String | `${entry.getCreatorUserPortraitURLString()}` | See \*\* |
|  | Document fields in the document form display mode | List<SearchResultFieldDisplayContext> | `${entry.getDocumentFormFieldDisplayContexts()}` | Expose in the editor panel. Name? |
|  |  |  | `${entry.getEditURL()}` | A new variable for the edit URL. The possible performance impact should be considered because of additional permission checks. |
|  |  |  | `${entry.getEntryClassName()}` | A new variable to better align the method name with the underlining APIs and indexed fields |
|  | The name of the request  parameter for asset category IDs | String | `${entry.getFieldAssetCategoryIds()}` |  |
|  | The name of the request  parameter for asset tag names | String | `${entry.getFieldAssetTagNames()}` |  |
|  | Document fields for entries without class name or primary key | List<SearchResultFieldDisplayContext>  | `${entry.getFieldDisplayContexts()}` |  |
|  | Highlighted search result summary content | String | `${entry.getHighlightedSummaryContent()}` | A new variable to get the highlighted summary content |
| Title | Highlighted title | String | `${entry.getHighlightedTitle()}` | Rename the label in the editor panel to Highlighted Title? |
|  | The CSS icon class for the represented model class / asset entry type | String | `${entry.getIconId()}` | Expose in the editor panel. The method name is confusing. Consider deprecating in favor of a new, more descriptive name. |
|  | Summary language ID if different from the current display language | String | `${entry.getLocaleLanguageId()}` |  |
|  | A notification text when the summary language ID is different from current display language | String | `${entry.getLocaleReminder()}` |  |
|  | Label for the model class  represented by the entry | String | `${entry.getModelResource()}` | Expose in the editor panel:  Model Name? The method name is confusing. Consider deprecating in favor of a new, more descriptive name. |
| Modified by User Name | Full name of the last modifier | String | `${entry.getModifiedByUserName()}` | See \*\*\* |
| Modified by User Portrait | URL to last modifier’s portrait / avatar | String | `${entry.getModifiedByUserPortraitURLString()}` | See \*\* |
| Modified Date | Last modification date | String | `${entry.getModifiedDateString()}` |  |
|  | The path of the current theme's image directory | String | `${entry.getPathThemeImages()}` |  |
|  | Portlet URL | PortletURL | `${entry.getPortletURL()}` |  |
| Publish Date | Published date | String | `${entry.getPublishedDateString()}` |  |
|  | URL to thumbnail for the asset entry represented by the search result entry | String | `${entry.getThumbnailURLString()}` |  Expose in the editor panel:  Thumbnail URL? See also \*\* |
|  | Title for the asset represented by the search result entry | String | `${entry.getTitle()}` | Expose in the editor panel:   Title? Note: this is the title generated by the corresponding asset renderer (if available). It's not the Summary title |
|  | URL to portrait / avatar of the user who created the asset entry represented by the search result entry | String | `${entry.getUserPortraitURLString()}` | Expose in the editor panel:  Creator User Portrait URL? See also \*\*) |
|  | View URL for the search result entry | String | `${entry.getViewURL()}` | Expose in the editor panel: View URL. If following the API naming conventions, this should be getURLView(), but there's a pattern already here See also \*\* |
|  | Has the asset entry represented by the entry asset categories or tags available | boolean | `${entry.isAssetCategoriesOrTagsVisible()}` |  |
|  | Is the asset download URL available | boolean | `${entry.isAssetRendererURLDownloadVisible()}` |  |
|  | Is the summary content available | boolean | `${entry.isContentVisible()}` |  |
|  | Is the creation date  available | boolean | `${entry.isCreationDateVisible()}` |  |
|  | Is creator’s portrait available | boolean | `${entry.isCreatorUserPortraitVisible()}` |  |
|  | Is the creator name available | boolean | `${entry.isCreatorVisible()}` |  |
|  | Is in document form display mode  | boolean | `${entry.isDocumentFormVisible()}` |  |
|  | Are the document fields for entries without class name or primary key available | boolean | `${entry.isFieldsVisible()}` |  |
|  | Is the CSS icon class for the represented model class / asset entry type available | boolean | `${entry.isIconVisible()}` |  |
|  | Is the locale reminder text available  | boolean | `${entry.isLocaleReminderVisible()}` |  |
|  | Is the label for the model class represented by this entry available | boolean | `${entry.isModelResourceVisible()}` |  |
|  | Is the last modifier name available | boolean | `${entry.isModifiedByUserNameVisible()}` |  |
|  | Is last modifier's  portrait available | boolean | `${entry.isModifiedByUserPortraitVisible()}` |  |
|  | Is the last modification date available | boolean | `${entry.isModifiedDateVisible()}` |  |
|  | Is the published date available | boolean | `${entry.isPublishedDateVisible()}` |  |
|  | Indicates the entry being unavailable because of an error | boolean | `${entry.isTemporarilyUnavailable()}` |  |
|  | Is there a thumbnail available for the asset | boolean | `${entry.isThumbnailVisible()}` |  |
|  | Is the portrait available for the user who created the asset entry | boolean | `${entry.isUserPortraitVisible()}` |  |

\*) Matter of approach, but if widget templates are considered a developer option, it would be worth considering to make the method names to mirror 1-1 the API and model layer.

\*\*) All the URL string variables should be named consistently. Now there’s `${entry.getViewURL()} returning a String and then ${entry.getUserPortraitURLString()}`, also returning a String. Consider dropping the “String” from the or all the URL String having it in the end. To mix, there’s the getPortletURL() returning a PortletURL object. 

\*\*\*) userName if used here as opposed to the API conventions to return the full name. Documentation should state this and maybe the field name in the editor panel could be more descriptive? Do we need the actual userName, too?
Not all of the fields are available in the search results widget template

