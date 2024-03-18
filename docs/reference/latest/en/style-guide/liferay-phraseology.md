---
uuid: 337dd2e1-277b-488c-a7fa-61908b6e1ad1
---
# Liferay Phraseology

Liferay's style phrases prose a certain way. Note that these are also conventions and neither correct nor incorrect; they are the way we have chosen to communicate based on our goals of being comprehensive, concise, and cohesive. 

## Oxford Commas

Oxford commas (or serial commas) are used in a series. When you have a list of three or more things, a comma should be included before the conjunction at the last item in the series. Excluding the comma can lead to a lack of clarity, as illustrated in this example: 

```
I want to thank my mentors, my parents and the President for their help.
```

Are your mentors really your parents and the President? Or did you really mean this: 

```
I want to thank my mentors, my parents, and the President for their help.
```

The Oxford comma makes the sentence clear. 

## Future Tense

Don't use future tense in the documentation. It's highly unlikely you need it to describe anything.

*This action will create a new record in the database.*

This sentence uses the future tense when there's no need to use the future tense. Instead, use the present tense:

*This action creates a new record in the database.*

## Must

*Must* is always shorter than any equivalent.

*To use Assets, you need to have an Asset Renderer and an Asset Renderer Factory.*

One word is better than two, and since *need to* is two words and *must* is only one, change this to *must* in all cases.

*To use Assets, you must have an Asset Renderer and an Asset Renderer Factory.*

## Simply and Just

Never use the words *simply* or *just*. What may seem simple to you is not simple to the beginner, and *simply* is an extra word in the text you can leave out. The same goes for *just*. 

## Dangling Participles

*Please do the following:*

This is a dangling participle, because there's no object following *the following*. Instead, use phrases like this:

- Follow these steps:
- Do these things:

There's almost always a better construction than *the following*.

## Subject/Pronoun Agreement

*When a user performs this function, they get feedback.*

*User* is singular; *they* is plural. In English, this is incorrect, though it's becoming more common. There's an easy way to resolve this in most cases. Make the whole thing plural:

*When users perform this function, they get feedback.*

## Colons

Only use colons after independent clauses. The following uses are incorrect:

- To use an accelerator:
- To create a Site:
- For example:

In the above examples, use a comma instead of a colon.

## Meta-Information

Never use meta-information, or information about the documentation. For example, never say things like this:

- This article is intended to
- This series of tutorials walks you
- At Liferay, we

This is all filler and unnecessary. Keep pronouns strictly to *you* and don't mention articles, their sections, or their format. 

## Cross Links

When linking from one article to another, keep in mind the rule above (avoid meta information), even in links. For example, this is a bad link:

*For more information, see [this article](index.html)*.

This is a good link:

*For more information, see [Friendly URLs](index.html)*.

## Numbers

In keeping with the *Chicago Manual of Style*, when referring to a number in a sentence, write out the number if it is 10 or less (for example, *There are six options.*). If the number is 10 or above, use the number (for example, *There are 16 places in hexadecimal.*). 

## Lists

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

## Never Project Roles

We never know the background of the reader. Some are individuals; some are within organizations. Roles within these constructs differ, as do their workflows. Never project a role, title, or job description onto your reader when the second person pronoun *you* (or the "understood you") should suffice. For example, never do this:

- Administrators can create the directory...
- Marketers can use Fragments to...
- Developers should create a class for...

Instead, do this:

- Create the folder
- You can use Fragments
- Create a class

Note that you also Omit Needless Words by doing this.

## Address the Reader with You

In a classroom, it's okay to say *we* are working on a particular topic, because there's a teacher and everybody is learning together. In documentation, don't address the reader with *we*. Be consistent and always use *you*.

Similarly, don't say let's [do something].

## Software is Not in Control

Never word things in a way where the software is making the decisions or seems to be in control of the user. Always empower the user. For example, never say this:

- This feature lets you
- A dialog pops up that allows you to

Instead, put the user in control, not the software:

- You can
- Use the dialog to configure

## Terminology

It's hard to keep terminology consistent, so when we find an inconsistency in the way a term is used, we must fix it. If you see terminology in a document and you or your spell checker are in doubt, please look it up.

**Common Examples**

| **Wrong**                     | **Right** |
| :--- | :--- | 
| backend                   | back-end        |
| frontend                  | frontend       |
| Javascript (or JS or js)  | JavaScript      |
| ServiceBuilder            | Service Builder |
| RESTBuilder               | REST Builder    |
| openapi                   | OpenAPI         |
| reindex                   | re-index        |
| [LIFERAY_HOME]            | [Liferay Home]  |
| out of the box            | out-of-the-box  |
| Freemarker or Free Marker | FreeMarker      |
| dropdown                  | drop-down       |

## Any

Much of the time, you can get rid of the word any: 

*If the theme you are using has no token definitions for style books, **any** color picker configurations on the page are replaced with color palette configurations.*

The sentence above has the same meaning with or without *any*, so it can be removed. 

## Verb-Adverb Combinations and their Nouns

Be careful with the noun form of verb-adverb. The verb-adverb is two words (the verb and the adverb); the noun is one: 

|  **Verb-Adverb**     |   **Noun** |
| :--- | :--- | 
|  to break (how?) down |  here's a quick breakdown      |
|  to set (how?) up     |  it's a graphical setup routine|
|  to log (how?) in     |  never give away your login    |

## If/Then

In the BASIC programming language, an *if* statement needs a *then*. In language, it mostly doesn't, and you can safely omit the *then*. 

## Verb Construction

Do your best not to break up verb construction. For example, 

|  **Original**                          |   **Preferred**                      |
| :--- | :--- | 
|  to dynamically display different pages |  to display different pages dynamically |
|  can optimally be surrounded by         |  can surround optimally                 |

## Subjects and Referents

Make sure singular/plural subjects and their referents agree: 

**Incorrect:** A geolocation database contains a mapping between IP addresses and their country of origin. 

**Correct:** A geolocation database contains a mapping between IP addresses and their countries of origin. 
