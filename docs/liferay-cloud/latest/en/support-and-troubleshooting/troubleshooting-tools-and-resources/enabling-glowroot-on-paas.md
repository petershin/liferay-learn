---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Development and Tooling
- Liferay PaaS
uuid: 1f809dd9-0c27-43e0-9223-c5d27949fab0
---

# Enabling Glowroot on PaaS

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA100+`

Glowroot is included with Liferay in the `/opt/liferay/glowroot` folder.

If you're running Liferay in a clustered environment, enable Glowroot with JVM options:

```json
"env": {
  "LIFERAY_JVM_OPTS": "-javaagent:/opt/liferay/glowroot/glowroot.jar -Dglowroot.enabled=true"
}
```

If your Liferay instance is not clustered, you can persist Glowroot data. To enable Glowroot and persist its data, follow these steps:

1. Create a directory to store this data in `/mnt/persistent-storage`:

   ```bash
   mkdir /mnt/persistent-storage/glowroot-data
   ```

1. Enable Glowroot and configure the data directory with JVM options:

   ```json
   "env": {
     "LIFERAY_JVM_OPTS": "-javaagent:/opt/liferay/glowroot/glowroot.jar -Dglowroot.data.dir=/mnt/persistent-storage/glowroot-data -Dglowroot.enabled=true"
   }
   ```

## Accessing Glowroot

1. Visit the site and log in.

1. Append `/o/glowroot` to the end of the site's URL. For example, if the site's URL is `https://webserver-acme-dev.lfr.cloud`, navigate to `https://webserver-acme-dev.lfr.cloud/o/glowroot`.

1. Create an Administrator user with a username and secure password. Then delete the anonymous user.

## Related Topics

- [Using Glowroot with Liferay](https://learn.liferay.com/w/dxp/system-administration/using-glowroot-with-liferay)