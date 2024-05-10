---
toc:
- ./configuration/configuring-system-settings.md
- ./configuration/configuring-virtual-instances.md
- ./configuration/configuring-instance-settings.md
- ./configuration/server-administration-and-email.md
uuid: bfffa7f5-ad04-4b57-9ee8-f1f8d5b1a300
---
# Configuration

The story begins after Liferay has been installed or an instance created in Liferay SaaS or PaaS. Clarity Vision Solutions' IT administrators, with your help, must get the system configured and its users registered so they can create the website and its content. 

Many settings can be configured at a hierarchy of scopes or levels. A more granular scope setting supersedes settings above it. For example, a configuration set at the site level supersedes configuration at the system level or instance level. This way, you can set sensible defaults which scope (i.e., instance or site) owners can override. See [Understanding Configuration Scope](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/understanding-configuration-scope) to learn more.

The finished configuration contains

* Antivirus software to scan uploaded files 
* A separate virtual instance for two internal sites: a B2B site for partners and an internal Intranet
* A separate user authentication setting for the virtual instance
* A connected mail server

The first step is Configuring System Settings.

[Let's Go!](./configuration/configuring-system-settings.md)
