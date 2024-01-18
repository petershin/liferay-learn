---
uuid: c0d3cf57-eadd-4ed4-81a1-63d0ea3e492e
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Authentication

An access token is necessary for making API calls to Liferay Analytics Cloud. Navigate to _Settings_ &rarr; _APIs_ to generate an access token.

Choose the duration (e.g. 30 days, 6 months, 1 year, or indefinite) for when the access token expires. Click _Generate Token_.

![Select an expiration date and click generate token.](authentication/images/01.png)

The generated token is valid for the duration you selected. When the token expires, you must generate a new token to perform additional API calls. 

![A new token is generated.](authentication/images/02.png)

To use the new token, click _Copy_ (![Copy](../images/icon-copy.png)) to copy the access token to your clipboard. Add this to your request authorization header on every API call. For example, you can set the request header with cURL like this: 

```
curl -i -L -H "Authorization: Bearer {token}"
```

To delete the access token, click _Revoke_, and the token is removed.
