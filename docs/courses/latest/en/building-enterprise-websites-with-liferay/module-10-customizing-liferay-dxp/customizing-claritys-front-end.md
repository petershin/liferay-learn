---
uuid: 671475f7-dd3a-4909-b98c-3cb3ec93b4e2
---
# Customizing Clarity's Front End

<!--TASK: improve intro-->
Now let's apply what you've learned to make some changes to Clarity's appearance. Here you'll use frontend client extensions to 

* Modify the current theme CSS
* Update the website favicon
* Add a CSS resource to a page

These exercises showcase the versatility and accessibility of frontend client extensions.

## Exercise: Modifying a Theme Client Extension
<!--Exercise 20a-->

Client Extensions separate customizations from the Liferay core. This helps simplify updates while freeing you to use your desired technologies and deployment models. As seen previously, the theme CSS client extension provides a way to override the current theme's CSS files. Here you'll update the client extension provided in the training workspace and deploy your changes as Walter Douglas.

To do this,

1. Sign in as Walter Douglas.

   * Email: `walter.douglas@clarityvisionsolutions.com`
   * Password: `learn`

1. In the Clarity Public Enterprise Website, go to the Home page.

   Note that Clarity's "See the Difference" banner uses a beige background (i.e., `#FCFBF8`). Let's make a change to Clarity's theme CSS client extension to update it.

   ![Clarity's "See the Difference" banner uses a beige background.](./customizing-claritys-front-end/images/01.png)

1. Navigate to the `[repository-folder]/exercises/lesson-20/` folder, open the `layout-background-color.scss` file, and copy its contents.

   This file contains styling for overwriting the background color for the `.lfr-layout-structure-item-container` CSS class.

1. Navigate to the `[repository-folder]/client-extensions/liferay-clarity-theme-css` folder, open the `src/css/_custom.scss` file, paste the copied CSS style into it, and save your changes.

1. Open a new terminal window, navigate to the `[repository-folder]/client-extensions/liferay-clarity-theme-css` folder, and run this command to build and deploy the theme client extension:

   ```bash
   blade gw clean deploy
   ```

   Or use Gradle Wrapper:

   ```bash
   ../../gradlew clean deploy
   ```

1. Verify the command executes successfully.

1. If necessary, log out of the Clarity portal. It may also be necessary to clear the cache in the browser if this change is not reflected automatically.

1. Verify the background of the container is now gray:

   ![New gray background](./customizing-claritys-front-end/images/02.png)

   **Tip**: When making changes to theme CSS values, you may need to clear your browser's cache to see your changes.

1. Now that you have seen how you can modify CSS styles using a theme client extension, remove the styling change just made from the `_custom.scss` file.

Next you'll learn how to use client extensions to update the site's favicon.

## Exercise: Deploying a Client Extension for Favicon
<!--Exercise 20b-->

In a previous exercise, you set the site favicon manually via the Liferay UI. With client extensions, you can streamline updates to your site by deploying the favicon along with your other frontend client extensions. Here you'll use a client extension to update Clarity's favicon as Walter Douglas.

To do this,

1. Open a new terminal window and go to the `liferay-clarity-theme-favicon` folder in your local copy of the training workspace (i.e., `enablement-bootcamp-clarity/client-extensions/liferay-clarity-theme-favicon`)

1. Run this command to build and deploy the client extension:

   ```bash
   blade gw clean deploy
   ```

   Or use Gradle Wrapper:

   ```bash
   ../../gradlew clean deploy
   ```

1. Verify the command executes successfully.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Site Builder*, and select *Pages*.

1. Click *Actions* (![Actions](../../images/icon-actions.png)) in the Application Bar and select *Configuration*.

1. In the Design tab, click *Select Favicon* (![Select Favicon](../../images/icon-change.png)).

1. In the modal window, go to the *Client Extension* tab and select *Liferay Clarity Theme Favicon*.

1. Click *Save*.

1. Go to the Home page and verify the page's favicon was updated.

   ![Go to the Home page and verify the page's favicon was updated.](./customizing-claritys-front-end/images/03.png)

## Exercise: Creating a New CSS Client Extension
<!--Exercise 20c-->

Liferay provides the CSS client extension for adding a single CSS resource to site pages. Here you'll create one of these client extensions using an external cdnjs URL as Walter Douglas user.

To do this,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the  *Applications* tab, and click *Client Extensions*.

1. Click *Add* (![Add Button](../../images/icon-add.png)) and select *Add CSS*.

1. For name, enter `Clarity Animation`.

1. For CSS URL, enter `https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css`.

   ![Create a CSS Client Extension.](./customizing-claritys-front-end/images/04.png)

1. Click *Publish*.

1. Go to the *Home* page in the Clarity Public Enterprise Website.

1. Click *Configure Page* (![Global Menu](../../images/icon-cog.png)) and select the *Design* tab.

1. Scroll down and click *Add CSS Client Extensions*.

1. Choose *Clarity Animation* and click *Add*.

   ![Add the Clarity Animation CSS Client Extension to the Home page configuration.](./customizing-claritys-front-end/images/05.png)

1. Scroll down and click *Save*.

   This saves the page as a draft. For the changes to take effect, you must publish the page.

1. Return to the Home page, click *Edit* (![Edit](../../images/icon-edit.png)), and click *Publish*.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Under Fragment Sets, click *Clarity Components*.

1. Select the *Clarity Gradient Container* fragment to begin editing it.

1. In your file browser, navigate to the `[repository-folder]/exercises/lesson-20/` folder, open the `clarityanimation.html` file, and copy its content into the fragment's HTML field.

   This adds three CSS animation classes to the fragment from the from the `animate.css` library on [cdnjs](https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css) (i.e., `animate__animated`, `animate__slower`, and `animate__fadeIn`).

   ![Edit the Clarity Gradient Container's fragment HTML field.](./customizing-claritys-front-end/images/06.png)

1. Click *Publish*.

   Now that you've updated the fragment, you can propagate these changes to existing instances of the fragment in site pages.

1. Click *Actions* (![Actions menu](../../images/icon-actions.png)) for the Clarity Gradient Container fragment, and select *View Usages*.

1. Check all boxes and click *Propagate*.

   ![Propagate the changes made to Clarity Gradient Container fragment.](./customizing-claritys-front-end/images/07.png)

   Now, all fragments used throughout the site are updated with the new CSS classes.

1. Go to the Home Page and confirm the animation works.

   The animation now plays every time you refresh or navigate to the Home page.

   ![Clarity Gradient Container](./customizing-claritys-front-end/images/08.png)

## Conclusion

Congratulations! You have created, modified, and deployed your own frontend client extensions. Next, we'll explore the tools you can use to model and manage data structure in Liferay.

Next Up: [Modeling and Managing Data Structures](./modeling-and-managing-data-structures.md)