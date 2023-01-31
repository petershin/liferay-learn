# Liferay Style Guide

## Prerequisites and Assumptions

The _Liferay Style Guide_ sits on the shoulders of giants---specifically, the giants of _The Chicago Manual of Style_ and Strunk and White's _The Elements of Style_. Where this guide is silent, assume what is written there. Both of those style guides are the foundation for what is here; in fact, this guide would not be possible without them. 

Liferay's documentation style comes from four overarching values: 

1. Documentation is _Comprehensive_: it shows everything you need to know about the software. 

1. Documentation is _Concise_: it gets to the point and avoids fluff.

1. Documentation is _Cohesive_: individual documentation relates to an overall message. 

1. Documentation has *Clarity*: it is written to make the message as clear as possible to the largest number of people.

### Comprehensive Documentation

Liferay's documentation is organized in a way that shows what concepts are available and how to navigate them. A person should be able to browse as easily to a particular topic as search for it. We achieve this by organizing it in ways that correspond to solving goals. Documentation has several layers. At the foundation is _feature_ documentation that describes every feature Liferay's software has to offer. Sitting on the foundation is _conceptual_ documentation. Consisting of well-designed introductory text, it builds on feature documentation by describing ways features are used. 

Solutions and Courses complement feature and conceptual documentation by describing full implementations of Liferay software. Solutions documentation leads the reader through creating specific applications of Liferay, such as the Raylife insurance application or the Minium commerce implementation. Courses lead the reader through the comprehensive building blocks of implementing Liferay for a production site, from provisioning the server all the way to analyzing site traffic. 

In this way, Liferay is able to satisfy the learning needs of all who want to use or evaluate Liferay for their needs. 

### Concise Documentation

We work hard to make Liferay's documentation *concise*. By keeping paragraphs short, using bulleted lists when possible, and avoiding long exposition, we keep to the subject matter. Our aim is to make it as easy as possible to digest the content. We use short, easy to understand descriptions, diagrams, illustrations, and even video to make this happen. 

### Cohesive Documentation

Liferay's documentation is written in a particular style defined in this document. Following Liferay style successfully makes it so many writers have one voice. The more Liferay documentation you read, the more you pick up on how we present information, and this consistent style makes it easy to learn, because you know what to expect. 

### Clear Documentation

To be effective, documentation must be clear. We work hard to make the message communicated equal the message received, and the methods for doing this are outlined in these standards. 

Additionally, the documentation has a single goal: to teach Liferay concepts as effectively as possible. We use consistent examples and use cases throughout the documentation, to make the documentation as a whole fit together as one. Documentation in different styles (feature, conceptual, solutions, and courses) complement each other by communicating Liferay's functionality in different ways for different learners. 

### You

