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
  - ./publications/using-the-publications-toolbar.md
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

You can use *Publications* to develop, track, and publish changes across your DXP instance. It works by creating a database column to determine which version of your content appears on your live sites. With it, users create separate publications to group their changes into publishable blocks.

![Group changes into publishable blocks.](./publications/images/01.png)

When making your changes, you can switch between *edit* and *production* modes. This frees you up to work on minor or major changes to your instance in an editing environment before they go live. You can then review and publish your changes immediately, or schedule them to be published at a later time.

You and your team can create as many publications as needed to organize and roll out your changes. You can also work concurrently with team members on the same or different publications, freeing you up to work on your own timelines.

Each publication is instance-scoped and can be accessed anywhere. This means you can use a publication to track diverse and complex changes across multiple sites. All changes are applied together when the publication is published.

Additionally, Publications provides a high level of process transparency, so you can more easily identify and resolve conflicts during publishing. It also maintains a complete publishing history that you can use to review and revert changes to your instance.

Publications support the following pages and content types:

| Feature                      | Liferay DXP 2024.Q2+ | Liferay DXP 2024.Q4+ |
|:-----------------------------|:--------------------:|:--------------------:|
| Accounts (Contact Info Only) |          ✅          |          ❌          |
| Blogs                        |          ✅          |          ✅          |
| Commerce Entities            |          ❌          |          ❌          |
| Content Pages                |          ✅          |          ✅          |
| Custom Objects               |          ❌          |          ❌          |
| Documents and Media          |          ✅          |          ✅          |
| Forms                        |          ✅          |          ✅          |
| Knowledge Base               |          ✅          |          ✅          |
| Message Boards               |          ✅          |          ✅          |
| Organizations                |          ✅          |          ❌          |
| Page Templates               |          ✅          |          ✅          |
| Site Templates               |          ✅          |          ✅          |
| Users (Contact Info Only)    |          ✅          |          ❌          |
| Web Content                  |          ✅          |          ✅          |
| Widget Pages                 |          ✅          |          ✅          |
| Wiki                         |          ✅          |          ✅          |

!!! note
    {bdg-secondary}`Liferay DXP 2024.Q4+` Only content-related entities can be modified within Publications. Attempting to edit non-content entities, such as Users, Organizations, and Accounts, displays a "This application saves changes directly to production" message.

To get started, see [Enabling Publications](./publications/enabling-publications.md).
