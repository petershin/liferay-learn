---
uuid: a183700b-eb36-4394-9874-f73dffb80096
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# API Headers Reference

API headers are components of HTTP requests that provide essential information to the server about the client's request and how the server should handle it.

You can use API Headers for both [REST APIs](./consuming-rest-services.md) and [GraphQL](./consuming-graphql-apis.md).

For REST APIs, you can include headers using cURL commands. Use the `--header "Header: Value"` syntax to specify the required headers. The headers you include depend on the specific REST API you're interacting with and the authentication mechanisms it supports.

For GraphQL, you can input header key/value pairs directly through the GraphQL browser interface. Alternatively, if you prefer using cURL commands, you can include GraphQL queries using the `--data` parameter along with the necessary headers using the `--header "Header: Value"` syntax for each header.

Here's an example of a cURL command that makes a GraphQL request:

```bash
curl \
   http://localhost:8080/o/graphql \
   --data '{"query":"{ blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20117\", sort: \"\") { page items { id articleBody headline creator { name } } } }"}' \
   --header "content-type: application/json" \
   --request POST \
   --user test@liferay.com:test
```

These are the available headers you can use when making Headless API requests:

- [`Accept`](#accept)
- [`Accept-Language`](#accept-language)
- [`X-Accept-All-Languages`](#x-accept-all-languages)
- [`Authorization`](#authorization)
- [`Cookie`](#cookie)
- [`Content-Type`](#content-type)

## Accept

The `Accept` header specifies the media types the client can receive in response from the server. It typically contains a list of types that the client can handle. The valid options are `json` (default) and `xml`.

Here's an example of a cURL command that makes a GET request to `http://example.com/o/headless-admin-user/v1.0/user-accounts` and includes a header specifying that the client accepts XML-formatted data in the response:

```bash
curl \
	"http://example.com/o/headless-admin-user/v1.0/user-accounts" \
	--header "Accept: application/xml" \
	--request "GET" \
```

## Accept-Language

The `Accept-Language` header specifies the client's preferred natural language(s), usually for the response content, so the server responds with content in the preferred language if available.

All valid language tags (an ISO-639 language identifier plus ISO-3166-1 alpha-2 country identifier) are valid options (e.g., `en-US`, `es-ES`, or `pt-BR`).

If the value for the selected language is empty, the query returns the result in the default language.

Here's an example of a cURL command where the preferred language for the response content is Brazilian Portuguese.

```bash
curl \
	"http://example.com/o/c/customobjects/" \
	--header "Accept: application/json" \
	--header "Accept-Language: pt-BR" \
	--request "GET" \
```

!!! tip
    {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+` Use the `Accept-Language` header with both Rest API and GraphQL to return values in the selected language when dealing with custom [objects](../../liferay-development/objects.md).

!!! warning
    {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+` When the *Enable Entry Translation* option is turned off for a custom object's field, it means the field doesn't support translation into multiple languages. If you store a value for a specific language other than the default one and you query for the field without specifying the language, the response is empty. That's because the default language value isn't used automatically as a fallback when you query for a different language. Instead, the response only includes values stored for the language you've queried.

## X-Accept-All-Languages

The `X-Accept-All-Languages` header indicates to the server that the client requests the content to be returned in all available languages. This header is an extension beyond the standard [`Accept-Language`](#accept-language) header, allowing the client to specify this behavior explicitly.

Use `true` as the parameter to return the content in all available languages or `false` to do otherwise (default behavior).

Here's an example of a cURL command that sends a request to `example.com/o/headless-admin-user/v1.0/user-accounts`, specifying that the server should return the requested content in all available languages.

```bash
curl \
	"http://example.com/o/headless-admin-user/v1.0/user-accounts" \
	--header "X-Accept-All-Languages: true" \
```

## Authorization

The `Authorization` header provides credentials for authentication purposes. Clients can authenticate themselves with the server using various authentication mechanisms, such as Basic Authentication, Bearer Tokens, or OAuth tokens.

In Liferay, the Authorization header identifies which user is making the request, using DXP's Authentication framework. If both this and the [`Cookie`](#cookie) headers are not supplied, the request is attempted as a guest (unauthenticated) user.

Valid options for the Authorization header include using Basic Authentication with Base64-encoded credentials or Bearer Tokens with OAuth tokens.

Here's an example of a cURL command that specifies a GET request to `http://example.com/o/c/customobjects/` and provides an authentication token using the Bearer token method:

```bash
curl \
	"http://example.com/o/c/customobjects/" \
	--header "accept: application/json" \
	--header "Accept-Language: pt-BR" \
	--header "Authorization: Bearer YOUR_ACCESS_TOKEN_HERE" \
	--request "GET" \
```

## Cookie

The `Cookie` header sends cookies previously stored by the server with the client's browser so the server maintains session state and tracks user activity across multiple requests.

In Liferay, the Cookie header uses a `JSESSIONID` value that identifies and tracks the user's session, using DXP's Authentication framework. If both this and [`Authorization`](#cookie) are not supplied, the request is attempted as a guest (unauthenticated) user.

Here's an example of a cURL command that performs a GET request to the provided URL and includes a Cookie header with a `JSESSIONID` value.

```bash
curl \
	"http://example.com/o/headless-admin-user/v1.0/user-accounts" \
	--header "Authorization: Bearer YOUR_ACCESS_TOKEN_HERE" \
	--header "Cookie: JSESSIONID=6349351B37C3EE1F6BA4E128107E9A34" \
	--request "GET" \
```

## Content-Type

The `Content-Type` header indicates the media type of the request payload sent from the client to the server so it can manage the data accordingly.

In Liferay, you can upload binary data as `multipart/form-data`

Here's an example of a cURL command that sends a POST request to `http://example.com`, attaching a file named `myfile.txt`. The command includes a header specifying that the request body is formatted as `multipart/form-data` to transmit files and other data fields as parts of the message.

```bash
curl \
	"http://example.com" \
	--form "file=@myfile.txt" \
	--header "Content-Type: multipart/form-data; boundary=ARBITRARY" \
	--request "POST" \
```

## Related Topics
- [Consuming REST Services](./consuming-rest-services.md)
- [Consuming GraphQL APIs](./consuming-graphql-apis.md)
