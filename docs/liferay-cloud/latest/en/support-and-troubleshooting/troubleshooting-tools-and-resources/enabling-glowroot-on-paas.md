---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Development and Tooling
- Liferay PaaS
uuid: 1f809dd9-0c27-43e0-9223-c5d27949fab0
---
# Enabling Glowroot on PaaS

Glowroot is included with Liferay since {bdg-secondary}`Liferay DXP 7.4-u100`. By default, it is inside `/opt/liferay/glowroot`. The steps to enable Glowroot differ based on your storage solution.

## Enabling Glowroot with SFS

1. To persist configuration changes, move Glowroot to `/opt/liferay/data`, as such:

   ```bash
   mv /opt/liferay/glowroot /opt/liferay/data/
   ```

1. Configure the data directory with the following JVM option:

   ```json
   "env": {
     "LIFERAY_JVM_OPTS": "-javaagent:/opt/liferay/data/glowroot/glowroot.jar -Dglowroot.data.dir=/opt/liferay/data/glowroot-data"
   }
   ```

1. Enable port 4000 for internal Glowroot UI access:

   ```json
   "ports": [
     {
       "port": 4000,
       "external": false
     }
   ]
   ```

## Enabling Glowroot with GCS

1. To persist configuration changes, move Glowroot to `/opt/liferay/data/license`, as such:

   ```bash
   mv /opt/liferay/glowroot /opt/liferay/data/license/
   ```

1. Configure the data directory with the following JVM option:

   ```json
   "env": {
     "LIFERAY_JVM_OPTS": "-javaagent:/opt/liferay/data/license/glowroot/glowroot.jar -Dglowroot.data.dir=/opt/liferay/data/license/glowroot-data"
   }
   ```

1. Enable port 4000 for internal Glowroot UI access:

   ```json
   "ports": [
     {
       "port": 4000,
       "external": false
     }
   ]
   ```

## Accessing Glowroot

1. Visit the site and log in.

1. Append `/o/glowroot` to the end of the site's URL. For example, if the site's URL is `https://webserver-acme-dev.lfr.cloud`, navigate to `https://webserver-acme-dev.lfr.cloud/o/glowroot`.

!!! tip
    For more security, create an Administrator user with a username and secure password. Then, delete the anonymous user.

## Related Topics

- [Using Glowroot with Liferay](https://learn.liferay.com/w/dxp/system-administration/using-glowroot-with-liferay)