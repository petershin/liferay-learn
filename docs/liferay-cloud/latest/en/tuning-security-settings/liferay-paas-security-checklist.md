---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 19b6a9b4-b554-49d0-ad37-edbe0a0517e9
---
# Liferay PaaS Security Checklist

Here are a list of best practices for tightening and maintaining your Liferay PaaS project's security, including networking practices, data security, and general security measures.

## General Security Measures

### Project Repository

The default GitHub repository is a template provided as a starting point to start managing your services. For privacy regulations, you should not commit your own organization's code to it.

Migrate the default GitHub repository to your own organization's private repository (GitHub, GitLab, or Bitbucket) before committing code to it.

### Security Patches

Apply all Liferay DXP and Liferay PaaS security-related fixes (by updating the Docker images) as soon as they are released.

Liferay DXP images are published on [Docker Hub](https://hub.docker.com/r/liferay/dxp/tags). See the newest Liferay Cloud service release notes [here](https://help.liferay.com/hc/en-us/sections/360006251311-Services-Changelog).

### Commits to Your Repository

Make sure not to commit any sensitive information (including licenses, credentials, secrets, etc.) to your repository. Use Liferay Cloud [secrets](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md) to manage credentials or other sensitive variables needed for your project.

!!! note
    Your Liferay PaaS subscription includes an enterprise Liferay DXP license automatically deployed with your environment. You do not need to supply a license with your installation.

### Code Scans

Liferay PaaS includes a [customizable CI pipeline](../platform-services/continuous-integration.md) for builds. Add code scans to your CI process to enforce and automate cleaner and safer code practices.

### Elasticsearch Security

Enable Elasticsearch security features by setting the `ENABLE_XPACK_SECURITY` environment variable to `true` in your search service. See [Elasticsearch's security settings documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/security-settings.html) for more information.

## Account Management

### Single Sign-On

Liferay PaaS can integrate with any SAML 2.0-compliant Single Sign-On (SSO) Identity Provider to authenticate users with Liferay Cloud. Set up multi-factor authentication for developers or IT team members using any identity provider that supports it.

### Default Administrator Account

If you deploy an out-of-the-box Liferay Portal build to your production environment, a default user (`test@liferay.com`) is available for sign-in with a *weak password*. Change this password as soon as possible.

### User Activity Audits

At least quarterly, perform a periodic audit of user activities in each Liferay PaaS environment and in Liferay DXP.

### Team Members

At least quarterly, audit team members and their permissions for each environment and delete inactive team members, for both members of your Liferay PaaS project and roles in Liferay DXP.

## Network Controls

### Public Endpoints

Avoid exposing database (or other service) endpoints to the internet. Publicly exposing these endpoints bypasses the HTTPS load balancer's DDoS protection.

### Rate Limiting

You can configure Nginx to throttle requests to the Liferay service. Monitor your environment's traffic patterns and configure these settings to acceptable limits to access rates.

### DNS Security

Ensure that your chosen DNS provider implements best DNS security practices.

## Backups

### Backup Downloads

Backups in Liferay PaaS are always encrypted at rest and in transit. However, if you download a backup to a local machine, ensure that you've mapped out your data flow to comply with any required security regulations.

### PII Sanitizing

Using production data in non-production environments can help for debugging purposes but still poses risks. Implement scripts to perform PII data masking when restoring these backups into non-production environments.

## HTTP Layer

### Ciphers

If it's required for compliance, you may request an increase to the restrictions on the cipher policy for SSL to reduce the allowed features.

By default, the policy allows a broad set of clients to negotiate SSL, including clients that support only out-of-date SSL features.

### CORS

Cross-origin resource sharing (CORS) can allow resource requests from an outside domain. Configure your Liferay DXP instance to allow only domains that are required to interact with your web application.

See [Setting Up CORS](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors) for more information.

### Content Security Policy

The Content Security Policy (CSP) prevents web browsers from loading malicious resources. Configure the `Content-Security-Policy` header for security compliance in your Nginx configuration file.

### URL Redirects

Ensure that HTTP-to-HTTPS redirects first direct to a secure version of the same original site, to prevent man-in-the-middle redirects to malicious sites. Ensure that redirects never point to HTTP addresses.

Configure URL redirects via your environment's Nginx configuration file.

### HSTS

The HTTP Strict Transport Security (HSTS) header ensures that users are immediately connected to the HTTPS website after the initial visit. Configure the `Strict-Transport-Policy` header for security compliance via your environment's Nginx configuration file.

### Web Browsers

Configure Nginx to verify the user agent header and block access to the site from outdated web browsers.

## Secrets

### Storage and Rotation

Only store secrets in safe, secure locations, and rotate them on fixed intervals.

### Disaster Recovery Master Token

Create your master token as a secret when [configuring your disaster recovery environment](../support-and-troubleshooting/troubleshooting-tools-and-resources/configuring-cross-region-disaster-recovery.md).

### Repository Access

Create your Git repository's Private Access Token (PAT) as a secret value.

### Dynatrace

If your Liferay PaaS subscription includes Dynatrace, create the Dynatrace tenant and token values as secrets.

### SSL Certificates

When installing custom SSL certificates, create the key and certificate properties as secrets.

### Development Environment Access

The `dev` environment's Liferay DXP access is protected by default credentials, which are shared in your provisioning email. Customize the Nginx configuration and set your own credentials, and store them as secrets.

