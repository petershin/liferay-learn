---
toc:
  - ./using-the-gogo-shell/command-line-gogo-shell.md
  - ./using-the-gogo-shell/gogo-shell-commands.md
uuid: 23a63181-fd00-4907-9d98-b6c8ae33a3aa
taxonomy-category-names:
- Development and Tooling
- Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Using the Gogo Shell

The Gogo shell provides a way to interact with the module framework. Among other things, you can

- Dynamically install/uninstall bundles (modules)
- Examine package dependencies
- Examine extension points
- List service references

The control panel is the safest, most secure way to access Gogo shell:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), and select the *Control Panel* tab.

1. Click *Gogo Shell* in the System section.

   The Gogo shell command screen appears.

   ![Gogo shell in the control panel](./using-the-gogo-shell/images/02.png)

   !!! note
       In DXP 7.2, open the Control Panel and navigate to *Configuration* &rarr; *Gogo Shell*

1. Enter a Gogo shell command in the *g!* text field. For example, enter `lb | grep "Liferay Announcements API"` to list information about the Announcements API bundle.

   !!! note
       If you have a cluster, you must run Gogo shell commands on all nodes. Commands run in the Control Panel's Gogo shell only affect the current node.

1. Click *Execute*.

   The command result output appears.

   ![The output section shows the command result.](./using-the-gogo-shell/images/03.png)

!!! warning
    The Gogo shell is extremely powerful and can manipulate the platform's core functionality. Only grant Gogo shell access to trusted administrators. Please see [Understanding Roles and Permissions](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) for more information.

## Conclusion

Now that you know how to run Gogo shell, explore the available [Gogo shell commands](./using-the-gogo-shell/gogo-shell-commands.md). If you're working in a developer environment, consider Gogo shell from the command line. See [Command Line Gogo Shell](./using-the-gogo-shell/command-line-gogo-shell.md) for more information.
