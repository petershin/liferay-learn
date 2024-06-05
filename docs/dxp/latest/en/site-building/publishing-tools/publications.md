---
toc:
  - ./publications/enabling-publications.md
  - ./publications/creating-and-managing-publications.md
  - ./publications/using-publication-templates.md
  - ./publications/making-and-publishing-changes.md
  - ./publications/using-workflow-with-publications.md
  - ./publications/collaborating-on-publications.md
  - ./publications/resolving-conflicts.md
  - ./publications/reverting-changes.md
  - ./publications/publications-permissions.md
taxonomy-category-names:
- Platform
- Publications
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 8e7e004e-c872-4b7d-af1d-0d2eec5210b1
---

# Publications

{bdg-secondary}`Liferay DXP/Portal 7.3+`

You can use *Publications* to develop, track, and publish changes across your DXP instance. It works by creating a database column to determine which version of your content is displayed on your live sites. With it, users create separate publications to group their changes into publishable blocks.

![Group changes into publishable blocks.](./publications/images/01.png)

When making your changes, you can switch between *edit* and *production* modes. This frees you up to work on minor or major changes to your instance in an editing environment before they go live. You can then review and publish your changes immediately, or schedule them to be published at a later time.

You and your team can create as many publications as needed to organize and roll out your changes. You can also work concurrently with team members on the same or different publications, freeing you up to work on your own timelines.

Each publication is instance-scoped and can be accessed anywhere. This means you can use a publication to track diverse and complex changes across multiple sites. All changes are applied together when the publication is published.

Additionally, Publications provides a high level of process transparency, so you can more easily identify and resolve conflicts during publishing. It also maintains a complete publishing history that you can use to review and revert changes to your instance.

{bdg-secondary}`Liferay 7.4 U86+/GA86+` Publications support the following pages and content types:

| Feature                      | Publications |
|:-----------------------------|:-------------|
| Accounts (Contact Info Only) | &#10004;     |
| Blogs                        | &#10004;     |
| Commerce Entities            | &#10008;     |
| Content Pages                | &#10004;     |
| Custom Objects               | &#10008;     |
| Documents and Media          | &#10004;     |
| Forms                        | &#10004;     |
| Knowledge Base               | &#10004;     |
| Message Boards               | &#10004;     |
| Organizations                | &#10004;     |
| Page Templates               | &#10004;     |
| Site Templates               | &#10004;     |
| Users (Contact Info Only)    | &#10004;     |
| Web Content                  | &#10004;     |
| Widget Pages                 | &#10004;     |
| Wiki                         | &#10004;     |

To get started, see [Enabling Publications](./publications/enabling-publications.md).
