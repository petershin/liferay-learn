---
uuid: e63f1fb0-18dc-4e03-b118-429883b0cbec
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Encrypted Fields

{bdg-primary}`Self-Hosted and Self-Managed Only`

{bdg-secondary}`Liferay 7.4 U72+/GA72+`

Liferay provides the encrypted field type for storing sensitive user data. To use encrypted fields, first add an encryption algorithm and key to your portal properties. Then add an encrypted field to your object definition. Once data is encrypted, only users with the decryption key can read it.

```{important}
Encrypted fields store string values and cannot be used to encrypt images or file types. Filtering, sorting, and indexing are not supported for encrypted fields. Additionally, field encryption is not available for [proxy object definitions](../../integrating-objects-with-third-party-services/managing-data-from-external-systems.md).
```

## Adding an Encryption Algorithm and Key

To use encryption algorithms and keys for objects, you must add these properties to your [`portal-ext.properties`](../../../../installation-and-upgrades/reference/portal-properties.md) file:

```properties
object.encryption.algorithm=[value]

object.encryption.key=[value]
```

Supported algorithm values include `AES`, `Blowfish`, and `DES`. Encryption key values must use base64 encoding. For example:

```properties
object.encryption.algorithm=AES

object.encryption.key=D9z5Rwxkn+8SctNWW/q/OA==
```

## Adding an Encrypted Field

1. Open the *Global Menu* ( ![Global Menu](../../../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the desired object definition.

1. Go to the *Fields* tab and click *Add* ( ![Add Button](../../../../images/icon-add.png) ).

1. Enter a *Label* and *Field Name*.

1. Select the *Encrypted* field type.

1. Determine whether the field is mandatory.

1. Click *Save*.

   ```{note}
   You cannot save encrypted fields without an encryption algorithm and key.
   ```

You can use this field to store encrypted string values. If desired, you can configure the field limit the number of characters allowed.

## Accessing Encrypted Data

Only users with the decryption key can read encrypted field values. If your Liferay instance has a valid encryption key, authorized users can view and export the field's data via the Liferay UI or REST APIs. However, if an encryption key is lost or becomes invalid, users cannot access or export entries for any object definition with encrypted fields. When attempted, Liferay returns a 400 error and directs users to either insert a valid encryption key or remove the object's encrypted fields to recover your entries.

```{important}
Losing your key can result in data loss. Please manage your encryption key with care. You are responsible for ensuring your data and key are backed up and stored in a safe place.

<!-- If your key is ever compromised, please export your object data using the Import/Export Center, update the `object.encryption.key` property, and reimport your data. -->
```

## Related Topics

* [Portal Properties](../../../../installation-and-upgrades/reference/portal-properties.md)
* [Adding Fields to Objects](./adding-fields-to-objects.md)
