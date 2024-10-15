---
uuid: 4d8d0578-afe3-4e20-9271-c4305b501e19
taxonomy-category-names:
- Content Management System
- Forums and Message Boards
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Message Boards API Basics

Liferay's Headless Delivery application provides REST services for the [Message Boards](../../message-boards.md) application. With these services, you can add message board categories, threads, and messages, list their information, modify their content, or remove them altogether. Access these services using methods such as cURL commands and Java classes.

!!! note
    Message board categories are named *sections* in the Liferay backend. These sections define topics for organizing threads.

## Preparing Message Boards Resources

Before proceeding with the tutorial, set up a clean Liferay Docker container and prepare the provided tutorial code for use.

### Liferay Docker Container

```{include} /_snippets/run-liferay-portal.md
```

Once started, retrieve the site ID. To find your site ID, open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)) and go to *Configuration* &rarr; *Site Settings* &rarr; *Site Configuration*.

![Find the site ID under the Site Configuration settings.](./message-boards-api-basics/images/01.png)

### Tutorial Code

Below is the sample code to demonstrate the headless API. This code includes both sample cURL and Java files.

Run the following command to download and unzip the [sample code](https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip):

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip -O
```

```bash
unzip liferay-y3a6.zip
```

While the cURL scripts come ready for use, you must compile the Java source files manually before you run them. To do this, go to the project's `java` folder and run the `javac` command.

```bash
cd liferay-y3a6/java
```

```bash
javac -classpath .:* *.java
```

Note that the project includes the `com.liferay.headless.delivery.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

