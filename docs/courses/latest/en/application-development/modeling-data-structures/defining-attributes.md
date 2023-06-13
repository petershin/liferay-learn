# Defining Attributes

Attributes represent database columns that store specific types of information for an application, such as text and numeric values. With Liferay, defining attributes for data models involves adding [fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to object definitions and creating [picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) for use as object fields.

<!-- Diagram -->

Delectable Bonsai needs to add fields to the Distributor Application object so they can collect the necessary business information for verifying each applicant's identity and credit. These details are necessary for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. Additionally, they want to collect information that can help them assess the relative value of each prospective distributor. For example, if the company is working to reach a specific region, they can give applications from that region higher priority.

To do this, first create picklists and then add fields to the Distributor Application object.

Next: [Adding Picklists for Distributor Applications](./defining-attributes/adding-picklists-for-distributor-applications.md)
