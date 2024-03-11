---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay SaaS
uuid: df455d9d-54bc-4ab8-8bef-db9f430a6ac3
---
# Liferay SaaS Go-Live Checklist

Liferay Cloud is committed to your project's smooth launch. Here is a list of steps you should take to prepare in advance for your production environment to go live.

## Inform Liferay Cloud Support

First, once you know the date your production environment will go live, submit a Support ticket **at least 8 days before the site's activation**.

Include this information in your ticket:

1. The date you plan to go live.

1. Any custom domains your site(s) will use.

1. Whether you will use a custom SSL certificate. *If so, provide the certificate*.

## Create a DNS Record with Your Chosen Provider

Liferay requires a Canonical Name (CNAME) record for the domain associated with your project (e.g., `exampleproject.lxc.liferay.com`), using your project ID. Your project ID is provided during provisioning.

You can also find your project ID by navigating to your client extensions environment (e.g., your `extprd` environment), and coyping it from the URL. The project ID is between a random 4-digit code and the dash ("-"):

![You can find your project ID from the URL in your client extensions environment.](./liferay-saas-go-live-checklist/images/01.png)

!!! note
    Some DNS providers do not offer CNAME records to base domain names. In those cases, try to use the *ALIAS* record. Otherwise, please notify Support on the [ticket you created](#inform-liferay-cloud-support).

## Create Custom SSL Certificates (Optional)

If you are creating a custom SSL certificate, keep these considerations in mind:

* The SSL certificate must also contain the intermediate certificates.

* When sending an SSL certificate with Liferay Cloud Support, upload it in a `.zip` file secured with a password, and share the password in a secure channel. Use the Large File Uploader tool instead of uploading it as a normal attachment.

* To avoid service interruption when your SSL certificate expires, provide Liferay Cloud Support with the new certificate *before the last maintenance window before the expiration*. You can provide the new certificate on a Support ticket.

## Adjust TTL when Transferring Your Domains

When transferring a custom domain to your new site on Liferay SaaS, DNS caching can significantly impact the time for the site to go live.

Avoid long DNS caching times by reducing the Time to Live (TTS) field on your DNS record to a few minutes, at least a few days before you go live. Once your instance goes live, return the TTS to a longer value.

## Additional Considerations

This checklist was designed with a typical Liferay SaaS instance in mind. Take special consideration for any of your project's unique needs, like client extension implementations.