The provided code includes APIs for the `MessageBoardSection`, `MessageBoardThread` and `MessageBoardMessage` services. See [Tutorial Code Reference](#tutorial-code-reference) for a list of all included sample APIs.

!!! important
    The provided code uses basic authentication for demonstration purposes. For production, you should authorize users with [OAuth2](../../../headless-delivery/using-oauth2.md).

## Calling the Message Boards APIs

In this exercise, you can use either the cURL commands or Java classes to call the `MessageBoardSection`, `MessageBoardThread` and `MessageBoardMessage` APIs. The following output examples correspond to the cURL commands, which differ slightly from the output for the provided Java classes.

1. Navigate to the `curl` or `java` folder in the `liferay-y3a6` project.

   **For cURL:**

   ```bash
   cd liferay-y3a6/curl
   ```

   **For Java:**

   ```bash
   cd liferay-y3a6/java
   ```

1. Execute `MessageBoardSection_POST_ToSite` using your site ID as a parameter. This creates a new message board section in the specified site.

   **For cURL:**

   ```bash
   ./MessageBoardSection_POST_ToSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSection_POST_ToSite
   ```

   The terminal displays the complete schema for the newly created section. The provided API calls only define the `description` and `name` fields for the new section.

1. Copy the section's ID for use with the following GET, PATCH, PUT, and DELETE methods.

   ```json
   {
      ...
      "description" : "Foo",
      "id" : 43925,
      ...
      "name" : "Able Section",
      ...
   }
   ```

1. Execute `MessageBoardSections_GET_FromSite` using the site ID for its parameter. This returns a list of all sections in the specified site.

   **For cURL:**

   ```bash
   ./MessageBoardSections_GET_FromSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSections_GET_FromSite
   ```

1. Execute `MessageBoardSection_PATCH_ById` using the message board section's ID for its parameter. This updates the details of the specified section with those provided in the API call.

   **For cURL:**

   ```bash
   ./MessageBoardSection_PATCH_ById.sh {message-board-section-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PATCH_ById
   ```

   This updates the `description` field to `Bar`.

1. Execute `MessageBoardSection_PUT_ById` using the same section ID for its parameter. This replaces the details of the specified section with those provided in the API call.

   **For cURL:**

   ```bash
   ./MessageBoardSection_PUT_ById.sh {message-board-section-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PUT_ById
   ```

   This updates the `name` field to `Baker Section` and the `description` field to `Goo`.

1. Execute `MessageBoardThread_POST_ToSite` using the site ID for its parameter. This creates a new message board thread for the site.

   **For cURL:**

   ```bash
   ./MessageBoardThread_POST_ToSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardThread_POST_ToSite
   ```

   ```json
   {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Able Thread",
      "id" : 43942,
      ...
      "messageBoardRootMessageId" : 43941,
   }
   ```

   All threads are created with a root message that serves as the parent message of all direct replies in the thread (i.e., `messageBoardRootMessageId`).

1. Execute `MessageBoardThread_POST_ToSection` using the above section ID for its parameter. This creates a new message board thread for the specified section.

   **For cURL:**

   ```bash
   ./MessageBoardThread_POST_ToSection.sh {message-board-section-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThread_POST_ToSection
   ```

1. Copy this thread's ID for use with the following GET, PATCH, and PUT methods.

   ```json
   {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Baker Thread",
      "id" : 43934,
      ...
      "messageBoardRootMessageId" : 43933,
      "messageBoardSectionId" : 43925,
      ...
   }
   ```

1. Execute `MessageBoardThread_PATCH_ById` using the thread's ID for its parameter. This updates the details of the specified thread with those provided in the API call.

   **For cURL:**

   ```bash
   ./MessageBoardThread_PATCH_ById.sh {message-board-thread-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PATCH_ById
   ```

   This updates the `articleBody` field to `Bar`.

1. Execute `MessageBoardThread_PUT_ById` using the same thread ID for its parameter. This replaces the details of the specified thread with those provided in the API call.

   **For cURL:**

   ```bash
   ./MessageBoardThread_PUT_ById.sh {message-board-thread-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PUT_ById
   ```

   This updates the `headline` field to `Charlie Thread` and the `articleBody` field to `Goo`.

1. Execute the `MessageBoardThreads_GET_FromSite` using the site ID for its parameter. This returns a list of all site threads without a section.

   **For cURL:**

   ```bash
   ./MessageBoardThreads_GET_FromSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardThreads_GET_FromSite
   ```

1. Execute `MessageBoardThreads_GET_FromSection` using the section ID for its parameter. This returns a list of all threads in the specified section.

   **For cURL:**

   ```bash
   ./MessageBoardThreads_GET_FromSection.sh {message-board-section-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThreads_GET_FromSection
   ```

1. Execute `MessageBoardMessage_POST_ToThread` using either of the above thread IDs for its parameter. This creates a new message board message for the specified thread.

   **For cURL:**

   ```bash
   ./MessageBoardMessage_POST_ToThread.sh {message-board-thread-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessage_POST_ToThread
   ```

1. Copy the message's ID for use with the following PUT, PATCH, and POST commands.

   ```json
   {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Able Message",
      "id" : 43946,
      ...
      "messageBoardSectionId" : 43925,
      "messageBoardThreadId" : 43934,
      "parentMessageBoardMessageId" : 43933,
      ...
   }
   ```

   The new message is created as a child of the thread's root message (`messageBoardRootMessageId`).

1. Execute `MessageBoardMessage_PATCH_ById` using the message's ID for its parameter. This updates the details of the specified message with those provided in the API call.

   **For cURL:**

   ```bash
   ./MessageBoardMessage_PATCH_ById.sh {message-board-message-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PATCH_ById
   ```

   This updates the `articleBody` field to `Bar`.

1. Execute `MessageBoardMessage_PUT_ById` using the same message ID for its parameter. This replaces the details of the specified message with those provided in the API call.

   **For cURL:**

   ```bash
   ./MessageBoardMessage_PUT_ById.sh {message-board-message-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PUT_ById
   ```

   This updates the `headline` field to `Baker Message` and the `articleBody` field to `Goo`.

1. Execute `MessageBoardMessage_POST_ToParent` using the preceding message ID for its parameter. This creates a new child message for the specified message.

   **For cURL:**

   ```bash
   ./MessageBoardMessage_POST_ToParent.sh {parent-message-board-message-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessage_POST_ToParent
   ```

   ```json
   {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Charlie Message",
      "id" : 43949,
      ...
      "messageBoardSectionId" : 43925,
      "messageBoardThreadId" : 43934,
      ...
      "parentMessageBoardMessageId" : 43946,
      ...
   }
   ```

1. Execute `MessageBoardMessages_GET_FromThread` using the thread ID for its parameter. This returns a list of child messages for the thread's root message (i.e., `messageBoardRootMessage`).

   **For cURL:**

   ```bash
   ./MessageBoardMessages_GET_FromThread.sh {message-board-thread-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessages_GET_FromThread
   ```

   The output should include data for the first message you created in the thread, which should itself have one child message. This is indicated by the message's `numberOfMessageBoardMessages` field.

1. Execute `MessageBoardMessages_GET_FromParent` using the preceding message's ID for its parameter. This returns a list of all child messages for the specified Message.

   **For cURL:**

   ```bash
   ./MessageBoardMessages_GET_FromParent.sh {parent-message-board-message-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessages_GET_FromParent
   ```

   The output should include data for the last child message you created.

1. Execute `MessageBoardSection_DELETE_ById` using the same section ID for its parameter. This deletes the specified section along with its threads and messages.

   **For cURL:**

   ```bash
   ./MessageBoardSection_DELETE_ById.sh {message-board-section-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_DELETE_ById
   ```

1. Execute `MessageBoardSection_GET_ById` using the same section ID for its parameter. This returns the details for the specified section if it exists.

   **For cURL:**

   ```bash
   ./MessageBoardSection_GET_ById.sh {message-board-section-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_GET_ById
   ```

   Since you deleted the section in the preceding step, it returns the following message.

   ```json
   {
      "status" : "NOT_FOUND",
      "title" : "No MessageBoardSection exists with the primary key 43925"
   }
   ```

## Code Reference

The provided sample code includes cURL scripts and Java classes for the following `MessageBoardSection`, `MessageBoardThread` and `MessageBoardMessage` APIs.

### Sample MessageBoardSection APIs

The sample code includes cURL scripts and Java classes that call the following APIs.

| Service             | HTTP Method | HTTP Endpoint                                          | Description                                                                                                               |
|:--------------------|:------------|:-------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------|
| MessageBoardSection | `POST`      | `/v1.0/sites/[siteId]/message-board-sections`          | Creates a new category with the details provided in the API call                                                          |
| MessageBoardSection | `GET`       | `/v1.0/sites/[siteId]/message-board-sections`          | Returns a complete list of all categories in the specified site; results can be paginated, filtered, searched, and sorted |
| MessageBoardSection | `PATCH`     | `/v1.0/message-board-sections/[messageBoardSectionId]` | Updates only the fields specified in the API call for a category                                                          |
| MessageBoardSection | `PUT`       | `/v1.0/message-board-sections/[messageBoardSectionId]` | Replaces all fields for the specified category with those provided in the API call                                        |
| MessageBoardSection | `DELETE`    | `/v1.0/message-board-sections/[messageBoardSectionId]` | Deletes the specified category and returns a 204 if the operation succeeds                                                |

### Sample MessageBoardThread APIs

| Service            | HTTP Method | HTTP Endpoint                                                                | Description                                                                                                                      |
|:-------------------|:------------|:-----------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| MessageBoardThread | `POST`      | `/v1.0/sites/[siteId]/message-board-threads`                                 | Creates a new thread with the details provided in the API call                                                                   |
| MessageBoardThread | `POST`      | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | Creates a new thread within the specified category using the details provided in the API call                                    |
| MessageBoardThread | `GET`       | `/v1.0/sites/[siteId]/message-board-threads`                                 | Returns a complete list of all site threads that are not in a category; results can be paginated, filtered, searched, and sorted |
| MessageBoardThread | `GET`       | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | Returns a complete list of all threads in the specified category; results can be paginated, filtered, searched, and sorted       |
| MessageBoardThread | `PATCH`     | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | Updates only the fields specified in the API call for a thread                                                                   |
| MessageBoardThread | `PUT`       | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | Replaces all fields for the specified thread with those provided in the API call                                                 |
| MessageBoardThread | `DELETE`    | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | Deletes the specified thread and returns a 204 if the operation succeeds                                                         |

### Sample MessageBoardMessage APIs

| Service             | HTTP Method | HTTP Endpoint                                                               | Description                                                                                                               |
|:--------------------|:------------|:----------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------|
| MessageBoardMessage | `POST`      | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | Creates a new message in the specified thread with the detailed provided in the API call.                                 |
| MessageBoardMessage | `GET`       | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | Returns a complete list of all messages in the specified thread; results can be paginated, filtered, searched, and sorted |
| MessageBoardMessage | `PATCH`     | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | Updates only the fields specified in the API call for a message                                                           |
| MessageBoardMessage | `PUT`       | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | Replaces all fields for the specified message with those provided in the API call                                         |
| MessageBoardMessage | `DELETE`    | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | Deletes the specified message and returns a 204 if the operation succeeds                                                 |

## Related Topics

- [Message Boards](../../../collaboration-and-social/message-boards.md)
- [Message Boards Configuration Reference](../message-boards-configuration-reference.md)
