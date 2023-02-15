# Liferay Style Conventions

Conventions are neither correct or incorrect; they are decisions that vary greatly in the industry. After much comparison and use, Liferay's documentation uses the conventions shown here. 

## Text Editing

Use the text editor that works best for you. Various members and former members of the team use these editors (in alphabetical order):

-   Atom (or one of its forks)
-   Neovim/Vim
-   Sublime Text
-   Textmate
-   Visual Studio Code (VS Code)

Make sure your editor can perform these functions:

-   Syntax highlighting, not only of Markdown, but also of the various programming languages used by Liferay (Java, JavaScript, FreeMarker, Groovy/Gradle, XML, JSON, etc.).
-   Automatic spell check. If a word is highlighted automatically by your spell checker, you're more likely to catch the error.
-   Dynamic word wrapping. You must be able to turn this off to format tables and then turn it back on to go back to paragraphs.

If you are new and unsure of which editor to use, see anybody: the whole team loves to evangelize their particular editor.

## Spaces / Tabs

Use spaces, not tabs. This is the opposite of the Liferay code standard, but indenting in Markdown is much more effective with spaces than with tabs.

## Article Naming

Article names (file names) should be the same as the article's title, all in lower case, with dashes replacing the spaces. If, for example, you have an article titled Using Message Boards, the article's file name should be `using-message-boards.md`. Never title an introduction *Introduction to [Subject Matter]*. 

## Line Breaks

Paragraphs are on a single line of text; use dynamic word wrap and do not break at 80 columns. Separate your paragraphs by using two carriage returns.

**Example:**

This is a paragraph.

This is another paragraph.

## Formatting Text

```
**Bold**
```
```
*Italics*
```

```
\`\`\`Code\`\`\`
```

## Bold

Bold is used sparingly in the documentation, because too much bold is distracting. The reader's eye is drawn to bold text more than to anything else. All headings are bold, so we avoid it in the body text itself. Bold is used in one place: field definitions.

When explaining a form that users can fill out, use bold for the field names.

Example:

**Name:** Enter the user's name.

**Address:** Enter the user's address.

Never end a section with a list of form elements.

## Italics

Italics are used in more places than bold. Below are some guidelines for when to use italics.

**Introducing Concepts**

If you're introducing a concept, italicize the concept the first time you use it. Don't italicize the concept after that.

**Example:** Liferay Portal/DXP is comprised of many OSGi *modules*. A module is a piece of functionality that can be a self-contained application or an extension to existing functionality.

Notice the italics on *modules* the first time it's used, but none when it's used after its initial introduction.

**UI Elements**

When you tell the user to click on something in the UI, italicize it.

Example: Click *Save* to continue.

If you're referring to a UI element, but there's no direction for the user, capitalize it, but *don't* italicize it.

**Example:** After clicking the button, the Configuration page appears.

To provide as much clarity on UI elements as possible, combine the above two rules:

**Example:** On the Configuration page, click the *Add* button.

The UI element that contains direction for the user is italicized, but the UI element that has no direction is not.

## Code

Offset blocks of code using three tick marks (\`\`\`) and the identifier for the code's syntax. For example, if you have a block of Java code, offset it like this: 

```
\`\`\`java
[Java code here]
\`\`\`
```
Surround the following items with one tick mark so they appear within sentences as code: 

- File names
- Classes
- Database tables
- Variables
- Folders/directories

## Referring to UI Elements

When mentioning a UI element, capitalize it. 

**Example:** On the Edit User screen, enter an address in the *Address* field. 

**Example:** Select the *Organization* where you're adding the user. 

## Badges

Currently there are three badges: subscription, unsupported, and version. Use badges to mark articles or sections appropriately.

**Subscription:** Use the subscription badge to mark a feature that appears only in the commercial product, and not in the open source
product.

```
{bdg-primary}`Subscription`
```

**Unsupported:** Use the unsupported badge to mark a feature that exists, but is not supported.

```
{bdg-warning}`Unsupported`
```

**Version:** Use the version badge to mark a feature that appears in particular versions of the product.

```
{bdg-secondary}`7.4 U15+ and GA15+`
```

For further information, please see the [Sphinx Design documentation](../https://sphinx-design.readthedocs.io/en/latest/badges_buttons.html%22) on badges. Note: badge syntax may change in the near future with the migration from Sphinx to Liferay. 

## Numbered Lists

Single/double space; number all with 1. Multiple paragraphs must be indented to where the first paragraph starts. 

```
1. This is a numbered list. When this paragraph ends, line up the second paragraph with the beginning of the first.

   This would be the second paragraph in the first item. 

1. This is the second item in a numbered list.

1. This is the third item in a numbered list.
```

## Tables

```
| header 1 | header 2 | header 3 |
| :--- | :--- | :--- |
| cell 1 | cell 2 | cell 3 |
```

| header 1 | header 2 | header 3 |
| :--- | :--- | :--- |
| cell 1 | cell 2 | cell 3 |

## Definitions

Definitions are paragraphs, with the item to be defined appearing in bold along with the colon. They should never be bulleted. Here are two example definitions:

**Definition:** a statement that describes the meaning of a term.

**Term:** an object, usually a noun, whose meaning must be defined.

Definitions must never use the term they're defining in the definition.

## Variables/Placeholders

If you have an example configuration that requires a placeholder, surround the placeholder in square brackets. This is to differentiate the placeholder from code, particularly markup code that is often surrounded by greater-than and less-than symbols. 

**Example:**

The default HSQL database is stored in `[Liferay Home]/data`. 

## Images and Visual Aids

Some images are reused across multiple articles (like icons). There is a shared `images` folder in the root of each product's English language documentation section.

Use one of these prefixes as a naming convention:

- icon-
- button-
- menu-

**Image Quality / Capture**

Capture icon images at a resolution of 20x20. Resize screenshots to an appropriate width for the page (no more than 800 pixels wide).

**Image Naming**

Name images as sequential numbers (01.png, 02.png), etc.

**Image Alt Text**

Every image should have alt text, and it should be at least one descriptive, complete sentence. In other words, alt text comprised of simple labels isn't enough. DON'T do this for alt text:

*The Liferay setup wizard.*

Instead, do this:

*The Liferay setup wizard contains fields for selecting your database type and connection.*

The visually impaired use screen readers to read the documentation, and they need good descriptions of whatever you're illustrating with your image.

## Admonitions 

Use admonitions to capture the reader's attention. Admonitions stand out from the main body of text to call out something important.

Do not overuse admonitions. If admonitions occur too frequently, readers skip over them.

The admonitions that we use most frequently are *Tip*, *Warning*, *Note*, and *Important*.

**Usage**

```
```{tip}

This is a tip. This is a link in a [tip](https://www.liferay.com). Markdown formatting is supported in an admonition.

```

To learn more about admonition syntax see the [MyST Syntax Guide](https://myst-parser.readthedocs.io/en/latest/syntax/syntax.html).
