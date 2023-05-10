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

<!-- Aswin - We have already explained about syntax checking, so I thought it might be useful to explain the following three options also. It wasn't all straightforward for me to understand from their names. -->

1. Under Password History, toggle _Enable History_. Leave the default history count as 6. 

   This keeps up to 6 passwords in history to avoid users from reusing the same ones. 

1. Under Password Expiration, toggle _Enable Expiration_ and configure these options: 

   - Maximum Age: 26 Weeks
   - Warning Time: 2 Weeks
   - Grace Limit: 5

   Passwords now expire after 26 weeks. Two weeks prior to expiration, users receive a warning. Even after expiry, users can enter their passwords up to 5 times (grace limit). 

1. Under Lockout, toggle _Enable Lockout_ and configure these options: 

   - Maximum Failure: 5
   - Reset Failure Count: 10 Minutes
   - Lockout Duration: Until unlocked by an administrator

   Users can now enter incorrect passwords only five times consecutively (maximum failure) before they're locked out. The failure count gets reset to 0 if the time between consecutive failed attempts is greater than 10 minutes. Only an administrator can unlock locked accounts. 

1. Click _Save_. 

Excellent! You have now configured password policies for both instances. 

Next: [Configuring Multi-Factor Authentication](./configuring-mfa.md)

## Relevant Concepts

- [Configuring a Password Policy](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/configuring-a-password-policy)
