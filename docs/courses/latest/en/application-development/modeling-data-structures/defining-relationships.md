# Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities and their interactions. Using relationships, developers can determine how data is organized and connected within a system to better capture entity associations and dependencies. In Liferay, you can define one-to-many and many-to-many relationships between object definitions. These relationships add fields or tables to each object that you can use to relate their entries, enabling you to access entry data in different object contexts.

<!--![Define relationships to relate object entries.](./defining-relationships/images/01.png)-->

When reviewing applications, Delectable Bonsai needs to store evaluation notes for each distributor application. To achieve this, you could add more fields to the Distributor Application Object, but that would overload it with responsibilities. Instead, they want to create a separate object definition for evaluation notes and relate it to the Distributor Application object. This provides reviewers a dedicated space <!--w/c--> for saving notes on application throughout the review process.

The first step is to set up the Application Evaluation object.

Next: [Setting Up the Application Evaluation Object](./defining-relationships/setting-up-the-application-evaluation-object.md)
