curl \
   "http://localhost:8080/o/scim/v1.0/v2/Users/${1}" \
   --data-raw '
      {
         "emails": [
            {
               "primary": true,
               "type": "default",
               "value": "able@liferay.com"
            }
         ],
         "name": {
            "familyName": "Charlie",
            "givenName": "Able"
         },
         "userName": "able.baker"
      }' \
   --header "Content-Type: application/scim+json" \
   --request "PUT" \
   --user "test@liferay.com:learn"