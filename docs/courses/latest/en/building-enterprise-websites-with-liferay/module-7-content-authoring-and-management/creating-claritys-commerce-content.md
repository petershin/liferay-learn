---
uuid: e9801e49-14af-43d7-bd38-d90ad513f96c
---
# Creating Clarity’s Commerce Content
Although they are not yet a B2C enterprise, Clarity wants to leverage some of the capabilities available through Liferay Commerce to create product-specific content. Because the Commerce and DXP codebases have been merged, using these features is easier than ever. While it is feasible to build Clarity's product material using web content structures, Liferay’s commerce features may provide an additional layer of future-proofing to the website. In this section, we'll cover the following commerce features:

- Catalogs
- Products
- Channels

## Catalogs

A catalog is a group of related products. Liferay catalogs provide a highly flexible way to organize your product offerings in the most sensible way for your business. There is no limit to the number of catalogs you can create, although maintenance effort should be a factor in how many you choose to have. Catalogs also allow you to define permissions for the products they contain, so that different product teams can manage different product groupings.

In addition, catalogs capture important commerce attributes like language, currency, and price lists, along with a placeholder image for products without an associated image. As useful as catalogs are, they are just empty containers without the products to populate them. Let's take a look at products next.

## Products

Like any manufacturer, Clarity has variants of their products designed to achieve different goals and target different customer profiles. Liferay Commerce supports four product types out of the box:

- Simple Product

    Any physical product for which inventory is tracked.

- Virtual Product

    Any non-tangible product, such as music files, electronic publications, services, and warranties.

- Grouped Product

    Two or more products from a Catalog that are packaged together and sold as a single item. Grouped products are tracked in your inventory and can contain simple products, virtual products, or other grouped products.

- Shop by Diagram

    Component parts belonging to a Bill of Materials (BOM) diagram that references products in the store.

 Products offer more than just a predefined type of content--they offer many additional features that together create a first-class commerce experience with minimal effort:

- Product details
- Product options
- Units of measure
- Configurable products
- Product media (images, videos, etc.)
- Related products
- Downloadable product documents
- Product availability
- Product variants

While Clarity could model all of these product types and attributes with web content structures, Liferay commerce provides an intuitive solution that you can implement with ease.

## Channels

Once their products and catalogs are configured, Clarity needs to think about how they will display their products to customer and website visitors. Channels are the storefront where products are displayed and sold to customers. They come with several useful features:

- Store administrators can create multiple channels, each representing a different customer experience (B2B, B2C, B2X)

- Channels can be linked to Liferay sites

- You can use Liferay's headless APIs to creative native mobile applications with channels or integrate channels with external marketplaces

- Channels define default display languages and currencies, as well as default product display pages and category pages

- For transactional sites, channels offer payment, shipping, and tax information

While e-commerce isn’t Clarity’s main focus right now, setting up these features will set them up for success in the future.


<!--TODO-->

## Exercises Coming Soon!

<!--
## Exercise One: Creating Clarity’s Products Catalog
Navigate to Application Menu > Commerce > Product Management > Catalogs
Click the “+” button to add a new catalog
Enter the following 
Name: Clarity Eyewear
Default Catalog Language: (your Language) (for example, English (United States))
Currency: (your store’s currency) (US Dollar)
Click Submit to finish creating your catalog

## Exercise Two: Defining Product Specifications
Creating a Product Specification Group (needed to create a product specification)
Navigate to Application Menu > Commerce > Product Management > Specifications
Click Specification Groups
Click New to add a new specification group
Enter the following
Title: Frame Description
Priority: 10.0
Key: frame-description
Click Save to finish creating your product specification group

Creating a Product Specification
Navigate to Application Menu > Commerce > Product Management > Specifications
Click New to add a new specification
Enter the following
Label: Frame Material
Description: The material the frame is made of.
Use in Faceted Navigation: True
Default Specification Group: Frame Description
Key: frame-material
Click Save to finish creating your catalog
Create 2 more specifications with the following attributes:
Label: Frame Color
Description: The color of the frame.
Use in Faceted Navigation: True
Default Specification Group: Frame Description
Key: frame-color
And
Label: Frame Size
Description: The size (in default units) of the frame.
Use in Faceted Navigation: False
Default Specification Group: Frame Description
Key: frame-size


## Exercise Three: Creating Products

