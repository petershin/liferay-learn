---
uuid: 1793412f-135e-4ee3-bb27-a46e3383ff7c
---
# Understanding Personal Data

Your customers interact with your site in various ways. Some of these interactions, such as blog post comments or message board replies, leave behind personal data on your system. See [managing user data](https://learn.liferay.com/w/dxp/users-and-permissions/managing-user-data) to learn about all the different types of personal data that might get generated on your site.

## Working with Personal Data

1. Log into Liferay as the administrator (i.e. [Kyle Klein](../users-accounts-organizations/managing-users.md#creating-users)).

1. Change the user authentication setting. Note, this is only for our learning and testing purposes.

   * Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_.
   * Under Platform, click _User Authentication_.
   * Uncheck the box next to require strangers to verify their email address.
   * Click _Save_.

1. Set permissions for the regular user role.

   * Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Roles_.
   * Scroll down and click _User_.
   * Click the _Define Permissions_ tab.
   * Navigate to _Site and Asset Library Administration_ &rarr; _Content & Data_ &rarr; _Blogs_.
   * Under _Blogs Entry_, tick the box for _Add Discussion_ and _View_.
   * In the left navigation, click _Message Boards_.
   * Under _Messages_, tick the box for _Add Message_.
   * Scroll down and click _Save_.

1. Add a blog entry.

   * Open the _Product Menu_ (![Product Menu](../../images/icon-product-menu.png)). 
   * Click _Blogs_ under _Content & Data_.
   * Click _Add_ (![Add icon](../../images/icon-add.png)).
   * Add the following entry. 
     * Title: Foo
     * Content: Foo 
   * Click _Publish_.

1. Add the blogs widget and message boards widget to a site page.

   * Open the _Product Menu_ (![Product Menu](../../images/icon-product-menu.png)).
   * Click _Pages_ under _Site Builder_.
   * Click _Add_ (![Add icon](../../images/icon-add.png)) to add a new page. Select _Page_.
   * In the next screen, select the blank template. Input `MB and Blog` as the page name. Click _Add_.
   * In the left navigation, select _Widgets_ under the fragments and widgets tab.
   * Find the message boards widget under collaboration. Drag it onto the page.
   * Then find the blogs widget and drag it onto the page under the message boards widget.
   * Finally, click _Publish_.

1. Create a sample customer.

   * Click the user profile image in the top right and click _Sign Out_.
   * Click _Sign in_ and in the pop-up window, click _Create Account_.
   * Input the following user information.
     * **Screen Name:** tommy
     * **Email Address:** tommy@tanner.com
     * **First Name:** Tommy
     * **Last Name:** Tanner
     * **Password:** test
     * **Enter Again:** test
     * **Text Verification:** input the text shown on the screen
   * Click _Save_.
   * Login in with the email address `tommy@tanner.com` and password `test`.
   * On the change password page, set the password as `learn`.

1. Add sample data.

   * Click _MB and Blog_ in the top navigation.
   * Click _New Thread_ to add a message board thread.
   * Input `Foo` for the subject and `Bar` for the body. 
   * Click _Publish_.
   * Next, click _Comment_ under the foo blog post.
   * Input `Bar` as the comment and click _Reply_.

   ![One message board thread and one blog post comment is visible.](./understanding-personal-data/images/01.png)

In this way, as customers interact with your site, they leave behind personal data. 

Next: [Managing and Deleting Personal Data](./managing-and-deleting-personal-data.md)

## Relevant Concepts

- [Managing User Data](https://learn.liferay.com/w/dxp/users-and-permissions/managing-user-data)
