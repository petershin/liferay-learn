---
uuid: 5b426154-d64f-4cdf-8a50-a240267218da
taxonomy-category-names:
- Commerce
- Client Extensions
- Development and Tooling
- Developer Tools
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using the Stripe Client Extension

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`

Liferay provides a client extension that integrates with [Stripe](https://stripe.com). It uses the payment integration client extension as a base. This client extension from the [Stripe workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-stripe-workspace) consists of a standalone Spring Boot application that communicates with Liferay using OAuth 2. See [Configuring Payment Methods](../../store-management/configuring-payment-methods.md) to read more about the payment methods available out-of-the-box with Liferay.

## Prerequisites

1. Install Java (JDK 8 or JDK 11).

   !!! note
       Check the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for supported JDKs, databases, and environments. See [JVM Configuration](https://learn.liferay.com/w/dxp/installation-and-upgrades/reference/jvm-configuration) for recommended JVM settings.

1. Download and unzip the Stripe workspace:

   ```bash
   curl -o com.liferay.stripe.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.stripe.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip -d liferay-stripe-workspace com.liferay.stripe.workspace-latest.zip
   ```

Now you have the tools to deploy the client extension to Liferay. 

```{include} /_snippets/run-liferay-portal.md
```

## Deploy the Stripe Client Extension

1. Go to the Stripe workspace. Run

   ```bash
   ./gradlew initBundle
   ```

   This downloads a bundle inside the Stripe workspace's `/bundles` folder.

1. Go to the `/bundles/tomcat/bin` folder. Run

   ```bash
   ./catalina run
   ```

1. Go back to the Stripe workspace's `/client-extensions/liferay-stripe-commerce-payment-integration` folder.

1. Run

   ```bash
   ../../gradlew clean createClientExtensionConfig deploy
   ```

1. In Liferay's log, confirm that the client extension deployed and started:

   ```log
   2024-05-23 13:12:26.386 INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:212] Processing liferay-stripe-commerce-payment-integration.zip
   2024-05-23 13:12:26.535 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:68] STARTED liferaystripecommercepaymentintegration_7.4.13 [1432]
   ```

   In addition, messages about the OAuth user agent are logged.

   ```log
   2024-05-23 13:12:26.545 INFO  [CM Event Dispatcher (Fire ConfigurationEvent: pid=com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-stripe-commerce-payment-integration-oauth-application-user-agent)][InterpolationConfigurationPlugin:135] Replaced value of configuration property 'homePageURL' for PID com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-stripe-commerce-payment-integration-oauth-application-user-agent
   2024-05-23 13:12:26.601 INFO  [CM Event Dispatcher (Fire ConfigurationEvent: pid=com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-stripe-commerce-payment-integration-oauth-application-user-agent)][OAuth2ProviderApplicationUserAgentConfigurationFactory:170] OAuth 2 application with external reference code liferay-stripe-commerce-payment-integration-oauth-application-user-agent and company ID 20095 has client ID id-bfd2c6b8-e77a-dc45-9d0a-736eaadb
   ```

1. Verify that the OAuth Application User Agent was added to Liferay. Go to _Control Panel_ &rarr; _OAuth2 Administration_.

![The Liferay Stripe Commerce Payment Integration OAuth Application User Agent is added when you deploy the client extension.](./use-the-stripe-client-extension/images/01.png)

The Liferay Stripe Commerce Payment Integration OAuth Application User Agent provides the [OAuth 2 authorization](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) needed so that Liferay can access the Spring Boot application's data through its protected endpoint. All that is needed for Liferay to authorize the application in this case is declaring the external reference code in `application-default.properties`:

```properties
liferay.oauth.application.external.reference.codes=liferay-stripe-commerce-payment-integration-oauth-application-user-agent
```

## Start the Microservice

From the `client-extensions/liferay-stripe-commerce-payment-integration` folder, run

```bash
../../gradlew bootRun
```

The Spring Boot application starts and prints messages in the log:

```log
...
2024-05-30 12:51:26.487  INFO 9315 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 58081 (http) with context path ''
2024-05-30 12:51:26.494  INFO 9315 --- [           main] c.l.stripe.StripeSpringBootApplication   : Started StripeSpringBootApplication in 2.103 seconds (JVM running for 2.369)
<==========---> 80% EXECUTING [18s]
> :client-extensions:liferay-stripe-commerce-payment-integration:bootRun
```

## Verifying the Addition of Stripe as a Payment Method

1. Log in as an administrator, open the _Global Menu_ (![Applications Menu icon](../../images/icon-applications-menu.png)), and go to _Control Panel_ &rarr; _Sites_.

1. Add a new Minium site.

1. Open the _Global Menu_ (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to _Commerce_ &rarr; _Channels_.

1. Select _Minium Portal_ and scroll down to the Payment Methods section. Verify the addition of Stripe as a new payment method here. It is inactive by default.

   ![Verify the addition of Stripe as a new payment method.](./using-the-payment-integration-client-extension/images/02.png)

1. Select the new payment integration and activate it using the _Active_ toggle.

1. Click _Save_. Two new tabs, _Eligibility_ and _Configuration_, appear for the payment integration.

   The configuration tab contains an input field. You must enter an API key that you can obtain from your [Stripe Dashboard](https://dashboard.stripe.com/login).

   ![Enter your Stripe API key to complete the integration.](./using-the-payment-integration-client-extension/images/03.png)

   You can go to the Eligibility tab to select specific order types or payment terms to be eligible for the payment integration. By default, it is eligible for all order types and payment terms.

1. Click _Save_.

1. Open the site and use the account selector to create a new account.

1. Add a few items to your cart.

1. Open the mini cart and click _Submit_. This starts the checkout flow.

1. Continue checking out until you reach the order summary page. Click _Continue_ to redirect to Stripe. Enter the necessary details and click _Pay_. After confirming payment, you're automatically redirected back to Liferay. Open the _Global Menu_ (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to _Commerce_ &rarr; _Payments_ to verify the payment’s completion.

![Go to Stripe and enter your payment details to complete the order.](./using-the-payment-integration-client-extension/images/04.gif)

!!! note
    The above flow is using Stripe's test mode. Stripe provides numerous test card numbers to replicate different payment scenarios. See [How to use test cards](https://docs.stripe.com/testing#use-test-cards) for more information.