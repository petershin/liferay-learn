---
uuid: f03aec85-6c18-42e5-b46f-217d3229d6f1
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Building a Sample API Application

{bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA102+
{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

!!! important
    The [API Builder](../api-builder.md) is currently behind a [beta feature flag](../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) (LPS-178642). API endpoints currently support retrieving and creating collections of entities.

Follow the steps below to see a mock API application example.

## Adding Sample Objects and Entries

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. On the command line, run the following script to create a `Student` object.

	```bash
	student=$(curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
		-d "{\"label\": {\"en_US\": \"Student\"}, \"name\": \"Student\", \"panelCategoryKey\": \"control_panel.object\", \"pluralLabel\": {\"en_US\": \"Students\"}, \"scope\": \"company\"}" \
	  -u "test@liferay.com:learn" | jq -r ".id")

	curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/object-fields" \
		-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"First Name\"}, \"name\": \"firstName\", \"required\": false}" \
		-u "test@liferay.com:learn"

	curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/object-fields" \
		-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Last Name\"}, \"name\": \"lastName\", \"required\": false}" \
		-u "test@liferay.com:learn"

	curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/publish" \
		-u "test@liferay.com:learn"
	```

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Objects*. Verify that a new `Student` object was created.

1. On the command line, run the following script to create a `Course` object.

	```bash
	course=$(curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
		-d "{\"label\": {\"en_US\": \"Course\"}, \"name\": \"Course\", \"panelCategoryKey\": \"control_panel.object\", \"pluralLabel\": {\"en_US\": \"Courses\"}, \"scope\": \"company\"}" \
		-u "test@liferay.com:learn" | jq -r ".id")

	curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/object-admin/v1.0/object-definitions/${course}/object-fields" \
		-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Course Name\"}, \"name\": \"courseName\", \"required\": false}" \
	  -u "test@liferay.com:learn"
	```

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Objects*. Click on the `Course` object that was just created.

1. Click the *Relationships* tab. Click *Add* (![Add icon](../../images/icon-add.png)).

1. Enter the following values to define the new relationship.

   | Field           | Value       |
   |:----------------|:------------|
   | Label           | Enrollment  |
   | Name            | enrollment  |
   | Type            | One to Many |
   | One Record Of   | Course      |
   | Many Records of | Student     |

   Click *Save*.

1. Click the *Details* tab. Click *Publish*.

## Adding Sample Courses and Students

1. On the command line, run the following script to create two courses and two students.

	```bash
	math101=$(curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/c/courses" \
		-d "{\"courseName\": \"Math 101\"}" \
		-u "test@liferay.com:learn" | jq -r ".id")

	curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/c/students" \
		-d "{\"r_enrollment_c_courseId\":${math101}, \"firstName\": \"Mary\", \"lastName\": \"Liferay\"}" \
		-u "test@liferay.com:learn"

	history101=$(curl \
		-H "Content-Type: application/json" \
		-X POST \
	  "http://localhost:8080/o/c/courses" \
		-d "{\"courseName\": \"History 101\"}" \
		-u "test@liferay.com:learn" | jq -r ".id")

	curl \
		-H "Content-Type: application/json" \
		-X POST \
		"http://localhost:8080/o/c/students" \
		-d "{\"r_enrollment_c_courseId\":${history101}, \"firstName\": \"John\", \"lastName\": \"Liferay\"}" \
		-u "test@liferay.com:learn"
	```

## Creating an API Application

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *API Builder*.

1. Click *Add* (![Add icon](../../images/icon-add.png)). Enter the title, URL, and description for the new API application.

   ![Create a new API application](./building-a-sample-api-application/images/01.png)

   | Field       | Value                                |
   |:------------|:-------------------------------------|
   | Title       | Registration                         |
   | URL         | registration                         |
   | Description | An API to get student registrations. |

   Click *Create*.

1. Click the *Schemas* tab. Click *Add* (![Add icon](../../images/icon-add.png)).

1. Enter the name, description, and object for the new schema.

   | Field       | Value                                           |
   |:------------|:------------------------------------------------|
   | Name        | Course Registrations                            |
   | Description | A list of courses and the students taking them. |
   | Object      | Course                                          |

   Click *Create*.

1. Click the newly created schema's *Properties* tab. Add the `Course Name` field by clicking on *Course Name* in the left menu.

   ![Add the course name field to the schema.](./building-a-sample-api-application/images/02.png)

1. In the left menu, click *View Related Objects*. Click *Student* to expand the attributes. Add the `First Name` and `Last Name` fields by clicking on *First Name* and *Last Name* in the left menu. Click *Save* in the top right corner.

1. Next, click the *Endpoints* tab. Click *Add* (![Add icon](../../images/icon-add.png)).

1. Enter the scope, path, and description for the new API endpoint.

   | Field       | Value                                                  |
   |:------------|:-------------------------------------------------------|
   | Scope       | Company                                                |
   | Path        | courses                                                |
   | Description | An endpoint to get a list of courses and its students. |

	Click *Create*.

1. Click the *Configuration* tab in the newly created API endpoint. Under Response Body Schema, select the *Course Registrations* schema you created in the previous step. Click *Publish* in the top right of the page.

1. Test out the new API application by navigating to the API explorer (e.g. <http://localhost:8080/o/api?endpoint=http://localhost:8080/o/c/registration/openapi.json>).

   Click the *GET courses* endpoint and click *Execute*.

   ![Execute the Get courses endpoint.](./building-a-sample-api-application/images/03.png)

   The custom API application returns a list of courses and the students taking the courses.

## Related Topics

- [Sample API Tutorials](../sample-api-tutorials.md)
- [Consuming APIs](../consuming-apis.md)