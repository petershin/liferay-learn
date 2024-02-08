---
uuid: ba75bce7-ccf4-4c5a-bffe-7c247434dac2
---

# Integrating Okta SSO

Clarity wants to use Okta, a Security Assertion Markup Language (SAML) based authentication single sign-on service with Liferay. They appreciate the convenience of one login for not only Liferay, but the other services they need logins for. In addition to authentication, they are relying on Okta to serve as their identity provider (IdP) and sync all user identities with Liferay. Continue reading see the basic steps to set up your Liferay DXP instance as the Service Provider (SP), and Okta as the Identity Provider (IdP).

## Okta Configuration

1. Log in to [Okta Dev](https://developer.okta.com/login/) and navigate to Admin > Add Application (Shortcuts in the right menu) > Create New App. 

    *Note, this tutorial requires you to have an existing account with Okta to test with.

1. Select SAML 2.0.

1. Enter *liferaysaml* as the name and click next.

1. Enter the following fields:
    - Single sign-on URL: *http://localhost:8080/c/portal/saml/acs*
    - Audience URI (SP Entity ID): *samlspdemo*
    - Name ID format: *EmailAddress*
    - Application username: *Email*

    ![Configuring SAML Integration](./integrating-okta-sso/images/01.png)

1. Select Attribute Statements
    - `screenName (Unspecified) = user.firstName`
    - `firstName (Unspecified) = user.firstName`
    - `lastName (Unspecified) = user.lastName`
    - `emailAddress (Unspecified) = user.email`

1. Click *Next*, check the second box on either you are a customer or partner > *Finish*.

1. On the Sign On tab, confirm that Application username format is set to to Email.

1. On the Sign On tab, under SAML Setup on the right side, click *View SAML Setup Instructions* button.

1. Under the Optional heading, select all the xml text and use it to create `oktametadata.xml`.

1. Navigate to Applications &rarr; Applications. Click on the down arrow for the *liferaysaml* application. Click on *Assign to Users*, click *Assign* for your users, then on *Save and Go Back*.

## Liferay DXP Configuration

1. Log in to Liferay and navigate to _Control Panel_ &rarr; _Security_ &rarr; _SAML Admin_.

1. Set the SAML Role to *Service Provider*, and Entity ID to *samlspdemo*.

1. Click *Create Certificate* under the certificate and private key section.
    - Enter the common name as `foo`.
    - Scroll down to the bottom. Input the key password as `learn`.
    - Click *Save*.
    - Finally, tick the *Enabled* checkbox under the general tab and click *Save*.

1. In Service Provider tab, keep the default settings and click *Save*.
    - *Clock Skew*: 3000
    - *Sign Authn Requests?* selected
    - *Sign Metadata?* selected
    - *Allow showing the login portlet.* selected

1. In Identity Provider Connections tab, click *Add Identity Provider* and set the following:
    1. Name: *okta*
    1. Enter the entity ID (found in xml file as `entityID`)
    1. Check the *Enabled* box
    1. Choose *Upload Metadata XML* and upload the `oktametadata.xml` file created previously
    1. Set *Name Identifier Format* to *Email Address*
    1. Enter the following attributes under Basic User Fields:

        | User Field Expression | SAML Attribute |
        |:----------------------|:---------------|
        | emailAddress          | emailAddress   |
        | firstName             | firstName      |
        | lastName              | lastName       |
        | screenName            | screenName     |

    1. Click on *Save*

1. Go back to *General* tab and enable the Service Provider. Click *Save*.

2. (Optionally) Add a `Sign In` widget to a temporary site page and publish it. In case the SSO is not working, this can provide a login workaround while testing.

1. Open a new browser and click top right *Sign In* which will redirect user to Okta sign in page.

    ![Okta sign in page after user being redirected](./integrating-okta-sso/images/02.png)

1. Fill in the user email and password.

1. User will be redirected back to Liferay home page and automatically signed in.

Congratulations! You've completed Module 4 - Identity Management and SSO.

[Back to Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)
