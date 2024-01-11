---
uuid: 6abef168-1381-46ae-b190-a9ff7c096d2d
taxonomy-category-names:
- Platform
- DXP Configuration
- Content Management System
- Liferay Self-Hosted
---
# Amazon Simple Storage Service

{bdg-primary}`Self-Hosted Only`

Amazon's simple storage service (S3) is a cloud-based storage solution that DXP's S3 Store uses to store files seamlessly to the cloud. Once you have an AWS account and have created an S3 *bucket*, you can configure the S3 store.

S3 uses the concept of buckets for file storage. In Amazon's UI, create a [bucket](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html) for your DXP files. Configure the bucket in a [geographical region](https://docs.aws.amazon.com/general/latest/gr/s3.html) that is as close as possible to your DXP server host.

When you create an [AWS account](https://aws.amazon.com/s3/), Amazon assigns you [unique keys](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html/) that link you to your account. You'll use these keys to configure the S3 Store. 

```{note}
No action is required to support AWS Signature Version 4 request authorization.
```

## Setting Up a SAXParser

Amazon S3 requires a SAXParser. If no SAXParser is available in your environment,

1. Download the [Xerces SAXParser](https://xerces.apache.org/mirrors.cgi) to your application server's global library folder: `/lib/ext` on Tomcat or `/module` on JBoss EAP and WildFly.

1. Specify the SAXParser in a [`system-ext.properties`](../../../installation-and-upgrades/reference/system-properties.md) file:

    ```properties
    org.xml.sax.driver=com.sun.org.apache.xerces.internal.parsers.SAXParser
    ```

1. Copy the `system-ext.properties` file to a folder that resides in the DXP application class path (for example: `/WEB-INF/classes/`).

## Configuring the Store

1. Configure [`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md):

    ```properties
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

1. Restart DXP.

1. In the Control Panel, navigate to *Configuration* &rarr; *System Settings* &rarr; *File Storage*.

1. In the *S3 Store* screen, configure the store:

    * **Bucket Name**: Your bucket's name.
    * **Access Key**: Your AWS access key.
    * **Secret Key**: Your secret key.
    * **S3 Region**: The [geographic region](https://docs.aws.amazon.com/general/latest/gr/s3.html); the default is `us-east-1`.

    ![Amazon S3 Store Configurations](./amazon-s3-store/images/01.png)

1. Leave the other fields as the default settings.

1. Click *Save*.

Your DXP instance is now using the Amazon S3 store.

```{important}
Consider [enabling antivirus scanning for uploaded files](../enabling-antivirus-scanning-for-uploaded-files.md).
```

## Using the Store in a Clustered Environment

Follow these steps to use S3 Store in a clustered environment:

1. If your application server doesn't already have SAXParser, copy [Xerces SAXParser](https://xerces.apache.org/mirrors.cgi) to each node's application server global library folder.

1. Copy the `system-ext.properties` file to the DXP application's `/WEB-INF/classes/` folder.

DXP is using the Amazon S3 store throughout your cluster.

## Database Rollback Limitation

```{warning}
If a database transaction rollback occurs in a Document Library, the transaction's file system changes are **not** reversed. Inconsistencies between Document Library files and those in the file system store can occur and may require manual synchronization. All of the DXP stores except [DBStore](./dbstore.md) are vulnerable to this limitation.
```

Consult the Amazon Simple Storage documentation for additional details on using Amazon's service.

## Related Topics

* [Configuring File Storage](../../file-storage.md)
* [Bucket Restrictions and Limitations](https://docs.aws.amazon.com/AmazonS3/latest/dev//BucketRestrictions.html#bucketnamingrules)
* [DBStore](./dbstore.md)
* [File Store Migration](../file-store-migration.md)
