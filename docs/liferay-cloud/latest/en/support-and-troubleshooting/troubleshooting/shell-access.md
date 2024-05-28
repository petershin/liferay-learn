---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: f07a9783-3f56-478b-b4b4-570606f04f29
---
# Shell Access

The command-line tools in Liferay Cloud contribute to the developer's workflow by delivering speed, control, traceability, scripting, and automation capabilities. Shell access makes it simpler to see what's going on inside your application. For example, you can use the shell to look for side effects not easily spotted in the logs. You can also call functions for data population or report generation that are meant to run only once.

!!! note
    The backup and database services do not provide shell access.

## Accessing the Shell via the Web Console

1. Go to your environment page.

1. Click *Services* in the menu on the left.

1. Select the service you want to access, then click the *Shell* tab.

![Access the shell via Liferay Cloud's web console.](./shell-access/images/01.png)

## Accessing the Shell via a Terminal

1. [Install the Liferay Cloud command line tool](../../reference/command-line-tool.md) if it's not already installed.

1. Run the command `lcp shell`, then select the service to access.

1. Run any command that you want.

![Access the shell via the command line.](./shell-access/images/02.png)

Alternatively, if you already know which service and project you want to access, you can run this command instead:

```shell
lcp shell -p projectID -s serviceID
```

## Enabling Shell Access

For security reasons, shell access for contributors is disabled by default. You can enable shell access in the *Access* tab in the *Settings* page.

![You can enable shell access in the Settings page.](./shell-access/images/03.png)

## Shell Limitations

The shell is a great tool to troubleshoot or perform one-time actions on your service, but it's not intended for permanent changes. When you deploy or restart your service, all files not in a persistent volume are replaced by the new build. For the shell, this means every command you run on your service is temporary and will reset when you redeploy or restart your service, unless you make the changes within a volume.

## Related Topics

- [Support Access](../liferay-cloud-support/support-access.md)
- [Managing Secure Environment Variables with Secrets](../../tuning-security-settings/managing-secure-environment-variables-with-secrets.md)
- [Private Network](../../configuring-the-cloud-network/private-network.md)