Creating a product
Navigate to Application Menu > Commerce > Product Management > Products
Click the “+” button and click Simple to create a simple product
Enter the following:
Name: Classic Aviator Sunglasses
Catalog: Clarity Eyewear
Click Submit to finish creating your product

Applying product specifications to a product
Within the detailed product view, find the Add Specifications section. Start typing “frame,” and click “Select” next to each of the Frame Material, Frame Color, and Frame Size specifications
Scroll down to the Specifications section of the product. Click Frame Material, and enter the following: 
Value: Metal
Position: 10
Repeat step 6 to apply the following values to the other specifications:
Frame Color:
Value: Gold
Position: 20
Frame Size:
Value: 54-20
Position: 30
Adding Products to Categories
Find the Public Categories section, and Clarity Products field. Click “Select” and choose Sunglasses
Click Done to apply the category to this item
Modifying Product SKU
Navigate to the SKU tab of the product
Click “default” to open up the default SKU
Change the SKU to “classic-aviator-sunglasses”
Click Publish to save your changes
Click “classic-aviator-sunglasses” to open up the SKU again
Click the Price tab in this window
Click “Add <SKU> to Price List”
Enter the following
Price List: Master Base Price List
Price: 150
Click Add to save the SKU price
Adding a Product Image
Click the Media tab
Click “Select File”
In the popup, make sure you are in the Clarity site, and click the Clarity Product Images folder
Select the Classic Aviator Sunglasses image
Enter the following
Title: Classic Aviator Sunglasses
Priority: 10.0
Click Publish to save the product image
Repeat steps 1-24 to create 2 more products, for AquaComfort Plus Dailies and Single Vision Lenses
AquaComfort Plus Dailies
Specifications:
None
Categories:
Contacts
Tags:
daily
 SKUs:
aquacomfort-plus-dailies
Base price: 35
Image: AquaComfort Plus Dailies
Single Vision Lenses
Specifications:
None
Categories:
Lenses
Tags:
daily
 SKUs:
single-vision-lenses
Base price: 100
Image: Single Vision Lenses

## Exercise Four: Creating a Commerce Channel

Navigate to Application Menu > Commerce > Store Management > Channels
Click the “+” button to add a new channel
Enter the following
Name: Clarity Bootcamp
Currency: (your store’s currency) (US Dollar)
Type: Site
Click Add to finish creating your channel
To use a channel to sell products, you must link it to a Liferay site.
Navigate to Application Menu > Commerce > Store Management > Channels
Click the Clarity Bootcamp channel you just created
Click Type
Click Select Site
Click Choose next to the Clarity site
Click Save
You can link a different site to the channel later as long as the site is not linked to another channel. Note: You can only link one catalog to a site at a time.

## Exercise 5: Setting Up the Product Pages

Updating the Product Page
1.  Navigate to the Product page we previously created http://localhost:8080/web/clarity/products and let’s take a look at the current experience.
2.  Navigate to the Side Menu > Design > Templates > Widget Templates
3.  Select New, select More, select Commerce Categories Navigation Template
4.  Enter Clarity Category Cards as the title and click Save and Continue
5.  Using the Fields and Elements provided, create a page that iterates through all of the categories in the selected vocabulary, displaying the Name, Description, and Category Image.
(You can use the provided example as a starting point or for inspiration)
Copy from https://gist.github.com/jhanda/eb53818541bdce69653f58372a73d8cb
6.  Navigate back to the Product page http://localhost:8080/web/clarity/products
7.  Edit the page, then select the Configuration icon on the Commerce Categories Navigation widget.


Creating the Product Listing Page (PLP)
As you’ve probably already noticed, while the Commerce Categories Navigation widget looks better and provides us links to each category, the links aren’t working.  That’s because Liferay doesn’t know which page to display for each category
1.  Navigate to the Product List page (http://localhost:8080/web/clarity/product-list)
2.  Review the widgets that have already been provided, we just missing one thing.
3.  Add the Category Content widget to the Banner container at the top of the Body section of the page.
4.  Publish the page and go back to the Product page and select one of the categories to confirm that it’s working

Product Details Page

Optional PLP Exercise Improving the Category Content
Create a new Widget Template to make the Category Content widget look like the figma design
-->

## Conclusion

This concludes *Creating Clarity’s Commerce Content*.

Next Up: [Organizing Clarity’s Content](./organizing-claritys-content.md)

<!-- TODO: Add Additional Resources section. -->
