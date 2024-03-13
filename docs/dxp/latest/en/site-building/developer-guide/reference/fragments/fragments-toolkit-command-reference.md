---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
uuid: afe56739-fa42-4145-a09a-24c56a0b9ec8
---
# Fragments Toolkit Command Reference

!!! note
    The Fragments Toolkit is deprecated as of Liferay 2024.Q1+/Portal 7.4 GA112+. See [Alternatives for the Fragments Toolkit](#alternatives-to-the-fragments-toolkit) for more information.

The [Fragments Toolkit](../../developing-page-fragments/using-the-fragments-toolkit.md) can connect to your currently running Liferay DXP instance to import and export fragments. You can even have Fragments that you create with the toolkit imported into Portal automatically. These commands are available:

<!-- TODO: The description for `npm run preview` is probably too long, it's overrunning the column width into a new table cell when the site is built. Probably should consider adding an asterisk and adding the version specific info separately after the table. -->

| Command | Description |
| :--- | :--- |
| `npm run add-collection` | Create a new collection to organize fragments. Referred as Fragment Sets in the platform. |
| `npm run add-fragment` | Add a component, input, or React fragment to a new or existing collection. |
| `npm run add-fragment-composition` | Add a new fragment composition to a new or existing collection. |
| `npm run add-page-template` | Create a new display page template, page template, or master page. |
| `npm run build` | Compile `.sass` or `.scss` file specified in `fragment.json`'s `cssPath` key, storing the compiled CSS code in `build/liferay-fragments`. Only compiled CSS is stored and no SCSS is saved in the database. External fragments should be stored in an external repository. |
| `npm run compress` | Create a `.zip` file that can be manually imported into Portal. |
| `npm run export` | Get collections and fragments from a running server |
| `npm run import` | Send the collections and fragments from your current project to a running server. If your Fragment's configuration JSON (if available) is invalid, the import fails and provides an error message. |
| `npm run import:watch` | Automatically import Collections and Fragments into Portal as they are created or modified. |
| `npm run preview` | {bdg-secondary}`Liferay DXP 7.2 SP1+/Portal 7.2 GA2+` Preview a Fragment before importing. Changes made to the fragment are auto-reloaded to display updates. This feature requires the installation of the [OAuth 2](https://web.liferay.com/marketplace/-/mp/application/109571986) plugin in your portal instance. |

!!! note
    You can see all of the available tasks inside the `scripts` section in the Fragment Set project's `package.json`.

With these tools at your disposal, you can efficiently manage creating and editing Page Fragments from the command line in your local environment.
