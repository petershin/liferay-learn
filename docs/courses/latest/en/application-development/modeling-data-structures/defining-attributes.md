# Defining Attributes

Attributes represent database columns that store specific types of information for an application, such as text and numeric values. In Liferay, defining attributes for data models involves adding [fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to object definitions for receiving user input. Additionally, you can create [picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) use them with objects to provide users with predefined single-select and multi-select fields.

<!-- Above explanation should be in intro (Let's Go!) article. -Rich -->

<!-- ![](./defining-attributes/images/01.png) -->

Delectable Bonsai must add fields to the Distributor Application object to collect the necessary information for verifying each applicant's business identity and credit for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. Additionally, this information can help them assess the relative value of each prospective distributor. For example, if the company seeks to penetrate a specific region, they can give applications from that region higher priority.

To do this, first add general fields to the Distributor Application object for gathering additional applicant and contact information.

Next: [Adding Fields to the Distributor Application Object](./defining-attributes/adding-fields-to-the-distributor-application-object.md)

<!-- I guess this is really big? I'm hoping to avoid modules with whole sub-modules. Is it possible to still break it up but keep the whole thing in this module and linear? -Rich -->
