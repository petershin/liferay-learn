---
toc:
  - ./building-a-custom-ticketing-system/customizing-a-data-schema.md
  - ./building-a-custom-ticketing-system/applying-a-custom-theme.md
  - ./building-a-custom-ticketing-system/deploying-a-custom-application.md
  - ./building-a-custom-ticketing-system/implementing-a-documentation-referral-system.md
uuid: e0218ddf-a7b1-4cc2-8f5d-ccc930d0704c
---
# Building a Custom Ticketing System

```{toctree}
:maxdepth: 3

building-a-custom-ticketing-system/customizing-a-data-schema.md
building-a-custom-ticketing-system/applying-a-custom-theme.md
building-a-custom-ticketing-system/deploying-a-custom-application.md
building-a-custom-ticketing-system/implementing-a-documentation-referral-system.md
```

Liferay makes it easy for you to build digital solutions. For example, you can create a custom ticketing application with the styling and features needed for your business.

![See the custom ticketing system sample.](./building-a-custom-ticketing-system/images/01.png)

This tutorial series walks you through building a custom ticketing system. You'll learn how to

* Define a custom data schema
* Apply a custom CSS theme
* Deploy a custom application
* Implement a documentation referral system

Each of these components are deployable through the use of [client extensions](../building-applications/client-extensions.md). The configuration of each client extension is defined by its [`client-extension.yaml`](../building-applications/client-extensions/working-with-client-extensions.md#configuring-client-extensions) file. 

## Prerequisites

Before starting, download the appropriate files and set up your system.

1. Download all the files from [liferay-ticket-workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-ticket-workspace)
<!--- Will need to update this once we can get the downloadable zip file --->

1. On the command line, navigate to the `liferay-ticket-workspace` folder.

```bash
cd liferay-ticket-workspace
```

1. Generate a local Liferay bundle.

```bash
./gradlew initBundle
```

1. Run the Liferay bundle.

```bash
./bundles/tomcat-9.0.73/bin/catalina.sh run
```

1. Sign in to Liferay at <http://localhost:8080> using the email address _test@liferay.com_ and the password _test_. When prompted, change the password to _learn_.

1. Build all the sample projects.

```bash
./gradlew build
```

In the first step, you'll [customize a data schema](./building-a-custom-icketing-system/customizing-a-data-schema.md)
