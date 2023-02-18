# Creating Organizations

Use Liferay to model Delectable Bonsai's organizational hierarchy. See [Understanding Organizations](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/understanding-organizations.html) to learn more. 

## Parent and Child Organizations

1. Login to your Liferay instance with the default admin credentials. 
   
   * Email address: `test@liferay.com`
   * Password: `test`

1. Create a parent organization. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. Click the _Organizations_ tab. Click _Add_ (![Add icon](../../images/icon-add.png)). Input `Delectable Bonsai` in the _Name_ field. Click _Save_.

1. Create a child organization. Click the _Back_ icon (![Back icon](../../images/icon-angle-left.png)) to return to the list of organizations. Click on the Delectable Bonsai organization you just created. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _New Organization_. Input `IT` in the _Name_ field. Note that under the parent organization section, Delectable Bonsai is selected. Click _Save_.

1. Make one more child organization called `Sales & Marketing` under the Delectable Bonsai parent organization.

1. The organizational hierarchy should look like the image below.

   ![The parent organization has two child organizations.](./creating-organizations/images/01.png)

## Organizational Sites

Next, create an organizational site that will be used by the Sales & Marketing department to host an internal blog. See [Organization Sites](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/organization-sites.html) to learn more.

1. Navigate back to organizations and click the Delectable Bonsai organization. 

1. Click the _Options_ icon (![Options icon](../../images/icon-actions.png)) for the Sales & Marketing child organization and click _Edit_.

2. In the left navigation, click _Organization Site_. Click the toggle to create the site. Click _Save_. A new organization site has been created.

3. Click on your profile image at the top right. Click _My Sites_. 

   ![Click on My Sites from the profile image.](./creating-organizations/images/02.png)

4. Click the _All Sites_ tab. Click the _Sales & Marketing_ site you just created. Note, the site is empty until some content is added to it.

5. Click the _Product Menu_ icon (![Product Menu icon](../../images/icon-product-menu.png)) in the top left. Under Site Builder, click _Pages_.

6. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _Page_. Click _Blank_ to create a blank page. Give the page the name _Sales & Marketing Blog_. Click _Add_.

7. In the left navigation, click _Plus_ (![Plus icon](../../images/icon-plus.png)) to see the Fragments and Widgets tools. Click the _Widgets_ tab and add a Blogs widget by dragging it onto the page. The widget is found under Collaboration. Click _Publish_.

8. The Sales & Marketing organization site now has a page with Sales & Marketing blog postings for anyone that is part of the child organization to view. See [Getting Started with Blogs](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/blogs/getting-started-with-blogs.html) to learn more about blogs and blog entries.

The next step is creating and managing users. See [Managing Users](./managing-users.md).

## Relevant Concepts
- [Understanding Organizations](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/understanding-organizations.html)
- [Organization Sites](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/organization-sites.html)
