---
uuid: d40fdaf9-2b3e-4ce7-be84-11faf6f8dd14
---
# Password Policies

Password policies are rules set for everything having to do with passwords: 

- Age
- Length and syntax
- History
- Expiration
- Lockout rules
- Change rules

Password policies can be applied to the whole instance, to organizations, or to individual users. 

Delectable Bonsai needs different password policies for its two instances. For the public website, the defaults work except they want to add some syntax rules to encourage users to choose more secure passwords. For Breakfast, the internal intranet, they want more security: syntax rules, password history, expiration, and lockout. 

## Setting the Password Policy for the Public Website

1. From <http://localhost:8080>, go to the _Global Menu_ &rarr; _Control Panel_ &rarr; _Security_ &rarr; _Password Policies_. 

1. Click the _Default Password Policy_. 

1. Toggle _Enable Syntax Checking_ and configure these options: 

   - Minimum Alpha Numeric: 1
   - Minimum Length: 6
   - Minimum Lower Case: 1
   - Minimum Numbers: 1
   - Minimum Upper Case: 1

1. Click _Save_. 

Users must now use passwords that's at least six characters long, has one letter, one lower case letter, one upper case letter, and one number. 

## Setting the Password Policy for Breakfast

1. From <http://breakfast.delectablebonsai.com:8080>, go to the _Global Menu_ &rarr; _Control Panel_ &rarr; _Security_ &rarr; _Password Policies_. 

1. Click the _Default Password Policy_. 

1. Toggle _Enable Syntax Checking_ and configure these options: 

   - Minimum Length: 8
   - Minimum Lower Case: 1
   - Minimum Numbers: 1
   - Minimum Symbols: 1
   - Minimum Upper Case: 1

1. Under Password History, toggle _Enable History_. Leave the default history count as 6. 

1. Under Password Expiration, toggle _Enable Expiration_ and configure these options: 

   - Maximum Age: 26 Weeks
   - Warning Time: 2 Weeks
   - Grace Limit: 5

1. Under Lockout, toggle _Enable Lockout_ and configure these options: 

   - Maximum Failure: 5
   - Reset Failure Count: 10 Minutes
   - Lockout Duration: Until unlocked by an administrator

1. Click _Save_. 

Breakfast users must now use six passwords before they can repeat one. Their passwords also expire every six months, two weeks prior to which they receive a warning. After their passwords expire, they can still use it up to a grace limit of five times before they are locked out. If they use the wrong password, they get five chances to log in, after which their accounts are locked. If they don't use all five chances, the failure count is reset after 10 minutes. Only administrators can unlock accounts. 

Excellent! You have now configured password policies for both instances. 

Next: [Configuring Multi-Factor Authentication](./configuring-mfa.md)

## Relevant Concepts

[Configuring a Password Policy](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/configuring-a-password-policy)
