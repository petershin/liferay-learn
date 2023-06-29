# Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities and their interactions. Using relationships, developers can determine how data is organized and connected within a system to better capture entity associations and dependencies. In Liferay, you can define one-to-many and many-to-many relationships between object definitions. These relationships add fields or tables to each object that you can use to relate their entries, enabling you to access entry data in different object contexts.

<!-- Above should be in module intro (Let's Go!) article. -Rich -->

<!--![Define relationships to relate object entries.](./defining-relationships/images/01.png)-->

When reviewing applications, Delectable Bonsai must store evaluation notes for each distributor application. To achieve this, you could add more fields to the Distributor Application Object, but that would overload it with responsibilities. Instead, they want to create a separate object definition for evaluation notes and relate it to the Distributor Application object. This provides reviewers a dedicated space <!--w/c--> for saving notes on application throughout the review process.

<!-- I don't think the above is a good explanation for why we create relationships in database tables. We create relationships whenever we have an entity that can have a variable number of properties associated with it. For example, a customer might have one name and address, but a variable number of orders, so orders becomes its own related entity. In this example, it sounds like one distributor application can have a variable number of notes by different authors attached. That would be the reason why you'd create another object/table with a relationship, and is a much clearer explanation than "would overload it with responsibilities." -Rich -->

The first step is to set up the Application Evaluation object.

Next: [Setting Up the Application Evaluation Object](./defining-relationships/setting-up-the-application-evaluation-object.md)

<!-- Same here; I am hoping to avoid sub-modules if we can. We can discuss if you like. -Rich -->
