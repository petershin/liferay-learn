---
uuid: 686de7ce-4bdf-420f-af40-065b8b2173e3
taxonomy-category-names:
- Platform
- Email Notifications and Notification Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Configuring Default Email Senders

By default, emails sent by Liferay DXP use the name and email address as the default admin user. This behavior can be configured for each of the different email types. To change the default email sender for most applications, follow these steps:

1. Open the *Product Menu* and navigate to the *Control Panel* &rarr; *Configuration* &rarr; *Instance Settings*.

   ![Locating the Email configuration option in the Instance Settings menu.](./configuring-default-email-senders/images/01.png)

1. Click *Email*.

1. Click *Email Sender*.

1. Enter your values for the following fields:

   - Name
   - Address

   ![Changing the default email sender name and email address.](./configuring-default-email-senders/images/02.png)

1. Click *Save*.

You can also configure the applications that use the default email sender through their individual [portal properties](#using-portal-properties-to-override-the-default-email-sender-for-a-specific-application).

## Changing the Email Sender for Specific Components

Some applications don't use the default email sender and you must configure their email sender independently:

- [Web Content](#changing-the-email-sender-for-web-content)
- [Knowledge Base](#changing-the-email-sender-for-knowledge-base)
- [Wiki](#changing-the-email-sender-for-wiki)
- [Bookmarks](#changing-the-email-sender-for-bookmarks)
- [Comments](#changing-the-email-sender-for-comments)
- [Flags](#changing-the-email-sender-for-flags)
- [Reports](#changing-the-email-sender-for-reports)
- [Multi-Factor Authentication](#changing-the-email-sender-for-multi-factor-authentication)
- [Announcements](#changing-the-email-sender-for-announcements)

!!! note
    The default values for these applications' email senders before configuration are the ones set in the [portal properties](#using-portal-properties-to-configure-the-default-email-sender).

### Changing the Email Sender for Web Content

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Web Content*.

1. Go to *Service*.

1. Set your values in *Email from Name* and *Email from Address*.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Knowledge Base

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Knowledge Base*.

1. Scroll down to *Email from Name* and *Email from Address*. Set your values here.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Wiki

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Wiki*.

1. Set your values in *Email from Name* and *Email from Address*.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Bookmarks

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Community Tools*.

1. Go to *Bookmarks*.

1. Set your values in *Email from Name* and *Email from Address*.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Comments

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Comments*.

1. Set your values in *Email from Name* and *Email from Address*.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Flags

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Community Tools*.

1. Set your values in *Email from Name* and *Email from Address*.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Reports

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Reports*.

1. Set your values in *Email from Name* and *Email from Address*.

1. Scroll down to the bottom of the page and click *Save*.

### Changing the Email Sender for Multi-Factor Authentication

1. Navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Comments*.

1. Set your values in *Template for Email "From" Field* and *Email from Name* .

1. Scroll down to the bottom of the page and click *Save*.

## Using Portal Properties to Configure the Default Email Sender

The default email sender can also be configured using a [`portal-ext.properties` file](../../reference/portal-properties.md). The following property values can be replaced with your own:

```properties
admin.email.from.name=Joe Bloggs
admin.email.from.address=test@domain.invalid
```

!!! important
    If you've changed one of the email senders using the UI, changing the portal property does not override it.

## Using Portal Properties to Override the Default Email Sender for a Specific Application

You can override some applications' default email senders using a [`portal-ext.properties` file](../../reference/portal-properties.md). Here's an example for the blogs service:

```properties
blogs.email.from.name=
blogs.email.from.address=
```

| Application      | Name Property                    | Address Property                     |
| :--------------- | :------------------------------- | :---------------------------------- |
| Blogs            | `blogs.email.from.name`          | `blogs.email.from.address`          |
| Document Library | `dl.email.from.name`             | `dl.email.from.address`             |
| Login            | `login.email.from.name`          | `login.email.from.address`          |
| Message Boards   | `message.boards.email.from.name` | `message.boards.email.from.address` |
| Sites            | `sites.email.from.name`          | `sites.email.from.address`          |
| Workflow         | `workflow.email.from.name`       | `workflow.email.from.address`       |

### Changing the Email Sender for Announcements

Announcements don't use the default email sender. To configure the sender name and address for announcement emails you must use a `portal-ext.properties` file. Replace the following property values with your own:

```properties
announcements.email.to.name=
announcements.email.to.address=noreply@domain.invalid
```

## Blacklisted Emails

The following emails are blacklisted by default and cannot be used in any DXP installation:

- `noreply@liferay.com`
- `test@liferay.com`
- `noreply@domain.invalid`
- `test@domain.invalid`

Attempts to use the above emails result in a logged `WARN` trace:

```bash
Email xxx will be ignored because it is included in mail.send.blacklist
```

You can configure this list using the `mail.send.blacklist` property.

## Related Topics

- [Configuring Mail](../configuring-mail.md)
- [Alternative Email Configuration Methods](./alternative-email-configuration-methods.md)
- [Portal Properties](../../reference/portal-properties.md)
