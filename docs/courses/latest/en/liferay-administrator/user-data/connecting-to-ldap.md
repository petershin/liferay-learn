---
uuid: 9540baaf-7e04-40a2-9a4a-1409d3526092
---
# Connecting to LDAP

An LDAP server can be configured at the system level or instance level in Liferay. Choose the [configuration scope](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/understanding-configuration-scope) based on your needs. Note, when configuring at the system scope, you must specify each instance ID. See [Connecting to an LDAP Directory](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory).

Delectable Bonsai must import user data from a company they just acquired. In real life, you'd already have an LDAP server to use. Here, you'll simulate one.

1. Start a new OpenLDAP container.

   ```bash
   docker run \
	   --env LDAP_ORGANISATION="Almighty Syrup" \
	   --env LDAP_DOMAIN="almightysyrup.com" \
	   --env LDAP_BASE_DN="dc=almightysyrup,dc=com" \
	   --name almightysyrupldap \
	   -p 389:389 \
	   -p 636:636 \
	   osixia/openldap:1.5.0
   ```

1. Find the IP address of the `almightysyrupldap` container. This will be used in the configuration step below.

   ```bash
   docker network inspect bridge
   ```

1. Generate an LDIF file that will be used to seed the LDAP with a user and a user group.

   ```bash
   cat <<EOT >> sarah.ldif
   dn: cn=sarah,dc=almightysyrup,dc=com
   objectClass: inetOrgPerson
   objectClass: organizationalPerson
   objectClass: person
   objectClass: top
   cn: Sarah
   sn: Stanley
   givenName: Sarah
   mail: sara@almightysyrup.com
   title: IT Staff
   userPassword: learn

   cn: almightysyrup
   dn: cn=almightysyrup,dc=almightysyrup,dc=com
   objectClass: groupOfUniqueNames
   objectClass: top
   uniqueMember: cn=sarah,dc=almightysyrup,dc=com
   EOT
   ```

1. In terminal, navigate to the same folder as the LDIF file. Copy the file into the container.

   ```bash
   docker cp sarah.ldif almightysyrupldap:/container/service/slapd/assets/test
   ```

1. Add the entry into the OpenLDAP server.

   ```bash
   docker exec almightysyrupldap ldapadd -x -D "cn=admin,dc=almightysyrup,dc=com" -w admin -f /container/service/slapd/assets/test/sarah.ldif -H ldap://localhost
   ```

Now in Liferay, connect to the company's LDAP server with the steps below. 

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. 

1. Under security, click _LDAP_.

1. In the left navigation, click _Servers_. 

1. Click _Add_.

1. In the new page, fill in the LDAP connection information.

   * Server Name: `Almighty Syrup`
   * Base Provider URL: `ldap://[IP address]:389`
   * Base DN: `dc=almightysyrup,dc=com`
   * Principal: `cn=admin,dc=almightysyrup,dc=com`
   * Credentials: `learn`

   ![Fill in the connection information.](./connecting-to-ldap/images/01.png)

   Click _Test LDAP Connection_. A new popup window shows that Liferay has successfully connected to the LDAP server. Click the _X_ and close the window.

1. Next, fill in the LDAP user information section. Make sure that required fields such as name and email are mapped correctly. Click _Test LDAP Users_ to preview the mapping of user fields.

   ![Fill in the user fields information.](./connecting-to-ldap/images/02.png)

1. Next, fill out the LDAP groups information. Click _Test LDAP Groups_ to verify that the `almightysyrup` user group is visible.

1. Finally, fill out the LDAP export information. Click _Save_.

The next step is [importing and exporting users](./importing-and-exporting-users.md).

## Relevant Concepts

[Connecting to an LDAP Directory](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory)
