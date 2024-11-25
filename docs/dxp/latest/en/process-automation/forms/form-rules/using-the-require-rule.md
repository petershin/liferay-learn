---
taxonomy-category-names:
- Platform
- Forms
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: fe17d654-83a9-4091-b7d8-aa94645dba83
---
# Using the Require Rule

Use a _Require_ rule to make a field required based on one or more conditions. Require Rules work in association with other Rules, such as the _Show_ Rule.

To demonstrate, assume the camp registration form includes these items:

* _I am 18 Years Old or Older_: a required single selection field with two options: _Yes_ and _No_.
* _Legal Guardian Email Address_: a text field that accepts valid email addresses.
* A [Show Rule](./using-the-show-hide-rule.md) that displays the _Legal Guardian Address_ field if the value for _I am 18 Years Old or Older_ is NO.

If the respondent answers _No_, the _Legal Guardian Email Address_ appears and the respondent must enter a valid email address.

## Configuring the Require Rule

Follow the steps below:

1. Click the _Rules_ tab.
1. Click Actions (![Actions](../../../images/icon-actions.png)) next to the _I am 18 Years Old or Older_ rule.

    ![Modify the existing Show-hide Rule.](./using-the-require-rule/images/01.png)

1. Click _Edit_.
1. Click the _Add Rule_ button under _Actions_.
1. Select _Require_ from the _Action_ dropdown menu.
1. Select the _Legal Guardian Email Address_ from the second dropdown menu.

    ![Add the Require Rule.](./using-the-require-rule/images/02.png)

1. Click _Save_ when finished.

## Related Topics

* [Creating Forms](../creating-and-managing-forms/creating-forms.md)
* [Using the Show-Hide Rule](./using-the-show-hide-rule.md)
