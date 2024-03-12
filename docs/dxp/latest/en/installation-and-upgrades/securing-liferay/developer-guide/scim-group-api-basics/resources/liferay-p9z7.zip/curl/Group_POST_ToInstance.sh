curl \
	"http://localhost:8080/o/scim/v1.0/v2/Groups" \
	--data-raw '
		{
         "displayName": "Foo"
	   }' \
	--header "Content-Type: application/scim+json" \
	--request "POST" \
	--user "test@liferay.com:learn"