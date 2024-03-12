curl \
	"http://localhost:8080/o/scim/v1.0/v2/Users" \
	--data-raw '
      {
         "active": "'true'",
         "emails": [
            {
               "primary": "'true'",
               "type": "default",
               "value": "able@liferay.com",
            }
         ],
         "name": {
            "familyName": "Baker",
            "givenName": "Able"
         },
         "userName": "able.baker"
      }' \
	--header "Content-Type: application/scim+json" \
	--request "POST" \
	--user "test@liferay.com:learn"