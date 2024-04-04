---
uuid: 85d7e066-677f-4616-aca4-56555601a228
---
# Personalizing Search Experiences with Blueprints

As we saw in the previous lesson, using search facets is great in providing visitors a way to quickly filter search results. However, search results can be further customized and personalized with the use of search blueprints. In the future, Clarity wants to sell their products directly to consumers. And they want to have a way to customize and control what might be shown at the top of particular search results. For example, they want seasonal products to be boosted in the search results to try to increase sales.

## Exercise 1: Create a Search Blueprint for Seasonal Products

Clarity has some sunglasses with summer prints that they have been promoting in their different marketing campaigns. They want these summer sunglasses to also show up at the top of search results when visitors are looking for sunglasses. They can do this by boosting the relevance score of this product category. Here's how to set this up.

1. Click the product menu and navigate to _Categorization_ &rarr; _Categories_. Click the plus icon to add a new vocabulary.

1. Input `Seasonal` as the name. Under associated asset types, select _Product_ as the chosen asset type. Click _Save_.

1. Within the Seasonal vocabulary, click the plus icon to add a new category. Input _Summer_ as the name and click _Save_.

   ![Create a summer category in the seasonal vocabulary.](./personalizing-search-experiences-with-blueprints/images/01.png)

1. Click the application menu and navigate to _Commerce_ &rarr; _Products_. Click the options icon of one of Clarity's sunglasses and click _Duplicate_. Give the product a new name (e.g. `Sunny Sunglasses`).

1. On the right side under categorization, click _Select_ next to the seasonal vocabulary. In the pop up window, select _Summer_ and click _Done_. Click _Publish_ to publish the product. The new product is now associated with the summer category.

1. Click the applications menu and navigate to _Applications_ &rarr; _Blueprints_. Click the plus icon to create a new blueprint.

1. Input _Summer Sunglasses_ as the title and click _Create_. 

1. In the right query elements menu, maximize the boost category menu to find and add the _Boost Contents in a Category_ element. Click _Select_ next to the category name. Select the Clarity site and select the summer category under the seasonal vocabulary.

   ![Add an element to boost the summer product category.](./personalizing-search-experiences-with-blueprints/images/02.png)

1. Change the boost value from `10` to `20`. The boost value increases the search relevance score, thereby resulting in a higher search results ranking. Click the _Preview_ button next to the cancel button to preview the search relevance score rankings. Input `sunglasses` in the search bar and search for the term. The first result should be the summer sunglasses product we created above.

   ![Use the preview feature to see the search relevance score rankings.](./personalizing-search-experiences-with-blueprints/images/03.png)

   Note, the search relevance score can very based on the search term and the search index you have. You may need to further increase the boost value depending on your use case.

1. Click _Save_ to save the blueprint. Any product marked with the summer category will now be returned with a higher relevance score to show up at the top of search results for sunglasses.

## Conclusion

Congratulations! You've completed Module 10 - Search.

[Back to Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)