Despite all the effort we spend to define the different types of documentation described above, the standards you'll see below for making communication clear, and the workflow we use to ensure Liferay style is followed, we can never know if we're successful without you. The standards described here are the result of many years of defining, testing, and refining our content, but since no human is perfect, there are certainly ways they can be improved. If something isn't clear or doesn't sit right because of one of these standards, we encourage you to send us that feedback through [Liferay's Ask](https://liferay.dev/c/portal/login?redirect=https://liferay.dev/ask/questions/liferay-learn-feedback/new) application. 

## Documentation Types

There are five types of documentation: 

1. **Introduction**: Placed hierarchically at the top of a section, the introduction is a high level explainer that summarizes how the feature can help the reader. It focuses on use cases that solve real-world problems. It also tells readers how the rest of the section enables them to use the feature optimally. 

1. **Concepts**: When a topic requires extensive explanation outside the individual features or the introduction, a concept document fills the gap. This can be placed either before a feature document that shows how the feature works, or more often, after a feature is described, to show all the options available in the feature. An example of the former is [Collection Pages](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.html); an example of the latter is a description of all the available [Workflow Nodes](https://learn.liferay.com/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-nodes.html). 

1. **Feature**: The foundation of all documentation covers each feature and how it works. Keeping paragraphs and explanations to a minimum, feature documentation describes---using numbered steps---how readers can use all of Liferay's features. Feature documentation can be user-focused or developer-focused. Liferay's documentation should always be feature-complete; the types that follow use feature documentation as their basis and reference. 

1. **Series**: Used for training courses, learning paths, and solutions (see below), a series guides the reader through the creation of a concrete solution to a use case. Each series section begins with an introduction and screenshot(s) describing what is to be built in that section, how---at a high level---it will be built, and summarizes with a _Let's Go!_ button to start the steps. The rest of the section contains documents filled primarily with numbered steps that lead the reader through solving a use case in Liferay. The steps documents show only the concrete steps; they have minimal explanation of the features used, and instead contain links to the feature documentation that describes those features in case the reader wants to learn more. If possible, a series always contains a link to a downloadable asset that represents what was created in the series, for import or deployment into the reader's Liferay instance. 

1. **Solution**: A special type of series, solution documentation describes a full-blown Liferay solution that's implemented as a Liferay site initializer. It breaks the solution down into steps the reader can follow to rebuild the solution from scratch. This informs readers about best practices for Liferay implementations and provides a concrete example that's already deployed in their Liferay instances for them to follow. 

## Documentation Voice

We expend much effort to unify the voice of Liferay's documentation. To make many writers sound like one, Liferay's technical writers follow a set of standards and an editorial process that helps ensure that readers encounter the same writing style per article regardless of which writer wrote it. The high level characteristics of this voice are friendly and casual. Beyond that, we keep to the rules listed in chapters one and two of _The Elements of Style_ with a particular emphasis on the rule titled _Omit Needless Words_. 

### Friendly

Prose should be friendly and welcoming. Liferay integrates with many products and services, and they should all be treated equally. Liferay is never compared to any other product in the documentation, and care should be taken not to assume the use of any particular integration product. For example, if a configuration is given for MySQL or for Tomcat, it should be given for every other database or application server Liferay supports. 

With that said, we avoid documenting other products. For example, in clustering articles, we document what's necessary for configuring Liferay to work in a clustered environment, and we avoid documenting app server configurations beyond our own Docker containers. 

### Casual

Documentation is written in a casual style to make it easy to understand for those for whom English is not a first language. We avoid formality and unnecessarily large words. Contraction use is encouraged to reduce word count and help make the text flow. 

### Steps Rather Than Paragraphs

Whenever possible, break procedural matters into numbered steps, rather than describing them in paragraphs. Information can be buried inside paragraphs and is much easier to find if it appears as part of a numbered list. Additionally, if customers have trouble following the steps, it is helpful to Liferay Support if they can provide the exact step number where the trouble began. 

### Omit Needless Words

William Strunk's famous rule, *Omit Needless Words*, is our mantra. Liferay Technical Writers should study chapters one and two of _Elements of Style_ and follow all the rules, but keep this one most of all in mind. The appendix to this document has a list of oft-used phrases that can be shortened or eliminated to tighten up your writing. 

Obviously, Strunk and White's rules were not directed toward technical writers specifically, but to all writers, who would do well to learn from their experience when writing in any style. Liferay's specific standards for technical documentation (below) are based on the foundation of _Elements of Style_. 

## Liferay Style

Liferay Style defines the prose of Liferay's documentation in a far more granular way than a generic resource like _The Chicago Manual of Style_ or _Elements of Style_ could. It is divided into three categories: conventions, phraseology, and format. 

### Liferay Conventions

Conventions are neither correct or incorrect; they are decisions that vary greatly in the industry. After much comparison and use, Liferay's documentation uses the conventions shown here. 

#### Text Editing

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

#### Spaces / Tabs

Use spaces, not tabs. This is the opposite of the Liferay code standard, but indenting in Markdown is much more effective with spaces than with tabs.

#### Article Naming

Article names (file names) should be the same as the article's title, all in lower case, with dashes replacing the spaces. If, for example, you have an article titled Using Message Boards, the article's file name should be `using-message-boards.md`. Never title an introduction *Introduction to [Subject Matter]*. 

#### Line Breaks

Paragraphs are on a single line of text; use dynamic word wrap and do not break at 80 columns. Separate your paragraphs by using two carriage returns.

**Example:**

This is a paragraph.

This is another paragraph.

#### Formatting Text

```
**Bold**
```
```
*Italics*
```

```
\`\`\`Code\`\`\`
```

#### Bold

Bold is used sparingly in the documentation, because too much bold is distracting. The reader's eye is drawn to bold text more than to anything else. All headings are bold, so we avoid it in the body text itself. Bold is used in one place: field definitions.

When explaining a form that users can fill out, use bold for the field names.

Example:

**Name:** Enter the user's name.

**Address:** Enter the user's address.

Never end a section with a list of form elements.

#### Italics

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

#### Code

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

#### Referring to UI Elements

When mentioning a UI element, capitalize it. 

**Example:** On the Edit User screen, enter an address in the *Address* field. 

**Example:** Select the *Organization* where you're adding the user. 

#### Badges

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

#### Numbered Lists

Single/double space; number all with 1. Multiple paragraphs must be indented to where the first paragraph starts. 

```
1. This is a numbered list. When this paragraph ends, line up the second paragraph with the beginning of the first.

   This would be the second paragraph in the first item. 

1. This is the second item in a numbered list.

1. This is the third item in a numbered list.
```

#### Tables

```
| header 1 | header 2 | header 3 |
| :--- | :--- | :--- |
| cell 1 | cell 2 | cell 3 |
```

| header 1 | header 2 | header 3 |
| :--- | :--- | :--- |
| cell 1 | cell 2 | cell 3 |

#### Definitions

Definitions are paragraphs, with the item to be defined appearing in bold along with the colon. They should never be bulleted. Here are two example definitions:

**Definition:** a statement that describes the meaning of a term.

**Term:** an object, usually a noun, whose meaning must be defined.

Definitions must never use the term they're defining in the definition.

#### Variables/Placeholders

If you have an example configuration that requires a placeholder, surround the placeholder in square brackets. This is to differentiate the placeholder from code, particularly markup code that is often surrounded by greater-than and less-than symbols. 

**Example:**

The default HSQL database is stored in `[Liferay Home]/data`. 

#### Images and Visual Aids

For images that are reused across multiple articles (like icons), there is a shared `images` folder in the root of each product's documentation section.

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

#### Admonitions 

Use admonitions to capture the reader's attention. Admonitions stand out from the main body of text to call out something important.

Do not overuse admonitions. If admonitions occur too frequently, readers skip over them.

The admonitions that we use most frequently are *Tip*, *Warning*, *Note*, and *Important*.

**Usage**

```
```{tip}

This is a tip. This is a link in a [tip](https://www.liferay.com). Markdown formatting is supported in an admonition.

```

To learn more about admonition syntax see the [MyST Syntax Guide](https://myst-parser.readthedocs.io/en/latest/syntax/syntax.html).

### Liferay Phraseology

Liferay's style phrases prose a certain way. Note that these are also conventions and neither correct nor incorrect; they are the way we have chosen to communicate based on our goals of being comprehensive, concise, and cohesive. 

#### Oxford Commas

Oxford commas (or serial commas) are used in a series. When you have a list of three or more things, a comma should be included before the conjunction at the last item in the series. Excluding the comma can lead to a lack of clarity, as illustrated in this example: 

```
I want to thank my mentors, my parents and the President for their help.
```

Are your mentors really your parents and the President? Or did you really mean this: 

```
I want to thank my mentors, my parents, and the President for their help.
```

The Oxford comma makes the sentence clear. 

#### Future Tense

Don't use future tense in the documentation. It's highly unlikely you need it to describe anything.

*This action will create a new record in the database.*

This sentence uses the future tense when there's no need to use the future tense. Instead, use the present tense:

*This action creates a new record in the database.*

#### Must

*Must* is always shorter than any equivalent.

*To use Assets, you need to have an Asset Renderer and an Asset Renderer Factory.*

One word is better than two, and since *need to* is two words and *must* is only one, change this to *must* in all cases.

*To use Assets, you must have an Asset Renderer and an Asset Renderer Factory.*

#### Simply and Just

Never use the words *simply* or *just*. What may seem simple to you is not simple to the beginner, and *simply* is an extra word in the text you can leave out. The same goes for *just*. 

#### Dangling Participles

*Please do the following:*

This is a dangling participle, because there's no object following *the following*. Instead, use phrases like this:

- Follow these steps:
- Do these things:

There's almost always a better construction than *the following*.

#### Subject/Pronoun Agreement

*When a user performs this function, they get feedback.*

*User* is singular; *they* is plural. In English, this is incorrect, though it's becoming more common. There's an easy way to resolve this in most cases. Make the whole thing plural:

*When users perform this function, they get feedback.*

#### Colons

Only use colons after independent clauses. The following uses are incorrect:

- To use an accelerator:
- To create a Site:
- For example:

In the above examples, use a comma instead of a colon.

#### Meta-Information

Never use meta-information, or information about the documentation. For example, never say things like this:

- This article is intended to
- This series of tutorials walks you
- At Liferay, we

This is all filler and unnecessary. Keep pronouns strictly to you and don't mention articles, their sections, or their format. 

#### Cross Links

When linking from one article to another, keep in mind the rule above (avoid meta information), even in links. For example, this is a bad link:

*For more information, see [this article](index.html)*.

This is a good link:

*For more information, see [Friendly URLs](index.html)*.

#### Numbers

In keeping with the *Chicago Manual of Style*, when referring to a number in a sentence, write out the number if it is 10 or less (for example, *There are six options.*). If the number is 10 or above, use the number (for example, *There are 16 places in hexadecimal.*). 

#### Lists

If you say there are so many options and then you list the options, use a numbered list. Use bullets when you don't mention the number of list items. 

**Example 1:** 

There are three ways to create a site: 

1. Create a site. 
2. Create an organization and then a site for that organization. 
3. Create a new portal instance, and then create the site. 

**Example 2:** 

Clicking the button gives you these options: 

- View
- Edit
- Delete

#### Never Project Roles

Organizations are different. Workflows are different. Roles are different. Never project a role onto your reader when the second person pronoun *you* (or the "understood you") should suffice. For example, never do this:

- Administrators can create the directory...
- Marketers can use Fragments to...
- Developers should create a class for...

Instead, do this:

- Create the folder
- You can use Fragments
- Create a class

Note that you also Omit Needless Words by doing this.

#### Address the Reader with You

In a classroom, it's okay to say *we* are working on a particular topic, because there's a teacher and everybody is learning together. In documentation, don't address the reader with *we*. Be consistent and always use *you*.

Similarly, don't say let's [do something].

#### Software is Not in Control

Never word things in a way where the software is making the decisions or seems to be in control of the user. Always empower the user. For example, never say this:

- This feature lets you
- A dialog pops up that allows you to

Instead, put the user in control, not the software:

- You can
- Use the dialog to configure

#### Terminology

It's hard to keep terminology consistent, so when we find an inconsistency in the way a term is used, we must fix it. If you see terminology in a document and you or your spell checker are in doubt, please look it up.

**Common Examples**
| Wrong                     | Right |
| :--- | :--- | :--- |
| backend                   | back-end        |
| frontend                  | front-end       |
| Javascript (or JS or js)  | JavaScript      |
| ServiceBuilder            | Service Builder |
| RESTBuilder               | REST Builder    |
| openapi                   | OpenAPI         |
| reindex                   | re-index        |
| [LIFERAY_HOME]            | [Liferay Home]  |
| out of the box            | out-of-the-box  |
| Freemarker or Free Marker | FreeMarker      |
| dropdown                  | drop-down       |

#### Any

Much of the time, you can get rid of the word any: 

*If the theme you are using has no token definitions for style books, **any** color picker configurations on the page are replaced with color palette configurations.*

The sentence above has the same meaning with or without *any*, so it can be removed. 

#### Verb-Adverb Combinations and their Nouns

Be careful with the noun form of verb-adverb. The verb-adverb is two words (the verb and the adverb); the noun is one: 

|  **Verb-Adverb**     |   **Noun** |
| :--- | :--- | :--- |
|  to break (how?) down |  here's a quick breakdown   |
|  to set (how?) up     |  it's a simple setup routine|
|  to log (how?) in     |  never give away your login |

#### If/Then

In the BASIC programming language, an *if* statement needs a *then*. In language, it mostly doesn't, and you can safely omit the *then*. 

#### Verb Construction

Do your best not to break up verb construction. For example, 

|  **Original**                          |   **Preferred**                      |
| :--- | :--- | :--- |
|  to dynamically display different pages |  to display different pages dynamically |
|  can optimally be surrounded by         |  can surround optimally                 |

#### Subjects and Referents

Make sure singular/plural subjects and their referents agree: 

**Incorrect:** A geolocation database contains a mapping between IP addresses and their country of origin. 

**Correct:** A geolocation database contains a mapping between IP addresses and their countries of origin. 

### Liferay Documentation Format

The format, or how a style of documentation is organized, is important to maintaining consistency of experience. As readers make more use of the documentation, the organization of how a feature is presented and described should become familiar. To make this possible, writers must adhere to format conventions. 

#### Never Use the word Introduction in an Introduction Title

In other words, never name an introduction *Introduction to....*

#### Make Feature Documentation as Independent as Possible

Each feature article should be as standalone as possible. Never assume the reader has (or might have) read another article on the same topic. If it's helpful to link to another article, definitely do it, but avoid language like this:

*You may have noticed this thing when [doing this other thing in this other article]. Here's how it works.*

Instead, do this:

*At the bottom of the [form](../some-other-article.md) is this other function. Here's how to use it.*

#### Introducing Steps

If you have a set of steps for the reader to follow, don't introduce those steps directly underneath a heading. Directly list the steps. 

**Example 1 (don't do this):**

```
## Editing Fields

To edit fields,

1. Step one 
```

**Example 2 (do this):**

```
## Editing Fields

1. Click the _Edit_ button.

1. Enter a name...
```

#### Comparing Features

When comparing features between items, such as Public and Private Pages, use a table with checks:

```
| Behavior | Public Pages | Private Pages |
| --- | --- |---|
| Visible to unauthenticated users | &#10004; |  |
| Viewing requires Login and Site Membership |  | &#10004; |
| Distinct URL pattern | &#10004; | &#10004; |
```

The table above renders like this:

| Behavior | Public Pages | Private Pages |
| --- | --- |---|
| Visible to unauthenticated users | &#10004; |  |
| Viewing requires Login and Site Membership |  | &#10004; |
| Distinct URL pattern | &#10004; | &#10004; |

#### Highlighting UI Elements

Highlighting UI elements is a great way to show users how to use a feature. There are two ways of highlighting UI elements: Box highlighting and numeric annotations.

An example using box highlighting:

An example of using numeric annotations:

![Numeric annotations should be paired with definitions of those annotations in the text below.](02.png)

If you use numeric annotations, define what's pictured in the text below the image. 

#### Diagrams / Visual Aids

Add diagrams to help users better understand complex concepts, including but not limited to how Liferay features relate to one another, a feature's purpose/function, or anything else you think may help a reader learn a concept. 

#### Videos

Upload videos to YouTube and then reference them in the article using the YouTube token: 

```
[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/x7fm_nCZ0sY
```
#### Documenting Multiple Liferay Versions

The Liferay documentation is versionless in that it always supports the latest version. Sometimes there must be documentation for an older version: 

- When Liferay modifies the user interface for a feature
- When Liferay deprecates or removes a feature, but users still use the old version
- When Liferay adds new functionality to an already existing feature

In these cases, you must support more than one version of the software in the documentation. Here are some ways to do that: 
 
-   Do not create a new article to discuss the changes in a new software minor version. Keep all the content for the same software major version in the same article.

-   Place the newest information at the top of the article and the oldest information at the bottom.

-   Evaluate the impact of the changes in the existing document:

    -   For minor changes, use badges (see above) to let readers know which version the content applies to. If the change requires a header, place the note right after the header.
    -   For major changes, use a dedicated H2 section to discuss the changes and place a note-type admonition at the beginning of the topic cross-linking the H2. 
