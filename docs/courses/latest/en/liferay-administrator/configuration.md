---
toc:
  - ./configuration/configuring-system-settings.md
  - ./configuration/configuring-instance-settings.md
  - ./configuration/understanding-virtual-instances.md
  - ./configuration/using-file-storage.md
  - ./configuration/server-administration-and-email.md
uuid: bfffa7f5-ad04-4b57-9ee8-f1f8d5b1a300
---
# Configuration

```{toctree}
:maxdepth: 3

configuration/configuring-system-settings.md
configuration/configuring-instance-settings.md
configuration/configuring-virtual-instances.md
configuration/using-file-storage.md
configuration/server-administration-and-email.md
```

Now it's time to configure the environment to suit your business needs. Setting configurations before registering users or creating web content can save you headaches down the road. 

<!-- When you say something can "save you headaches" down the road, it immediately generates the question, "What headaches?" This sends the reader down a thought-path that isn't helpful. If you're going to say something like that, you want to tell them exactly what potential problems you're avoiding. Here are some I can think of: 

- Setting defaults inherited by users (such as password policies) makes it so you don't have to set those settings manually later on each user
- Settings that affect defaults created for content in the global area make it so you don't have to set those settings manually later on each piece of content

But I don't know if either of those are what you had in mind. -Rich -->

In Liferay, many settings can be configured at different scopes or levels. A more granular scope setting supersedes settings above it. For example, a configuration set at the site level supersedes configuration at the system level or instance level. This way, you can set sensible defaults which scope (i.e., instance or site) owners can override. See [Understanding Configuration Scope](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/understanding-configuration-scope.html) to learn more.

The finished configuration contains

* Antivirus software to scan uploaded files. 
* A support chat system to be used across a Liferay instance.
* A separate virtual instance for companies who purchase Delectable Bonsai syrup that are sold under their own branding.
* A separate file storage solution.
* A connected mail server.

The first step is [Configuring System Settings](./configuration/configuring-system-settings.md).
