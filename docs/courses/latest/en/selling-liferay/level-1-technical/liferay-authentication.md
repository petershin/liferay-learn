---
toc:
  - ./liferay-authentication/other-authentication-methods.md
  - ./liferay-authentication/authorization.md
uuid: 49c5b81d-46ef-4eb5-88f7-86999cf71e4b
visibility: 
- Employee
- Partner
---

# Liferay Authentication

**At a Glance**

* Most prospects will need authenticated applications
* Authentication determines who is allowed to login to an application
* Authorization determines what they are allowed to do once logged in
* Liferay provides its own identity management capabilities
* Liferay Authentication is sufficient for stand-alone and self-contained customer applications

```{note}
* View the [recording](https://learn.liferay.com/documents/d/guest/se1-3-liferay-authentication) from the live workshop of this module.
* Download the [PDF](https://learn.liferay.com/documents/d/guest/se1-3-liferay-authentication-pdf) of the presentation used in the live workshop.
```

## Background

Up to this point in a demo only [public pages](./public-pages-experience.md) have been covered. These types of pages are great for applications like Public Websites but for many (if not most) Liferay applications there will be a need to control who can access the system - and what they can do once they get there.

This module covers the sorts of capabilities Liferay provides to support applications where not everyone is allowed to login - and even when they do login, they are not necessarily allowed to access everything.

The module covers capabilities provided by Liferay to support:

* Authentication
* Authorization

## Authentication vs. Authorization

Everyone is familiar with logging in to systems - for example, logging in to your phone or bank account. Technology today provides many ways to do this, for example using a fingerprint, facial recognition, or more traditional things like security codes and passwords.

Sometimes a combination of these techniques are used - in which case the system is utilizing Multi-Factor Authentication - or MFA.

It’s important to realize that when a user “logs in” to a system, two separate, but related things, take place: Authentication and Authorization.

**Authentication**

To keep it simple, Authentication is the process where a user identifies who they are - to determine whether they are allowed to access the system at all.

**Authorization**

Once a user is authenticated, authorization is the process of determining what they are allowed to access - what information they can see, whether they are allowed to create new information, edit existing information, or even delete information.

Using an analogy, the process of authentication can be thought of like opening a lock. With Liferay DXP different types of locks are available to allow users to be authenticated.

## Liferay Authentication

Liferay contains its own Identity Management capabilities - features that allow administrators to:

* Create users
* Define their passwords
* Specify what they can access 

For some stand-alone or self-contained customer applications, with a limited set of users who are able to login - such as a Client Portal, or a dedicated internal system, these capabilities will be sufficient for their needs.

When talking about Liferay’s authentication capabilities during a demo it is useful to explain that Liferay provides three different ways that users can be authenticated, by:

* Screen Name
* Email Address
* User ID

At this stage in the sales process it is usually sufficient to talk about these capabilities at a high-level - the fact that a customer will not need a separate identity management system for simple use-cases will be sufficient.

However, Liferay provides many additional capabilities along with basic authentication, such as allowing Administrators to define Password Policies which include:

* Minimum length of passwords
* What characters passwords must include
* How often they expire
* Whether previous passwords can be reused
* etc.

It is also important to remember that most demos where Login is being shown will be using Liferay’s own Identity Management capabilities. But, there are many other approaches that can be used in production applications, some of which include:

* OpenID Connect
* SAML
* Single Sign-On
* Identity Management Systems

These are all discussed in the next section, [other authentication methods](./liferay-authentication/other-authentication-methods.md).
