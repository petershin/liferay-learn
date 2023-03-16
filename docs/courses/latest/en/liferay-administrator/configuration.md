---
toc:
  - ./configuration/configuring-system-settings.md
  - ./configuration/configuring-virtual-instances.md
  - ./configuration/configuring-instance-settings.md
  - ./configuration/server-administration-and-email.md
uuid: bfffa7f5-ad04-4b57-9ee8-f1f8d5b1a300
---
# Configuration

```{toctree}
:maxdepth: 3

configuration/configuring-system-settings.md
configuration/configuring-virtual-instances.md
configuration/configuring-instance-settings.md
configuration/server-administration-and-email.md
```

Now it's time to configure the environment to suit your business needs. In Liferay, many settings can be configured at different scopes or levels. A more granular scope setting supersedes settings above it. For example, a configuration set at the site level supersedes configuration at the system level or instance level. This way, you can set sensible defaults which scope (i.e., instance or site) owners can override. See [Understanding Configuration Scope](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/understanding-configuration-scope.html) to learn more.

The finished configuration contains

* Antivirus software to scan uploaded files. 
* A separate virtual instance for companies who purchase Delectable Bonsai syrup that are sold under their own branding.
* A separate user authentication setting for the virtual instance.
* A connected mail server.

The first step is [Configuring System Settings](./configuration/configuring-system-settings.md).
