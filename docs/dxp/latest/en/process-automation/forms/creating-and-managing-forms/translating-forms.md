---
taxonomy-category-names:
- Platform
- Forms
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 49f9c4cd-4251-4581-b783-01459f3c0a6d
---
# Translating Forms

Forms can be be translated and presented in any language that is currently enabled on the current site.

To add a translation:

1. Begin by viewing an existing form (e.g., _Guest Feedback Survey_) to be translated.
1. Click the (+) sign next to the language dropdown menu.
1. Select a language to translate the form to.

    ![Select the desired language.](./translating-forms/images/01.png)

1. A new language tab is added to the form. Translation text entered does not override the default language.

    ![View the additional form in the next tab.](./translating-forms/images/03.png)

1. Enter a new title.
1. To modify a field's label, click on the field. This opens the field configuration menu.

    ![Translate the field's labels.](./translating-forms/images/02.png)

1. Enter the translation.
1. Continue until all the desired fields have been translated.
1. Click _Save Form_ when finished.

```{note}
Each form field's messages are editable in the translation, using the field settings sidebar. Other changes made to the field's settings apply to all translations (e.g., marking the field as required) no matter which translation they are made for. The Accept if Input [validation setting](./validating-text-and-numeric-field-entries.md) is a little different: it's only editable in the default language, although the corresponding Value and Error Message fields are translatable.
```

## Viewing Translated Forms

Authenticated users that have configured a matching default language for the site now see the translated form by default.

![Authenticated users whose language settings are localized will see the form in their language.](./translating-forms/images/04.png)

If accessed in the [Form widget on a Liferay DXP page](../sharing-forms-and-managing-submissions/sharing-forms.md), the Form is displayed in the User’s language automatically. If there’s no translation available in a user's selected language, the default language of the Form is displayed.

## Viewing Translated Form Records

Starting in Liferay 7.4, The language of each form record is recorded in two locations for administrators: [exported form data](exporting-and-importing-forms.md) and from within the View Entries screen for a form.

To view the entries and their languages in the Liferay Forms application,

1. Open the Site Administration menu and go to Content & Data &rarr; Forms.
1. Open the Actions (![Actions](../../../images/icon-actions.png)) menu for a form and click _View Entries_.

   ![Administrators can easily see the form record language.](./translating-forms/images/05.png)

## Related Topics

* [Forms Field Types Reference](./forms-field-types-reference.md)
* [Customizing the Submit Button](./customizing-the-submit-button.md)
