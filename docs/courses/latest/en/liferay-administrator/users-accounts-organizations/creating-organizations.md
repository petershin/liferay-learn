---
uuid: 471cbdd8-1672-430b-8871-91bebb0665ef
---
# Creating Organizations

Use Liferay to model Clarity Vision Solutions' organizational hierarchy. See [Organizations](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations) to learn more. 

## Parent and Child Organizations

1. Create a top level organization. 

   * Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. 
   * Click the _Organizations_ tab. 
   * Click _Add_ (![Add icon](../../images/icon-add.png)). 
   * Enter `Clarity Vision Solutions` in the _Name_ field. 
   * Click _Save_.

1. Create a child organization. 

   * Click _Back_ (![Back icon](../../images/icon-angle-left.png)) to return to the list of organizations. 
   * Click on the Clarity Vision Solutions organization you just created. 
   * Click _Add_ (![Add icon](../../images/icon-add.png)) and select _New Organization_. 
   * Input `IT` in the _Name_ field. Note that under the parent organization section, Clarity Vision Solutions is selected. 
   * Click _Save_.

1. Create another child organization called `Sales & Marketing` under the Clarity Vision Solutions parent organization using the steps above.

1. The organizational hierarchy should look like the image below.

   ![The parent organization has two child organizations.](./creating-organizations/images/01.png)

## Assigning Existing Users to Organizations

The IT manager and IT staff are not part of any organization. Edit their user accounts to assign them to the IT organization.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. 

1. From the list of user accounts, click on _Kyle Klein_. Click _Organizations_ in the left navigation.

1. Click _Select_ and a new window pops up. Click _Choose_ for the IT organization. Click _Save_.

1. Follow the same steps to add Marcus Morgan to the IT organization.

## Adding New Users to Organizations

New users can also be added within organizations.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_.

   * Click the _Organizations_ tab.
   * Click _Clarity Vision Solutions_. 
   * Click _Options_ (![Options icon](../../images/icon-actions.png)) for the Sales & Marketing child organization. 
   * Click _Add User_.

1. Add the following user:

   * Screen Name: `lily`
   * Email Address: `lily@clarityvisionsolutions.com`
   * First Name: `Lily`
   * Last Name: `Lewis`
   * Job Title: `Account Manager`

   Click _Save_ at the bottom of the page.

## Organizational Sites

Next, create an organization site for the Sales & Marketing department to host an internal blog. See [Organization Sites](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites) to learn more.

1. Navigate back to Organizations and click the *Clarity Vision Solutions* organization. 

1. Click _Options_ (![Options icon](../../images/icon-actions.png)) for the Sales & Marketing child organization and click _Edit_.

1. In the left navigation, click _Organization Site_. 
   * Click the toggle to create the site. 
   * Click _Save_. 

   A new organization site has been created.

1. Click on your profile image at the top right. Click _My Sites_. 

   ![Click on My Sites from the profile image.](./creating-organizations/images/02.png)

1. Click the _All Sites_ tab. Click the _Sales & Marketing_ site you just created. Note, the site is empty until some content is added to it.

1. Click the _Product Menu_ icon (![Product Menu icon](../../images/icon-product-menu.png)) in the top left. Under Site Builder, click _Pages_.

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _Page_. 

   * Click _Blank_ to create a blank page. 
   * Give the page the name _Sales & Marketing Blog_. 
   * Click _Add_.

1. In the left navigation, click _Plus_ (![Plus icon](../../images/icon-plus.png)) to see the Fragments and Widgets tools. 

   * Click the _Widgets_ tab. 
   * Add a Blogs widget by dragging it onto the page. The widget is in Collaboration. 
   * Click _Publish_.

1. The Sales & Marketing organization site now has a page with Sales & Marketing blog postings for anyone that is part of the child organization to view. See [Getting Started with Blogs](https://learn.liferay.com/en/w/dxp/content-authoring-and-management/blogs/getting-started-with-blogs) to learn more about blogs and blog entries.

Next, you'll import users by [connecting to LDAP](./connecting-to-ldap.md). 

## Relevant Concepts

- [Organizations](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations)
- [Organization Sites](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites)
