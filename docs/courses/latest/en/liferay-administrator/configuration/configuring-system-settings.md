---
uuid: ed60ae33-a661-4593-844a-cb91c1379427
---
# Configuring System Settings

System settings apply across any instance, site, or widget that you may have. Although it is useful to have granular control over your configurations, there may be situations where you need to configure a setting that applies across your entire environment. For example, configuring an antivirus at the system level to scan any file that is uploaded to Liferay. See [System Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/system-settings.html) to learn more.

### System Settings in LXC

System settings are not accessible in LXC. Contact your Liferay Cloud support person to configure system settings.

### System Settings in LXC-SM or On-Premises

Liferay supports [ClamAV](https://www.clamav.net/), an open-source antivirus software. Configure ClamAV antivirus software in system settings.

```{note}
Follow the [ClamAV Documentation](https://docs.clamav.net/) to setup ClamAV to run on the platform you plan to use with your Liferay environment.
```

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _System Settings_. 

1. Under security, click _Antivirus_.

1. In the left navigation, click _Antivirus Clamd Scanner_.

1. Input the settings.

   * Hostname or IP Address - Your server environment that is running ClamAV.
   * Port - The port number of your server.
   * Socket Connection SO Timeout Time - A timeout time in milliseconds.

1. Click _Update_. Your Liferay environment is now configured to scan any uploaded file with ClamAV.

The next step is to [configure instance settings](./configuring-instance-settings.md).

## Relevant Concepts

- [System Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/system-settings.html)
- [Enabling Antivirus Scanning for Uploaded Files](https://learn.liferay.com/dxp/latest/en/system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.html)
