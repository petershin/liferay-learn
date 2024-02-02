---
toc:
  - ./managing-user-data/exporting-user-data.md
  - ./managing-user-data/sanitizing-user-data.md
  - ./managing-user-data/configuring-the-anonymous-user.md
  - ./managing-user-data/enabling-gdpr-compliance-for-cookies.md
uuid: 2ab639a3-b972-4418-9fa5-db5958090d7a
taxonomy-category-names:
- Security
- Personal Data Management
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Managing User Data (GDPR)

Liferay's User Associated Data (UAD) framework assists you in meeting two of the General Data Protection Regulation's (GDPR) technically challenging requirements:

- The [right to data portability](./managing-user-data/exporting-user-data.md)
- The [right to be forgotten](./managing-user-data/sanitizing-user-data.md)

The following Liferay applications have the UAD framework applied to them:

| Liferay Application    | Liferay 7.2 (DXP & CE) | Liferay 7.3 (DXP & CE) | Liferay 7.4 |
|:-----------------------|:-----------------------|:-----------------------|:------------|
| Announcements          | Yes                    | Yes                    | Yes         |
| Blogs                  | Yes                    | Yes                    | Yes         |
| Bookmarks (deprecated) | Yes                    | Yes                    | Yes         |
| Contacts Center        | Yes                    | Yes                    | Yes         |
| Documents and Media    | Yes                    | Yes                    | Yes         |
| Forms                  | No                     | Yes                    | Yes         |
| Message Boards         | Yes                    | Yes                    | Yes         |
| Objects                | No                     | No                     | Yes         |
| Web Content            | Yes                    | Yes                    | Yes         |
| Wiki                   | Yes                    | Yes                    | Yes         |

```{important}
Through the User Management functionality of Liferay DXP, companies processing the personal data of their website's users can begin to address the requirements of GDPR. However, the tools discussed here and anywhere else in the documentation, including those directly aimed at addressing GDPR requirements, do not guarantee compliance with the legal requirements of GDPR. Each company or individual whose website processes user personal data and is under the jurisdiction of GDPR must carefully determine the precise steps necessary to ensure they are fully compliant with GDPR.
```
